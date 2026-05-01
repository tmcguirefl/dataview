# ModelScope-J: Reimplementation Specification

**Project:** ModelScope reimplemented in the J programming language, served via JHS (J HTTP Server)  
**Reference implementation:** `/Users/tomdevel/jdev/CSCI3308_DataModeling`  
**jlearn library:** `/Users/tomdevel/jdev/jlearn`  
**Repository root:** `/Users/tomdevel/jdev/dataview`  

## Environment

| Item | Value |
|---|---|
| J version | `j9.8.0-beta1/j64arm/darwin` (Apple Silicon, macOS) |
| J install path | `/Applications/j9.8/` |
| Executable | `/Applications/j9.8/bin/jconsole` (symlinked as `ijconsole`) |
| PATH addition | `/Applications/j9.8/bin` |
| Start server | `ijconsole src/init.ijs` (from `dataview/`) |
| Architecture | `j64arm` — Apple Silicon native, SLEEF SIMD math |

Add to shell profile (`~/.zshrc`) once:
```sh
export PATH="/Applications/j9.8/bin:$PATH"
```

### Confirmed Working Addons (tested in J9.8)

| Addon | `require` path | Status |
|---|---|---|
| SQLite (JDD) | `data/ddsqlite` | ✓ opens/creates db, `setzlocale_jddsqlite_''` exports verbs to `_z_` |
| LAPACK/SVD | `math/lapack2` | ✓ |
| CSV | `tables/csv` | ✓ |
| pjson (JHS built-in) | `convert/pjson` | ✓ |
| JSON | `convert/json` | ✓ |
| Stats | `stats/base` | ✓ |
| Base64 | `convert/base64` | ✗ **not installed** — token encoding needs alternative |
| SHA/crypto | `security/sha` | ✗ **not installed** — use `128!:6` (SHA-1, built-in) |

### Hashing: `128!:6` is SHA-1 (Built-in, No Addon Needed)

`128!:6 y` is available natively in J9.8 with no `require`. It returns a 40-character hex SHA-1 digest. There is no built-in SHA-256. For password hashing in a local single-user tool, SHA-1 with a random salt is acceptable. The salt+hash are stored together in the `users` table.

```j
NB. Generate a random 16-byte hex salt
salt =: , 16 ?@$ 256
saltstr =: , '0123456789abcdef' {~ ,: (salt >: 16) + 16 | salt   NB. hex encode

NB. Hash: SHA-1(salt || password)  — 40 hex chars
hashpw =: 3 : '128!:6 saltstr , y'
```

For session tokens, base64 is unavailable as an addon. Use hex encoding instead:
```j
NB. Build token: hex(userid) || '_' || hex(timestamp) || '_' || SHA1(secret||userid||ts)
```

### `data/ddsqlite` Correct Usage (verified on J9.8)

```j
require 'data/ddsqlite'
setzlocale_jddsqlite_ ''      NB. exports ddcon, ddsql, ddsel, ddparm, etc. to _z_

NB. Open (or create) a database — nocreate=0 is required to create a new file
db =. ddcon 'database=/path/to/modelscope.db;nocreate=0'

NB. Execute DDL / DML
'CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY, username TEXT)' ddsql__db ''

NB. Parameterized insert — prevents SQL injection
'INSERT INTO users (username) VALUES (?)' ddparm__db (SQLITE_TEXT ; ,< 'alice')

NB. Select
db ddsel__db 'SELECT id, username FROM users'
rows =. ddfet__db ''          NB. all rows as boxed matrix

NB. Disconnect
dddis__db ''
```

**Key gotcha:** `ddcon` returns `_1` on failure (file not found and `nocreate=1`, which is the default). Always pass `nocreate=0` when creating a new database file.

---

## 1. Project Layout

```
dataview/
├── SPEC.md                    ← this file
├── .gitignore
├── docs/                      ← existing J reference documentation
├── src/
│   ├── init.ijs               ← master loader: requires all modules, starts JHS
│   ├── db.ijs                 ← in-memory dataset store (J namespaces as "rows")
│   ├── auth.ijs               ← user registration, login, JWT-equivalent token
│   ├── csv_util.ijs           ← CSV ingestion, quality report, type detection
│   ├── preprocess.ijs         ← imputation, outlier removal, scaling, one-hot
│   ├── pca.ijs                ← PCA driver (delegates to jlearn PCASolver)
│   ├── kmeans.ijs             ← k-means driver (delegates to jlearn jLearnKMeans)
│   ├── analysis.ijs           ← column stats, correlation matrix, distribution data
│   ├── report.ijs             ← standalone HTML report builder
│   ├── routes/
│   │   ├── api_health.ijs     ← GET  /api/health
│   │   ├── api_auth.ijs       ← POST /api/register  POST /api/login
│   │   ├── api_datasets.ijs   ← dataset CRUD + upload + inspect
│   │   ├── api_pca.ijs        ← run PCA, list runs, fetch run, delete
│   │   ├── api_clusters.ijs   ← k-means on a PCA run
│   │   ├── api_analysis.ijs   ← column statistics, correlation
│   │   ├── api_compare.ijs    ← compare two PCA runs
│   │   ├── api_report.ijs     ← HTML report download
│   │   └── api_profile.ijs    ← user profile get/update
│   └── www/
│       ├── index.html         ← SPA shell (plain HTML/CSS/JS, no build step)
│       ├── app.js             ← client JS: routing, fetch helpers, auth token
│       ├── pages/
│       │   ├── login.js
│       │   ├── register.js
│       │   ├── projects.js    ← dashboard: datasets, upload, runs
│       │   ├── visualize.js   ← scatter/scree/loadings via Plotly CDN
│       │   ├── compare.js
│       │   └── settings.js
│       └── styles.css
└── test/
    ├── test_csv_util.ijs
    ├── test_preprocess.ijs
    ├── test_pca.ijs
    └── test_auth.ijs
```

---

## 2. What Can Be Transcribed to J

### 2.1 Directly Supported by jlearn (use as-is)

| Node.js / Reference | jlearn Module | Locale | Notes |
|---|---|---|---|
| `ml-pca` / `validateAndPreprocessForPca` PCA step | `dr/pca.ijs` | `PCASolver` | Requires `math/lapack2` addon. Returns eigenvectors, eigenvalues, transformed data. The reference uses SVD; jlearn PCA uses covariance + LAPACK eigendecomposition — numerically equivalent for centred data. |
| Missing value imputation (mean/median) | `impute/imputer.ijs` | `jLearnImpute` | `imputeColumnWithMean`, `imputeColumnWithMean`, `smartImpute` map directly to the reference's `imputeStrategy: 'mean'/'median'` options. |
| K-means clustering on PCA output | `clustering/kmeans.ijs` | `jLearnKMeans` | The reference's custom k-means (`k=2–6`, max 50 iterations) maps directly. Use `create data;'euclidean';k;'normal'`, `fit 50`, `predict points`. |
| Min-max normalization (feature scaling) | `utils/minmaxscaler.ijs` | `MinMaxScaler` | `normalizeColumns data` maps to `scaleMethod: 'minmax'` in the reference. |
| Z-score standardization (feature scaling) | `utils/minmaxscaler.ijs` | `MinMaxScaler` | `standardizeColumns data` maps to `scaleMethod: 'standard'`. Both `fit`, `standardizeData` (transform single point), and `destandardize` (inverse) are included. |
| CSV loading | `utils/utils.ijs` + `tables/csv` addon | `jLearnUtil` | `readcsv 'path'` returns boxed string array. `fixcsv` parses. These handle the raw loading; our `csv_util.ijs` wraps them with type detection and quality reporting. |
| Train/test split | `utils/utils.ijs` | `jLearnUtil` | `splitDataset (X;Y;pct;normalize)` — useful for any future model evaluation pages. |
| Kernel PCA | `dr/kpca.ijs` | `KPCASolver` | Not in the reference but trivial to expose as a "PCA mode" option. |
| Factor Analysis | `dr/factor.ijs` | `FASolver` | Not in reference — available as an additional analysis option. |
| Hierarchical clustering | `clustering/hcluster.ijs` | `jLearnHCluster` | Not in reference — can be added as a compare/explore feature. |
| DBSCAN | `clustering/dbscan.ijs` | `DBSCAN` | Not in reference — additional clustering option. |
| Explained variance score | `score/modelscorer.ijs` | `jLearnScorer` | `explainedVariance trueVals;predVals` matches the reference's `explained_variance_ratio` output. |

### 2.2 Implemented in Native J (no jlearn needed)

These are straightforward J expressions and do not need a library:

| Reference feature | J implementation | Key primitives |
|---|---|---|
| Matrix multiplication (PCA projection) | `X +/ . * V` | dot conjunction |
| Covariance matrix | `cov =: 4 : '(|: x - +/ x % #x) +/ . * (y - +/ y % #y) % <: #x'` | standard J |
| Transpose | `|: matrix` | built-in |
| Mean centering | `X - +/ X % # X` (column broadcast via `"1`) | built-in |
| Constant column detection | `*/1 = # @ ~. "1 |: X` — all values identical | built-in |
| Outlier removal (z-score) | `|((X - m) % s) < threshold` | built-in |
| Outlier removal (IQR) | Q1/Q3 from `(#*0.25){ /:~ X`, then flag | `/:~`, `{` |
| One-hot encoding | `= y` (equals table) on integer labels | built-in |
| Correlation matrix | `C % %: (*/) C =: cov X` | derived from cov |
| Column statistics (min, max, mean, std) | `<./ , >./ , (+/ % #) , %: (+/ *:@(- +/%#))` applied `"1 |: X` | built-in |
| URL decoding (JHS POST bodies) | `jurldecodeplus` (JHS built-in) | JHS |
| JSON encoding (API responses) | `enc_pjson_` (built into JHS) or `enc_json` from `convert/json` addon | JHS built-in preferred |
| JSON decoding (POST request bodies) | `dec_pjson_ NV_jhs_` — JHS built-in; do **not** use `dec_json` here | JHS built-in; see §3.5 for key-lookup pattern |
| Password hashing | `sha256` via `security/sha` or `crypt` addon; bcrypt not available natively — use SHA-256 with salt stored alongside | addon |
| JWT-equivalent session tokens | Stateless: store `userID;timestamp;sha256(userID,timestamp,secret)` as boxed literal, base64-encode with `convert/base64` addon | addon |

### 2.3 Preprocessing Pipeline Mapping

The reference's `validateAndPreprocessForPca()` pipeline in J:

```
Input CSV
  → csv_util parseCSV       (tables/csv readcsv + type detection)
  → csv_util qualityReport  (native J: missing counts, type mix, constant cols)
  → preprocess dropConstant (native J: */1 = # @ ~. "1 |: X)
  → preprocess imputeData   (jlearn jLearnImpute smartImpute)
  → preprocess removeOutliers (native J z-score or IQR)
  → preprocess encodeCateg  (native J = y one-hot, or jlearn numberize)
  → preprocess scaleFeatures (jlearn MinMaxScaler or standardizeColumns)
  → pca runPCA              (jlearn PCASolver transform)
  → pca storeRun            (db.ijs write to namespace)
```

### 2.4 Not Directly Transcribable / Requires Alternative

| Reference feature | Status | Alternative in J |
|---|---|---|
| PostgreSQL persistence (`pg` driver) | No J PostgreSQL driver available | **In-memory namespace store** (`db.ijs`) backed by J's `cocurrent`/locale system. Persist to disk via `3!:1` (J serialization) or `writecsv` for tabular data. Acceptable for single-user JHS session; add file-based persistence for multi-session. |
| bcryptjs password hashing | No bcrypt in J stdlib | SHA-256 with random salt via `security/sha` addon. Functionally equivalent for our purposes. |
| JWT (jsonwebtoken) | No JWT library in J | Stateless token: `base64(userID \| timestamp \| hmac_sha256(secret, userID \| timestamp))`. Validate by recomputing HMAC on each request. |
| multer in-memory CSV upload | JHS parses POST bodies as form-encoded | Use `<input type=file>` + `multipart/form-data`; JHS can read the raw POST body bytes and parse the MIME boundary manually, or use a helper in `csv_util.ijs`. Alternatively, send CSV content as a textarea string (simpler for initial implementation). |
| Google Gemini AI narrative | External API, no J HTTP client in stdlib | Optional feature: use `jsocket` or `net/http` addon to POST to the Gemini REST endpoint, return response JSON. Deferred to a later phase. |
| React/Vite SPA | No React in J | Plain HTML + vanilla JS + Plotly.js (CDN). JHS serves static files from `src/www/`. Client uses `fetch()` to call JSON APIs. Functional parity, no build step. |
| npm workspaces | Not applicable | Single J project, `init.ijs` loads all modules. |
| Docker Compose | Not required | JHS runs in a J session; `init.ijs` is the entry point: `jconsole init.ijs`. |

### 2.5 Features Not Ported (Out of Scope)

- The "Pinky" mascot — purely decorative, not reimplemented
- Saved PCA presets in DB — retained as an in-memory list per dataset, no JSONB
- Dataset version chains — deferred; single version per dataset initially
- `projectSourceCode/` lab scaffold — discarded entirely

---

## 3. JHS Routing Architecture

### 3.1 How JHS Actually Routes Requests

JHS routing is convention-based, but the naming rules are more constrained than they first appear. When a request arrives:

- A **raw POST** (body is `application/json`, not form-encoded) sets `RAW=1`. JHS does **not** auto-dispatch raw POSTs via verb naming — the serve loop must check `RAW` and dispatch manually.
- A **GET** or form POST goes through `input_jhs_` which constructs a verb name from the URL and calls it.

**Critical:** `jfe 1` (the JHS event loop) is a no-op under `jconsole -js`. All ModelScope-J endpoints use JSON bodies, so we drive the request loop manually with `getdata''`:

```j
NB. In init.ijs — the main serve loop
app_serve =: 3 : 0
  OKURL =: 0$<''           NB. must be boxed list before addOKURL
  jhscfg''                 NB. runs configdefault, then calls config verb
  logappfile =: <jpath '~user/modelscope.log'
  IFJHS_z_ =: 1
  LOCALHOST =: '0.0.0.0'
  cookie =: 'jcookie=' , ": 6!:0''
  SKSERVER_jhs_ =: _1
  r =. dobind''
  if. 0 ~: r do. echo 'bind failed' [ exit'' end.
  sdcheck_jsocket_ sdlisten_jsocket_ SKLISTEN , 5
  addOKURL 'api'           NB. exempt /api/* from login redirect
  echo 'listening on http://' , LOCALHOST , ':' , (": PORT) , '/api'
  while. 1 do.
    try.
      getdata''            NB. blocks until a connection arrives; sets RAW, URL, METHOD, NV
      dispatch ''
    catch. end.
  end.
)

NB. Route dispatcher — runs in jhs locale
dispatch =: 3 : 0
  NB. All API calls are raw JSON POSTs or GETs
  if. 1 = RAW do.
    NB. POST /api/<endpoint>
    select. URL
      case. 'api/register'        do. jev_post_raw_api_register_ ''
      case. 'api/login'           do. jev_post_raw_api_login_ ''
      case. 'api/datasets/upload' do. jev_post_raw_api_upload_ ''
      case. 'api/datasets/pca'    do. jev_post_raw_api_pca_ ''
      NB. ... other POST routes
      case. do. japi_404 ''
    end.
  elseif. 'GET' -: METHOD do.
    NB. GET /api/<endpoint>
    select. URL
      case. 'api/health'    do. jev_get_api_health_ ''
      case. 'api/datasets'  do. jev_get_api_datasets_ ''
      NB. ... other GET routes (URL may include query string — strip with i.&'?')
      case. do. japi_404 ''
    end.
  end.
)
```

**Note on URL matching with path parameters:** JHS sets `URL` to the raw path without leading `/`. For routes like `/api/pca/:id`, extract the ID segment manually:

```j
NB. e.g. URL = 'api/pca/7/clusters'
parts =. '/' cut URL
id    =. ". > 3 { parts     NB. numeric id
```

### 3.2 Handler Locale Pattern

Every handler file defines a coclass and uses `coinsert 'jhs'` so it can call `htmlresponse`, `gethv`, and other JHS verbs without explicit `_jhs_` suffixes **inside** the handler body. However, any access to JHS globals from outside the handler body (e.g. from `db.ijs`) still requires explicit `_jhs_` suffixes.

```j
NB. src/routes/api_health.ijs
coclass 'api_health'
coinsert 'jhs'

jev_get_api_health_ =: 3 : 0
  japi_ok '{"status":"ok","service":"modelscope-j"}'
)
```

The `dispatch` verb (running in `jhs` locale) calls `jev_get_api_health_` directly; the trailing `_` already encodes the locale.

### 3.3 Shared Response Helper

Define a JSON response helper in the `jhs` locale so all routes can call it without a suffix:

```j
NB. In init.ijs, coclass 'jhs'
NB. Send a 200 JSON response
japi_ok =: 3 : 0
  r =. 'HTTP/1.1 200 OK' , CRLF
  r =. r , 'Content-Type: application/json' , CRLF
  r =. r , 'Access-Control-Allow-Origin: *' , CRLF , CRLF
  r =. r , y
  htmlresponse r
)

NB. Send a JSON error response with given HTTP status line
japi_err =: 4 : 0
  r =. 'HTTP/1.1 ' , x , CRLF
  r =. r , 'Content-Type: application/json' , CRLF
  r =. r , 'Access-Control-Allow-Origin: *' , CRLF , CRLF
  r =. r , y
  htmlresponse r
)

japi_404 =: 3 : 0
  '404 Not Found' japi_err '{"status":"error","message":"not found"}'
)
```

### 3.4 Authentication in Handlers

The token is sent as `Authorization: Bearer <token>`. Read it via `gethv`:

```j
NB. Returns user id (integer) or _1 if invalid/missing
japi_checkauth =: 3 : 0
  hdr =. dltb gethv_jhs_ 'Authorization:'
  if. 0 = # hdr do. _1 return. end.
  tok =. dltb (6 + hdr i. ' ') }. hdr    NB. strip 'Bearer '
  validateToken_auth_ tok
)
```

### 3.5 JSON Body Parsing

All POST bodies arrive as raw JSON in `NV_jhs_`. Use `dec_pjson_` (not `dec_json` — `dec_pjson_` is the verb available in JHS):

```j
body =. dec_pjson_ NV_jhs_
NB. body is an n×2 boxed matrix: col-0 = rank-1 key strings, col-1 = values

NB. Field lookup helper (see JHSinfo.md for the correct rank-aware pattern):
getfield =: 4 : 0
  r =. ''
  i =. 0
  nx =. , x               NB. ravel x to rank-1 for -: comparison
  while. i < # y do.
    row =. i { y
    k =. , > 0 { row
    if. k -: nx do.
      r =. > 1 { row
      return.
    end.
    i =. >: i
  end.
  r                        NB. explicit final expression — not return. with value
)

NB. Usage:
username =. 'username' getfield body
password =. 'password' getfield body
```

**Critical gotchas from JHSinfo.md that apply here:**
- Always ravel (`,`) both sides of `-:` when comparing JSON keys — pjson keys are rank-1 vectors, J string literals are rank-0.
- `return.` ignores its argument; assign to a name first, then `return.`.
- Negative numbers from `":` produce `_` not `-`; use `rplc '_';'-'` before putting any numeric value in a JSON string.
- Boxed strings padded to equal length — always `dltb > idx { boxedList` before using string values.
- `htmlresponse` closes the socket; every code path must call it exactly once.

---

## 4. Data Storage Design

State is persisted in a SQLite database via `data/ddsqlite`. The file lives at `data/modelscope.db` (gitignored). `db.ijs` opens (or creates) it on startup and runs `CREATE TABLE IF NOT EXISTS` for each table — the same `ensureSchema` pattern used by the Node.js reference.

### Schema

```sql
CREATE TABLE IF NOT EXISTS users (
  id          INTEGER PRIMARY KEY AUTOINCREMENT,
  username    TEXT UNIQUE NOT NULL,
  pwhash      TEXT NOT NULL,        -- SHA-1(salt||password) hex
  salt        TEXT NOT NULL,        -- 32-char hex random salt
  displayname TEXT DEFAULT '',
  email       TEXT DEFAULT '',
  created_at  TEXT DEFAULT (datetime('now'))
);

CREATE TABLE IF NOT EXISTS datasets (
  id              INTEGER PRIMARY KEY AUTOINCREMENT,
  user_id         INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  name            TEXT NOT NULL,
  notes           TEXT DEFAULT '',
  tags            TEXT DEFAULT '[]',       -- JSON array of strings
  is_favorite     INTEGER DEFAULT 0,
  row_count       INTEGER,
  col_count       INTEGER,
  quant_cols      TEXT DEFAULT '[]',       -- JSON array
  cat_cols        TEXT DEFAULT '[]',       -- JSON array
  all_cols        TEXT DEFAULT '[]',       -- JSON array
  raw_data        TEXT,                    -- JSON: n×m numeric matrix
  row_metadata    TEXT,                    -- JSON: per-row labels/originals
  quality_report  TEXT,                    -- JSON: quality profile
  preview_data    TEXT,                    -- JSON: first 10 rows
  upload_ts       TEXT DEFAULT (datetime('now'))
);

CREATE TABLE IF NOT EXISTS pca_runs (
  id              INTEGER PRIMARY KEY AUTOINCREMENT,
  dataset_id      INTEGER NOT NULL REFERENCES datasets(id) ON DELETE CASCADE,
  notes           TEXT DEFAULT '',
  is_pinned       INTEGER DEFAULT 0,
  n_components    INTEGER NOT NULL,
  explained_var   TEXT,    -- JSON array: per-component fractions
  all_ev          TEXT,    -- JSON array: all eigenvalues (scree plot)
  loadings        TEXT,    -- JSON: k×n_features matrix
  transformed     TEXT,    -- JSON: n_samples×k projected points
  col_names       TEXT,    -- JSON array: feature names used
  n_samples       INTEGER,
  preproc_opts    TEXT,    -- JSON: preprocessing config
  preproc_report  TEXT,    -- JSON: per-step counts
  row_indexes     TEXT,    -- JSON array: original row indexes surviving preprocessing
  created_at      TEXT DEFAULT (datetime('now'))
);
```

### `db.ijs` Pattern

```j
NB. db.ijs  — opens/creates SQLite; DB global holds the connection handle
require 'data/ddsqlite'
setzlocale_jddsqlite_ ''

DB_PATH =: jpath '~/../data/modelscope.db'   NB. relative to J home; adjust as needed

db_open =: 3 : 0
  DB =: ddcon 'database=', DB_PATH, ';nocreate=0'
  if. _1 = DB do. echo 'FATAL: cannot open database' [ exit'' end.
  db_ensure_schema ''
)

db_close =: 3 : 0
  dddis__DB ''
)
```

All query verbs (`db_getuser`, `db_insertdataset`, `db_listpcaruns`, etc.) use parameterized `ddparm__DB` calls — never string interpolation into SQL.

---

## 5. J Addon Requirements

All of the following are pre-installed in `/Applications/j9.8/addons/`. No `install` commands needed — just `require` them in `init.ijs`.

| Addon | `require` path | Status | Purpose |
|---|---|---|---|
| `math/lapack2` | `require 'math/lapack2'` | ✓ present | SVD + eigendecomposition for PCA via jlearn |
| `tables/csv` | `require 'tables/csv'` | ✓ present | CSV file read/write |
| `convert/json` | `require 'convert/json'` | ✓ present | JSON encode for API responses |
| `convert/pjson` | `require 'convert/pjson'` | ✓ present | JHS built-in JSON decode (`dec_pjson_`) |
| `stats/base` | `require 'stats/base'` | ✓ present | Statistical utilities (used by jlearn) |
| `data/ddsqlite` | `require 'data/ddsqlite'` | ✓ present + tested | SQLite persistence |
| `convert/base64` | — | ✗ **not present** | Use hex encoding for tokens instead |
| `security/sha` | — | ✗ **not present** | Use built-in `128!:6` (SHA-1) instead |

---

## 6. Implementation Phases

### Phase 1 — Core Infrastructure
1. `src/init.ijs` — addon loading, jlearn path setup, `config` verb in `jhs` locale, `app_serve` with manual `getdata` loop (not `jfe 1`), `dispatch` verb, shared `japi_ok`/`japi_err`/`japi_404` helpers
2. `src/db.ijs` — in-memory store, file-backed persistence
3. `src/auth.ijs` — register/login, SHA-256+salt hashing, stateless token, `validateToken`
4. `src/routes/api_health.ijs` — `GET /api/health` returns `{"status":"ok"}`
5. `src/routes/api_auth.ijs` — raw POST handlers, `dec_pjson_ NV_jhs_` for body, `getfield` helper
6. `src/www/index.html` + `app.js` — SPA shell with login/register pages

### Phase 2 — CSV Upload and Quality Report
1. `src/csv_util.ijs` — `parseCSV`, `detectTypes`, `buildQualityReport`
2. `src/routes/api_datasets.ijs` — `POST /upload`, `GET /api/datasets`, `GET /:id/quality`
3. `src/www/pages/projects.js` — upload form, dataset list, quality report display

### Phase 3 — Preprocessing and PCA
1. `src/preprocess.ijs` — full pipeline: drop constant cols, impute, outliers, encode, scale
2. `src/pca.ijs` — `runPCA` wrapping `PCASolver`, `listRuns`, `getRun`, `deleteRun`
3. `src/routes/api_pca.ijs` — all PCA CRUD endpoints
4. `src/www/pages/visualize.js` — scatter (2D/3D), scree plot, loadings via Plotly CDN

### Phase 4 — K-Means Clustering and Comparison
1. `src/kmeans.ijs` — `runKMeans` wrapping `jLearnKMeans`
2. `src/routes/api_clusters.ijs` — `GET /api/pca/:id/clusters`
3. `src/routes/api_compare.ijs` — `GET /api/datasets/:id/pca/compare`
4. `src/www/pages/compare.js` — side-by-side run comparison

### Phase 5 — Analysis, Reports, Profile
1. `src/analysis.ijs` — column statistics, Pearson correlation matrix, distribution data
2. `src/report.ijs` — standalone HTML report builder (string manipulation in J)
3. `src/routes/api_analysis.ijs`, `api_report.ijs`, `api_profile.ijs`
4. `src/www/pages/settings.js`

### Phase 6 (Optional) — AI Narrative
1. HTTP POST to Gemini REST API via `jsocket` or `net/http` addon
2. `GET /api/pca/:id/narrative` endpoint
3. Graceful disable when key not set

---

## 7. API Endpoint Table

All endpoints return `application/json`. Authentication: token in `Authorization: Bearer <token>` header or `X-MS-Token` header (simpler for JHS parsing).

| Method | Path | Auth | jlearn / J module | Description |
|---|---|---|---|---|
| GET | /api/health | No | — | `{"status":"ok"}` |
| POST | /api/register | No | `auth.ijs` SHA-256 | Create account, return token |
| POST | /api/login | No | `auth.ijs` SHA-256 | Authenticate, return token |
| GET | /api/datasets | Yes | `db.ijs` | List user's datasets |
| POST | /api/datasets/upload | Yes | `csv_util.ijs`, `tables/csv` | Parse CSV, store, return quality report |
| POST | /api/datasets/inspect-upload | Yes | `csv_util.ijs` | Dry-run parse, no store |
| GET | /api/datasets/:id/quality | Yes | `db.ijs` | Stored quality report |
| GET | /api/datasets/:id/preview | Yes | `db.ijs` | First 10 rows |
| GET | /api/datasets/:id/analysis | Yes | `analysis.ijs` native J | Column stats + correlation matrix |
| PATCH | /api/datasets/:id | Yes | `db.ijs` | Rename / update notes / tags |
| DELETE | /api/datasets/:id | Yes | `db.ijs` | Delete dataset + all runs |
| POST | /api/datasets/:id/pca/preview | Yes | `preprocess.ijs` jlearn | Dry-run preprocessing estimate |
| POST | /api/datasets/:id/pca | Yes | `pca.ijs` `PCASolver` | Run PCA, store run, return results |
| GET | /api/datasets/:id/pca | Yes | `db.ijs` | List PCA runs for dataset |
| GET | /api/datasets/:id/pca/compare | Yes | `analysis.ijs` | Compare two runs (runA/runB query params) |
| GET | /api/pca/:id | Yes | `db.ijs` | Fetch single PCA run |
| PATCH | /api/pca/:id | Yes | `db.ijs` | Update notes / pin |
| DELETE | /api/pca/:id | Yes | `db.ijs` | Delete run |
| GET | /api/pca/:id/clusters | Yes | `kmeans.ijs` `jLearnKMeans` | k-means on transformed points |
| GET | /api/pca/:id/report | Yes | `report.ijs` | Download HTML report |
| GET | /api/pca/:id/export | Yes | `db.ijs`, `tables/csv` | Download transformed data as CSV |
| GET | /api/profile | Yes | `db.ijs` | User profile |
| PATCH | /api/profile | Yes | `db.ijs` | Update display name / email |
| GET | /api/pca/:id/narrative | Yes | `net/http` → Gemini | AI interpretation (Phase 6) |

---

## 8. jlearn Usage Reference (Quick Lookup)

### PCA (`dr/pca.ijs`, locale `PCASolver`)

```j
require '~Projects/jlearn/dr/pca.ijs'
require 'math/lapack2'

inst =: conew 'PCASolver'
create__inst ''
NB. transform with top-N components:
result =: transform__inst (X ; 1 ; nComponents)
NB. result is the transformed data matrix (n_samples x nComponents)
NB. eigenVecs__inst : loadings matrix
NB. eigenVals__inst : all eigenvalues (for scree plot)
```

Computing explained variance ratio from eigenvalues:
```j
ev      =: eigenVals__inst
evRatio =: ev % +/ ev
```

### K-Means (`clustering/kmeans.ijs`, locale `jLearnKMeans`)

```j
require '~Projects/jlearn/clustering/kmeans.ijs'

inst =: conew 'jLearnKMeans'
create__inst (transformedData ; 'euclidean' ; k ; 'normal')
fit__inst 50
labels =: predict__inst transformedData
```

### Imputation (`impute/imputer.ijs`, locale `jLearnImpute`)

```j
require '~Projects/jlearn/impute/imputer.ijs'

inst =: conew 'jLearnImpute'
create__inst ''
cleaned =: smartImpute__inst data   NB. mean for numeric, mode for categorical
```

### Min-Max Scaling (`utils/minmaxscaler.ijs`)

```j
require '~Projects/jlearn/utils/minmaxscaler.ijs'

inst =: conew 'MinMaxScaler'
create__inst (data ; 0 1)
scaled =: normalizeColumns data
NB. inverse: not needed for PCA but available via stored min/max
```

### Z-Score Standardization (same module)

```j
scaled =: standardizeColumns data
NB. single-point inverse: destandardize__inst point
```

---

## 9. Repository Layout in Context of `jdev/`

```
jdev/
├── CSCI3308_DataModeling/    ← reference Node.js implementation (read-only)
├── jlearn/                   ← jlearn library (read-only, cloned 2026-05-01)
├── dataview/                 ← THIS PROJECT (git repo)
│   ├── .git/
│   ├── .gitignore
│   ├── SPEC.md               ← this file
│   ├── docs/                 ← J reference docs (NuVoc, JHS notes, etc.)
│   ├── src/
│   ├── test/
│   └── data/                 ← runtime-only: db.ijs snapshot (gitignored)
├── jhsdev/                   ← (pre-existing, unrelated)
└── jmcp/                     ← (pre-existing, unrelated)
```

Add `data/` to `.gitignore` (runtime session data, not source):
```
data/
```

---

## 10. J / JHS Gotchas (from JHSinfo.md — must read before coding)

These are confirmed issues from a previous JHS project. Each one will burn you if ignored.

| Area | Gotcha | Fix |
|---|---|---|
| Evaluation order | No operator precedence — right-to-left always. String concatenation needs explicit parens. | `'http://' , LOCALHOST , ':' , (": PORT) , '/api'` |
| `-:` match | Compares shape AND content. JSON keys from `dec_pjson_` are rank-1; J string literals are rank-0. They won't match. | Ravel both sides: `(,x) -: (,k)` |
| `return.` | Its argument is **ignored**. The verb returns the last evaluated expression. | Assign to `r`, then call `return.` alone on next line. |
| Loop return value | A `while.` loop's last expression is the test predicate, not the body result. | End every verb with an explicit `r` line. |
| `try./catch.` | Cannot assign result on the same line as `try.`. | Assign default before the block; assign inside each branch. |
| Negative literals | `":` formats negative numbers with `_` not `-`. Breaks JSON. | `(": n) rplc '_';'-'` before putting numbers in JSON strings. |
| Boxed string padding | Strings in a boxed list are padded with trailing spaces to equal length. | Always `dltb > idx { list` before using string values. |
| `;` (Link) | Does not always produce a 2-element boxed list — appends rows when right arg is a 2D boxed matrix. | Use `(<x) , <y` for an explicit 2-element boxed list. |
| `jfe 1` | Is a no-op under `jconsole -js`. Server exits immediately after binding. | Use manual `while. 1 do. getdata'' ... end.` loop. |
| Locale visibility | Handler verbs run in their own locale (copath = z only). Cannot see `jhs` names without `_jhs_` suffix. | Use `coinsert 'jhs'` in handler coclass, **or** always qualify with `_jhs_`. |
| `htmlresponse` | Closes the socket. Calling it twice per request errors. | Every code path must reach exactly one `htmlresponse` call. |
| `OKURL` init | `addOKURL` calls `rmOKURL` internally which does `OKURL -. <y`. Crashes if `OKURL` is `''`. | `OKURL =: 0$<''` before the first `addOKURL` call. |
| `gethv` key format | Must include the trailing colon. | `gethv_jhs_ 'Authorization:'` |
| Control flow scope | `if.`, `while.`, `select.` are only valid inside a verb body — not at script top level. | Wrap any top-level logic in a named verb and call it. |

---

## 11. Key Design Decisions and Rationale

| Decision | Rationale |
|---|---|
| jlearn `PCASolver` over native J for PCA | jlearn wraps LAPACK SVD correctly and returns eigenvalues in descending order with correct sign conventions. Native J `%.` pseudoinverse does not give SVD components directly. |
| jlearn `jLearnKMeans` over native J | The reference's centroid initialization had known quality issues (evenly-spaced indices). jlearn supports `'uniform'` random seeding which is better. |
| jlearn `smartImpute` over hand-coded | Handles both numeric (mean) and object-type columns automatically, matching the reference's `'smart'` imputation mode. |
| jlearn `standardizeColumns` / `normalizeColumns` | Includes `fit`/`transform`/`inverse_transform` pattern, matching reference's need to store per-feature statistics for visualization (PCA biplot reconstruction). |
| In-memory store with file persistence | PostgreSQL is not reachable from J without a JDBC/ODBC bridge. For a single-user local tool this is appropriate. Multi-user would require a socket-based IPC to an external DB process. |
| Vanilla JS frontend (no React/Vite) | JHS serves static files directly; no Node.js build pipeline needed. Plotly.js from CDN handles all visualization. parity with reference's charts is achievable. |
| SHA-256+salt instead of bcrypt | J's `security/sha` addon provides SHA-256. bcrypt is not available. For a local single-user tool SHA-256+random salt is acceptable. |
| Port 65001 (JHS default) | No port conflict with the reference (which uses 5001/5173). Both can run simultaneously during cross-reference testing. |
| jlearn path via `~Projects` alias | The standard jlearn convention. In `init.ijs` we set `9!:27 < '/Users/tomdevel/jdev/jlearn'` to configure the Projects path, or load modules by absolute path. |
