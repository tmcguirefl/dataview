NB. pca.ijs — PCA execution, storage, and retrieval
NB.
NB. API (all verbs in jhs locale):
NB.   pca_run y    — run PCA; y is (dsid ; ncomp ; preproc_opts_list)
NB.                  preproc_opts_list: boxed list of option strings
NB.                  Returns (run_id ; ev_pct_json ; run_summary_json) or error string
NB.   pca_listjson y — y is dataset_id; returns JSON array of run summaries
NB.   pca_getjson  y — y is pca_run_id; returns full run JSON

cocurrent 'jhs'

require jpath '~/jdev/jlearn/dr/pca.ijs'

NB. --------------------------------------------------------
NB. pca_num_to_json — encode a plain numeric array as a JSON array string
NB. enc_json on a plain numeric array gives a single number when it's a vector,
NB. so we build manually.
pca_num_to_json =: 3 : 0
  n  =. # , y
  r  =. '['
  k  =. 0
  while. k < n do.
    if. k > 0 do. r =. r , ',' end.
    r =. r , ": k { , y
    k =. >: k
  end.
  r =. r , ']'
  r
)

NB. --------------------------------------------------------
NB. pca_mat_to_json — encode a numeric matrix as JSON array of arrays [[r0...],[r1...]...]
pca_mat_to_json =: 3 : 0
  nrows =. > 0 { $ y
  r =. '['
  i =. 0
  while. i < nrows do.
    if. i > 0 do. r =. r , ',' end.
    r =. r , pca_num_to_json i { y
    i =. >: i
  end.
  r =. r , ']'
  r
)

NB. --------------------------------------------------------
NB. pca_run — preprocess + run PCA on a stored dataset
NB. y is (dsid ; ncomp ; preproc_opts_list)
NB.   dsid             — dataset id (integer)
NB.   ncomp            — number of PCA components (integer)
NB.   preproc_opts_list — boxed list e.g. (<'scale_std') , <'drop_const'
NB. Returns (run_id ; ev_pct_json ; run_summary_json) on success
NB.      or '0',JASEP,errmsg on failure
pca_run =: 3 : 0
  r =. ''
  try.
  uid   =. MS_UID_jhs_
  dsid  =. > 0 { y
  ncomp =. > 1 { y
  opts  =. > 2 { y

  NB. fetch dataset raw_data (col 7 in db_getdataset result: id,name,nrows,ncols,qcols,ccols,acols,raw_data,qrep,prev,ts)
  row =. db_getdataset_jhs_ dsid ; uid
  if. 0 = # row do.
    r =. '0' , JASEP , 'Dataset not found.'
    return.
  end.
  raw_json  =. dltb > 7 { row
  cn_json   =. dltb > 6 { row        NB. all_cols json

  NB. parse raw_data JSON: it's a 2-D numeric array [[r0c0,...],...]
  NB. and col_names: JSON array of strings
  NB. Use J's built-in : read with do. to eval JSON into J — but that
  NB. requires safe input. raw_json comes from our own db, so this is safe.
  NB. We use the approach: parse with dec_json, or re-derive from stored data.
  NB. Since raw_data is already a JSON numeric matrix and colnames is JSON array,
  NB. we parse them back using the convert/json dec_json verb.
  NB. dec_json is not always available; parse manually from the db quant_cols.
  NB. Better: store raw_data as quant only and re-parse.
  NB. The raw_data column stores the full CSV-extracted numeric matrix (quant cols only).
  NB. quant_cols column (index 4) stores the JSON array of quant column names.
  qcols_json =. dltb > 4 { row

  NB. Parse the numeric matrix from JSON using dec_json (convert/json)
  NB. dec_json returns a J nested array; for a 2-D numeric array it gives a boxed list of rows.
  require 'convert/json'
  numrows_box =. dec_json_json_ raw_json
  NB. numrows_box is a boxed list of rows; each row is a boxed list of numbers
  nrows_raw =. # numrows_box
  if. 0 = nrows_raw do.
    r =. '0' , JASEP , 'No numeric data in dataset (no quantitative columns or all rows dropped).'
    return.
  end.
  NB. convert to numeric matrix: unbox each row, stack
  row0  =. > 0 { numrows_box
  ncols_raw =. # row0
  nummat =. (nrows_raw , ncols_raw) $ 0
  i =. 0
  while. i < nrows_raw do.
    nummat =. ((> i { numrows_box) (i,0)} nummat)
    i =. >: i
  end.

  NB. parse column names from qcols_json
  colnames_box =. dec_json_json_ qcols_json
  NB. colnames_box is a boxed list of strings
  colnames =. colnames_box

  NB. guard: ncomp must be in 1..(ncols_raw-1)
  ncols_now =. ncols_raw
  if. ncomp < 1 do.
    r =. '0' , JASEP , 'n_components must be at least 1.'
    return.
  end.
  if. ncomp >= ncols_now do.
    r =. '0' , JASEP , 'n_components must be less than the number of quantitative columns (' , (": ncols_now) , ').'
    return.
  end.

  NB. ── Preprocessing ─────────────────────────────────────────────────────
  'nummat colnames preprep_json' =. > &.> preproc_run_jhs_ (<nummat) , (<colnames) , <opts
  nrows =. > 0 { $ nummat
  ncols =. > 1 { $ nummat

  if. ncols < 2 do.
    r =. '0' , JASEP , 'After preprocessing, fewer than 2 columns remain.'
    return.
  end.
  if. ncomp >= ncols do.
    ncomp =. ncols - 1
  end.
  if. nrows < 2 do.
    r =. '0' , JASEP , 'Not enough rows for PCA.'
    return.
  end.

  NB. ── PCA ──────────────────────────────────────────────────────────────
  pca =. '' conew 'PCASolver'
  create__pca ''
  transformed =. transform__pca nummat ; 1 ; ncomp
  evecs =. eigenVecs__pca
  evals =. eigenVals__pca

  NB. explained variance percentages (top ncomp components)
  total_ev  =. +/ evals
  ev_pct    =. (100 * (ncomp {. evals) % total_ev)
  all_ev_pct =. 100 * evals % total_ev

  NB. loadings: top ncomp eigenvectors transposed to (ncomp x ncols)
  loadings =. |: ncomp {."1 evecs

  destroy__pca ''

  NB. ── Serialise to JSON ────────────────────────────────────────────────
  ev_json    =. pca_num_to_json ev_pct
  allev_json =. pca_num_to_json all_ev_pct
  tx_json    =. pca_mat_to_json transformed
  load_json  =. pca_mat_to_json loadings

  NB. column names as JSON array
  cn_json2 =. '['
  k =. 0
  while. k < # colnames do.
    if. k > 0 do. cn_json2 =. cn_json2 , ',' end.
    cn_json2 =. cn_json2 , enc_json_json_ dltb > k { colnames
    k =. >: k
  end.
  cn_json2 =. cn_json2 , ']'

  NB. preproc opts as JSON array of strings
  ppopt_json =. '['
  k =. 0
  while. k < # opts do.
    if. k > 0 do. ppopt_json =. ppopt_json , ',' end.
    ppopt_json =. ppopt_json , enc_json_json_ dltb > k { opts
    k =. >: k
  end.
  ppopt_json =. ppopt_json , ']'

  NB. row indexes: 0..nrows-1 (we kept all rows from the stored matrix)
  ridx_json =. '['
  k =. 0
  while. k < nrows do.
    if. k > 0 do. ridx_json =. ridx_json , ',' end.
    ridx_json =. ridx_json , (": k)
    k =. >: k
  end.
  ridx_json =. ridx_json , ']'

  NB. ── Store ───────────────────────────────────────────────────────────
  run_id =. db_insertpcarun_jhs_ dsid ; ncomp ; ev_json ; allev_json ; load_json ; tx_json ; cn_json2 ; nrows ; ppopt_json ; preprep_json ; ridx_json
  if. _1 = run_id do.
    r =. '0' , JASEP , 'Database error saving PCA run.'
    return.
  end.

  NB. summary JSON for the client
  summary_json =. '{"run_id":' , (": run_id)
  summary_json =. summary_json , ',"n_components":' , (": ncomp)
  summary_json =. summary_json , ',"n_samples":' , (": nrows)
  summary_json =. summary_json , ',"n_cols":' , (": ncols)
  summary_json =. summary_json , ',"explained_var":' , ev_json
  summary_json =. summary_json , ',"all_ev":' , allev_json
  summary_json =. summary_json , ',"col_names":' , cn_json2
  summary_json =. summary_json , ',"transformed":' , tx_json
  summary_json =. summary_json , ',"loadings":' , load_json
  summary_json =. summary_json , ',"preproc_report":' , preprep_json , '}'

  r =. (<run_id) , (<ev_json) , <summary_json
  catch.
    r =. '0' , JASEP , 'PCA error: ' , 13!:12''
  end.
  r
)

NB. --------------------------------------------------------
NB. pca_listjson — list PCA runs for a dataset as JSON array
NB. y is dataset_id (integer)
pca_listjson =: 3 : 0
  rows =. db_listpcaruns_jhs_ y
  nrows =. # rows
  if. 0 = nrows do.
    r =. '[]'
    return.
  end.
  r =. '['
  i =. 0
  while. i < nrows do.
    row  =. i { rows
    rid  =. > > 0 { row
    ncomp =. > > 1 { row
    nsamp =. > > 2 { row
    ppopt =. dltb > 3 { row
    pinned =. > > 4 { row
    ts   =. dltb > 5 { row
    entry =. '{"id":' , (": rid)
    entry =. entry , ',"n_components":' , (": ncomp)
    entry =. entry , ',"n_samples":' , (": nsamp)
    entry =. entry , ',"pinned":' , (": pinned)
    entry =. entry , ',"ts":' , (enc_json_json_ ts) , '}'
    if. i > 0 do. r =. r , ',' end.
    r =. r , entry
    i =. >: i
  end.
  r =. r , ']'
  r
)

NB. --------------------------------------------------------
NB. pca_getjson — fetch full PCA run as JSON
NB. y is pca_run_id (integer)
pca_getjson =: 3 : 0
  row =. db_getpcarun_jhs_ y
  if. 0 = # row do.
    r =. ''
    return.
  end.
  NB. columns: id;dataset_id;n_components;explained_var;all_ev;loadings;
  NB.          transformed;col_names;n_samples;preproc_opts;preproc_report;
  NB.          row_indexes;is_pinned;notes;created_at
  rid      =. > > 0 { row
  did      =. > > 1 { row
  ncomp    =. > > 2 { row
  ev_json  =. dltb > 3 { row
  allev    =. dltb > 4 { row
  loadings =. dltb > 5 { row
  tx       =. dltb > 6 { row
  cn       =. dltb > 7 { row
  nsamp    =. > > 8 { row
  ppopt    =. dltb > 9 { row
  pprep    =. dltb > 10 { row
  ridx     =. dltb > 11 { row
  pinned   =. > > 12 { row
  ts       =. dltb > 14 { row
  r =. '{"id":' , (": rid)
  r =. r , ',"dataset_id":' , (": did)
  r =. r , ',"n_components":' , (": ncomp)
  r =. r , ',"n_samples":' , (": nsamp)
  r =. r , ',"pinned":' , (": pinned)
  r =. r , ',"ts":' , (enc_json_json_ ts)
  r =. r , ',"explained_var":' , ev_json
  r =. r , ',"all_ev":' , allev
  r =. r , ',"col_names":' , cn
  r =. r , ',"loadings":' , loadings
  r =. r , ',"transformed":' , tx
  r =. r , ',"preproc_opts":' , ppopt
  r =. r , ',"preproc_report":' , pprep
  r =. r , ',"row_indexes":' , ridx , '}'
  r
)
