NB. msdashboard.ijs — ModelScope main dashboard
NB. URL: /msdashboard
NB.
NB. Phase 2 features:
NB.   - Dataset list (fetched on page load)
NB.   - CSV upload via textarea (paste CSV text + give it a name)
NB.   - Quality report panel (shown after upload or on row click)
NB.   - Delete dataset

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
'<div class="ms-columns">'

NB. ── Left panel: upload + dataset list ─────────────────────────────────────
'<section class="ms-panel ms-left">'
'<h2>Datasets</h2>'
'<div class="ms-upload-form">'
'<label>Dataset name</label>'
'dsname' jhtext '';30
'<label style="margin-top:8px">Paste CSV</label>'
'<textarea id="csvdata" rows="6" placeholder="col1,col2&#10;1,2&#10;3,4"></textarea>'
'<div class="ms-upload-actions">'
'upload' jhb 'Upload'
'<span id="upload-msg" class="ms-msg"></span>'
'</div>'
'</div>'
'<div id="ds-list-wrap">'
'<p id="ds-empty" class="ms-hint">No datasets yet.</p>'
'<table id="ds-table" class="ms-table" style="display:none">'
'<thead><tr><th>Name</th><th>Rows</th><th>Cols</th><th>Uploaded</th><th></th></tr></thead>'
'<tbody id="ds-tbody"></tbody>'
'</table>'
'</div>'
'</section>'

NB. ── Right panel: quality report ────────────────────────────────────────────
'<section class="ms-panel ms-right">'
'<h2>Quality Report <span id="qr-dsname" class="ms-subtitle"></span></h2>'
'<div id="qr-summary" class="ms-qr-summary" style="display:none">'
'<span id="qr-rows" class="ms-badge"></span>'
'<span id="qr-cols" class="ms-badge"></span>'
'<span id="qr-quant" class="ms-badge ms-badge-blue"></span>'
'<span id="qr-cat" class="ms-badge ms-badge-green"></span>'
'<span id="qr-const" class="ms-badge ms-badge-warn"></span>'
'</div>'
'<div id="qr-cols-wrap">'
'<p id="qr-hint" class="ms-hint">Select a dataset to see its quality report.</p>'
'<table id="qr-table" class="ms-table" style="display:none">'
'<thead><tr><th>Column</th><th>Type</th><th>Missing</th><th>Unique</th><th>Constant?</th></tr></thead>'
'<tbody id="qr-tbody"></tbody>'
'</table>'
'</div>'
'</section>'

'</div>'
'</main>'
NB. Hidden fields for delete and quality-view dataset ids
'<input type="hidden" id="dsid-del"  name="dsid-del"  value="">'
'<input type="hidden" id="dsid-view" name="dsid-view" value="">'
NB. Hidden refresh button — triggered by ev_body_load to populate dataset list
'<span style="display:none">'
'listds' jhb 'Refresh'
'</span>'
'</div>'
)

NB. ── Styles ──────────────────────────────────────────────────────────────────
CSS =: 0 : 0
* { box-sizing: border-box; }
body { font-family: sans-serif; margin:0; background:#f0f2f5; }
.ms-shell { display:flex; flex-direction:column; height:100vh; }
.ms-header { display:flex; align-items:center; gap:16px; padding:12px 24px;
             background:#2c3e50; color:#fff; }
.ms-header h1 { margin:0; font-size:1.4rem; color:#fff; flex:1; }
.ms-whoami { font-size:0.9rem; color:#bdc3c7; }
button.jhb { padding:6px 14px; border-radius:4px; cursor:pointer;
             background:#2c3e50; color:#fff; border:none; font-size:0.9rem; }
button.jhb:hover { background:#1a252f; }
button.ms-del { padding:3px 10px; border-radius:4px; cursor:pointer;
                background:#e74c3c; color:#fff; border:none; font-size:0.8rem; }
button.ms-del:hover { background:#c0392b; }
button.ms-view { padding:3px 10px; border-radius:4px; cursor:pointer;
                 background:#2980b9; color:#fff; border:none; font-size:0.8rem; }
button.ms-view:hover { background:#1a6fa8; }
.ms-main { flex:1; overflow:auto; padding:24px; }
.ms-columns { display:flex; gap:24px; align-items:flex-start; }
.ms-panel { background:#fff; border-radius:8px; padding:24px;
            box-shadow:0 1px 4px rgba(0,0,0,.1); }
.ms-left  { flex:0 0 380px; }
.ms-right { flex:1; min-width:0; }
.ms-panel h2 { margin:0 0 16px; font-size:1.1rem; }
.ms-subtitle { font-size:0.85rem; color:#888; font-weight:normal; }
.ms-upload-form { display:flex; flex-direction:column; gap:6px; margin-bottom:20px; }
.ms-upload-form label { font-size:0.85rem; font-weight:600; color:#555; }
.ms-upload-form input[type=text] { width:100%; padding:6px 8px;
  border:1px solid #ccc; border-radius:4px; font-size:0.9rem; }
textarea#csvdata { width:100%; padding:6px 8px; border:1px solid #ccc;
  border-radius:4px; font-size:0.85rem; font-family:monospace;
  resize:vertical; }
.ms-upload-actions { display:flex; align-items:center; gap:12px; margin-top:4px; }
.ms-msg { font-size:0.85rem; }
.ms-msg.ok  { color:#27ae60; }
.ms-msg.err { color:#e74c3c; }
.ms-hint { color:#999; font-size:0.9rem; }
.ms-table { width:100%; border-collapse:collapse; font-size:0.88rem; }
.ms-table th { text-align:left; padding:6px 10px; background:#f8f9fa;
               border-bottom:2px solid #dee2e6; color:#555; }
.ms-table td { padding:6px 10px; border-bottom:1px solid #f0f0f0; }
.ms-table tr:hover td { background:#f8f9fa; }
.ms-table .ms-actions { display:flex; gap:6px; }
.ms-qr-summary { display:flex; gap:8px; flex-wrap:wrap; margin-bottom:16px; }
.ms-badge { display:inline-block; padding:4px 10px; border-radius:12px;
            background:#e9ecef; font-size:0.82rem; color:#444; }
.ms-badge-blue { background:#d6eaf8; color:#1a5276; }
.ms-badge-green { background:#d5f5e3; color:#1d6a39; }
.ms-badge-warn { background:#fdebd0; color:#784212; }
)

NB. ── Client JavaScript ─────────────────────────────────────────────────────
JS =: 0 : 0
// ── Upload ──────────────────────────────────────────────────────────────────
function ev_upload_click() {
  var name = jbyid('dsname').value.trim();
  var csv  = jbyid('csvdata').value;
  if (!name) { showMsg('upload-msg','Dataset name required.','err'); return; }
  if (!csv.trim()) { showMsg('upload-msg','Paste some CSV first.','err'); return; }
  jdoajax(['dsname','csvdata'], '');
}
function ev_upload_click_ajax(ts) {
  if (ts[0]==='1') {
    showMsg('upload-msg','Uploaded!','ok');
    jbyid('dsname').value = '';
    jbyid('csvdata').value = '';
    refreshDatasets(ts[1]);   // ts[1] is the dataset list JSON
  } else {
    showMsg('upload-msg', ts[1], 'err');
  }
}

// ── Logout ──────────────────────────────────────────────────────────────────
function ev_logout_click() { jdoajax([], ''); }
function ev_logout_click_ajax(ts) { location.href='/mslogin'; }

// ── Refresh dataset list ─────────────────────────────────────────────────────
function ev_body_load() { jscdo('listds'); }
function ev_listds_click() { jdoajax([], ''); }
function ev_listds_click_ajax(ts) { refreshDatasets(ts[0]); }

// ── Delete dataset ───────────────────────────────────────────────────────────
function deleteDataset(id) {
  jbyid('dsid-del').value = id;
  jform.jmid.value  = 'delete';
  jform.jtype.value = 'click';
  jdoajax(['dsid-del'], '');
}
function ev_delete_click_ajax(ts) {
  if (ts[0]==='1') refreshDatasets(ts[1]);
  else showMsg('upload-msg', ts[1], 'err');
}

// ── View quality report ──────────────────────────────────────────────────────
function viewQuality(id, name) {
  jbyid('dsid-view').value = id;
  jform.jmid.value  = 'quality';
  jform.jtype.value = 'click';
  jdoajax(['dsid-view'], '');
}
function ev_quality_click_ajax(ts) {
  if (ts[0]==='1') renderQuality(ts[1], ts[2]);
  else jbyid('qr-hint').textContent = ts[1];
}

// ── Render helpers ───────────────────────────────────────────────────────────
function showMsg(id, msg, cls) {
  var el = jbyid(id);
  el.textContent = msg;
  el.className = 'ms-msg ' + cls;
}

function refreshDatasets(json) {
  var datasets = JSON.parse(json);
  var tbody = jbyid('ds-tbody');
  tbody.innerHTML = '';
  if (datasets.length === 0) {
    jbyid('ds-empty').style.display = '';
    jbyid('ds-table').style.display = 'none';
    return;
  }
  jbyid('ds-empty').style.display = 'none';
  jbyid('ds-table').style.display = '';
  datasets.forEach(function(ds) {
    var tr = document.createElement('tr');
    tr.innerHTML =
      '<td>' + esc(ds.name) + '</td>' +
      '<td>' + ds.rows + '</td>' +
      '<td>' + ds.cols + '</td>' +
      '<td>' + ds.ts.substring(0,10) + '</td>' +
      '<td><div class="ms-actions">' +
        '<button class="ms-view" onclick="viewQuality(' + ds.id + ',\'' + esc(ds.name) + '\')">Quality</button>' +
        '<button class="ms-del"  onclick="deleteDataset(' + ds.id + ')">Delete</button>' +
      '</div></td>';
    tbody.appendChild(tr);
  });
}

function renderQuality(name, json) {
  var qr = JSON.parse(json);
  jbyid('qr-dsname').textContent = '— ' + name;
  jbyid('qr-rows').textContent   = qr.rows + ' rows';
  jbyid('qr-cols').textContent   = qr.cols + ' columns';
  jbyid('qr-quant').textContent  = qr.quant + ' numeric';
  jbyid('qr-cat').textContent    = qr.cat + ' categorical';
  jbyid('qr-const').textContent  = qr.constant_cols + ' constant';
  jbyid('qr-summary').style.display = '';
  var tbody = jbyid('qr-tbody');
  tbody.innerHTML = '';
  qr.columns.forEach(function(col) {
    var tr = document.createElement('tr');
    tr.innerHTML =
      '<td>' + esc(col.name) + '</td>' +
      '<td>' + (col.type==='q' ? 'numeric' : 'categorical') + '</td>' +
      '<td>' + col.missing + '</td>' +
      '<td>' + col.unique + '</td>' +
      '<td>' + (col.constant ? 'yes' : '') + '</td>';
    tbody.appendChild(tr);
  });
  jbyid('qr-hint').style.display  = 'none';
  jbyid('qr-table').style.display = '';
}

function esc(s) {
  return String(s).replace(/&/g,'&amp;').replace(/</g,'&lt;').replace(/>/g,'&gt;');
}
)

NB. ── Event dispatcher ────────────────────────────────────────────────────────
jev_get =: jev =: 3 : 0
  mid  =. getv 'jmid'
  type =. getv 'jtype'
  if. 0 = # mid do.
    if. _1 = MS_UID_jhs_ do.
      jhrcmds 'pageopen *mslogin'
      return.
    end.
    jhcmds 'set ms-whoami *Signed in as ',MS_USER_jhs_
    'ModelScope' jhr ''
    return.
  end.
  if. 'logout_click' -: mid,'_',type do.
    MS_UID_jhs_  =: _1
    MS_USER_jhs_ =: ''
    jhrajax ''
  elseif. 'upload_click' -: mid,'_',type do.
    ms_upload''
  elseif. 'listds_click' -: mid,'_',type do.
    ms_listds''
  elseif. 'delete_click' -: mid,'_',type do.
    ms_delete''
  elseif. 'quality_click' -: mid,'_',type do.
    ms_quality''
  else.
    jhrajax ''
  end.
)

NB. ── Dataset list JSON builder ───────────────────────────────────────────────
NB. Returns a JSON array string from db_listdatasets rows.
ms_ds_list_json =: 3 : 0
  uid  =. MS_UID_jhs_
  rows =. db_listdatasets_jhs_ uid
  nrows =. # rows
  if. 0 = nrows do.
    r =. '[]'
    return.
  end.
  r =. '['
  i =. 0
  while. i < nrows do.
    row  =. i { rows
    dsid =. > > 0 { row
    nm   =. dltb > 1 { row
    nrws =. > > 2 { row
    ncls =. > > 3 { row
    ts   =. dltb > 6 { row
    entry =. '{"id":' , (": dsid)
    entry =. entry , ',"name":' , (enc_json_json_ nm)
    entry =. entry , ',"rows":' , (": nrws)
    entry =. entry , ',"cols":' , (": ncls)
    entry =. entry , ',"ts":'   , (enc_json_json_ ts) , '}'
    if. i > 0 do. r =. r , ',' end.
    r =. r , entry
    i =. >: i
  end.
  r =. r , ']'
  r
)

NB. ── Upload handler ───────────────────────────────────────────────────────────
ms_upload =: 3 : 0
  r =. ''
  try.
  uid   =. MS_UID_jhs_
  dsnm  =. dltb getv 'dsname'
  csvtx =. getv 'csvdata'
  if. 0 = # dsnm do.
    jhrajax '0',JASEP,'Dataset name required.'
    return.
  end.
  if. 0 = # dltb csvtx do.
    jhrajax '0',JASEP,'No CSV data provided.'
    return.
  end.
  NB. parse
  'header datamat' =. csv_parse_jhs_ csvtx
  ncols =. # header
  nrows =. # datamat
  if. (0 = ncols) +. (0 = nrows) do.
    jhrajax '0',JASEP,'CSV appears empty or has only a header row.'
    return.
  end.
  NB. type detection and quality report
  NB. use (<x),<y syntax — ; merges boxed vec + boxed matrix into a matrix
  types  =. csv_detect_types_jhs_ datamat
  qrep   =. csv_quality_report_jhs_ (<header) , (<datamat) , <types
  prev   =. csv_preview_json_jhs_ (<header) , <datamat
  NB. numeric matrix for PCA later
  'rawjson colsjson rowidxjson' =. csv_to_json_matrix_jhs_ (<header) , (<datamat) , <types
  NB. column name lists
  qcols_json =. enc_json_json_ (dltb &.> (I. 'q' = types) { header)
  ccols_json =. enc_json_json_ (dltb &.> (I. 'c' = types) { header)
  acols_json =. enc_json_json_ (dltb &.> header)
  NB. store
  dsid =. db_insertdataset_jhs_ uid ; dsnm ; nrows ; ncols ; qcols_json ; ccols_json ; acols_json ; rawjson ; qrep ; prev
  if. _1 = dsid do.
    jhrajax '0',JASEP,'Database error — could not save dataset.'
    return.
  end.
  listjson =. ms_ds_list_json''
  jhrajax '1',JASEP,listjson
  catch.
    jhrajax '0',JASEP,'Upload error: ',13!:12''
  end.
)

NB. ── List datasets handler ───────────────────────────────────────────────────
ms_listds =: 3 : 0
  listjson =. ms_ds_list_json''
  jhrajax listjson
)

NB. ── Delete dataset handler ──────────────────────────────────────────────────
ms_delete =: 3 : 0
  uid  =. MS_UID_jhs_
  dsid =. ". dltb getv 'dsid-del'
  if. 0 = # ": dsid do.
    jhrajax '0',JASEP,'Invalid dataset id.'
    return.
  end.
  ok =. db_deletedataset_jhs_ dsid ; uid
  if. ok do.
    listjson =. ms_ds_list_json''
    jhrajax '1',JASEP,listjson
  else.
    jhrajax '0',JASEP,'Delete failed.'
  end.
)

NB. ── Quality report handler ──────────────────────────────────────────────────
ms_quality =: 3 : 0
  uid  =. MS_UID_jhs_
  dsid =. ". dltb getv 'dsid-view'
  row  =. db_getdataset_jhs_ dsid ; uid
  if. 0 = # row do.
    jhrajax '0',JASEP,'Dataset not found.'
    return.
  end.
  nm   =. dltb > 1 { row
  qrep =. dltb > 8 { row
  jhrajax '1',JASEP,nm,JASEP,qrep
)
