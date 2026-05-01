# ModelScope-J: Reimplementation Specification

**Project:** ModelScope reimplemented in the J programming language, served via JHS (J HTTP Server)  
**Reference implementation:** `/Users/tomdevel/jdev/CSCI3308_DataModeling`  
**jlearn library:** `/Users/tomdevel/jdev/jlearn`  
**Repository root:** `/Users/tomdevel/jdev/dataview`  

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
| JSON encoding (API responses) | `enc_json` from `convert/json` addon | addon |
| JSON decoding (POST request bodies) | `dec_json` from `convert/json` addon | addon |
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

JHS resolves handlers by naming convention. Every API endpoint maps to a J verb in a route locale:

```
GET  /api/health             →  jev_get_api_health_   in api_health locale
POST /api/register           →  jev_post_api_register_ in api_auth locale
POST /api/login              →  jev_post_api_login_    in api_auth locale
GET  /api/datasets           →  jev_get_api_datasets_  in api_datasets locale
POST /api/datasets/upload    →  jev_post_api_datasets_upload_  in api_datasets locale
...
```

All handlers return a JSON string. The client always sends `Content-Type: application/json` POST bodies (not form-encoded), decoded in JHS via `dec_json body`.

A shared `jhs_respond` helper in `src/routes/api_auth.ijs` sets the content-type header and returns the JSON string:

```j
NB. Set response content-type to JSON and return payload
japi_respond =: 3 : 0
  HTTP_response_header =: 'Content-Type: application/json'
  y
)
```

---

## 4. Data Storage Design

Since there is no database, all state lives in J locales during the session. On server start, `db.ijs` defines two "tables" as named locale arrays:

```j
NB. Each user: id ; username ; pwhash ; salt ; displayname ; email
USERS =: 0 6 $ ''

NB. Each dataset: id ; userid ; name ; notes ; tags ; qualityReport ; rawData ; rowMeta ; colNames ; quantCols ; catCols
DATASETS =: 0 11 $ ''   NB. values are boxed

NB. Each PCA run: id ; datasetid ; nComponents ; explainedVariance ; allEV ; loadings ; transformedData ; colNames ; nSamples ; preprocOptions ; preprocReport ; rowIndexes ; notes ; isPinned
PCA_RUNS =: 0 14 $ ''
```

Persistence: on graceful shutdown `db.ijs` serializes all three globals to `dataview/data/db.ijs` (a loadable J script via `3!:1`). On startup `init.ijs` loads it if it exists.

---

## 5. J Addon Requirements

Install all of these via the J Package Manager before first run:

| Addon | Install command | Purpose |
|---|---|---|
| `math/lapack2` | `install 'math/lapack2'` | SVD + eigendecomposition for PCA |
| `tables/csv` | `install 'tables/csv'` | CSV file read/write |
| `convert/json` | `install 'convert/json'` | JSON encode/decode for API |
| `convert/base64` | `install 'convert/base64'` | Session token encoding |
| `security/sha` | `install 'security/sha'` | SHA-256 for password hashing and HMAC |
| `stats/base` | `install 'stats/base'` | Statistical utilities (used by jlearn) |

---

## 6. Implementation Phases

### Phase 1 — Core Infrastructure
1. `src/init.ijs` — addon loading, jlearn path setup, JHS start on port 65001
2. `src/db.ijs` — in-memory store, file-backed persistence
3. `src/auth.ijs` — register/login, SHA-256+salt hashing, stateless token
4. `src/routes/api_health.ijs` — `GET /api/health` returns `{"status":"ok"}`
5. `src/routes/api_auth.ijs` — `POST /api/register`, `POST /api/login`
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

## 10. Key Design Decisions and Rationale

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
