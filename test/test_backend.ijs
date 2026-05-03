NB. test/test_backend.ijs — backend unit tests for ModelScope-J
NB.
NB. Run from the dataview/ directory:
NB.   jconsole test/test_backend.ijs

NB. ── Bootstrap ───────────────────────────────────────────────────────────────
require 'data/ddsqlite'
setzlocale_jddsqlite_ ''
require 'tables/csv'
require 'convert/json'

load 'src/db.ijs'
load 'src/csv_util.ijs'
load 'src/preprocess.ijs'
load 'src/pca.ijs'
load 'src/kmeans.ijs'

NB. jhs-core globals not defined when running without jhs/core
JASEP_jhs_ =: '|'
LF_jhs_    =: 10 { a.

NB. Isolated test database
DB_PATH_jhs_ =: 'data/test_ms.db'
2!:0 'rm -f data/test_ms.db'
db_open_jhs_ ''

NB. ── Harness ──────────────────────────────────────────────────────────────────
PASS =: 0
FAIL =: 0

pass =: 3 : 0
  PASS =: >: PASS
  echo '  PASS: ',y
)
fail =: 3 : 0
  FAIL =: >: FAIL
  echo '  FAIL: ',y
)

NB. t_ok label val — val must be 1
t_ok =: 4 : 0
  if. 0 ~: +. y do. pass x else. fail x end.
)

NB. t_eq label expected actual — uses -: (match)
NB. x is (label;expected) boxed pair, y is actual value
t_eq =: 4 : 0
  lbl =. > 0 { x
  ev  =. > 1 { x
  if. ev -: y do.
    pass lbl
  else.
    fail lbl , ' | expected: ',(":ev),' | got: ',(":y)
  end.
)

NB. t_near label tol  actual — all abs values strictly less than tol
t_near =: 4 : 0
  'lbl tol' =. x
  if. 0 ~: */ , (tol > | , y) do. pass lbl else. fail lbl end.
)

section =: 3 : 0
  echo ''
  echo '── ',y,' ──────────────────────────────────────────────'
)

NB. ══════════════════════════════════════════════════════════════════════════
section 'csv_parse'
NB. ══════════════════════════════════════════════════════════════════════════

LF =. 10 { a.
CSV1 =: 'name,age,score',LF,'Alice,30,95.5',LF,'Bob,25,88'

'hdr1 mat1' =. csv_parse_jhs_ CSV1

('csv_parse header count' ; 3)         t_eq # hdr1
('csv_parse row count'    ; 2)         t_eq # mat1
('csv_parse header[0]'    ; 'name')    t_eq > 0 { hdr1
('csv_parse header[1]'    ; 'age')     t_eq > 1 { hdr1
NB. cell (0,1): row 0, col 1
('csv_parse cell[0,1]'    ; '30')      t_eq > 0 { 1 {"1 mat1
('csv_parse cell[1,2]'    ; '88')      t_eq > 1 { 2 {"1 mat1

NB. No trailing LF — fixcsv must still get all rows
CSV1b =: 'x,y',LF,'1,2',LF,'3,4'
'hdr1b mat1b' =. csv_parse_jhs_ CSV1b
('csv_parse no-trailing-LF rows' ; 2) t_eq # mat1b

NB. Header-only CSV
CSV1c =: 'a,b,c'
'hdr1c mat1c' =. csv_parse_jhs_ CSV1c
('csv_parse header-only rows' ; 0) t_eq # mat1c

NB. ══════════════════════════════════════════════════════════════════════════
section 'csv_detect_types'
NB. ══════════════════════════════════════════════════════════════════════════

CSV2 =: 'name,age,score',LF,'Alice,30,95.5',LF,'Bob,25,88',LF,'Carol,22,77.1'
'hdr2 mat2' =. csv_parse_jhs_ CSV2
types2 =. csv_detect_types_jhs_ mat2

NB. types is a rank-1 char string; index with { gives a scalar, literal 'x' is rank-0
NB. compare using = (char equality) rather than -: (match checks rank too)
('detect_types name->c'  ; 1) t_eq 'c' = 0 { types2
('detect_types age->q'   ; 1) t_eq 'q' = 1 { types2
('detect_types score->q' ; 1) t_eq 'q' = 2 { types2

NB. All-numeric
CSV2b =: 'x,y,z',LF,'1,2,3',LF,'4,5,6'
'hdr2b mat2b' =. csv_parse_jhs_ CSV2b
types2b =. csv_detect_types_jhs_ mat2b
('detect_types all-q' ; 1) t_eq types2b -: 'qqq'   NB. -: match works when both are rank-1 same length

NB. 60% numeric -> categorical (threshold is 80%)
CSV2c =: 'v',LF,'1',LF,'2',LF,'x',LF,'4',LF,'y'
'hdr2c mat2c' =. csv_parse_jhs_ CSV2c
types2c =. csv_detect_types_jhs_ mat2c
('detect_types 60%-num->c' ; 1) t_eq 'c' = 0 { types2c

NB. ══════════════════════════════════════════════════════════════════════════
section 'csv_quality_report'
NB. ══════════════════════════════════════════════════════════════════════════

qrep2 =. csv_quality_report_jhs_ (<hdr2) , (<mat2) , <types2

'qr: starts {' t_ok '{' -: {. qrep2
'qr: ends }'   t_ok '}' -: {: qrep2

NB. Key substrings present
'qr: has rows'    t_ok 0 < # ('"rows"'    E. qrep2)
'qr: has quant'   t_ok 0 < # ('"quant"'   E. qrep2)
'qr: has columns' t_ok 0 < # ('"columns"' E. qrep2)

NB. Correct values embedded literally
('qr: rows=3'  ; 1) t_eq +/ ('"rows":3'  E. qrep2)
('qr: quant=2' ; 1) t_eq +/ ('"quant":2' E. qrep2)
('qr: cat=1'   ; 1) t_eq +/ ('"cat":1'   E. qrep2)

NB. ══════════════════════════════════════════════════════════════════════════
section 'csv_to_json_matrix'
NB. ══════════════════════════════════════════════════════════════════════════

'rawj colsj ridxj' =. csv_to_json_matrix_jhs_ (<hdr2) , (<mat2) , <types2

'raw: starts ['  t_ok '[' -: {. rawj
'raw: ends ]'    t_ok ']' -: {: rawj

NB. colnames JSON has age and score but not name
'colnames: has age'    t_ok 0 < +/ ('"age"'   E. colsj)
'colnames: has score'  t_ok 0 < +/ ('"score"' E. colsj)
'colnames: no name'    t_ok 0 = +/ ('"name"'  E. colsj)

'rowidx: has 0,1,2' t_ok (0 < +/ ('0' E. ridxj)) *. (0 < +/ ('2' E. ridxj))

NB. ══════════════════════════════════════════════════════════════════════════
section 'csv_preview_json'
NB. ══════════════════════════════════════════════════════════════════════════

prevj =. csv_preview_json_jhs_ (<hdr2) , <mat2
'preview: starts ['    t_ok '[' -: {. prevj
'preview: ends ]'      t_ok ']' -: {: prevj
'preview: has Alice'   t_ok 0 < +/ ('"Alice"' E. prevj)
'preview: has name key' t_ok 0 < +/ ('"name"'  E. prevj)

NB. 15 rows -> capped at 10 objects (10 opening { inside array)
lines =. LF ,~ ,/ (LF ,~ '1') #~ 15
CSV_big =: 'v', LF, lines
'hdrB matB' =. csv_parse_jhs_ CSV_big
prevB =. csv_preview_json_jhs_ (<hdrB) , <matB
('preview: 10 row limit' ; 10) t_eq +/ '{' = prevB

NB. ══════════════════════════════════════════════════════════════════════════
section 'pca_num_to_json'
NB. ══════════════════════════════════════════════════════════════════════════

r_vec =. pca_num_to_json_jhs_ 10 20 30
'num_to_json: starts [' t_ok '[' -: {. r_vec
'num_to_json: ends ]'   t_ok ']' -: {: r_vec
'num_to_json: has 10'   t_ok 0 < +/ ('10' E. r_vec)
'num_to_json: has 30'   t_ok 0 < +/ ('30' E. r_vec)

('num_to_json: single' ; '[42]') t_eq pca_num_to_json_jhs_ , 42

NB. ══════════════════════════════════════════════════════════════════════════
section 'pca_mat_to_json'
NB. ══════════════════════════════════════════════════════════════════════════

m23 =. 2 3 $ 1 2 3 4 5 6
r_mat =. pca_mat_to_json_jhs_ m23
'mat_to_json: starts ['  t_ok '[' -: {. r_mat
'mat_to_json: ends ]'    t_ok ']' -: {: r_mat
'mat_to_json: has 1'     t_ok 0 < +/ ('1' E. r_mat)
'mat_to_json: has 6'     t_ok 0 < +/ ('6' E. r_mat)
NB. 2 rows: '[' appears 3 times (outer + 2 row arrays)
('mat_to_json: 3x[' ; 3) t_eq +/ '[' = r_mat

NB. ══════════════════════════════════════════════════════════════════════════
section 'preproc_run — no-op'
NB. ══════════════════════════════════════════════════════════════════════════

NB. 4x3 matrix: x, y (varying), const (all 99)
nummat_pp =. 4 3 $ 1 2 99  3 4 99  5 6 99  7 8 99
cols_pp   =. (<'x') , (<'y') , <'const'
opts_none =. i. 0    NB. empty boxed list

res_none =. preproc_run_jhs_ (<nummat_pp) , (<cols_pp) , <opts_none
nm_none =. > 0 { res_none
cn_none =. > 1 { res_none

('preproc no-op nrows' ; 4) t_eq > 0 { $ nm_none
('preproc no-op ncols' ; 3) t_eq > 1 { $ nm_none
('preproc no-op colnames' ; 3) t_eq # cn_none

NB. ══════════════════════════════════════════════════════════════════════════
section 'preproc_run — drop_const'
NB. ══════════════════════════════════════════════════════════════════════════

opts_dc =. , < 'drop_const'
res_dc =. preproc_run_jhs_ (<nummat_pp) , (<cols_pp) , <opts_dc
nm_dc =. > 0 { res_dc
cn_dc =. > 1 { res_dc
rj_dc =. > 2 { res_dc

('drop_const ncols'      ; 2) t_eq > 1 { $ nm_dc
('drop_const colnames'   ; 2) t_eq # cn_dc
'drop_const: x kept'    t_ok (<'x')     e. cn_dc
'drop_const: y kept'    t_ok (<'y')     e. cn_dc
'drop_const: const gone' t_ok -. (<'const') e. cn_dc
'drop_const: report has Dropped' t_ok 0 < +/ ('Dropped' E. rj_dc)

NB. ══════════════════════════════════════════════════════════════════════════
section 'preproc_run — scale_std (z-score)'
NB. ══════════════════════════════════════════════════════════════════════════

opts_std =. (<'drop_const') , <'scale_std'
res_std  =. preproc_run_jhs_ (<nummat_pp) , (<cols_pp) , <opts_std
nm_std   =. > 0 { res_std

NB. Column means should be ~0 after z-score
nrows_std =. > 0 { $ nm_std
col0 =. 0 {"1 nm_std
col1 =. 1 {"1 nm_std
mean0 =. (+/ col0) % nrows_std
mean1 =. (+/ col1) % nrows_std
('scale_std col0 mean~0' ; 1e_10) t_near | mean0
('scale_std col1 mean~0' ; 1e_10) t_near | mean1

NB. Column std should be ~1
var0 =. (+/ *: col0 - mean0) % nrows_std
std0 =. %: var0
('scale_std col0 std~1' ; 0.01) t_near | 1 - std0

NB. ══════════════════════════════════════════════════════════════════════════
section 'preproc_run — scale_mm (min-max)'
NB. ══════════════════════════════════════════════════════════════════════════

opts_mm =. (<'drop_const') , <'scale_mm'
res_mm  =. preproc_run_jhs_ (<nummat_pp) , (<cols_pp) , <opts_mm
nm_mm   =. > 0 { res_mm

'scale_mm: all >= 0' t_ok 0 <: <./ , nm_mm
'scale_mm: all <= 1' t_ok 1 >: >./ , nm_mm

NB. ══════════════════════════════════════════════════════════════════════════
section 'db — user and dataset CRUD'
NB. ══════════════════════════════════════════════════════════════════════════

uid =. db_insertuser_jhs_ 'testuser' ; 'hash' ; 'salt'
'db_insertuser: positive id' t_ok uid > 0

urow =. db_getuser_jhs_ 'testuser'
'db_getuser: found'       t_ok 0 < # urow
('db_getuser: username' ; 'testuser') t_eq dltb > 1 { urow

db_settoken_jhs_ uid ; 'tok123'
urow2 =. db_userbytoken_jhs_ 'tok123'
'db_userbytoken: found' t_ok 0 < # urow2

NB. Known raw_data JSON: 3 rows, 2 quant cols (age, score)
raw_j  =. '[[30,95.5],[25,88],[22,77.1]]'
qcols_j =. '["age","score"]'
ccols_j =. '["name"]'
acols_j =. '["name","age","score"]'
qrep_j  =. '{"rows":3,"cols":3,"quant":2,"cat":1,"constant_cols":0,"columns":[]}'
prev_j  =. '[{"name":"Alice","age":"30","score":"95.5"}]'

dsid =. db_insertdataset_jhs_ uid ; 'iris_test' ; 3 ; 3 ; qcols_j ; ccols_j ; acols_j ; raw_j ; qrep_j ; prev_j
'db_insertdataset: positive id' t_ok dsid > 0

('db_listdatasets: 1 row' ; 1) t_eq # db_listdatasets_jhs_ uid

drow =. db_getdataset_jhs_ dsid ; uid
'db_getdataset: found' t_ok 0 < # drow
('db_getdataset: name' ; 'iris_test') t_eq dltb > 1 { drow

drow_bad =. db_getdataset_jhs_ dsid ; (uid + 99)
'db_getdataset: wrong owner->empty' t_ok 0 = # drow_bad

NB. ══════════════════════════════════════════════════════════════════════════
section 'pca_run — end-to-end'
NB. ══════════════════════════════════════════════════════════════════════════

NB. Wrap in a verb because control structures require a verb body in J scripts
run_pca_tests =: 3 : 0
  'dsid uid' =. y
  pca_opts =. (<'drop_const') , <'scale_std'

  NB. 1-component PCA
  pca_res1 =. pca_run_jhs_ dsid ; 1 ; pca_opts
  pca_ok1  =. 32 = 3!:0 pca_res1
  'pca_run 1-comp: succeeded' t_ok pca_ok1

  if. pca_ok1 do.
    run_id1   =. > 0 { pca_res1
    ev_json1  =. > 1 { pca_res1
    sum_json1 =. > 2 { pca_res1
    'pca_run: run_id > 0'              t_ok run_id1 > 0
    'pca_run: ev_json starts ['        t_ok '[' -: {. ev_json1
    'pca_run: summary: run_id key'     t_ok 0 < +/ ('"run_id"'        E. sum_json1)
    'pca_run: summary: explained_var'  t_ok 0 < +/ ('"explained_var"' E. sum_json1)
    'pca_run: summary: transformed'    t_ok 0 < +/ ('"transformed"'   E. sum_json1)
    'pca_run: summary: loadings'       t_ok 0 < +/ ('"loadings"'      E. sum_json1)
    'pca_run: summary: col_names'      t_ok 0 < +/ ('"col_names"'     E. sum_json1)
    'pca_run: summary: preproc_report' t_ok 0 < +/ ('"preproc_report"' E. sum_json1)

    NB. ncomp=99 must fail with error string
    pca_bad =. pca_run_jhs_ dsid ; 99 ; pca_opts
    'pca_run bad ncomp: error string' t_ok 2 = 3!:0 pca_bad

    NB. ── pca_listjson ────────────────────────────────────────────────────
    lj =. pca_listjson_jhs_ dsid
    'pca_listjson: starts [' t_ok '[' -: {. lj
    'pca_listjson: has id'   t_ok 0 < +/ ('"id"' E. lj)

    NB. ── pca_getjson ─────────────────────────────────────────────────────
    gj =. pca_getjson_jhs_ run_id1
    'pca_getjson: starts {'         t_ok '{' -: {. gj
    'pca_getjson: has transformed'  t_ok 0 < +/ ('"transformed"' E. gj)
    'pca_getjson: has loadings'     t_ok 0 < +/ ('"loadings"'    E. gj)

    NB. ── kmeans on this PCA run (k=2) ──────────────────────────────────────
    km_res =. kmeans_run_jhs_ run_id1 ; 2
    km_ok  =. 32 = 3!:0 km_res
    'kmeans_run: succeeded' t_ok km_ok
    if. km_ok do.
      km_id    =. > 0 { km_res
      lbl_json =. > 1 { km_res
      sum_json =. > 2 { km_res
      'kmeans_run: km_id > 0'          t_ok km_id > 0
      'kmeans_run: labels starts ['    t_ok '[' -: {. lbl_json
      'kmeans_run: summary has km_id'  t_ok 0 < +/ ('"km_id"'   E. sum_json)
      'kmeans_run: summary has labels' t_ok 0 < +/ ('"labels"'  E. sum_json)
      'kmeans_run: summary has k'      t_ok 0 < +/ ('"k"' E. sum_json)
      require 'convert/json'
      labels =. > &.> dec_json_json_ lbl_json   NB. unbox each, giving numeric boxed list
      labels =. > labels                         NB. open/stack into flat numeric array
      'kmeans_run: label count = n_samples' t_ok (# labels) = 3
      'kmeans_run: all labels >= 0'         t_ok 0 <: <./ labels
      'kmeans_run: all labels < k'          t_ok 2 > >./ labels
      lj2 =. kmeans_listjson_jhs_ run_id1
      'kmeans_listjson: starts [' t_ok '[' -: {. lj2
      'kmeans_listjson: has id'   t_ok 0 < +/ ('"id"' E. lj2)
      gj2 =. kmeans_getjson_jhs_ km_id
      'kmeans_getjson: starts {'       t_ok '{' -: {. gj2
      'kmeans_getjson: has labels'     t_ok 0 < +/ ('"labels"'    E. gj2)
      'kmeans_getjson: has centroids'  t_ok 0 < +/ ('"centroids"' E. gj2)
      bad_km =. kmeans_run_jhs_ run_id1 ; 1
      'kmeans_run bad k=1: error string' t_ok 2 = 3!:0 bad_km
      ('db_deletekm: ok' ; 1)              t_eq db_deletekm_jhs_ km_id
      ('kmeans_getjson after delete' ; '') t_eq kmeans_getjson_jhs_ km_id
    else.
      fail 'kmeans: all detail tests skipped (run failed)'
    end.

    NB. ── db_deletepcarun ──────────────────────────────────────────────────
    ('db_deletepcarun: ok' ; 1) t_eq db_deletepcarun_jhs_ run_id1
    ('pca_getjson after delete' ; '') t_eq pca_getjson_jhs_ run_id1
  else.
    fail 'pca_run: all detail tests skipped (run failed)'
  end.
)

MS_UID_jhs_  =: uid
MS_USER_jhs_ =: 'testuser'
run_pca_tests dsid ; uid

NB. ── db_deletedataset ────────────────────────────────────────────────────────
('db_deletedataset: ok' ; 1) t_eq db_deletedataset_jhs_ dsid ; uid
('db_getdataset after delete' ; '') t_eq db_getdataset_jhs_ dsid ; uid

NB. ── Cleanup ─────────────────────────────────────────────────────────────────
db_close_jhs_ ''
2!:0 'rm -f data/test_ms.db'
echo 'Test database removed.'

NB. ── Summary ─────────────────────────────────────────────────────────────────
echo ''
echo '════════════════════════════════════════════════'
echo 'Results: ',(": PASS),' passed  ',(": FAIL),' failed'
echo '════════════════════════════════════════════════'
exit FAIL > 0
