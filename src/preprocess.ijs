NB. preprocess.ijs — preprocessing pipeline for numeric matrices
NB.
NB. API (all verbs in jhs locale):
NB.   preproc_run y   — y is (nummat ; colnames ; opts)
NB.                     nummat   — numeric nrows x ncols matrix
NB.                     colnames — boxed vector of column name strings
NB.                     opts     — boxed list of option strings (any subset):
NB.                                'drop_const' 'impute' 'scale_std' 'scale_mm'
NB.                     Returns (outmat ; outcols ; report_json)
NB.
NB. Imputer: jLearnImpute locale — smartImpute y (boxed matrix, a: = missing)
NB. Scaler:  MinMaxScaler class  — standardizeColumns__inst '' (z-score)
NB.                                normalizeColumns__inst ''   (0-1 range)
NB.
NB. GOTCHA: imputer expects a boxed matrix where missing cells = a: (ace/empty box)
NB.         Our numeric matrix has no missing sentinel — cells that failed ". were
NB.         already dropped by csv_to_json_matrix (row-dropping strategy).
NB.         So imputation is a no-op on a fully numeric matrix; we keep it for
NB.         forward-compatibility if we later pass raw parsed data.
NB.
NB. GOTCHA: MinMaxScaler stores data in its locale on create; verbs operate on
NB.         that stored copy. We create one instance per call, destroy after use.

cocurrent 'jhs'

require jpath '~/jdev/jlearn/impute/imputer.ijs'
require jpath '~/jdev/jlearn/utils/minmaxscaler.ijs'

NB. --------------------------------------------------------
NB. preproc_run — run the preprocessing pipeline
NB. y is (nummat ; colnames ; opts)
NB. Returns (outmat ; outcols ; report_json)
preproc_run =: 3 : 0
  'nummat colnames opts' =. y
  nrows =. > 0 { $ nummat
  ncols =. > 1 { $ nummat

  dropped  =. ''         NB. names of dropped columns
  steps    =. ''         NB. narrative for report

  NB. ── 1. Drop constant columns ──────────────────────────────────────────
  if. (< 'drop_const') e. opts do.
    NB. A column is constant if its max equals its min (all values identical)
    NB. >./"2 and <./"2 give column-wise max/min (rank-2 verb over the matrix)
    col_max =. >./"1 |: nummat       NB. max of each column
    col_min =. <./"1 |: nummat       NB. min of each column
    col_const =. col_max = col_min
    keep_mask =. -. col_const
    keep_idx  =. I. keep_mask
    n_dropped =. +/ col_const
    if. n_dropped > 0 do.
      dropped  =. col_const # colnames
      colnames =. keep_mask # colnames
      nummat   =. keep_idx {"1 nummat
      ncols    =. # keep_idx
      steps    =. steps , 'Dropped ' , (": n_dropped) , ' constant column(s). '
    else.
      steps =. steps , 'No constant columns found. '
    end.
  end.

  NB. ── 2. Impute missing values ────────────────────────────────────────────
  NB. Our matrix is fully numeric (row-dropping ensures this), but we honour
  NB. the option for completeness.
  if. (< 'impute') e. opts do.
    steps =. steps , 'Imputation: matrix is fully numeric, no missing values. '
  end.

  NB. ── 3. Scale ─────────────────────────────────────────────────────────────
  if. (ncols > 0) *. (nrows > 1) do.
    if. (< 'scale_std') e. opts do.
      sc =. (nummat ; 0 ; 1) conew 'MinMaxScaler'
      nummat =. standardizeColumns__sc ''
      destroy__sc ''
      steps =. steps , 'Applied z-score standardisation. '
    elseif. (< 'scale_mm') e. opts do.
      sc =. (nummat ; 0 ; 1) conew 'MinMaxScaler'
      nummat =. normalizeColumns__sc ''
      destroy__sc ''
      steps =. steps , 'Applied min-max normalisation (0-1). '
    end.
  end.

  NB. ── Build report JSON ────────────────────────────────────────────────────
  NB. dropped_json: JSON array of dropped column names
  dropped_json =. '['
  k =. 0
  while. k < # dropped do.
    if. k > 0 do. dropped_json =. dropped_json , ',' end.
    dropped_json =. dropped_json , enc_json_json_ dltb > k { dropped
    k =. >: k
  end.
  dropped_json =. dropped_json , ']'

  report_json =. '{"steps":' , (enc_json_json_ dltb steps)
  report_json =. report_json , ',"n_rows_out":' , (": nrows)
  report_json =. report_json , ',"n_cols_out":' , (": ncols)
  report_json =. report_json , ',"dropped_cols":' , dropped_json , '}'

  r =. (<nummat) , (<colnames) , <report_json
  r
)
