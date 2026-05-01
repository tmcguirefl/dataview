NB. init.ijs — ModelScope-J server entry point
NB. Usage (from dataview/ directory):
NB.   jconsole -js "load '~/jdev/dataview/src/init.ijs'" > /tmp/modelscope.log 2>&1 &
NB.
NB. Mirrors the proven jmcp pattern:
NB.   getdata'' in a loop, check RAW for POSTs, dispatch GETs inline.
NB. htmlresponse_jhs_ is always locale-qualified to avoid resolution issues.
NB.
NB. GOTCHA: select./case. string matching hangs in J9.8. Always use if./elseif.
NB. GOTCHA: r =. '' [ return. does NOT exit — [ evaluates both sides.
NB.         Use explicit if./end. block with r=. '' then return. on separate lines.

NB. ============================================================
NB. 1. Core addons
NB. ============================================================
require 'data/ddsqlite'
setzlocale_jddsqlite_ ''
require 'convert/pjson'
require 'convert/json'
require 'tables/csv'
require 'stats/base'

NB. ============================================================
NB. 2. JHS config locale — define config verb before loading core
NB. ============================================================
coclass 'jhs'

MS_PORT =: 65002   NB. 65001 is in use by another account's jmcp server

config =: 3 : 0
  AUTO =: 0
  PORT =: MS_PORT
)

NB. Load JHS core — defines jhscfg, dobind, getdata, htmlresponse, addOKURL, etc.
load '~addons/ide/jhs/core.ijs'

NB. ============================================================
NB. 3. Shared JSON response helpers (all in jhs locale)
NB.    htmlresponse_jhs_ is locale-qualified so it resolves correctly
NB.    from any locale the caller runs in.
NB.    GOTCHA: htmlresponse closes socket — call exactly once per request
NB. ============================================================
CRLF =: (13{a.) , (10{a.)

japi_ok =: 3 : 0
  r =. 'HTTP/1.1 200 OK' , CRLF
  r =. r , 'Content-Type: application/json' , CRLF
  r =. r , 'Access-Control-Allow-Origin: *' , CRLF
  r =. r , 'Access-Control-Allow-Headers: Authorization, Content-Type' , CRLF
  r =. r , CRLF , y
  htmlresponse_jhs_ r
)

NB. x is HTTP status fragment e.g. '400 Bad Request'
japi_err =: 4 : 0
  r =. 'HTTP/1.1 ' , x , CRLF
  r =. r , 'Content-Type: application/json' , CRLF
  r =. r , 'Access-Control-Allow-Origin: *' , CRLF
  r =. r , 'Access-Control-Allow-Headers: Authorization, Content-Type' , CRLF
  r =. r , CRLF , y
  htmlresponse_jhs_ r
)

japi_404 =: 3 : 0
  '404 Not Found' japi_err '{"status":"error","message":"not found"}'
)

japi_options =: 3 : 0
  r =. 'HTTP/1.1 204 No Content' , CRLF
  r =. r , 'Access-Control-Allow-Origin: *' , CRLF
  r =. r , 'Access-Control-Allow-Methods: GET, POST, PATCH, DELETE, OPTIONS' , CRLF
  r =. r , 'Access-Control-Allow-Headers: Authorization, Content-Type' , CRLF
  r =. r , CRLF
  htmlresponse_jhs_ r
)

NB. ============================================================
NB. 4. Static file server
NB.    GOTCHA: select./case. hangs in J9.8 — use if./elseif. for content type
NB. ============================================================
japi_static =: 3 : 0
  fname =. y
  if. (0 = # fname) +. '/' -: fname do. fname =. 'index.html' end.
  fpath =. 'src/www/' , fname
  if. -. fexist fpath do.
    '404 Not Found' japi_err '{"status":"error","message":"file not found"}'
    return.
  end.
  ext =. (1 + fpath i: '.') }. fpath
  if. 'html' -: ext do.
    ct =. 'text/html'
  elseif. 'js' -: ext do.
    ct =. 'application/javascript'
  elseif. 'css' -: ext do.
    ct =. 'text/css'
  else.
    ct =. 'application/octet-stream'
  end.
  content =. fread fpath
  r =. 'HTTP/1.1 200 OK' , CRLF
  r =. r , 'Content-Type: ' , ct , '; charset=utf-8' , CRLF
  r =. r , 'Content-Length: ' , (": # content) , CRLF
  r =. r , CRLF , content
  htmlresponse_jhs_ r
)

NB. ============================================================
NB. 5. getfield helper
NB.    GOTCHA: pjson keys are rank-1; ravel both sides before -:
NB.    GOTCHA: return. ignores its argument — assign then return. separately
NB. ============================================================
getfield =: 4 : 0
  r =. ''
  i =. 0
  nx =. , x
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

NB. ============================================================
NB. 6. Auth API handlers (in jhs locale)
NB. ============================================================

api_register =: 3 : 0
  body =. y
  uname =. dltb 'username' getfield body
  pw    =. dltb 'password' getfield body
  if. 0 = # uname do.
    '400 Bad Request' japi_err '{"status":"error","message":"username required"}'
    return.
  end.
  if. 0 = # pw do.
    '400 Bad Request' japi_err '{"status":"error","message":"password required"}'
    return.
  end.
  if. 3 > # pw do.
    '400 Bad Request' japi_err '{"status":"error","message":"password too short"}'
    return.
  end.
  existing =. db_getuser uname
  if. 0 < # existing do.
    '409 Conflict' japi_err '{"status":"error","message":"username already taken"}'
    return.
  end.
  'salt pwhash' =. auth_hashpw pw
  uid =. db_insertuser uname ; pwhash ; salt
  if. _1 = uid do.
    '500 Internal Server Error' japi_err '{"status":"error","message":"could not create user"}'
    return.
  end.
  tok =. auth_maketoken''
  db_settoken uid ; tok
  resp =. '{"token":"', tok, '","userId":', ((": uid) rplc '_';'-'), ',"username":"', uname, '"}'
  japi_ok resp
)

api_login =: 3 : 0
  body =. y
  uname =. dltb 'username' getfield body
  pw    =. dltb 'password' getfield body
  if. (0 = # uname) +. (0 = # pw) do.
    '400 Bad Request' japi_err '{"status":"error","message":"username and password required"}'
    return.
  end.
  row =. db_getuser uname
  if. 0 = # row do.
    '401 Unauthorized' japi_err '{"status":"error","message":"invalid credentials"}'
    return.
  end.
  uid    =. > > 0 { row
  stored =. dltb > 2 { row
  salt   =. dltb > 3 { row
  if. -. auth_checkpw pw ; stored ; salt do.
    '401 Unauthorized' japi_err '{"status":"error","message":"invalid credentials"}'
    return.
  end.
  tok =. auth_maketoken''
  db_settoken uid ; tok
  resp =. '{"token":"', tok, '","userId":', ((": uid) rplc '_';'-'), ',"username":"', uname, '"}'
  japi_ok resp
)

NB. ============================================================
NB. 6b. jev_post_raw_api_ stub — must exist so getdata sets RAW=1 for POST /api
NB.     getdata checks: 3=nc<'jev_post_raw_',URL,'_'
NB.     J parses jev_post_raw_api_ as verb jev_post_raw in locale api.
NB.     Our loop calls api_post_dispatch directly; this stub is never invoked.
NB. ============================================================
jev_post_raw_api_ =: 3 : 0
  api_post_dispatch''
)

NB. ============================================================
NB. 7. POST dispatcher — called after getdata when RAW=1, URL='api'
NB.    Reads sub-route from ?r=<route> query param.
NB.    With RAW=1, NV holds the raw body. The query string is NOT set as QUERY —
NB.    extract it from the raw POST request line via gethv 'POST'.
NB.    gethv 'POST' returns e.g. '/api?r=register HTTP/1.1'
NB.    GOTCHA: select./case. hangs in J9.8 — use if./elseif. for routing
NB. ============================================================
api_post_dispatch =: 3 : 0
  reqline =. gethv 'POST'
  qi =. reqline i. '?'
  qs =. (>: qi) }. reqline
  qs =. (qs i. ' ') {. qs
  route =. ''
  parts =. <;._2 qs , '&'
  i =. 0
  while. i < # parts do.
    p =. > i { parts
    if. 'r=' -: 2 {. p do.
      route =. 2 }. p
    end.
    i =. >: i
  end.
  body =. dec_pjson_ NV
  if. 'register' -: route do.
    api_register body
  elseif. 'login' -: route do.
    api_login body
  else.
    japi_404''
  end.
)

NB. ============================================================
NB. 8. GET dispatcher
NB.    GOTCHA: select./case. hangs in J9.8 — use if./elseif.
NB. ============================================================
get_dispatch =: 3 : 0
  base =. URL {. ~ (URL i. '?') <. # URL
  if. 'api/health' -: base do.
    japi_ok '{"status":"ok","service":"modelscope-j","version":"0.1.0"}'
  else.
    japi_static base
  end.
)

NB. ============================================================
NB. 9. Load application modules
NB. ============================================================
load 'src/db.ijs'
load 'src/auth.ijs'

NB. ============================================================
NB. 10. Main server — mirrors jmcp pattern exactly
NB.     getdata sets RAW, URL, METHOD, NV globals
NB.     GOTCHA: jfe 1 is a no-op under jconsole -js; use getdata loop
NB.     GOTCHA: OKURL must be boxed list before addOKURL
NB. ============================================================
app_serve =: 3 : 0
  db_open''

  OKURL =: 0 $ <''
  jhscfg''
  logappfile =: < jpath '~user/modelscope.log'
  IFJHS_z_ =: 1
  LOCALHOST =: '0.0.0.0'
  cookie =: 'jcookie=' , ": 6!:0''
  SKSERVER_jhs_ =: _1
  r =. dobind''
  if. 0 ~: r do.
    echo 'FATAL: bind failed on port ' , (": PORT)
    exit''
  end.
  sdcheck_jsocket_ sdlisten_jsocket_ SKLISTEN , 5
  addOKURL 'api'
  echo 'ModelScope-J listening on http://0.0.0.0:' , (": PORT)
  echo 'Health check: curl http://localhost:' , (": PORT) , '/api/health'
  while. 1 do.
    try.
      getdata''
      meth =. toupper METHOD
      if. 'OPTIONS' -: meth do.
        japi_options''
      elseif. (1 = RAW) *. 'api' -: URL do.
        api_post_dispatch''
      elseif. 'GET' -: meth do.
        get_dispatch''
      else.
        japi_404''
      end.
    catch.
    end.
  end.
)

app_serve''
