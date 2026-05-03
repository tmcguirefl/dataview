NB. msdashboard.ijs — ModelScope main dashboard
NB. URL: /msdashboard
NB.
NB. Phase 2 features:
NB.   - Dataset list (fetched on page load)
NB.   - CSV upload via textarea (paste CSV text + give it a name)
NB.   - Quality report panel (shown after upload or on row click)
NB.   - Delete dataset
NB.
NB. Phase 3 features:
NB.   - PCA run form (n_components, preprocessing options)
NB.   - Scree plot (Plotly)
NB.   - 2-D scatter of PC1 vs PC2 (Plotly)
NB.   - Loadings heatmap (Plotly)
NB.   - Previous PCA runs list per dataset

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

NB. ── Tab bar ─────────────────────────────────────────────────────────────
'<nav class="ms-tabs">'
'<button class="ms-tab ms-tab-active" onclick="switchTab(''tab-data'')">Datasets</button>'
'<button class="ms-tab" onclick="switchTab(''tab-pca'')">PCA</button>'
'<button class="ms-tab" onclick="switchTab(''tab-clusters'')">Clusters</button>'
'<button class="ms-tab" onclick="switchTab(''tab-analysis'')">Analysis</button>'
'<button class="ms-tab" onclick="switchTab(''tab-profile'')">Profile</button>'
'</nav>'

'<main class="ms-main">'

NB. ════════════════════════════════════════════════════════════════════════
NB. TAB 1 — Datasets
NB. ════════════════════════════════════════════════════════════════════════
'<div id="tab-data" class="ms-tab-panel">'
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
'</div>'

NB. ════════════════════════════════════════════════════════════════════════
NB. TAB 2 — PCA
NB. ════════════════════════════════════════════════════════════════════════
'<div id="tab-pca" class="ms-tab-panel" style="display:none">'
'<div class="ms-columns">'

NB. ── Left panel: PCA run form + run history ──────────────────────────────
'<section class="ms-panel ms-left">'
'<h2>Run PCA</h2>'
'<div class="ms-pca-form">'
'<label>Dataset</label>'
'<select id="pca-dsid" class="ms-select">'
'<option value="">— select a dataset —</option>'
'</select>'
'<label style="margin-top:8px">Components <span class="ms-hint-inline">(2–N)</span></label>'
'pca_ncomp' jhtext '2';4
'<label style="margin-top:8px">Preprocessing</label>'
'<div class="ms-checkgroup">'
'<label><input type="checkbox" id="pp-drop-const" checked> Drop constant columns</label>'
'<label><input type="checkbox" id="pp-scale-std"  checked> Z-score standardise</label>'
'<label><input type="checkbox" id="pp-scale-mm"> Min-max normalise</label>'
'</div>'
'<div class="ms-upload-actions" style="margin-top:12px">'
'runpca' jhb 'Run PCA'
'<span id="pca-msg" class="ms-msg"></span>'
'</div>'
'</div>'

'<h2 style="margin-top:24px">Previous Runs</h2>'
'<div id="pca-runs-wrap">'
'<p id="pca-runs-empty" class="ms-hint">No runs yet for this dataset.</p>'
'<table id="pca-runs-table" class="ms-table" style="display:none">'
'<thead><tr><th>#Comp</th><th>Samples</th><th>Date</th><th></th></tr></thead>'
'<tbody id="pca-runs-tbody"></tbody>'
'</table>'
'</div>'
'</section>'

NB. ── Right panel: plots ──────────────────────────────────────────────────
'<section class="ms-panel ms-right">'
'<h2>Results <span id="pca-run-label" class="ms-subtitle"></span></h2>'
'<p id="pca-hint" class="ms-hint">Run PCA or load a previous run to see plots.</p>'
'<div id="pca-results" style="display:none">'

NB. Preprocessing report banner
'<div id="pca-preproc-bar" class="ms-preproc-bar"></div>'

NB. Explained variance badges
'<div id="pca-ev-summary" class="ms-qr-summary" style="margin-bottom:16px"></div>'

NB. Scree plot
'<div class="ms-plot-title">Scree Plot (all components)</div>'
'<div id="plot-scree" class="ms-plot"></div>'

NB. Scatter
'<div class="ms-plot-title">PC1 vs PC2 Scatter</div>'
'<div id="plot-scatter" class="ms-plot"></div>'

NB. Loadings heatmap
'<div class="ms-plot-title">Loadings (PC rows × feature columns)</div>'
'<div id="plot-loadings" class="ms-plot" style="min-height:200px"></div>'

'</div>'
'</section>'

'</div>'
'</div>'

NB. ════════════════════════════════════════════════════════════════════════
NB. TAB 3 — Clusters
NB. ════════════════════════════════════════════════════════════════════════
'<div id="tab-clusters" class="ms-tab-panel" style="display:none">'
'<div class="ms-columns">'

NB. ── Left panel: cluster run form + history ─────────────────────────────
'<section class="ms-panel ms-left">'
'<h2>Run K-Means</h2>'
'<div class="ms-pca-form">'
'<label>PCA Run</label>'
'<select id="km-prid" class="ms-select">'
'<option value="">— select a PCA run —</option>'
'</select>'
'<label style="margin-top:8px">k (clusters) <span class="ms-hint-inline">(2–10)</span></label>'
'km_k' jhtext '3';4
'<div class="ms-upload-actions" style="margin-top:12px">'
'runkmeans' jhb 'Run K-Means'
'<span id="km-msg" class="ms-msg"></span>'
'</div>'
'</div>'

'<h2 style="margin-top:24px">Previous Runs</h2>'
'<div id="km-runs-wrap">'
'<p id="km-runs-empty" class="ms-hint">No cluster runs for this PCA run.</p>'
'<table id="km-runs-table" class="ms-table" style="display:none">'
'<thead><tr><th>k</th><th>Samples</th><th>Date</th><th></th></tr></thead>'
'<tbody id="km-runs-tbody"></tbody>'
'</table>'
'</div>'

'<h2 style="margin-top:24px">Compare PCA Runs</h2>'
'<div class="ms-pca-form">'
'<label>Run A</label>'
'<select id="cmp-rid-a" class="ms-select"><option value="">— none —</option></select>'
'<label style="margin-top:8px">Run B</label>'
'<select id="cmp-rid-b" class="ms-select"><option value="">— none —</option></select>'
'<div class="ms-upload-actions" style="margin-top:12px">'
'compareruns' jhb 'Compare'
'<span id="cmp-msg" class="ms-msg"></span>'
'</div>'
'</div>'
'</section>'

NB. ── Right panel: cluster scatter + comparison ──────────────────────────
'<section class="ms-panel ms-right">'
'<div id="km-results" style="display:none">'
'<h2>Cluster Results <span id="km-run-label" class="ms-subtitle"></span></h2>'
'<div id="km-count-summary" class="ms-qr-summary"></div>'
'<div class="ms-plot-title">PC1 vs PC2 — coloured by cluster</div>'
'<div id="plot-km-scatter" class="ms-plot"></div>'
'</div>'
'<div id="cmp-results" style="display:none">'
'<h2>Run Comparison</h2>'
'<div class="ms-cmp-row">'
'<div>'
'<div class="ms-plot-title" id="cmp-label-a"></div>'
'<div id="plot-cmp-a" class="ms-plot"></div>'
'</div>'
'<div>'
'<div class="ms-plot-title" id="cmp-label-b"></div>'
'<div id="plot-cmp-b" class="ms-plot"></div>'
'</div>'
'</div>'
'</div>'
'<p id="km-hint" class="ms-hint">Select a PCA run, choose k, and click Run K-Means.</p>'
'</section>'

'</div>'
'</div>'

NB. ════════════════════════════════════════════════════════════════════════
NB. TAB 4 — Analysis
NB. ════════════════════════════════════════════════════════════════════════
'<div id="tab-analysis" class="ms-tab-panel" style="display:none">'
'<div class="ms-columns">'

NB. ── Left panel: dataset selector + stats ──────────────────────────────
'<section class="ms-panel ms-left">'
'<h2>Column Statistics</h2>'
'<div class="ms-pca-form">'
'<label>Dataset</label>'
'<select id="an-dsid" class="ms-select">'
'<option value="">— select a dataset —</option>'
'</select>'
'<div class="ms-upload-actions" style="margin-top:12px">'
'anstats' jhb 'Load Stats'
'<span id="an-msg" class="ms-msg"></span>'
'</div>'
'</div>'
'<div id="an-stats-wrap" style="display:none">'
'<table class="ms-table">'
'<thead><tr><th>Column</th><th>Min</th><th>Max</th><th>Mean</th><th>Std</th><th>Median</th><th>N</th></tr></thead>'
'<tbody id="an-stats-tbody"></tbody>'
'</table>'
'</div>'
'</section>'

NB. ── Right panel: correlation heatmap + report download ─────────────────
'<section class="ms-panel ms-right">'
'<h2>Correlation Matrix</h2>'
'<p id="an-hint" class="ms-hint">Select a dataset and click Load Stats to see correlation.</p>'
'<div id="an-corr-wrap" style="display:none">'
'<div id="plot-corr" class="ms-plot" style="height:350px"></div>'
'</div>'
'<div id="an-report-wrap" style="display:none;margin-top:16px">'
'<h2>PCA Report</h2>'
'<p class="ms-hint" style="margin-bottom:8px">Select a PCA run to download its HTML report.</p>'
'<div class="ms-pca-form">'
'<label>PCA Run</label>'
'<select id="an-prid" class="ms-select">'
'<option value="">— select a PCA run —</option>'
'</select>'
'<div class="ms-upload-actions" style="margin-top:8px">'
'anreport' jhb 'Download Report'
'<span id="an-report-msg" class="ms-msg"></span>'
'</div>'
'</div>'
'</div>'
'</section>'

'</div>'
'</div>'

NB. ════════════════════════════════════════════════════════════════════════
NB. TAB 5 — Profile
NB. ════════════════════════════════════════════════════════════════════════
'<div id="tab-profile" class="ms-tab-panel" style="display:none">'
'<div class="ms-columns">'
'<section class="ms-panel ms-left">'
'<h2>Your Profile</h2>'
'<div class="ms-upload-form">'
'<label>Display Name</label>'
'prof_displayname' jhtext '';40
'<label style="margin-top:8px">Email</label>'
'prof_email' jhtext '';40
'<div class="ms-upload-actions" style="margin-top:12px">'
'saveprofile' jhb 'Save'
'<span id="prof-msg" class="ms-msg"></span>'
'</div>'
'</div>'
'</section>'
'</div>'
'</div>'

'</main>'

NB. Hidden fields
'<input type="hidden" id="dsid-del"  name="dsid-del"  value="">'
'<input type="hidden" id="dsid-view" name="dsid-view" value="">'
'<input type="hidden" id="pca-run-id" name="pca-run-id" value="">'
'<input type="hidden" id="pca-ds-id"  name="pca-ds-id"  value="">'
'<input type="hidden" id="km-run-id"  name="km-run-id"  value="">'
'<input type="hidden" id="km-prid-h"  name="km-prid-h"  value="">'
'<input type="hidden" id="cmp-rid-a-h" name="cmp-rid-a-h" value="">'
'<input type="hidden" id="cmp-rid-b-h" name="cmp-rid-b-h" value="">'
'<input type="hidden" id="an-dsid-h"   name="an-dsid-h"   value="">'
'<input type="hidden" id="an-prid-h"   name="an-prid-h"   value="">'

NB. Hidden refresh button triggered on body load
'<span style="display:none">'
'listds' jhb 'Refresh'
'</span>'
'</div>'

NB. Plotly CDN
'<script src="https://cdn.plot.ly/plotly-2.35.2.min.js" charset="utf-8"></script>'
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
button.ms-view:hover  { background:#1a6fa8; }
button.ms-load-run    { padding:3px 10px; border-radius:4px; cursor:pointer;
                        background:#8e44ad; color:#fff; border:none; font-size:0.8rem; }
button.ms-load-run:hover { background:#6c3483; }
.ms-tabs { display:flex; gap:0; background:#1a252f; padding:0 24px; }
.ms-tab  { padding:10px 22px; border:none; background:none; color:#bdc3c7;
           font-size:0.95rem; cursor:pointer; border-bottom:3px solid transparent; }
.ms-tab:hover      { color:#fff; }
.ms-tab-active     { color:#fff; border-bottom-color:#3498db; }
.ms-tab-panel      { width:100%; }
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
.ms-hint-inline { color:#999; font-size:0.8rem; font-weight:normal; }
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
.ms-pca-form { display:flex; flex-direction:column; gap:6px; margin-bottom:12px; }
.ms-pca-form label { font-size:0.85rem; font-weight:600; color:#555; }
.ms-pca-form input[type=text] { width:80px; padding:6px 8px;
  border:1px solid #ccc; border-radius:4px; font-size:0.9rem; }
.ms-select { width:100%; padding:6px 8px; border:1px solid #ccc;
  border-radius:4px; font-size:0.9rem; background:#fff; }
.ms-checkgroup { display:flex; flex-direction:column; gap:4px; padding:4px 0; }
.ms-checkgroup label { font-weight:normal; font-size:0.88rem; color:#444;
  cursor:pointer; display:flex; align-items:center; gap:6px; }
.ms-preproc-bar { font-size:0.82rem; color:#555; background:#f8f9fa;
  border:1px solid #e0e0e0; border-radius:4px; padding:6px 10px;
  margin-bottom:12px; }
.ms-plot-title { font-size:0.88rem; font-weight:600; color:#555;
  margin:16px 0 4px; }
.ms-plot { width:100%; height:300px; }
.ms-cmp-row { display:flex; gap:16px; }
.ms-cmp-row > div { flex:1; min-width:0; }
)

NB. ── Client JavaScript ─────────────────────────────────────────────────────
JS =: 0 : 0
// ── Tab switching ─────────────────────────────────────────────────────────
function switchTab(id) {
  ['tab-data','tab-pca','tab-clusters','tab-analysis','tab-profile'].forEach(function(t) {
    jbyid(t).style.display = t === id ? '' : 'none';
  });
  document.querySelectorAll('.ms-tab').forEach(function(btn) {
    btn.classList.toggle('ms-tab-active', btn.getAttribute('onclick').indexOf("'"+id+"'") !== -1);
  });
  if (id === 'tab-pca') refreshPcaDatasetDropdown();
  if (id === 'tab-clusters') refreshKmPcaRunDropdown();
  if (id === 'tab-analysis') refreshAnalysisDropdowns();
  if (id === 'tab-profile') loadProfileFields();
}

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
    refreshDatasets(ts[1]);
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

// ── Run PCA ──────────────────────────────────────────────────────────────────
function ev_runpca_click() {
  var dsid  = jbyid('pca-dsid').value;
  var ncomp = jbyid('pca_ncomp').value.trim();
  if (!dsid) { showMsg('pca-msg','Select a dataset first.','err'); return; }
  if (!ncomp || isNaN(parseInt(ncomp,10))) { showMsg('pca-msg','Enter a valid number of components.','err'); return; }
  var opts = [];
  if (jbyid('pp-drop-const').checked) opts.push('drop_const');
  if (jbyid('pp-scale-std').checked)  opts.push('scale_std');
  if (jbyid('pp-scale-mm').checked)   opts.push('scale_mm');
  jbyid('pca-ds-id').value  = dsid;
  jbyid('pca-run-id').value = '';
  jform.jmid.value  = 'runpca';
  jform.jtype.value = 'click';
  // Pass opts as pipe-delimited string in a hidden field we'll read server-side
  jform['pca_ncomp'].value = ncomp;
  // opts passed as pca_opts hidden
  var optsField = document.getElementById('pca-opts-hidden');
  if (!optsField) {
    optsField = document.createElement('input');
    optsField.type = 'hidden';
    optsField.name = 'pca_opts';
    optsField.id   = 'pca-opts-hidden';
    jform.appendChild(optsField);
  }
  optsField.value = opts.join('|');
  showMsg('pca-msg','Running PCA…','');
  jdoajax(['pca-ds-id','pca_ncomp','pca-opts-hidden'], '');
}
function ev_runpca_click_ajax(ts) {
  if (ts[0]==='1') {
    showMsg('pca-msg','Done!','ok');
    var summary = JSON.parse(ts[1]);
    renderPcaResults(summary);
    // refresh runs list for this dataset
    loadPcaRuns(jbyid('pca-ds-id').value);
  } else {
    showMsg('pca-msg', ts[1], 'err');
  }
}

// ── Load previous PCA run ────────────────────────────────────────────────────
function loadPcaRun(runId) {
  jbyid('pca-run-id').value = runId;
  jform.jmid.value  = 'loadpcarun';
  jform.jtype.value = 'click';
  jdoajax(['pca-run-id'], '');
}
function ev_loadpcarun_click_ajax(ts) {
  if (ts[0]==='1') {
    var summary = JSON.parse(ts[1]);
    renderPcaResults(summary);
    showMsg('pca-msg','','');
  } else {
    showMsg('pca-msg', ts[1], 'err');
  }
}

// ── Delete PCA run ────────────────────────────────────────────────────────────
function deletePcaRun(runId) {
  jbyid('pca-run-id').value = runId;
  jform.jmid.value  = 'delpcarun';
  jform.jtype.value = 'click';
  jdoajax(['pca-run-id'], '');
}
function ev_delpcarun_click_ajax(ts) {
  if (ts[0]==='1') loadPcaRuns(jbyid('pca-ds-id').value);
  else showMsg('pca-msg', ts[1], 'err');
}

// ── Load PCA runs list ───────────────────────────────────────────────────────
function loadPcaRuns(dsid) {
  if (!dsid) return;
  jbyid('pca-ds-id').value = dsid;
  jform.jmid.value  = 'listpcaruns';
  jform.jtype.value = 'click';
  jdoajax(['pca-ds-id'], '');
}
function ev_listpcaruns_click_ajax(ts) {
  renderPcaRunsList(JSON.parse(ts[0]));
}

// ── Render helpers ───────────────────────────────────────────────────────────
function showMsg(id, msg, cls) {
  var el = jbyid(id);
  el.textContent = msg;
  el.className = 'ms-msg' + (cls ? ' ' + cls : '');
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

function refreshPcaDatasetDropdown() {
  // Re-read the dataset table to populate the PCA dataset selector
  var rows = jbyid('ds-tbody').querySelectorAll('tr');
  var sel  = jbyid('pca-dsid');
  var prev = sel.value;
  while (sel.options.length > 1) sel.remove(1);
  var tbl = jbyid('ds-table');
  if (tbl.style.display === 'none') return;
  var tbodies = tbl.querySelectorAll('tbody tr');
  tbodies.forEach(function(tr) {
    var cells = tr.querySelectorAll('td');
    if (!cells.length) return;
    var btn = tr.querySelector('.ms-view');
    if (!btn) return;
    var match = btn.getAttribute('onclick').match(/viewQuality\((\d+)/);
    if (!match) return;
    var id   = match[1];
    var name = cells[0].textContent;
    var opt  = document.createElement('option');
    opt.value = id;
    opt.textContent = name;
    if (id === prev) opt.selected = true;
    sel.appendChild(opt);
  });
}

function renderPcaRunsList(runs) {
  // Cache all PCA runs for the cluster tab dropdown
  if (!window._allPcaRuns) window._allPcaRuns = [];
  runs.forEach(function(r) {
    if (!window._allPcaRuns.find(function(x){return x.id===r.id;})) {
      window._allPcaRuns.push(r);
    }
  });

  var tbody = jbyid('pca-runs-tbody');
  tbody.innerHTML = '';
  if (runs.length === 0) {
    jbyid('pca-runs-empty').style.display = '';
    jbyid('pca-runs-table').style.display = 'none';
    return;
  }
  jbyid('pca-runs-empty').style.display = 'none';
  jbyid('pca-runs-table').style.display = '';
  runs.forEach(function(r) {
    var tr = document.createElement('tr');
    tr.innerHTML =
      '<td>' + r.n_components + '</td>' +
      '<td>' + r.n_samples + '</td>' +
      '<td>' + r.ts.substring(0,10) + '</td>' +
      '<td><div class="ms-actions">' +
        '<button class="ms-load-run" onclick="loadPcaRun(' + r.id + ')">Load</button>' +
        '<button class="ms-del"      onclick="deletePcaRun(' + r.id + ')">Del</button>' +
      '</div></td>';
    tbody.appendChild(tr);
  });
}

function renderPcaResults(s) {
  // Cache for cluster tab use
  window._currentPcarunId    = s.run_id;
  window._currentPcaResults  = s;

  jbyid('pca-hint').style.display    = 'none';
  jbyid('pca-results').style.display = '';

  // Label
  jbyid('pca-run-label').textContent = '— ' + s.n_components + ' PC(s), ' + s.n_samples + ' samples';

  // Preproc banner
  var pp = s.preproc_report;
  jbyid('pca-preproc-bar').textContent = pp ? pp.steps : '';

  // EV badges
  var evDiv = jbyid('pca-ev-summary');
  evDiv.innerHTML = '';
  s.explained_var.forEach(function(v, i) {
    var sp = document.createElement('span');
    sp.className = 'ms-badge ms-badge-blue';
    sp.textContent = 'PC' + (i+1) + ': ' + v.toFixed(1) + '%';
    evDiv.appendChild(sp);
  });
  var total = s.explained_var.reduce(function(a,b){return a+b;},0);
  var tot = document.createElement('span');
  tot.className = 'ms-badge';
  tot.textContent = 'Total: ' + total.toFixed(1) + '%';
  evDiv.appendChild(tot);

  // Scree plot (all components)
  var allEv = s.all_ev;
  var scrLabels = allEv.map(function(_,i){return 'PC'+(i+1);});
  Plotly.newPlot('plot-scree', [{
    x: scrLabels, y: allEv, type: 'bar',
    marker: {color: '#3498db'},
    name: 'Explained Var %'
  }], {
    margin: {t:10,r:10,b:40,l:45},
    xaxis: {title: 'Component'},
    yaxis: {title: '% Variance'}
  }, {responsive: true, displaylogo: false});

  // Scatter PC1 vs PC2
  if (s.n_components >= 2) {
    var xs = s.transformed.map(function(r){return r[0];});
    var ys = s.transformed.map(function(r){return r[1];});
    Plotly.newPlot('plot-scatter', [{
      x: xs, y: ys, mode: 'markers',
      marker: {size:6, color:'#2ecc71', opacity:0.75}
    }], {
      margin: {t:10,r:10,b:45,l:50},
      xaxis: {title:'PC1'},
      yaxis: {title:'PC2'}
    }, {responsive: true, displaylogo: false});
  } else {
    jbyid('plot-scatter').innerHTML = '<p class="ms-hint" style="padding:8px">Need ≥2 components for scatter.</p>';
  }

  // Loadings heatmap
  var colNames = s.col_names;
  var pcLabels = s.loadings.map(function(_,i){return 'PC'+(i+1);});
  Plotly.newPlot('plot-loadings', [{
    z: s.loadings,
    x: colNames,
    y: pcLabels,
    type: 'heatmap',
    colorscale: 'RdBu',
    zmid: 0
  }], {
    margin: {t:10,r:10,b:70,l:50}
  }, {responsive: true, displaylogo: false});
}

// ── Run K-Means ───────────────────────────────────────────────────────────
function ev_runkmeans_click() {
  var prid = jbyid('km-prid').value;
  var k    = jbyid('km_k').value.trim();
  if (!prid) { showMsg('km-msg','Select a PCA run first.','err'); return; }
  if (!k || isNaN(parseInt(k,10)) || parseInt(k,10) < 2) {
    showMsg('km-msg','k must be an integer ≥ 2.','err'); return;
  }
  jbyid('km-prid-h').value = prid;
  jbyid('km-run-id').value = '';
  jform.jmid.value  = 'runkmeans';
  jform.jtype.value = 'click';
  jform['km_k'].value = k;
  showMsg('km-msg','Running…','');
  jdoajax(['km-prid-h','km_k'], '');
}
function ev_runkmeans_click_ajax(ts) {
  if (ts[0]==='1') {
    showMsg('km-msg','Done!','ok');
    var tx = ts[2] ? JSON.parse(ts[2]) : null;
    renderKmResults(JSON.parse(ts[1]), tx);
    loadKmRuns(jbyid('km-prid-h').value);
  } else {
    showMsg('km-msg', ts[1], 'err');
  }
}

// ── Load K-Means run ─────────────────────────────────────────────────────
function loadKmRun(kmId) {
  jbyid('km-run-id').value = kmId;
  jform.jmid.value  = 'loadkmrun';
  jform.jtype.value = 'click';
  jdoajax(['km-run-id'], '');
}
function ev_loadkmrun_click_ajax(ts) {
  if (ts[0]==='1') {
    var tx = ts[2] ? JSON.parse(ts[2]) : null;
    renderKmResults(JSON.parse(ts[1]), tx);
    showMsg('km-msg','','');
  } else {
    showMsg('km-msg', ts[1], 'err');
  }
}

// ── Delete K-Means run ───────────────────────────────────────────────────
function deleteKmRun(kmId) {
  jbyid('km-run-id').value = kmId;
  jform.jmid.value  = 'delkmrun';
  jform.jtype.value = 'click';
  jdoajax(['km-run-id'], '');
}
function ev_delkmrun_click_ajax(ts) {
  if (ts[0]==='1') loadKmRuns(jbyid('km-prid-h').value);
  else showMsg('km-msg', ts[1], 'err');
}

// ── List K-Means runs ────────────────────────────────────────────────────
function loadKmRuns(prid) {
  if (!prid) return;
  jbyid('km-prid-h').value = prid;
  jform.jmid.value  = 'listkmruns';
  jform.jtype.value = 'click';
  jdoajax(['km-prid-h'], '');
}
function ev_listkmruns_click_ajax(ts) {
  renderKmRunsList(JSON.parse(ts[0]));
}

// ── Compare PCA runs ─────────────────────────────────────────────────────
function ev_compareruns_click() {
  var ra = jbyid('cmp-rid-a').value;
  var rb = jbyid('cmp-rid-b').value;
  if (!ra || !rb) { showMsg('cmp-msg','Select both runs.','err'); return; }
  jbyid('cmp-rid-a-h').value = ra;
  jbyid('cmp-rid-b-h').value = rb;
  jform.jmid.value  = 'compareruns';
  jform.jtype.value = 'click';
  showMsg('cmp-msg','Loading…','');
  jdoajax(['cmp-rid-a-h','cmp-rid-b-h'], '');
}
function ev_compareruns_click_ajax(ts) {
  if (ts[0]==='1') {
    showMsg('cmp-msg','','');
    renderComparison(JSON.parse(ts[1]), JSON.parse(ts[2]));
  } else {
    showMsg('cmp-msg', ts[1], 'err');
  }
}

// ── Refresh K-Means PCA run dropdown ────────────────────────────────────
function refreshKmPcaRunDropdown() {
  // Collect all known PCA run IDs from the PCA runs table
  // We store them as data attributes when renderPcaRunsList is called
  var kmSel  = jbyid('km-prid');
  var cmpSelA = jbyid('cmp-rid-a');
  var cmpSelB = jbyid('cmp-rid-b');
  var prevKm  = kmSel.value;
  var prevA   = cmpSelA.value;
  var prevB   = cmpSelB.value;
  // Clear existing options
  while (kmSel.options.length > 1) kmSel.remove(1);
  while (cmpSelA.options.length > 1) cmpSelA.remove(1);
  while (cmpSelB.options.length > 1) cmpSelB.remove(1);
  // Read from stored run data
  (window._allPcaRuns || []).forEach(function(r) {
    var lbl = 'Run #' + r.id + ' (' + r.n_components + ' PC, ' + r.ts.substring(0,10) + ')';
    [kmSel, cmpSelA, cmpSelB].forEach(function(sel, si) {
      var opt = document.createElement('option');
      opt.value = r.id;
      opt.textContent = lbl;
      if ((si===0 && String(r.id)===prevKm) ||
          (si===1 && String(r.id)===prevA)  ||
          (si===2 && String(r.id)===prevB)) opt.selected = true;
      sel.appendChild(opt);
    });
  });
}

// ── Render cluster scatter ────────────────────────────────────────────────
var CLUSTER_COLORS = ['#e74c3c','#3498db','#2ecc71','#f39c12','#9b59b6',
                      '#1abc9c','#e67e22','#34495e','#e91e63','#00bcd4'];

function renderKmResults(s, transformed) {
  jbyid('km-hint').style.display    = 'none';
  jbyid('km-results').style.display = '';
  jbyid('cmp-results').style.display = 'none';
  jbyid('km-run-label').textContent = '— k=' + s.k + ', ' + s.n_samples + ' samples';

  // Cluster size badges — compute from labels if counts not present
  var div = jbyid('km-count-summary');
  div.innerHTML = '';
  var counts = s.counts;
  if (!counts) {
    counts = [];
    for (var ci=0; ci<s.k; ci++) counts.push(0);
    s.labels.forEach(function(lbl) { if (lbl>=0 && lbl<s.k) counts[lbl]++; });
  }
  counts.forEach(function(c, i) {
    var sp = document.createElement('span');
    sp.className = 'ms-badge';
    sp.style.background = CLUSTER_COLORS[i % CLUSTER_COLORS.length];
    sp.style.color = '#fff';
    sp.textContent = 'C' + i + ': ' + c;
    div.appendChild(sp);
  });

  if (transformed && transformed.length > 0 && transformed[0].length >= 2) {
    _drawKmScatter(s, transformed);
  } else {
    jbyid('plot-km-scatter').innerHTML =
      '<p class="ms-hint" style="padding:8px">Need ≥2 PCA components for coloured scatter.</p>';
  }
}

function _drawKmScatter(km, transformed) {
  if (!transformed || transformed.length === 0 || transformed[0].length < 2) {
    jbyid('plot-km-scatter').innerHTML =
      '<p class="ms-hint" style="padding:8px">Need ≥2 PCA components for coloured scatter.</p>';
    return;
  }
  var traces = [];
  for (var ci = 0; ci < km.k; ci++) {
    var xs = [], ys = [];
    km.labels.forEach(function(lbl, i) {
      if (lbl === ci) { xs.push(transformed[i][0]); ys.push(transformed[i][1]); }
    });
    traces.push({
      x: xs, y: ys, mode: 'markers', name: 'C' + ci,
      marker: {size: 7, color: CLUSTER_COLORS[ci % CLUSTER_COLORS.length], opacity: 0.85}
    });
  }
  Plotly.newPlot('plot-km-scatter', traces, {
    margin: {t:10,r:10,b:45,l:50},
    xaxis: {title:'PC1'}, yaxis: {title:'PC2'},
    legend: {orientation:'h'}
  }, {responsive: true, displaylogo: false});
}

function renderKmRunsList(runs) {
  var tbody = jbyid('km-runs-tbody');
  tbody.innerHTML = '';
  if (runs.length === 0) {
    jbyid('km-runs-empty').style.display = '';
    jbyid('km-runs-table').style.display = 'none';
    return;
  }
  jbyid('km-runs-empty').style.display = 'none';
  jbyid('km-runs-table').style.display = '';
  runs.forEach(function(r) {
    var tr = document.createElement('tr');
    tr.innerHTML =
      '<td>' + r.k + '</td>' +
      '<td>' + r.n_samples + '</td>' +
      '<td>' + r.ts.substring(0,10) + '</td>' +
      '<td><div class="ms-actions">' +
        '<button class="ms-load-run" onclick="loadKmRun(' + r.id + ')">Load</button>' +
        '<button class="ms-del"      onclick="deleteKmRun(' + r.id + ')">Del</button>' +
      '</div></td>';
    tbody.appendChild(tr);
  });
}

function renderComparison(runA, runB) {
  jbyid('cmp-results').style.display = '';
  jbyid('km-hint').style.display = 'none';
  var makeScree = function(s, elId, labelEl) {
    jbyid(labelEl).textContent = 'Run #' + s.id + ' — ' + s.n_components + ' PCs, ' + s.n_samples + ' samples';
    var allEv = s.all_ev;
    Plotly.newPlot(elId, [{
      x: allEv.map(function(_,i){return 'PC'+(i+1);}),
      y: allEv, type: 'bar',
      marker: {color: '#3498db'}
    }], {
      margin: {t:10,r:6,b:40,l:45},
      xaxis: {title:'Component'},
      yaxis: {title:'% Var'}
    }, {responsive: true, displaylogo: false});
  };
  makeScree(runA, 'plot-cmp-a', 'cmp-label-a');
  makeScree(runB, 'plot-cmp-b', 'cmp-label-b');
}

// ── Analysis tab ──────────────────────────────────────────────────────────
function refreshAnalysisDropdowns() {
  // Copy datasets into an-dsid from ds-table
  var sel  = jbyid('an-dsid');
  var prev = sel.value;
  while (sel.options.length > 1) sel.remove(1);
  var tbodies = jbyid('ds-table').querySelectorAll('tbody tr');
  tbodies.forEach(function(tr) {
    var btn = tr.querySelector('.ms-view');
    if (!btn) return;
    var match = btn.getAttribute('onclick').match(/viewQuality\((\d+)/);
    if (!match) return;
    var cells = tr.querySelectorAll('td');
    var opt = document.createElement('option');
    opt.value = match[1];
    opt.textContent = cells[0].textContent;
    if (match[1] === prev) opt.selected = true;
    sel.appendChild(opt);
  });
  // Copy PCA runs into an-prid
  var psel = jbyid('an-prid');
  var pprev = psel.value;
  while (psel.options.length > 1) psel.remove(1);
  (window._allPcaRuns || []).forEach(function(r) {
    var opt = document.createElement('option');
    opt.value = r.id;
    opt.textContent = 'Run #' + r.id + ' (' + r.n_components + ' PC, ' + r.ts.substring(0,10) + ')';
    if (String(r.id) === pprev) opt.selected = true;
    psel.appendChild(opt);
  });
}

function ev_anstats_click() {
  var dsid = jbyid('an-dsid').value;
  if (!dsid) { showMsg('an-msg','Select a dataset first.','err'); return; }
  jbyid('an-dsid-h').value = dsid;
  jform.jmid.value  = 'anstats';
  jform.jtype.value = 'click';
  showMsg('an-msg','Loading…','');
  jdoajax(['an-dsid-h'], '');
}
function ev_anstats_click_ajax(ts) {
  if (ts[0]==='1') {
    showMsg('an-msg','','');
    var stats = JSON.parse(ts[1]);
    renderAnalysisStats(stats);
    loadAnalysisCorr(jbyid('an-dsid-h').value);
  } else {
    showMsg('an-msg', ts[1], 'err');
  }
}

function renderAnalysisStats(data) {
  var tbody = jbyid('an-stats-tbody');
  tbody.innerHTML = '';
  var cols = data.col_names;
  var stats = data.stats;
  cols.forEach(function(col, i) {
    var s = stats[i];
    var tr = document.createElement('tr');
    tr.innerHTML =
      '<td>' + esc(col) + '</td>' +
      '<td>' + s.min.toFixed(3) + '</td>' +
      '<td>' + s.max.toFixed(3) + '</td>' +
      '<td>' + s.mean.toFixed(3) + '</td>' +
      '<td>' + s.std.toFixed(3) + '</td>' +
      '<td>' + s.median.toFixed(3) + '</td>' +
      '<td>' + s.n + '</td>';
    tbody.appendChild(tr);
  });
  jbyid('an-stats-wrap').style.display = '';
  jbyid('an-report-wrap').style.display = '';
}

function loadAnalysisCorr(dsid) {
  jbyid('an-dsid-h').value = dsid;
  jform.jmid.value  = 'ancorr';
  jform.jtype.value = 'click';
  jdoajax(['an-dsid-h'], '');
}
function ev_ancorr_click_ajax(ts) {
  if (ts[0]==='1') {
    var corr = JSON.parse(ts[1]);
    renderCorrHeatmap(corr);
  } else {
    jbyid('an-hint').textContent = ts[1];
  }
}

function renderCorrHeatmap(data) {
  jbyid('an-hint').style.display = 'none';
  jbyid('an-corr-wrap').style.display = '';
  var cols = data.col_names;
  var mat  = data.matrix;
  Plotly.newPlot('plot-corr', [{
    z: mat, x: cols, y: cols,
    type: 'heatmap',
    colorscale: 'RdBu',
    zmid: 0,
    zmin: -1, zmax: 1,
    text: mat.map(function(row){return row.map(function(v){return v.toFixed(2);});}),
    texttemplate: '%{text}',
    showscale: true
  }], {
    margin: {t:20,r:60,b:80,l:80}
  }, {responsive: true, displaylogo: false});
}

function ev_anreport_click() {
  var prid = jbyid('an-prid').value;
  if (!prid) { showMsg('an-report-msg','Select a PCA run.','err'); return; }
  jbyid('an-prid-h').value = prid;
  jform.jmid.value  = 'anreport';
  jform.jtype.value = 'click';
  showMsg('an-report-msg','Generating…','');
  jdoajax(['an-prid-h'], '');
}
function ev_anreport_click_ajax(ts) {
  if (ts[0]==='1') {
    showMsg('an-report-msg','','');
    var html = ts[1];
    var blob = new Blob([html], {type:'text/html'});
    var a = document.createElement('a');
    a.href = URL.createObjectURL(blob);
    a.download = 'pca_report_run' + jbyid('an-prid-h').value + '.html';
    document.body.appendChild(a);
    a.click();
    document.body.removeChild(a);
    URL.revokeObjectURL(a.href);
    showMsg('an-report-msg','Downloaded.','ok');
  } else {
    showMsg('an-report-msg', ts[1], 'err');
  }
}

// ── Profile tab ───────────────────────────────────────────────────────────
function loadProfileFields() {
  jform.jmid.value  = 'loadprofile';
  jform.jtype.value = 'click';
  jdoajax([], '');
}
function ev_loadprofile_click_ajax(ts) {
  if (ts[0]==='1') {
    var p = JSON.parse(ts[1]);
    jbyid('prof_displayname').value = p.displayname || '';
    jbyid('prof_email').value = p.email || '';
  }
}

function ev_saveprofile_click() {
  jform.jmid.value  = 'saveprofile';
  jform.jtype.value = 'click';
  showMsg('prof-msg','Saving…','');
  jdoajax(['prof_displayname','prof_email'], '');
}
function ev_saveprofile_click_ajax(ts) {
  if (ts[0]==='1') showMsg('prof-msg','Saved!','ok');
  else showMsg('prof-msg', ts[1], 'err');
}

function esc(s) {
  return String(s).replace(/&/g,'&amp;').replace(/</g,'&lt;').replace(/>/g,'&gt;');
}

// When PCA dataset dropdown changes, load that dataset's run history
document.addEventListener('DOMContentLoaded', function() {
  jbyid('pca-dsid').addEventListener('change', function() {
    var id = this.value;
    jbyid('pca-ds-id').value = id;
    if (id) loadPcaRuns(id);
    else {
      jbyid('pca-runs-empty').style.display = '';
      jbyid('pca-runs-table').style.display = 'none';
    }
  });

  jbyid('km-prid').addEventListener('change', function() {
    var id = this.value;
    jbyid('km-prid-h').value = id;
    if (id) loadKmRuns(id);
    else {
      jbyid('km-runs-empty').style.display = '';
      jbyid('km-runs-table').style.display = 'none';
    }
  });
});
)

NB. ── Event dispatcher ────────────────────────────────────────────────────────
jev_get =: jev =: 3 : 0
  mid  =. getv 'jmid'
  type =. getv 'jtype'
  if. 0 = # mid do.
    if. _1 = MS_UID_jhs_ do.
      jhrcmds 'eval location.href=''/mslogin'''
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
  elseif. 'runpca_click' -: mid,'_',type do.
    ms_runpca''
  elseif. 'listpcaruns_click' -: mid,'_',type do.
    ms_listpcaruns''
  elseif. 'loadpcarun_click' -: mid,'_',type do.
    ms_loadpcarun''
  elseif. 'delpcarun_click' -: mid,'_',type do.
    ms_delpcarun''
  elseif. 'runkmeans_click' -: mid,'_',type do.
    ms_runkmeans''
  elseif. 'listkmruns_click' -: mid,'_',type do.
    ms_listkmruns''
  elseif. 'loadkmrun_click' -: mid,'_',type do.
    ms_loadkmrun''
  elseif. 'delkmrun_click' -: mid,'_',type do.
    ms_delkmrun''
  elseif. 'compareruns_click' -: mid,'_',type do.
    ms_compareruns''
  elseif. 'anstats_click' -: mid,'_',type do.
    ms_anstats''
  elseif. 'ancorr_click' -: mid,'_',type do.
    ms_ancorr''
  elseif. 'anreport_click' -: mid,'_',type do.
    ms_anreport''
  elseif. 'loadprofile_click' -: mid,'_',type do.
    ms_loadprofile''
  elseif. 'saveprofile_click' -: mid,'_',type do.
    ms_saveprofile''
  else.
    jhrajax ''
  end.
)

NB. ── Dataset list JSON builder ───────────────────────────────────────────────
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

NB. ── Run PCA handler ──────────────────────────────────────────────────────────
ms_runpca =: 3 : 0
  r =. ''
  try.
  dsid  =. ". dltb getv 'pca-ds-id'
  ncomp =. ". dltb getv 'pca_ncomp'
  NB. opts: pipe-delimited string like 'drop_const|scale_std'
  opts_str =. dltb getv 'pca_opts'
  NB. split on '|'
  opts =. i. 0
  if. 0 < # opts_str do.
    NB. split pipe-separated list into boxed tokens
    tok =. ''
    k   =. 0
    while. k <: # opts_str do.
      c =. k { opts_str , '|'
      if. c = '|' do.
        if. 0 < # tok do. opts =. opts , < tok end.
        tok =. ''
      else.
        tok =. tok , c
      end.
      k =. >: k
    end.
  end.
  result =. pca_run_jhs_ dsid ; ncomp ; opts
  NB. check for error: result is '0',JASEP,errmsg or a 3-element boxed list
  if. (2 = 3!:0 result) *. '0' -: {. result do.
    jhrajax result
    return.
  end.
  summary_json =. dltb > 2 { result
  jhrajax '1',JASEP,summary_json
  catch.
    jhrajax '0',JASEP,'PCA error: ',13!:12''
  end.
)

NB. ── List PCA runs handler ────────────────────────────────────────────────────
ms_listpcaruns =: 3 : 0
  dsid =. ". dltb getv 'pca-ds-id'
  jhrajax pca_listjson_jhs_ dsid
)

NB. ── Load PCA run handler ─────────────────────────────────────────────────────
ms_loadpcarun =: 3 : 0
  rid =. ". dltb getv 'pca-run-id'
  json =. pca_getjson_jhs_ rid
  if. 0 = # json do.
    jhrajax '0',JASEP,'Run not found.'
    return.
  end.
  jhrajax '1',JASEP,json
)

NB. ── Delete PCA run handler ───────────────────────────────────────────────────
ms_delpcarun =: 3 : 0
  rid =. ". dltb getv 'pca-run-id'
  ok =. db_deletepcarun_jhs_ rid
  if. ok do.
    jhrajax '1'
  else.
    jhrajax '0',JASEP,'Delete failed.'
  end.
)

NB. ── Run K-Means handler ──────────────────────────────────────────────────────
NB. Returns km summary JSON + pca tx_json so client can draw scatter immediately
ms_runkmeans =: 3 : 0
  r =. ''
  try.
  prid =. ". dltb getv 'km-prid-h'
  k    =. ". dltb getv 'km_k'
  result =. kmeans_run_jhs_ prid ; k
  if. (2 = 3!:0 result) *. '0' -: {. result do.
    jhrajax result
    return.
  end.
  summary_json =. dltb > 2 { result
  NB. fetch pca transformed for scatter
  pca_row =. db_getpcarun_jhs_ prid
  tx_json =. ''
  if. 0 < # pca_row do.
    tx_json =. dltb > 6 { pca_row
  end.
  jhrajax '1',JASEP,summary_json,JASEP,tx_json
  catch.
    jhrajax '0',JASEP,'K-Means error: ',13!:12''
  end.
)

NB. ── List K-Means runs handler ──────────────────────────────────────────────
ms_listkmruns =: 3 : 0
  prid =. ". dltb getv 'km-prid-h'
  jhrajax kmeans_listjson_jhs_ prid
)

NB. ── Load K-Means run handler ────────────────────────────────────────────────
NB. Returns km JSON + pca tx_json so client can draw the scatter
ms_loadkmrun =: 3 : 0
  kid  =. ". dltb getv 'km-run-id'
  krow =. db_getkm_jhs_ kid
  if. 0 = # krow do.
    jhrajax '0',JASEP,'Run not found.'
    return.
  end.
  json =. kmeans_getjson_jhs_ kid
  NB. also fetch pca run's transformed for the scatter
  prid      =. > > 1 { krow
  pca_row   =. db_getpcarun_jhs_ prid
  tx_json   =. ''
  if. 0 < # pca_row do.
    tx_json =. dltb > 6 { pca_row
  end.
  jhrajax '1',JASEP,json,JASEP,tx_json
)

NB. ── Delete K-Means run handler ────────────────────────────────────────────
ms_delkmrun =: 3 : 0
  kid =. ". dltb getv 'km-run-id'
  ok  =. db_deletekm_jhs_ kid
  if. ok do.
    jhrajax '1'
  else.
    jhrajax '0',JASEP,'Delete failed.'
  end.
)

NB. ── Compare PCA runs handler ──────────────────────────────────────────────
ms_compareruns =: 3 : 0
  r =. ''
  try.
  rid_a =. ". dltb getv 'cmp-rid-a-h'
  rid_b =. ". dltb getv 'cmp-rid-b-h'
  json_a =. pca_getjson_jhs_ rid_a
  json_b =. pca_getjson_jhs_ rid_b
  if. (0 = # json_a) +. (0 = # json_b) do.
    jhrajax '0',JASEP,'One or both runs not found.'
    return.
  end.
  jhrajax '1',JASEP,json_a,JASEP,json_b
  catch.
    jhrajax '0',JASEP,'Compare error: ',13!:12''
  end.
)

NB. ── Analysis stats handler ─────────────────────────────────────────────
ms_anstats =: 3 : 0
  dsid =. ". dltb getv 'an-dsid-h'
  json =. analysis_stats_jhs_ dsid
  if. 0 < +/ ('"error"' E. json) do.
    jhrajax '0',JASEP,json
    return.
  end.
  jhrajax '1',JASEP,json
)

NB. ── Analysis correlation handler ──────────────────────────────────────
ms_ancorr =: 3 : 0
  dsid =. ". dltb getv 'an-dsid-h'
  json =. analysis_corr_jhs_ dsid
  if. 0 < +/ ('"error"' E. json) do.
    jhrajax '0',JASEP,json
    return.
  end.
  jhrajax '1',JASEP,json
)

NB. ── Report download handler ────────────────────────────────────────────
NB. Returns the full HTML as the second JASEP segment (client creates a Blob)
ms_anreport =: 3 : 0
  prid =. ". dltb getv 'an-prid-h'
  html =. report_build_jhs_ prid
  if. 0 = # html do.
    jhrajax '0',JASEP,'PCA run not found.'
    return.
  end.
  jhrajax '1',JASEP,html
)

NB. ── Load profile fields handler ────────────────────────────────────────
ms_loadprofile =: 3 : 0
  uid  =. MS_UID_jhs_
  row  =. db_getuserbyid_jhs_ uid
  if. 0 = # row do.
    jhrajax '0',JASEP,'User not found.'
    return.
  end.
  dname =. dltb > 5 { row
  email =. dltb > 6 { row
  json =. '{"displayname":' , (enc_json_json_ dname) , ',"email":' , (enc_json_json_ email) , '}'
  jhrajax '1',JASEP,json
)

NB. ── Save profile handler ────────────────────────────────────────────────
ms_saveprofile =: 3 : 0
  uid    =. MS_UID_jhs_
  dname  =. dltb getv 'prof_displayname'
  email  =. dltb getv 'prof_email'
  ok     =. db_updateprofile_jhs_ uid ; dname ; email
  if. ok do.
    jhrajax '1'
  else.
    jhrajax '0',JASEP,'Save failed.'
  end.
)
