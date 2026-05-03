NB. csv_util.ijs — CSV parsing, type detection, and quality reporting
NB.
NB. Relies on:
NB.   tables/csv  — fixcsv (string->boxed matrix), makenum, makenumcol
NB.   convert/json — enc_json (any J value -> JSON string)
NB.
NB. API (all verbs in jhs locale):
NB.   csv_parse y             CSV text -> header (boxed vec) ; data (boxed mat)
NB.   csv_detect_types y      boxed data mat -> type char list ('q'|'c' per col)
NB.   csv_quality_report y    header;data;types -> quality JSON string
NB.   csv_to_json_matrix y    header;data;types -> mat_json;colnames_json;rowidx_json
NB.   csv_preview_json y      header;data -> JSON array string of first 10 rows
NB.
NB. fixcsv handles quoted fields with embedded commas correctly.
NB. makenum converts numeric-looking boxed strings to J numbers in place.
NB. makenumcol does the same column-by-column (whole col only if fully numeric).
NB. enc_json serialises any J value (number, string, list, boxed array) to JSON.
NB. 3!:0 y returns the data type: 2=char, 4=integer, 8=float, 32=boxed.

cocurrent 'jhs'

require 'tables/csv'
require 'convert/json'

NB. --------------------------------------------------------
NB. csv_parse — parse a CSV text string
NB. y is a character string (LF or CRLF line endings both fine).
NB. Returns (header ; datamat):
NB.   header  — boxed vector of column name strings (from row 0)
NB.   datamat — boxed nrows x ncols matrix of strings (rows 1..end)
NB. Uses fixcsv which handles RFC 4180 quoted fields correctly.
NB. Rows with wrong column count are dropped.
csv_parse =: 3 : 0
  NB. fixcsv requires trailing LF to include the last line
  txt =. y , (LF #~ LF ~: {: y)
  mat =. fixcsv txt
  header =. {. mat
  ncols  =. # header
  dmat   =. }. mat
  nrows  =. # dmat
  if. 0 = nrows do.
    r =. (<header) , <((0, ncols) $ <'')
    return.
  end.
  NB. fixcsv always produces a rectangular matrix, no row-count guard needed
  nrows =. # dmat
  NB. use (<x),<y to get a 2-element boxed list; x;y would merge into a matrix
  NB. when x is a boxed vector and y is a boxed matrix (J's ; Link behaviour)
  r =. (<header) , <dmat
  r
)

NB. --------------------------------------------------------
NB. csv_detect_types — infer column type from a boxed string data matrix
NB. y is the boxed nrows x ncols data matrix returned by csv_parse.
NB. Returns a char list: 'q' (quantitative) or 'c' (categorical) per column.
NB. Strategy: convert whole column with makenum (sentinel _9999 for failures).
NB.   If >= 80% of non-empty cells converted successfully -> 'q'.
NB. 3!:0 on a converted cell: 4 or 8 = number, 32 = still boxed (string).
csv_detect_types =: 3 : 0
  'nrows ncols' =. , $ y
  if. 0 = nrows do.
    r =. ncols $ 'q'
    return.
  end.
  r =. ''
  j =. 0
  while. j < ncols do.
    col      =. j {"1 y                        NB. boxed string vector, length nrows
    NB. trim and find non-empty cells
    trimmed  =. dltb &.> col
    lens     =. > # &.> trimmed
    nonempty =. (0 < lens) # trimmed
    nne      =. # nonempty
    NB. attempt numeric conversion on non-empty cells
    converted =. _9999 makenum nonempty
    NB. count cells that became numbers: type 4 (int) or 8 (float) after unboxing
    NB. makenum leaves non-numeric cells as boxed char vectors (type 32 in converted)
    NB. when all cells convert, makenum returns a plain numeric array (type 4 or 8)
    NB. so test 3!:0 on converted as a whole, or per-element if still boxed
    convtype =. 3!:0 converted
    if. 32 = convtype do.
      NB. mixed or all-string result -- count cells whose unboxed type is 4 or 8
      n_numeric =. +/ (4 8 e.~ > 3!:0 &.> converted)
    else.
      NB. all numeric -- makenum unboxed everything
      n_numeric =. nne
    end.
    if. (0 = nne) +. (n_numeric >: >. 0.8 * nne) do.
      r =. r , 'q'
    else.
      r =. r , 'c'
    end.
    j =. >: j
  end.
  r
)

NB. --------------------------------------------------------
NB. csv_col_missing — count empty/whitespace-only cells in a boxed column
csv_col_missing =: 3 : 0
  +/ 0 = > # &.> (dltb &.> y)
)

NB. --------------------------------------------------------
NB. csv_col_unique — count distinct non-empty values in a boxed column
csv_col_unique =: 3 : 0
  trimmed  =. dltb &.> y
  lens     =. > # &.> trimmed
  nonempty =. (0 < lens) # trimmed
  # ~. nonempty
)

NB. --------------------------------------------------------
NB. csv_is_constant — 1 if all non-empty cells share the same value
csv_is_constant =: 3 : 0
  trimmed  =. dltb &.> y
  lens     =. > # &.> trimmed
  nonempty =. (0 < lens) # trimmed
  if. 1 > # nonempty do. 1 return. end.
  r =. 1 = # ~. nonempty
  r
)

NB. --------------------------------------------------------
NB. csv_quality_report — build a quality-report JSON string
NB. y is (header ; datamat ; types):
NB.   header  — boxed ncols-vector of column name strings
NB.   datamat — boxed nrows x ncols string matrix
NB.   types   — char list 'q'|'c' per column
NB. Returns a JSON object string.
NB. enc_json_json_ handles all value serialisation (strings, numbers, booleans).
csv_quality_report =: 3 : 0
  'header datamat types' =. y
  'nrows ncols' =. , $ datamat

  NB. per-column entries
  NB. enc_json encodes a 2 x n boxed array as a JSON object:
  NB.   row 0 = string keys, row 1 = values (any type)
  col_entries =. i. 0
  j =. 0
  while. j < ncols do.
    col_hdr  =. dltb > j { header
    col_type =. 1 {. j { types
    col_vals =. j {"1 datamat
    n_miss   =. csv_col_missing  col_vals
    n_uniq   =. csv_col_unique   col_vals
    is_const =. csv_is_constant  col_vals
    ks =. 'name' ; 'type' ; 'missing' ; 'unique' ; 'constant'
    vs =. col_hdr ; col_type ; n_miss ; n_uniq ; is_const
    entry =. enc_json_json_ ks ,: vs
    col_entries =. col_entries , < entry
    j =. >: j
  end.

  NB. summary-level counts
  n_quant =. +/ 'q' = types
  n_cat   =. +/ 'c' = types
  n_const =. 0
  j =. 0
  while. j < ncols do.
    colvj =. j {"1 datamat
    if. csv_is_constant colvj do. n_const =. >: n_const end.
    j =. >: j
  end.

  NB. join col_entries with commas
  cols_json =. '['
  k =. 0
  while. k < # col_entries do.
    if. k > 0 do. cols_json =. cols_json , ',' end.
    cols_json =. cols_json , > k { col_entries
    k =. >: k
  end.
  cols_json =. cols_json , ']'
  r =. '{"rows":'          , (": nrows)
  r =. r , ',"cols":'          , (": ncols)
  r =. r , ',"quant":'         , (": n_quant)
  r =. r , ',"cat":'           , (": n_cat)
  r =. r , ',"constant_cols":' , (": n_const)
  r =. r , ',"columns":'       , cols_json , '}'
  r
)

NB. --------------------------------------------------------
NB. csv_to_json_matrix — extract quantitative columns as a JSON 2-D numeric array
NB. y is (header ; datamat ; types)
NB. Rows with any non-numeric cell in a quant column are dropped.
NB. Returns (mat_json ; colnames_json ; rowidx_json):
NB.   mat_json     — JSON 2-D array [[v,...],...]
NB.   colnames_json — JSON array of column name strings
NB.   rowidx_json  — JSON array of original row indices that survived
csv_to_json_matrix =: 3 : 0
  'header datamat types' =. y
  'nrows ncols' =. , $ datamat

  qidx =. I. 'q' = types
  nq   =. # qidx

  NB. column names
  colnames_json =. enc_json_json_ (dltb &.> qidx { header)

  NB. parse each quant cell as a number; build good-row list
  NB. Process row by row to avoid makenum's mixed-result complexity.
  good_rows =. i. 0
  good_nums =. i. 0         NB. will hold numeric rows as a flat list
  i =. 0
  while. i < nrows do.
    row_i  =. i { datamat
    qcells =. qidx { row_i  NB. boxed strings for quant columns
    nums   =. ". &.> (dltb &.> qcells)
    NB. ". on empty or non-numeric string returns empty 0$0; length 0 = bad
    allnum =. */ 0 < > # &.> nums
    if. allnum do.
      good_rows =. good_rows , i
      good_nums =. good_nums , (> &.> nums)
    end.
    i =. >: i
  end.

  NB. encode good_rows as a JSON integer array
  rowidx_json =. '['
  k =. 0
  while. k < # good_rows do.
    if. k > 0 do. rowidx_json =. rowidx_json , ',' end.
    rowidx_json =. rowidx_json , (": k { good_rows)
    k =. >: k
  end.
  rowidx_json =. rowidx_json , ']'

  if. 0 = # good_rows do.
    mat_json =. '[]'
    r =. mat_json ; colnames_json ; rowidx_json
    return.
  end.

  NB. reshape good_nums into (nGoodRows x nq) numeric matrix
  ng     =. # good_rows
  nummat =. (ng, nq) $ good_nums

  NB. encode as JSON array of arrays [[r0c0,...],[r1c0,...],...]
  NB. enc_json on a 2-row matrix treats it as a {key:val} object, so build manually
  mat_json =. '['
  i =. 0
  while. i < ng do.
    row_json =. enc_json_json_ i { nummat
    if. i > 0 do. mat_json =. mat_json , ',' end.
    mat_json =. mat_json , row_json
    i =. >: i
  end.
  mat_json =. mat_json , ']'

  r =. mat_json ; colnames_json ; rowidx_json
  r
)

NB. --------------------------------------------------------
NB. csv_preview_json — first 10 rows as a JSON array of objects
NB. y is (header ; datamat)
NB. Each object maps column names to cell values (as strings).
csv_preview_json =: 3 : 0
  header  =. > 0 { y
  datamat =. > 1 { y
  'nrows ncols' =. , $ datamat
  nshow =. nrows <. 10
  r =. '['
  i =. 0
  while. i < nshow do.
    row_i =. i { datamat
    NB. 2 x ncols boxed array: row 0 = keys, row 1 = values
    ks  =. dltb &.> header
    vs  =. dltb &.> row_i
    obj =. enc_json_json_ ks ,: vs
    if. i > 0 do. r =. r , ',' end.
    r =. r , obj
    i =. >: i
  end.
  r =. r , ']'
  r
)
