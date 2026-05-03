NB. analysis.ijs — column statistics and correlation matrix for stored datasets
NB.
NB. API (all verbs in jhs locale):
NB.   analysis_stats y   — y is dataset_id (integer)
NB.                        Returns JSON object with per-column stats
NB.   analysis_corr  y   — y is dataset_id (integer)
NB.                        Returns JSON: {col_names:[...], matrix:[[...],...]}
NB.
NB. Both verbs load the stored raw_data (quant cols only) from the datasets table.
NB. All math is native J — no jlearn required.

cocurrent 'jhs'

NB. --------------------------------------------------------
NB. Internal: load numeric matrix and col names for a dataset
NB. Returns (nummat ; colnames) or '' on failure
analysis_load_nummat =: 3 : 0
  r =. ''
  row =. db_getdataset_jhs_ y ; MS_UID_jhs_
  if. 0 = # row do. r return. end.
  raw_json   =. dltb > 7 { row
  qcols_json =. dltb > 4 { row
  require 'convert/json'
  numrows_box =. dec_json_json_ raw_json
  nrows =. # numrows_box
  if. 0 = nrows do. r return. end.
  nummat   =. > > &.> numrows_box
  colnames =. dec_json_json_ qcols_json
  r =. (<nummat) , <colnames
  r
)

NB. --------------------------------------------------------
NB. analysis_col_stats — compute stats for one numeric column vector
NB. y is a plain numeric vector (length n)
NB. Returns JSON object string
analysis_col_stats =: 3 : 0
  n    =. # y
  mn   =. <./ y
  mx   =. >./ y
  avg  =. (+/ y) % n
  vr   =. (+/ *: y - avg) % n
  sd   =. %: vr
  NB. median: sort, take middle (linear interpolation for even n)
  sy   =. /:~ y
  med  =. ((n - 1) % 2) { sy    NB. lower of the two midpoints for even n
  r =. '{"min":'    , (": mn)  rplc '_';'-'
  r =. r , ',"max":' , (": mx)  rplc '_';'-'
  r =. r , ',"mean":' , (": avg) rplc '_';'-'
  r =. r , ',"std":' , (": sd)  rplc '_';'-'
  r =. r , ',"median":' , (": med) rplc '_';'-'
  r =. r , ',"n":' , (": n) , '}'
  r
)

NB. --------------------------------------------------------
NB. analysis_stats — per-column stats for a dataset's numeric columns
NB. y is dataset_id (integer)
NB. Returns JSON: {col_names:[...], stats:[{min,max,mean,std,median,n},...]}
analysis_stats =: 3 : 0
  r =. ''
  loaded =. analysis_load_nummat y
  if. 0 = # loaded do.
    r =. '{"error":"dataset not found or no numeric columns"}'
    return.
  end.
  'nummat colnames' =. loaded
  ncols =. > 1 { $ nummat
  NB. col_names JSON
  cn_json =. '['
  k =. 0
  while. k < ncols do.
    if. k > 0 do. cn_json =. cn_json , ',' end.
    cn_json =. cn_json , enc_json_json_ dltb > k { colnames
    k =. >: k
  end.
  cn_json =. cn_json , ']'
  NB. stats per column
  st_json =. '['
  k =. 0
  while. k < ncols do.
    if. k > 0 do. st_json =. st_json , ',' end.
    col =. k {"1 nummat
    st_json =. st_json , analysis_col_stats col
    k =. >: k
  end.
  st_json =. st_json , ']'
  r =. '{"col_names":' , cn_json , ',"stats":' , st_json , '}'
  r
)

NB. --------------------------------------------------------
NB. analysis_corr — Pearson correlation matrix for a dataset's numeric columns
NB. y is dataset_id (integer)
NB. Returns JSON: {col_names:[...], matrix:[[r00,r01,...],...]}}
analysis_corr =: 3 : 0
  r =. ''
  loaded =. analysis_load_nummat y
  if. 0 = # loaded do.
    r =. '{"error":"dataset not found or no numeric columns"}'
    return.
  end.
  'nummat colnames' =. loaded
  nrows =. > 0 { $ nummat
  ncols =. > 1 { $ nummat

  NB. col_names JSON
  cn_json =. '['
  k =. 0
  while. k < ncols do.
    if. k > 0 do. cn_json =. cn_json , ',' end.
    cn_json =. cn_json , enc_json_json_ dltb > k { colnames
    k =. >: k
  end.
  cn_json =. cn_json , ']'

  NB. Pearson correlation: C[i,j] = cov(Xi,Xj) / (std(Xi)*std(Xj))
  NB. Centre each column
  means =. (+/"1 |: nummat) % nrows    NB. mean of each column, length ncols
  centred =. nummat -"1 _ means        NB. subtract col means, broadcasting over rows
  NB. column standard deviations
  stds =. %: (+/"1 |: *: centred) % nrows
  NB. avoid division by zero for constant cols
  stds =. stds + (stds = 0) * 1       NB. replace 0 std with 1 (corr undefined → 0)
  NB. normalise columns
  normed =. centred %"1 _ stds        NB. divide each row by stds vector
  NB. correlation matrix: (|: normed) +/ . * normed % nrows
  NB. shape: ncols x ncols
  mp      =. +/ . *
  corrmat =. ((|: normed) mp normed) % nrows

  NB. serialise matrix
  mat_json =. '['
  i =. 0
  while. i < ncols do.
    if. i > 0 do. mat_json =. mat_json , ',' end.
    row_json =. '['
    j =. 0
    while. j < ncols do.
      if. j > 0 do. row_json =. row_json , ',' end.
      val_ij =. j { i { corrmat
      row_json =. row_json , (": val_ij) rplc '_';'-'
      j =. >: j
    end.
    row_json =. row_json , ']'
    mat_json =. mat_json , row_json
    i =. >: i
  end.
  mat_json =. mat_json , ']'

  r =. '{"col_names":' , cn_json , ',"matrix":' , mat_json , '}'
  r
)
