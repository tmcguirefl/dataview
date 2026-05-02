NB. csv_util.ijs — CSV parsing, type detection, and quality reporting
NB. API summary:
NB.   csv_parse y           parse CSV text -> header (boxed);data (boxed matrix)
NB.   csv_detect_types y    y is boxed data matrix -> 'q' or 'c' per column
NB.   csv_quality_report y  y is header;data;types -> quality JSON string
NB.   csv_to_json_matrix y  y is header;data;types -> numeric matrix JSON string
NB.   csv_preview_json y    y is header;data -> first 10 rows JSON string
NB.
NB. CSV upload in JHS uses textarea: user pastes CSV text, getv retrieves it
NB. URL-decoded. No multipart parsing needed.

cocurrent 'jhs'

NB. --------------------------------------------------------
NB. csv_split_line — split a single CSV line on commas (no quoted-field handling
NB. for now; production CSV with embedded commas should use tables/csv readcsv).
NB. Returns boxed list of trimmed field strings.
csv_split_line =: 3 : 0
  parts =. ',' cut y
  r =. dltb &.> parts
  r
)

NB. --------------------------------------------------------
NB. csv_parse — parse full CSV text (LF or CR+LF line endings)
NB. Returns header (boxed row vector) ; data (boxed nrows x ncols matrix)
NB. Empty lines are skipped. Rows with wrong column count are dropped.
csv_parse =: 3 : 0
  NB. normalise line endings
  txt   =. y rplc (CRLF);LF
  lines =. LF cut txt
  NB. drop empty lines
  lens  =. # &.> lines
  lines =. (0 < &> lens) # lines
  if. 1 > # lines do.
    r =. (0$<'') ; (0 2 $ <'')
    return.
  end.
  header  =. csv_split_line > {. lines
  ncols   =. # header
  datalines =. }. lines
  NB. parse each data line into a boxed row
  rows =. csv_split_line &.> datalines
  NB. keep only rows with the right number of columns
  goodmask =. ncols = # &.> rows
  rows =. goodmask # rows
  nrows =. # rows
  if. 0 = nrows do.
    r =. header ; (0, ncols) $ <''
    return.
  end.
  NB. stack rows into a nrows x ncols boxed matrix
  mat =. > rows
  NB. ensure rank-2 even for 1 row
  mat =. (nrows, ncols) $ mat
  r =. header ; mat
  r
)

NB. --------------------------------------------------------
NB. csv_isnumeric — 1 if a string parses as a number (including empty as missing)
csv_isnumeric =: 3 : 0
  s =. dltb y
  if. 0 = # s do. 1 return. end.    NB. empty = missing = treat as numeric
  NB. attempt to parse; ". returns 0$0 on failure in J
  v =. ". s
  r =. 0 < # v
  r
)

NB. --------------------------------------------------------
NB. csv_detect_types — infer column type for each column
NB. y is boxed nrows x ncols data matrix (all strings)
NB. Returns char list: 'q' (quantitative) or 'c' (categorical) per column
csv_detect_types =: 3 : 0
  'nrows ncols' =. , $ y
  if. 0 = nrows do.
    r =. ncols $ 'q'
    return.
  end.
  r =. ''
  j =. 0
  while. j < ncols do.
    col =. ((<a:),(< j)) { y        NB. extract column j as boxed vector
    col =. > &.> col                 NB. unbox each cell
    NB. count numeric-looking cells (ignoring empty)
    n_numeric =. +/ csv_isnumeric &.> col
    NB. if >= 80% of non-empty cells look numeric -> quantitative
    nonempty =. +/ 0 < # &.> (dltb &.> col)
    thresh =. >. 0.8 * (nonempty >. 1)
    if. n_numeric >= thresh do.
      r =. r , 'q'
    else.
      r =. r , 'c'
    end.
    j =. >: j
  end.
  r
)

NB. --------------------------------------------------------
NB. csv_col_missing — count empty/NA cells in a column (boxed string vector)
csv_col_missing =: 3 : 0
  vals =. > &.> y
  +/ 0 = # &.> (dltb &.> vals)
)

NB. --------------------------------------------------------
NB. csv_col_unique — count distinct non-empty values in a column
csv_col_unique =: 3 : 0
  vals =. dltb &.> > &.> y
  nonempty =. (0 < # &.> vals) # vals
  # ~. nonempty
)

NB. --------------------------------------------------------
NB. csv_is_constant — 1 if all non-empty cells in a column have the same value
csv_is_constant =: 3 : 0
  vals =. dltb &.> > &.> y
  nonempty =. (0 < # &.> vals) # vals
  if. 1 > # nonempty do. 1 return. end.
  r =. 1 = # ~. nonempty
  r
)

NB. --------------------------------------------------------
NB. csv_num_to_json — format a number for JSON (replacing J's _ with -)
csv_num_to_json =: 3 : 0
  (": y) rplc '_';'-'
)

NB. --------------------------------------------------------
NB. csv_str_to_json — escape a string for JSON (quotes and backslashes)
csv_str_to_json =: 3 : 0
  s =. dltb y
  s =. s rplc '\';'\\'
  s =. s rplc '"';'\"'
  s =. s rplc (LF);'\n'
  s =. s rplc (CR);'\r'
  '"' , s , '"'
)

NB. --------------------------------------------------------
NB. csv_quality_report — build quality report JSON string
NB. y is header ; data_matrix ; types_string
NB. Returns JSON object string with per-column quality info + summary
csv_quality_report =: 3 : 0
  'header datamat types' =. y
  'nrows ncols' =. , $ datamat
  NB. build per-column array
  cols_json =. '['
  j =. 0
  while. j < ncols do.
    col_hdr  =. dltb > j { header
    col_type =. j { types
    NB. extract column as boxed vector of strings
    if. 0 = nrows do.
      col_vals =. 0 $ <''
    else.
      col_vals =. ((<a:),(< j)) { datamat
    end.
    n_miss    =. csv_col_missing col_vals
    n_unique  =. csv_col_unique  col_vals
    is_const  =. csv_is_constant col_vals
    col_entry =. '{'
    col_entry =. col_entry , '"name":' , (csv_str_to_json col_hdr) , ','
    col_entry =. col_entry , '"type":"' , (1{.col_type) , '",'
    col_entry =. col_entry , '"missing":' , (csv_num_to_json n_miss) , ','
    col_entry =. col_entry , '"unique":' , (csv_num_to_json n_unique) , ','
    col_entry =. col_entry , '"constant":' , (1{'false','true'{~is_const) , '}'
    if. j < <: ncols do.
      cols_json =. cols_json , col_entry , ','
    else.
      cols_json =. cols_json , col_entry
    end.
    j =. >: j
  end.
  cols_json =. cols_json , ']'
  n_quant =. +/ 'q' = types
  n_cat   =. +/ 'c' = types
  n_const =. 0
  j =. 0
  while. j < ncols do.
    if. 0 = nrows do.
      col_vals =. 0 $ <''
    else.
      col_vals =. ((<a:),(< j)) { datamat
    end.
    if. csv_is_constant col_vals do. n_const =. >: n_const end.
    j =. >: j
  end.
  r =. '{"rows":' , (csv_num_to_json nrows)
  r =. r , ',"cols":' , (csv_num_to_json ncols)
  r =. r , ',"quant":' , (csv_num_to_json n_quant)
  r =. r , ',"cat":' , (csv_num_to_json n_cat)
  r =. r , ',"constant_cols":' , (csv_num_to_json n_const)
  r =. r , ',"columns":' , cols_json , '}'
  r
)

NB. --------------------------------------------------------
NB. csv_cell_to_num — convert a string cell to a number; NaN sentinel (_) for empty/bad
csv_cell_to_num =: 3 : 0
  s =. dltb y
  if. 0 = # s do. _ return. end.
  v =. ". s
  if. 0 = # v do. _ return. end.
  r =. > {. v
  r
)

NB. --------------------------------------------------------
NB. csv_to_json_matrix — convert numeric columns to a JSON 2D array
NB. y is header ; data_matrix ; types_string
NB. Returns JSON string: [[r0c0,...],...]  (only quantitative columns)
NB. Rows with any _ value in quant cols are omitted as invalid.
NB. Also returns col_names JSON array for the quant columns.
NB. Result is (matrix_json ; colnames_json ; row_indexes_json)
csv_to_json_matrix =: 3 : 0
  'header datamat types' =. y
  'nrows ncols' =. , $ datamat
  NB. identify quantitative column indices
  qidx =. I. 'q' = types
  nq   =. # qidx
  NB. build column names JSON
  qnames =. qidx { > &.> header
  cnames_json =. '['
  k =. 0
  while. k < nq do.
    cnames_json =. cnames_json , (csv_str_to_json dltb > k { qnames)
    if. k < <: nq do. cnames_json =. cnames_json , ',' end.
    k =. >: k
  end.
  cnames_json =. cnames_json , ']'
  NB. build numeric matrix (nrows x nq), mark invalid rows
  mat_json   =. '['
  rowidx_json =. '['
  first_row  =. 1
  i =. 0
  while. i < nrows do.
    NB. extract numeric values for this row
    nums =. csv_cell_to_num &.> (qidx { > &.> ((<i),(<a:)) { datamat)
    NB. skip row if any value is _
    if. 1 e. _ = > &.> nums do.
      i =. >: i
    else.
      row_json =. '['
      k =. 0
      while. k < nq do.
        v =. > k { nums
        row_json =. row_json , (csv_num_to_json v)
        if. k < <: nq do. row_json =. row_json , ',' end.
        k =. >: k
      end.
      row_json =. row_json , ']'
      if. first_row do.
        mat_json    =. mat_json , row_json
        rowidx_json =. rowidx_json , (csv_num_to_json i)
        first_row   =. 0
      else.
        mat_json    =. mat_json , ',' , row_json
        rowidx_json =. rowidx_json , ',' , (csv_num_to_json i)
      end.
      i =. >: i
    end.
  end.
  mat_json    =. mat_json , ']'
  rowidx_json =. rowidx_json , ']'
  r =. mat_json ; cnames_json ; rowidx_json
  r
)

NB. --------------------------------------------------------
NB. csv_preview_json — first 10 rows as a JSON array of objects
NB. y is header ; data_matrix
NB. Returns JSON string: [{"col1":"val1",...},...]
csv_preview_json =: 3 : 0
  'header datamat' =. y
  'nrows ncols' =. , $ datamat
  nshow =. nrows <. 10
  r =. '['
  i =. 0
  while. i < nshow do.
    obj =. '{'
    j =. 0
    while. j < ncols do.
      k =. csv_str_to_json dltb > j { header
      if. 0 = nrows do.
        v =. csv_str_to_json ''
      else.
        v =. csv_str_to_json dltb > ((<i),(< j)) { datamat
      end.
      obj =. obj , k , ':' , v
      if. j < <: ncols do. obj =. obj , ',' end.
      j =. >: j
    end.
    obj =. obj , '}'
    if. i > 0 do. r =. r , ',' end.
    r =. r , obj
    i =. >: i
  end.
  r =. r , ']'
  r
)
