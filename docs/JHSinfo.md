# JHSinfo — Lessons Learned: J Language and JHS Platform

Practical issues encountered building an MCP server in pure J using JHS (J HTTP Server)
as the HTTP frontend. Organized by category.

---

## J Language Gotchas

### Right-to-left evaluation — parentheses are mandatory

J has no operator precedence: every verb is evaluated strictly right-to-left.
String concatenation chains require explicit parentheses around sub-expressions.

```j
NB. WRONG — evaluates as  'prefix' , ": (port , '/path')
'http://' , LOCALHOST , ':' , ": PORT , '/mcp'

NB. CORRECT
'http://' , LOCALHOST , ':' , (": PORT) , '/mcp'
```

### `-:` (match) is rank-sensitive

`-:` compares shape AND contents. String literals in source code are rank-0 scalars;
`dec_pjson_` returns JSON string values as rank-1 character vectors. They do not match
with `-:` even when the characters are identical.

```j
'a' -: 'a'        NB. 1  (both rank-0 scalar)
'a' -: ,'a'       NB. 0  (rank-0 vs rank-1) — pjson keys are rank-1

NB. Fix: ravel both sides before comparing
nx =. , x
k  =. , > 0 { row
k -: nx           NB. 1
```

### `;` (Link) appends rows into matching-rank arrays — it does not always box

`;` boxes its arguments **only when they are rank-0 scalars or rank-1 vectors** and
the ranks are compatible for boxing. When the right argument is a 2D boxed matrix,
`;` treats the left atom as a one-row matrix and appends it, producing a larger matrix.

```j
jrpcid =. 3
body   =. 4 2 $ ...    NB. 4-row 2-col boxed matrix

jrpcid ; body          NB. WRONG — gives 5x2 matrix, not 2-element list
(<jrpcid) , <body      NB. CORRECT — explicit 2-element boxed list
```

### Verb return value is the last evaluated expression

`return.` exits a verb but its argument is **ignored**. The verb returns whatever
was last assigned to a name.

```j
NB. WRONG — verb returns '' (last assignment), not the found value
if. k -: nx do. return. > 1 { row end.

NB. CORRECT — assign first, then return
if. k -: nx do.
  r =. > 1 { row
  return.
end.
```

Equally: a `while.` loop's last evaluated expression is the test predicate (or last
body statement), not any accumulated result. Always end a verb with an explicit
`r` line to guarantee the intended return value.

```j
mcp_getfield =: 4 : 0
  r =. ''      NB. default return value
  i =. 0
  while. i < # y do.
    ...
    i =. >: i
  end.
  r            NB. explicit return — without this, verb returns i (loop counter)
)
```

### Control structures must be inside a verb body

`if.`, `while.`, `select.`, `try./catch.` are only valid inside an explicit or
tacit verb definition. Using them at the top level of a script produces a
spelling or syntax error.

```j
NB. WRONG at script top level
while. 1 do. ... end.

NB. CORRECT — wrap in a verb
serve =: 3 : 0
  while. 1 do. ... end.
)
serve ''
```

### `try./catch.` blocks cannot be assigned directly

The result of a `try./catch.` block cannot be captured with `=.` on the same line.

```j
NB. WRONG
result =. try. foo'' catch. 'err' end.

NB. CORRECT — assign inside each branch
result =. ''
try.
  result =. foo''
catch.
  result =. 'err'
end.
```

### Negative number literals use `_`, not `-`

J uses `_` as the negative sign in numeric literals (`_32601`). This is **not**
valid JSON. When formatting error codes for JSON output, replace:

```j
jsoncode =. (": errcode) rplc '_';'-'
```

### Boxed strings in a boxed list are padded to equal length

When multiple strings are stored in a boxed list (e.g. a registry entry
`name ; description ; schema`), J pads all character atoms in the list to
the same length with trailing spaces. Use `dltb` (delete leading/trailing
blanks) before using the value.

```j
nm   =. dltb > 0 { entry
desc =. dltb > 1 { entry
```

---

## General JHS Application Startup Pattern

Every headless JHS web application follows the same structure. The MCP server
(`config_jhs_mcp.ijs`) is the canonical example. Copy this pattern for any new
JHS application.

### Config file structure

```j
coclass 'jhs'

NB. Application-specific settings
MY_PORT =: 65002

NB. config verb — called by jhscfg after configdefault sets defaults.
NB. Do NOT pre-assign PORT here; jhscfg only calls configdefault (which sets
NB. PASS, USER, AUTO, etc.) when PORT is undefined, so let jhscfg call it first.
config =: 3 : 0
  AUTO =: 0          NB. suppress browser launch
  PORT =: MY_PORT
)

NB. Load JHS core — defines jhscfg, getdata, addOKURL, dobind, htmlresponse, etc.
load '~addons/ide/jhs/core.ijs'

NB. Load your handler file(s) here
load '~/path/to/myhandler.ijs'

NB. Start the server
app_serve =: 3 : 0
  OKURL =: 0$<''        NB. must be boxed list before addOKURL
  jhscfg''              NB. runs configdefault, then calls config verb above
  logappfile =: <jpath '~user/myapp.log'
  IFJHS_z_ =: 1
  LOCALHOST =: '0.0.0.0'
  cookie =: 'jcookie=' , ": 6!:0''
  SKSERVER_jhs_ =: _1
  r =. dobind''
  if. 0 ~: r do. echo 'bind failed' [ exit'' end.
  sdcheck_jsocket_ sdlisten_jsocket_ SKLISTEN , 5
  addOKURL 'myurl'      NB. exempts /myurl from login redirect
  echo 'listening on http://' , LOCALHOST , ':' , (": PORT) , '/myurl'
  while. 1 do.
    try.
      getdata''
      if. (1=RAW) *. 'myurl' -: URL do.
        jev_post_raw_myurl_ ''   NB. raw POST handler
      end.
    catch. end.
  end.
)

app_serve''
```

Start with:

```sh
jconsole -js "load '~/path/to/config_myapp.ijs'" > /tmp/myapp.log 2>&1 &
```

### URL dispatch — how JHS routes requests

JHS's `input` verb (in `core.ijs`) routes each request to a handler verb whose
name encodes both the method and the URL:

| Request type | Handler verb called | Notes |
|---|---|---|
| Raw POST to `/foo` | `jev_post_raw_foo_` | RAW=1; body in `NV_jhs_` |
| Form POST to `/foo` | reads `jdo` field | standard JHS form flow |
| GET `/foo` | `jev_get_foo_` | normal page handler |
| GET with `.` in URL | `jev_get_jfilesrc_` | file serving |

RAW=1 is set by `getdata` when the POST body is not form-encoded (e.g.
`Content-Type: application/json`). The MCP server uses raw POST exclusively.

For the headless loop we drive `getdata''` directly and dispatch ourselves,
which means only the `RAW` branch is wired up. If you need GET support in a
headless app, add a parallel `elseif. 'GET' -: METHOD` branch.

### Handler verb structure

Define handler verbs in their own coclass with `coinsert 'jhs'` so they can
call `htmlresponse`, `gethv`, `NV`, etc. without explicit `_jhs_` suffixes
inside the handler body:

```j
NB. myhandler.ijs
coclass 'myurl'
coinsert 'jhs'

NB. Called for raw POST /myurl
jev_post_raw =: 3 : 0
  body =. dec_pjson_ NV_jhs_    NB. NV_jhs_: raw POST body bytes
  NB. ... process body ...
  resp =. 'HTTP/1.1 200 OK' , CRLF , 'Content-Type: application/json' , CRLF , CRLF , '{}'
  htmlresponse_jhs_ resp         NB. send response and close connection
)

NB. Called for GET /myurl
jev_get =: 3 : 0
  htmlresponse_jhs_ 'HTTP/1.1 200 OK' , CRLF , CRLF , '<html>...'
)
```

JHS calls `jev_post_raw_myurl_` because it looks up the verb name by combining
`jev_post_raw_` with the URL (`myurl`) and locale suffix (`_`). The `coinsert 'jhs'`
in the handler locale makes `jev_post_raw` visible as `jev_post_raw_myurl_` via
the locale chain.

### Available verbs after loading `core.ijs` (in `jhs` locale)

| Verb | Purpose |
|---|---|
| `jhscfg''` | Apply config: runs `configdefault`, calls `config` verb, validates |
| `dobind''` | Create and bind `SKLISTEN` socket on `PORT`; returns 0 on success |
| `getdata''` | Block until a connection arrives; sets `RAW`, `URL`, `METHOD`, `NV`, `PEER` |
| `htmlresponse y` | Send raw HTTP response string `y` and close the socket |
| `addOKURL y` | Exempt URL `y` from login redirect (must call after `jhscfg`) |
| `gethv y` | Read request header value for key `y` (include trailing colon) |
| `enc_pjson_ y` | Encode J value `y` to JSON string |
| `dec_pjson_ y` | Decode JSON string `y` to J value |

---

## JHS Platform Gotchas

### JHS creates a new locale for each URL handler at runtime

When JHS receives `POST /mcp`, it auto-creates a locale named `mcp` with a copath
of `z` only. Any handler verb executing in that locale **cannot see names defined in
the `jhs` locale** unless they are referenced with the explicit `_jhs_` suffix.

This applies to every global, helper verb, and constant defined in `jhs`:

```j
NB. Inside jev_post_raw_mcp_ — runs in 'mcp' locale, copath=z only:
NV_jhs_             NB. POST body (NV alone is undefined here)
htmlresponse_jhs_   NB. send HTTP response
MCP_CRLF_jhs_       NB. CRLF constant
MCP_SESSIONS_jhs_   NB. session store global
mcp_getfield_jhs_   NB. any helper verb defined in jhs
```

### Handler verb names ending in `_` cannot take an extra locale suffix

JHS calls `jev_post_raw_mcp_` by convention. A name ending in `_` already carries
locale-suffix syntax, so appending `__jhs_` produces an ill-formed name.

The solution is to define the handler with `coinsert 'jhs'` in its coclass. This
makes `jev_post_raw` visible as `jev_post_raw_mcp_` via the locale chain, and the
serve loop (running in `jhs`) can call it directly by its full name:

```j
NB. In mcp_handler.ijs:
coclass 'mcp'
coinsert 'jhs'   NB. gives mcp locale access to jhs verbs; also makes
                 NB. jev_post_raw visible as jev_post_raw_mcp_ to callers in jhs
jev_post_raw =: 3 : 0
  ...
)

NB. In the serve loop (running in jhs locale) — direct call works:
jev_post_raw_mcp_ ''
```

### `jfe 1` (JHS event loop) is a no-op in `jconsole` script mode

`init ''` calls `jfe 1` as its blocking loop, but `jfe` is a no-op when running
under `jconsole -js`. The server binds the socket and then exits immediately.

The fix is to drive the request loop manually with `getdata''`:

```j
mcp_serve =: 3 : 0
  OKURL =: 0$<''
  jhscfg''              NB. runs configdefault then config verb (sets AUTO=0, PORT)
  logappfile =: <jpath '~user/jmcp.log'
  IFJHS_z_ =: 1
  LOCALHOST =: '0.0.0.0'
  cookie =: 'jcookie=' , ": 6!:0''
  SKSERVER_jhs_ =: _1
  r =. dobind''
  if. 0 ~: r do. echo 'bind failed' [ exit'' end.
  sdcheck_jsocket_ sdlisten_jsocket_ SKLISTEN , 5
  addOKURL 'mcp'
  while. 1 do.
    try.
      getdata''          NB. blocks until a connection arrives
      if. (1=RAW) *. 'mcp' -: URL do.
        jev_post_raw_mcp_ ''   NB. called from jhs locale; mcp locale accessible via coinsert
      end.
    catch. end.
  end.
)
mcp_serve''
```

### `config` verb must be defined before calling `jhscfg`

`jhscfg` calls `configdefault` (which sets `AUTO =: 1`, `PORT =: 65001`, etc.)
and then calls `config` as an override hook. Define `config` in the `jhs` locale
before starting the server:

```j
coclass 'jhs'
config =: 3 : 0
  AUTO =: 0        NB. suppress browser launch
  PORT =: 65001
)
```

### `OKURL` must be initialized as a boxed list before calling `addOKURL`

`addOKURL` calls `rmOKURL` internally, which does `OKURL -. <y`. If `OKURL`
is `''` (the JHS default, a character atom), this produces a domain error.
Pre-initialize it as an empty boxed list:

```j
OKURL =: 0$<''
addOKURL 'mcp'
```

### `htmlresponse` closes the socket — never call it twice per request

Each call to `htmlresponse` sends the full HTTP response and closes the connection.
Calling it a second time for the same request causes an error. All code paths for
a given request must converge on exactly one `htmlresponse` call.

### `gethv` reads request headers — key must include the trailing colon

```j
sid =. gethv_jhs_ 'Mcp-Session-Id:'   NB. colon required
```

---

## `dec_pjson_` Object Structure

`dec_pjson_` decodes a JSON object into an **n×2 boxed matrix** where:
- Column 0: boxed **rank-1 character vector** (the key)
- Column 1: boxed decoded value (number → J float, string → rank-1 char, nested object → n×2 matrix)

```j
dec_pjson_ '{"a":3,"b":5}'
NB. shape: 2 2  (2 rows, 2 cols)
NB. 0 { result  →  row 0:  (<,'a') , (<3)
NB. 1 { result  →  row 1:  (<,'b') , (<5)
```

Nested objects are decoded recursively. `dec_pjson_` does **not** return lazy/string values
for nested objects — the entire tree is decoded in one call.

Key lookup pattern (correct):

```j
mcp_getfield =: 4 : 0
  r =. ''
  i =. 0
  nx =. , x          NB. ravel: match rank-1 keys
  while. i < # y do.
    row =. i { y
    k =. , > 0 { row
    if. k -: nx do.
      r =. > 1 { row
      return.
    end.
    i =. >: i
  end.
  r
)
```
