NB. msdashboard.ijs — ModelScope main dashboard
NB. URL: /msdashboard
NB.
NB. Requires MS_UID_jhs_ != _1 (set by mslogin after authentication).
NB. All dataset and PCA functionality will be added to this locale.

coclass 'msdashboard'
coinsert 'jhs'

NB. ── Page body ─────────────────────────────────────────────────────────────
HBS =: 0 : 0
'<div class="ms-shell">'
'<header class="ms-header">'
jhh1 'ModelScope'
'<span id="ms-whoami" class="ms-whoami"></span>'
'logout' jhb 'Sign out'
'</header>'
'<main class="ms-main">'
'<section class="ms-datasets">'
'<h2>Datasets</h2>'
'<p id="ms-dataset-msg">No datasets yet.</p>'
'</section>'
'</main>'
'</div>'
)

CSS =: 0 : 0
body { font-family: sans-serif; margin:0; background:#f8f9fa; }
.ms-shell { display:flex; flex-direction:column; height:100vh; }
.ms-header { display:flex; align-items:center; gap:16px; padding:12px 24px;
             background:#2c3e50; color:#fff; }
.ms-header h1 { margin:0; font-size:1.4rem; color:#fff; flex:1; }
.ms-whoami { font-size:0.9rem; color:#ccc; }
button.jhb { padding:6px 14px; border-radius:4px; cursor:pointer; }
.ms-main { flex:1; padding:24px; }
.ms-datasets h2 { margin-top:0; }
)

JS =: 0 : 0
function ev_logout_click() { jdoajax([],''); }
function ev_logout_click_ajax(ts) { location.href='/mslogin'; }
)

NB. ── Event dispatcher ────────────────────────────────────────────────────────
NB. jev_msdashboard_ resolves to verb 'jev' in locale msdashboard — defined here.
jev_get =: jev =: 3 : 0
  mid  =. getv 'jmid'
  type =. getv 'jtype'
  if. 0 = # mid do.
    NB. GET — render page or redirect to login
    if. _1 = MS_UID_jhs_ do.
      jhrcmds 'pageopen *mslogin'
      return.
    end.
    jhcmds 'set ms-whoami *Signed in as ',MS_USER_jhs_
    'ModelScope — Dashboard' jhr ''
    return.
  end.
  NB. Ajax event dispatch
  if. 'logout_click' -: mid,'_',type do.
    MS_UID_jhs_  =: _1
    MS_USER_jhs_ =: ''
    jhrajax ''
  else.
    jhrajax ''
  end.
)
