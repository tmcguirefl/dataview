NB. kmeans.ijs — K-means clustering on stored PCA runs
NB.
NB. API (all verbs in jhs locale):
NB.   kmeans_run y     — y is (pca_run_id ; k)
NB.                      Loads transformed matrix from stored PCA run,
NB.                      runs KMeans (k clusters, 50 iterations, euclidean).
NB.                      Stores result in km_runs table.
NB.                      Returns (km_id ; labels_json ; summary_json) or error string.
NB.   kmeans_listjson y — y is pca_run_id; returns JSON array of km run summaries.
NB.   kmeans_getjson  y — y is km_run_id; returns full km run JSON or ''.

cocurrent 'jhs'

require jpath '~/jdev/jlearn/utils/utils.ijs'
require jpath '~/jdev/jlearn/clustering/kmeans.ijs'

NB. --------------------------------------------------------
NB. km_labels_to_int — convert KMeans predict boolean matrix to integer label vector
NB. predict returns (n_samples x k) boolean matrix; each row has 1 in cluster column.
NB. We take the index of the 1 in each row: i.&1 "1
km_labels_to_int =: i.&1 "1

NB. --------------------------------------------------------
NB. kmeans_run — run k-means on a stored PCA run's transformed data
NB. y is (pca_run_id ; k)
NB.   pca_run_id — integer id in pca_runs table
NB.   k          — number of clusters (integer, 2..n_samples-1)
NB. Returns (km_id ; labels_json ; summary_json) on success
NB.      or '0',JASEP,errmsg on failure
kmeans_run =: 3 : 0
  r =. ''
  try.
  prid   =. > 0 { y
  k      =. > 1 { y
  prid   =. {. , prid
  k      =. {. , k

  NB. fetch the PCA run to get transformed matrix
  row =. db_getpcarun_jhs_ prid
  if. 0 = # row do.
    r =. '0' , JASEP , 'PCA run not found.'
    return.
  end.

  NB. columns: id;dataset_id;n_components;explained_var;all_ev;loadings;
  NB.          transformed;col_names;n_samples;...
  tx_json =. dltb > 6 { row
  nsamp   =. > > 8 { row

  NB. parse transformed JSON: [[r0c0,...],...]
  require 'convert/json'
  txrows_box =. dec_json_json_ tx_json
  ntx =. # txrows_box
  if. 0 = ntx do.
    r =. '0' , JASEP , 'No transformed data in PCA run.'
    return.
  end.
  txmat =. > > &.> txrows_box    NB. open each row, then stack into numeric matrix

  NB. validate k
  if. k < 2 do.
    r =. '0' , JASEP , 'k must be at least 2.'
    return.
  end.
  if. k > ntx do.
    r =. '0' , JASEP , 'k must be less than or equal to the number of samples (' , (": ntx) , ').'
    return.
  end.

  NB. run KMeans
  km =. (txmat ; 'euclidean' ; k ; 'uniform') conew 'KMeans'
  centroids =. fit__km 50
  bool_labels =. predict__km txmat
  int_labels =. km_labels_to_int bool_labels
  destroy__km ''

  NB. serialise labels: JSON int array
  lbl_json =. '['
  ki =. 0
  while. ki < ntx do.
    if. ki > 0 do. lbl_json =. lbl_json , ',' end.
    lbl_json =. lbl_json , (": ki { int_labels) rplc '_';'-'
    ki =. >: ki
  end.
  lbl_json =. lbl_json , ']'

  NB. serialise centroids: JSON array of arrays
  nk =. > 0 { $ centroids
  cen_json =. '['
  ki =. 0
  while. ki < nk do.
    if. ki > 0 do. cen_json =. cen_json , ',' end.
    NB. each centroid row as JSON array
    row_c =. ki { centroids
    nc =. # row_c
    cen_json =. cen_json , '['
    ci =. 0
    while. ci < nc do.
      if. ci > 0 do. cen_json =. cen_json , ',' end.
      cen_json =. cen_json , (": ci { row_c) rplc '_';'-'
      ci =. >: ci
    end.
    cen_json =. cen_json , ']'
    ki =. >: ki
  end.
  cen_json =. cen_json , ']'

  NB. store
  km_id =. db_insertkm_jhs_ prid ; k ; lbl_json ; cen_json ; ntx
  if. _1 = km_id do.
    r =. '0' , JASEP , 'Database error saving k-means run.'
    return.
  end.

  NB. cluster size counts
  counts_json =. '['
  ki =. 0
  while. ki < k do.
    if. ki > 0 do. counts_json =. counts_json , ',' end.
    counts_json =. counts_json , (": +/ ki = int_labels) rplc '_';'-'
    ki =. >: ki
  end.
  counts_json =. counts_json , ']'

  summary_json =. '{"km_id":' , (": km_id)
  summary_json =. summary_json , ',"pca_run_id":' , (": prid)
  summary_json =. summary_json , ',"k":' , (": k)
  summary_json =. summary_json , ',"n_samples":' , (": ntx)
  summary_json =. summary_json , ',"labels":' , lbl_json
  summary_json =. summary_json , ',"centroids":' , cen_json
  summary_json =. summary_json , ',"counts":' , counts_json , '}'

  r =. (<km_id) , (<lbl_json) , <summary_json
  catch.
    r =. '0' , JASEP , 'K-means error: ' , 13!:12''
  end.
  r
)

NB. --------------------------------------------------------
NB. kmeans_listjson — list k-means runs for a pca_run as JSON array
NB. y is pca_run_id (integer)
kmeans_listjson =: 3 : 0
  rows =. db_listkm_jhs_ y
  nrows =. # rows
  if. 0 = nrows do.
    r =. '[]'
    return.
  end.
  r =. '['
  i =. 0
  while. i < nrows do.
    row  =. i { rows
    kid  =. > > 0 { row
    kval =. > > 1 { row
    nsamp =. > > 2 { row
    ts   =. dltb > 3 { row
    entry =. '{"id":' , (": kid)
    entry =. entry , ',"k":' , (": kval)
    entry =. entry , ',"n_samples":' , (": nsamp)
    entry =. entry , ',"ts":' , (enc_json_json_ ts) , '}'
    if. i > 0 do. r =. r , ',' end.
    r =. r , entry
    i =. >: i
  end.
  r =. r , ']'
  r
)

NB. --------------------------------------------------------
NB. kmeans_getjson — fetch full k-means run as JSON
NB. y is km_run_id (integer)
kmeans_getjson =: 3 : 0
  row =. db_getkm_jhs_ y
  if. 0 = # row do.
    r =. ''
    return.
  end.
  NB. columns: id;pca_run_id;k;labels;centroids;n_samples;created_at
  kid    =. > > 0 { row
  prid   =. > > 1 { row
  kval   =. > > 2 { row
  lbl    =. dltb > 3 { row
  cen    =. dltb > 4 { row
  nsamp  =. > > 5 { row
  ts     =. dltb > 6 { row
  r =. '{"id":' , (": kid)
  r =. r , ',"pca_run_id":' , (": prid)
  r =. r , ',"k":' , (": kval)
  r =. r , ',"n_samples":' , (": nsamp)
  r =. r , ',"ts":' , (enc_json_json_ ts)
  r =. r , ',"labels":' , lbl
  r =. r , ',"centroids":' , cen , '}'
  r
)
