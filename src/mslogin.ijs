NB. mslogin.ijs — ModelScope login / register page
NB. URL: /mslogin
NB.
NB. Session globals (in jhs locale):
NB.   MS_UID  — integer user id, _1 when not logged in
NB.   MS_USER — username string, '' when not logged in

coclass 'mslogin'
coinsert 'jhs'

NB. ── Session globals — initialised once at load time ──────────────────────
NB. These live in the jhs locale so all page locales share them.
if. _1 = nc <'MS_UID_jhs_'  do. MS_UID_jhs_  =: _1 end.
if. _1 = nc <'MS_USER_jhs_' do. MS_USER_jhs_ =: '' end.

NB. ── Page body ─────────────────────────────────────────────────────────────
NB. HBS sentences are evaluated by jhbs; each must return an HTML string.
NB. jhspan returns a <span> that jhrcmds 'set msg *...' can update in place.
HBS =: 0 : 0
'<div class="ms-login-wrap">'
jhh1 'ModelScope'
'<p class="ms-subtitle">Data analysis for J</p>'
'<div class="ms-card">'
'msg' jhspan ''
jhtablea
jhtr 'Username:' ; 'uname' jhtext '';20
jhtr 'Password:' ; 'pass' jhpassword '';20
jhtablez
jhbr
'login'    jhb 'Sign in'
'<span class="ms-sep"> &nbsp; </span>'
'register' jhb 'Register'
'</div>'
'</div>'
)

CSS =: 0 : 0
body { font-family: sans-serif; background: #f0f2f5; }
.ms-login-wrap { display:flex; flex-direction:column; align-items:center; padding-top:80px; }
.ms-subtitle { color:#666; margin-top:-8px; }
.ms-card { background:#fff; border-radius:8px; padding:32px 40px; box-shadow:0 2px 8px rgba(0,0,0,.12); min-width:320px; }
.ms-card table { margin-bottom:12px; }
.ms-card td { padding:4px 8px 4px 0; vertical-align:middle; }
.ms-sep { display:inline-block; width:8px; }
#msg { color:red; display:block; min-height:1.2em; margin-bottom:8px; }
button.jhb { padding:6px 18px; border-radius:4px; cursor:pointer; }
)

JS =: 0 : 0
function ev_uname_enter() { jscdo('login'); }
function ev_pass_enter()  { jscdo('login'); }
function ev_login_click()    { jdoajax(['uname','pass'],'login'); }
function ev_register_click() { jdoajax(['uname','pass'],'register'); }

function ev_login_click_ajax(ts)    { if(ts[0]) location.href='/msdashboard'; else jbyid('msg').innerHTML=ts[1]; }
function ev_register_click_ajax(ts) { if(ts[0]) location.href='/msdashboard'; else jbyid('msg').innerHTML=ts[1]; }
)

NB. ── Page render ─────────────────────────────────────────────────────────
jev_get =: 3 : 0
  if. _1 ~: MS_UID_jhs_ do.
    jhrcmds 'pageopen *msdashboard'
    return.
  end.
  'ModelScope' jhr ''
)

NB. ── Login handler (ajax) ───────────────────────────────────────────────
NB. Returns JASEP-delimited: ok(1/0) JASEP message
ev_login_click =: 3 : 0
  uname =. dltb getv 'uname'
  pw    =. dltb getv 'pass'
  if. (0 = # uname) +. (0 = # pw) do.
    jhrajax '0',JASEP,'Username and password required.'
    return.
  end.
  row =. db_getuser_jhs_ uname
  if. 0 = # row do.
    jhrajax '0',JASEP,'Invalid credentials.'
    return.
  end.
  uid    =. > > 0 { row
  stored =. dltb > 2 { row
  salt   =. dltb > 3 { row
  if. -. auth_checkpw_jhs_ pw ; stored ; salt do.
    jhrajax '0',JASEP,'Invalid credentials.'
    return.
  end.
  MS_UID_jhs_  =: uid
  MS_USER_jhs_ =: uname
  jhrajax '1',JASEP,''
)

NB. ── Register handler (ajax) ────────────────────────────────────────────
ev_register_click =: 3 : 0
  uname =. dltb getv 'uname'
  pw    =. dltb getv 'pass'
  if. 0 = # uname do.
    jhrajax '0',JASEP,'Username required.'
    return.
  end.
  if. 3 > # pw do.
    jhrajax '0',JASEP,'Password must be at least 3 characters.'
    return.
  end.
  existing =. db_getuser_jhs_ uname
  if. 0 < # existing do.
    jhrajax '0',JASEP,'Username already taken.'
    return.
  end.
  'salt pwhash' =. auth_hashpw_jhs_ pw
  uid =. db_insertuser_jhs_ uname ; pwhash ; salt
  if. _1 = uid do.
    jhrajax '0',JASEP,'Could not create account.'
    return.
  end.
  MS_UID_jhs_  =: uid
  MS_USER_jhs_ =: uname
  jhrajax '1',JASEP,''
)
