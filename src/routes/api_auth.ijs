NB. api_auth.ijs — POST /api/register  POST /api/login
NB.
NB. Both endpoints expect raw JSON body (Content-Type: application/json):
NB.   register: {"username":"alice","password":"secret"}
NB.   login:    {"username":"alice","password":"secret"}
NB.
NB. Both return: {"token":"<40hexchars>","userId":<int>,"username":"<str>"}
NB. or:          {"status":"error","message":"<reason>"}

coclass 'apiauth'
coinsert 'jhs'

NB. --------------------------------------------------------
NB. getfield — extract a value from a dec_pjson_ result by key
NB. x is key string, y is the n x 2 boxed matrix from dec_pjson_
NB. returns unboxed value or '' if not found
NB.
NB. GOTCHA (JHSinfo.md): pjson keys are rank-1 char vectors;
NB. J string literals are rank-0. Ravel both sides before -:
NB. GOTCHA: assign to r then return. — return. ignores its argument
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

NB. --------------------------------------------------------
NB. json_str — wrap a string value in JSON double-quotes, escaping backslash and quote
json_str =: 3 : 0
  escaped =. y rplc '\' ; '\\'
  escaped =. escaped rplc '"' ; '\"'
  escaped =. escaped rplc (13{a.) ; '\r'
  escaped =. escaped rplc (10{a.) ; '\n'
  r =. '"' , escaped , '"'
  r
)

NB. json_int — format an integer for JSON (replace J's _ negative sign with -)
NB. GOTCHA (JHSinfo.md): ": formats negatives with _ not -
json_int =: 3 : '(": y) rplc ''_'';''-'''

NB. --------------------------------------------------------
NB. POST /api/register
jev_post_raw_api_register_ =: 3 : 0
  body =. dec_pjson_ NV_jhs_
  uname =. dltb 'username' getfield body
  pw    =. dltb 'password' getfield body

  NB. Validate inputs
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

  NB. Check username not already taken
  existing =. db_getuser_jhs_ uname
  if. 0 < # existing do.
    '409 Conflict' japi_err '{"status":"error","message":"username already taken"}'
    return.
  end.

  NB. Hash password and insert user
  'salt pwhash' =. auth_hashpw_jhs_ pw
  uid =. db_insertuser_jhs_ uname ; pwhash ; salt
  if. _1 = uid do.
    '500 Internal Server Error' japi_err '{"status":"error","message":"could not create user"}'
    return.
  end.

  NB. Generate session token and store it
  tok =. auth_maketoken_jhs_''
  db_settoken_jhs_ uid ; tok

  resp =. '{"token":', (json_str tok)
  resp =. resp , ',"userId":', (json_int uid)
  resp =. resp , ',"username":', (json_str uname), '}'
  japi_ok resp
)

NB. --------------------------------------------------------
NB. POST /api/login
jev_post_raw_api_login_ =: 3 : 0
  body =. dec_pjson_ NV_jhs_
  uname =. dltb 'username' getfield body
  pw    =. dltb 'password' getfield body

  if. (0 = # uname) +. (0 = # pw) do.
    '400 Bad Request' japi_err '{"status":"error","message":"username and password required"}'
    return.
  end.

  NB. Look up user
  row =. db_getuser_jhs_ uname
  if. 0 = # row do.
    '401 Unauthorized' japi_err '{"status":"error","message":"invalid credentials"}'
    return.
  end.

  NB. row columns: id;username;pwhash;salt;session_token;displayname;email;created_at
  uid    =. > > 0 { row
  stored =. dltb > 2 { row
  salt   =. dltb > 3 { row

  NB. Verify password
  if. -. auth_checkpw_jhs_ pw ; stored ; salt do.
    '401 Unauthorized' japi_err '{"status":"error","message":"invalid credentials"}'
    return.
  end.

  NB. Issue new token
  tok =. auth_maketoken_jhs_''
  db_settoken_jhs_ uid ; tok

  resp =. '{"token":', (json_str tok)
  resp =. resp , ',"userId":', (json_int uid)
  resp =. resp , ',"username":', (json_str uname), '}'
  japi_ok resp
)
