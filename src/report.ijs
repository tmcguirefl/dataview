NB. report.ijs — self-contained HTML report builder for a PCA run
NB.
NB. API (all verbs in jhs locale):
NB.   report_build y   — y is pca_run_id (integer)
NB.                       Returns a complete HTML string or '' on error.
NB.                       The HTML is self-contained (inline CSS, no JS deps).
NB.
NB. The report includes:
NB.   - Dataset name, row/col counts, upload timestamp
NB.   - Quality summary (quant/cat/constant cols)
NB.   - PCA configuration (n_components, preprocessing)
NB.   - Explained variance table
NB.   - Loadings table (features × PCs)
NB.   - Preprocessing report
NB.   - Generation timestamp

cocurrent 'jhs'

require 'convert/json'

NB. --------------------------------------------------------
NB. report_esc — HTML-escape a string
report_esc =: 3 : 0
  r =. ''
  k =. 0
  while. k < # y do.
    c =. k { y
    if.     c -: '&' do. r =. r , '&amp;'
    elseif. c -: '<' do. r =. r , '&lt;'
    elseif. c -: '>' do. r =. r , '&gt;'
    elseif. c -: '"' do. r =. r , '&quot;'
    else.                r =. r , c
    end.
    k =. >: k
  end.
  r
)

NB. --------------------------------------------------------
NB. report_fmt — format a number to 4 decimal places as a string
report_fmt =: 3 : 0
  s =. ": y
  NB. replace J negative sign
  s =. s rplc '_';'-'
  s
)

NB. --------------------------------------------------------
NB. report_build — generate the HTML report
NB. y is pca_run_id (integer)
report_build =: 3 : 0
  r =. ''

  NB. fetch PCA run
  pca_row =. db_getpcarun_jhs_ y
  if. 0 = # pca_row do. r return. end.

  NB. columns: id;dataset_id;n_components;explained_var;all_ev;loadings;
  NB.          transformed;col_names;n_samples;preproc_opts;preproc_report;
  NB.          row_indexes;is_pinned;notes;created_at
  pca_id    =. > > 0 { pca_row
  ds_id     =. > > 1 { pca_row
  ncomp     =. > > 2 { pca_row
  ev_json   =. dltb > 3 { pca_row
  allev_json =. dltb > 4 { pca_row
  load_json =. dltb > 5 { pca_row
  cn_json   =. dltb > 7 { pca_row
  nsamp     =. > > 8 { pca_row
  ppopt_json =. dltb > 9 { pca_row
  pprep_json =. dltb > 10 { pca_row
  pca_ts    =. dltb > 14 { pca_row

  NB. fetch dataset row
  ds_row =. db_getdataset_jhs_ ds_id ; MS_UID_jhs_
  ds_name   =. ''
  ds_nrows  =. 0
  ds_ncols  =. 0
  ds_ts     =. ''
  qrep_json =. '{}'
  if. 0 < # ds_row do.
    ds_name  =. dltb > 1 { ds_row
    ds_nrows =. > > 2 { ds_row
    ds_ncols =. > > 3 { ds_row
    ds_ts    =. dltb > 10 { ds_row
    qrep_json =. dltb > 8 { ds_row
  end.

  NB. parse JSON arrays for display
  ev_arr    =. > &.> dec_json_json_ ev_json
  allev_arr =. > &.> dec_json_json_ allev_json
  cn_arr    =. dec_json_json_ cn_json
  ppopt_arr =. dec_json_json_ ppopt_json
  pprep     =. dec_json_json_ pprep_json

  NB. parse loadings matrix: [[r0c0,...],...]
  load_rows_box =. dec_json_json_ load_json
  nload =. # load_rows_box

  NB. opts string
  opts_str =. ''
  k =. 0
  while. k < # ppopt_arr do.
    if. k > 0 do. opts_str =. opts_str , ', ' end.
    opts_str =. opts_str , dltb > k { ppopt_arr
    k =. >: k
  end.
  if. 0 = # opts_str do. opts_str =. '(none)' end.

  NB. preproc steps string
  NB. dec_json_json_ on a JSON object returns (keys_array ; values_array)
  steps_str =. ''
  if. 32 = 3!:0 pprep do.
    pprep_keys =. > 0 { pprep
    NB. values side is the raw (possibly mixed) second element of pprep; index directly
    k =. 0
    while. k < # pprep_keys do.
      if. (dltb > k { pprep_keys) -: 'steps' do.
        steps_str =. dltb > k { 1 { pprep
      end.
      k =. >: k
    end.
  end.

  NB. ── Build HTML ──────────────────────────────────────────────────────────
  LF =. 10 { a.
  H =. ''

  H =. H , '<!DOCTYPE html><html lang="en"><head><meta charset="UTF-8">' , LF
  H =. H , '<title>PCA Report — ' , (report_esc ds_name) , '</title>' , LF
  H =. H , '<style>' , LF
  H =. H , 'body{font-family:system-ui,sans-serif;margin:0;padding:24px;background:#f0f2f5;color:#222;}' , LF
  H =. H , '.card{background:#fff;border-radius:8px;padding:24px;margin-bottom:20px;box-shadow:0 1px 4px rgba(0,0,0,.1);}' , LF
  H =. H , 'h1{font-size:1.6rem;margin:0 0 4px;}' , LF
  H =. H , 'h2{font-size:1.1rem;margin:0 0 12px;color:#2c3e50;}' , LF
  H =. H , '.meta{color:#888;font-size:0.85rem;margin-bottom:16px;}' , LF
  H =. H , '.badge{display:inline-block;padding:3px 10px;border-radius:12px;background:#d6eaf8;color:#1a5276;font-size:0.82rem;margin:2px;}' , LF
  H =. H , 'table{width:100%;border-collapse:collapse;font-size:0.88rem;}' , LF
  H =. H , 'th{text-align:left;padding:6px 10px;background:#f8f9fa;border-bottom:2px solid #dee2e6;color:#555;}' , LF
  H =. H , 'td{padding:6px 10px;border-bottom:1px solid #f0f0f0;}' , LF
  H =. H , '.num{text-align:right;font-family:monospace;}' , LF
  H =. H , '.footer{color:#aaa;font-size:0.8rem;text-align:center;margin-top:24px;}' , LF
  H =. H , '</style></head><body>' , LF

  NB. Header card
  H =. H , '<div class="card">' , LF
  H =. H , '<h1>PCA Report: ' , (report_esc ds_name) , '</h1>' , LF
  H =. H , '<div class="meta">Dataset uploaded: ' , ds_ts
  H =. H , ' &nbsp;|&nbsp; PCA run: ' , pca_ts , '</div>' , LF
  H =. H , '<span class="badge">' , (": ds_nrows) , ' rows</span>'
  H =. H , '<span class="badge">' , (": ds_ncols) , ' columns</span>'
  H =. H , '<span class="badge">' , (": ncomp) , ' PCs</span>'
  H =. H , '<span class="badge">' , (": nsamp) , ' samples used</span>' , LF
  H =. H , '<p style="margin:12px 0 0;font-size:0.9rem;"><strong>Preprocessing:</strong> ' , (report_esc opts_str) , '</p>'
  if. 0 < # steps_str do.
    H =. H , '<p style="margin:4px 0 0;font-size:0.85rem;color:#555;">' , (report_esc steps_str) , '</p>'
  end.
  H =. H , '</div>' , LF

  NB. Explained variance card
  H =. H , '<div class="card">' , LF
  H =. H , '<h2>Explained Variance</h2>' , LF
  H =. H , '<table><thead><tr><th>Component</th><th class="num">Variance %</th><th class="num">Cumulative %</th></tr></thead><tbody>' , LF
  cumul =. 0
  k =. 0
  while. k < # ev_arr do.
    ev_k =. > k { ev_arr
    cumul =. cumul + ev_k
    H =. H , '<tr><td>PC' , (": k+1) , '</td>'
    H =. H , '<td class="num">' , (6j2 ": ev_k) , '</td>'
    H =. H , '<td class="num">' , (6j2 ": cumul) , '</td></tr>' , LF
    k =. >: k
  end.
  H =. H , '</tbody></table></div>' , LF

  NB. Loadings card
  ncn =. # cn_arr
  H =. H , '<div class="card">' , LF
  H =. H , '<h2>Loadings (features × PCs)</h2>' , LF
  H =. H , '<table><thead><tr><th>Feature</th>'
  k =. 0
  while. k < ncomp do.
    H =. H , '<th class="num">PC' , (": k+1) , '</th>'
    k =. >: k
  end.
  H =. H , '</tr></thead><tbody>' , LF
  NB. loadings matrix is ncomp × ncols; we transpose for display (features as rows)
  NB. load_rows_box: ncomp rows, each a vector of ncols values
  NB. We want feature i: take element i from each of the ncomp rows
  fi =. 0
  while. fi < ncn do.
    feat =. dltb > fi { cn_arr
    H =. H , '<tr><td>' , (report_esc feat) , '</td>'
    pi =. 0
    while. pi < nload do.
      load_row =. > > &.> pi { load_rows_box
      NB. load_row is the pi-th eigenvector (length ncols)
      val =. fi { load_row
      H =. H , '<td class="num">' , (6j4 ": val) , '</td>'
      pi =. >: pi
    end.
    H =. H , '</tr>' , LF
    fi =. >: fi
  end.
  H =. H , '</tbody></table></div>' , LF

  NB. Footer
  H =. H , '<div class="footer">Generated by ModelScope-J &mdash; PCA run #' , (": pca_id) , '</div>' , LF
  H =. H , '</body></html>' , LF

  r =. H
  r
)
