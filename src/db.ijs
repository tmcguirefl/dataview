NB. db.ijs — SQLite persistence for ModelScope-J
NB. API summary:
NB.   db_open ''          open (or create) the database, run ensureSchema
NB.   db_close ''         disconnect
NB.   db_getuser y        SELECT user row WHERE username=y  -> boxed row or ''
NB.   db_getuserbyid y    SELECT user row WHERE id=y        -> boxed row or ''
NB.   db_insertuser y     INSERT user, y is name;pwhash;salt -> new id or _1
NB.   db_settoken y       UPDATE session_token WHERE id=y0, token=y1
NB.   db_userbytoken y    SELECT user row WHERE session_token=y -> boxed row or ''
NB.   db_cleartoken y     UPDATE session_token=NULL WHERE id=y
NB.
NB. All queries use sql_esc for safe literal embedding (no ddparm — ddparm
NB. has a complex argument format and ddsql/ddsel cover our needs fine).
NB. ddfet returns boxed rank-2 array (nrows × ncols); rows are retrieved
NB. via {. rows (first row) which is an 8-element boxed vector.
NB. GOTCHA: always assign # rows to a variable before testing — lazy eval
NB.         of ddfet result can hang inside if. 0 = # rows do. ...

cocurrent 'jhs'

require 'data/ddsqlite'
setzlocale_jddsqlite_ ''

NB. Global connection handle — set by db_open
DB =: _1

NB. Path to database file (relative to working directory when server starts)
DB_PATH =: 'data/modelscope.db'

NB. --------------------------------------------------------
NB. db_open — opens or creates the database
db_open =: 3 : 0
  DB =: ddcon 'database=', DB_PATH, ';nocreate=0'
  if. _1 = DB do.
    echo 'FATAL: cannot open database: ', DB_PATH
    exit''
  end.
  echo 'db: opened ', DB_PATH
  db_ensure_schema''
)

NB. db_close — disconnect
db_close =: 3 : 0
  if. _1 ~: DB do. dddis__DB'' end.
  DB =: _1
)

NB. --------------------------------------------------------
NB. db_ensure_schema — CREATE TABLE IF NOT EXISTS for all tables
NB. GOTCHA: avoid embedded SQL DEFAULT '' — J quote escaping is error-prone.
NB.         Use nullable columns with no DEFAULT for optional text fields.
db_ensure_schema =: 3 : 0
  sql =. 'CREATE TABLE IF NOT EXISTS users'
  sql =. sql , ' (id INTEGER PRIMARY KEY AUTOINCREMENT'
  sql =. sql , ' ,username TEXT UNIQUE NOT NULL'
  sql =. sql , ' ,pwhash TEXT NOT NULL'
  sql =. sql , ' ,salt TEXT NOT NULL'
  sql =. sql , ' ,session_token TEXT'
  sql =. sql , ' ,displayname TEXT'
  sql =. sql , ' ,email TEXT'
  sql =. sql , ' ,created_at TEXT DEFAULT (datetime(''now'')))'
  rc =. DB ddsql~ sql
  if. 0 ~: rc do. echo 'WARN: create users table rc=' , ": rc end.

  sql =. 'CREATE TABLE IF NOT EXISTS datasets'
  sql =. sql , ' (id INTEGER PRIMARY KEY AUTOINCREMENT'
  sql =. sql , ' ,user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE'
  sql =. sql , ' ,name TEXT NOT NULL'
  sql =. sql , ' ,notes TEXT'
  sql =. sql , ' ,tags TEXT'
  sql =. sql , ' ,is_favorite INTEGER DEFAULT 0'
  sql =. sql , ' ,row_count INTEGER DEFAULT 0'
  sql =. sql , ' ,col_count INTEGER DEFAULT 0'
  sql =. sql , ' ,quant_cols TEXT'
  sql =. sql , ' ,cat_cols TEXT'
  sql =. sql , ' ,all_cols TEXT'
  sql =. sql , ' ,raw_data TEXT'
  sql =. sql , ' ,row_metadata TEXT'
  sql =. sql , ' ,quality_report TEXT'
  sql =. sql , ' ,preview_data TEXT'
  sql =. sql , ' ,upload_ts TEXT DEFAULT (datetime(''now'')))'
  rc =. DB ddsql~ sql
  if. 0 ~: rc do. echo 'WARN: create datasets table rc=' , ": rc end.

  sql =. 'CREATE TABLE IF NOT EXISTS pca_runs'
  sql =. sql , ' (id INTEGER PRIMARY KEY AUTOINCREMENT'
  sql =. sql , ' ,dataset_id INTEGER NOT NULL REFERENCES datasets(id) ON DELETE CASCADE'
  sql =. sql , ' ,notes TEXT'
  sql =. sql , ' ,is_pinned INTEGER DEFAULT 0'
  sql =. sql , ' ,n_components INTEGER NOT NULL'
  sql =. sql , ' ,explained_var TEXT'
  sql =. sql , ' ,all_ev TEXT'
  sql =. sql , ' ,loadings TEXT'
  sql =. sql , ' ,transformed TEXT'
  sql =. sql , ' ,col_names TEXT'
  sql =. sql , ' ,n_samples INTEGER DEFAULT 0'
  sql =. sql , ' ,preproc_opts TEXT'
  sql =. sql , ' ,preproc_report TEXT'
  sql =. sql , ' ,row_indexes TEXT'
  sql =. sql , ' ,created_at TEXT DEFAULT (datetime(''now'')))'
  rc =. DB ddsql~ sql
  if. 0 ~: rc do. echo 'WARN: create pca_runs table rc=' , ": rc end.

  echo 'db: schema ready'
)

NB. --------------------------------------------------------
NB. sql_esc — escape a string for embedding in a SQL single-quoted literal
NB. doubles each single-quote character; result is safe to embed between ' ... '
sql_esc =: 3 : 0
  r =. ''
  i =. 0
  while. i < # y do.
    c =. i { y
    if. c -: '''' do. r =. r , '''' end.
    r =. r , c
    i =. >: i
  end.
  r
)

NB. --------------------------------------------------------
NB. db_row_or_empty — fetch all rows from statement handle, return first boxed row or ''
NB. GOTCHA: assign # rows to variable before testing — avoids lazy-eval hang
db_row_or_empty =: 3 : 0
  rows =. ddfet y , _1
  nrows =. # rows
  if. 0 = nrows do.
    r =. ''
    return.
  end.
  r =. {. rows
  r
)

NB. --------------------------------------------------------
NB. db_getuser — fetch user row by username
NB. returns boxed 8-element row (id;username;pwhash;salt;token;displayname;email;created_at)
NB. or '' if not found
db_getuser =: 3 : 0
  r =. ''
  sql =. 'SELECT id,username,pwhash,salt,session_token,displayname,email,created_at FROM users WHERE username='''
  sql =. sql , (sql_esc dltb y) , ''''
  sh =. DB ddsel~ sql
  if. _1 = sh do. r return. end.
  r =. db_row_or_empty sh
  r
)

NB. db_getuserbyid — fetch user row by id
db_getuserbyid =: 3 : 0
  r =. ''
  sql =. 'SELECT id,username,pwhash,salt,session_token,displayname,email,created_at FROM users WHERE id='
  sql =. sql , (": y)
  sh =. DB ddsel~ sql
  if. _1 = sh do. r return. end.
  r =. db_row_or_empty sh
  r
)

NB. db_insertuser — insert new user, return new rowid or _1 on error
NB. y is (username ; pwhash ; salt) boxed list
db_insertuser =: 3 : 0
  r =. _1
  'uname pw salt' =. y
  sql =. 'INSERT INTO users (username, pwhash, salt) VALUES ('''
  sql =. sql , (sql_esc dltb uname) , ''','''
  sql =. sql , (sql_esc dltb pw) , ''','''
  sql =. sql , (sql_esc dltb salt) , ''')'
  rc =. DB ddsql~ sql
  if. 0 ~: rc do. r return. end.
  NB. fetch the new rowid
  sh =. DB ddsel~ 'SELECT last_insert_rowid()'
  if. _1 = sh do. r return. end.
  rows =. ddfet sh , _1
  nrows =. # rows
  if. 0 = nrows do. r return. end.
  r =. > > {. rows
  r
)

NB. db_settoken — store session token for user id
NB. y is (userid ; token) boxed pair
db_settoken =: 3 : 0
  'uid tok' =. y
  sql =. 'UPDATE users SET session_token=''' , (sql_esc dltb tok) , ''' WHERE id=' , (": uid)
  DB ddsql~ sql
  i. 0
)

NB. db_userbytoken — fetch user row by session token
NB. returns boxed row or '' if not found / token is empty
db_userbytoken =: 3 : 0
  r =. ''
  if. 0 = # dltb y do. r return. end.
  sql =. 'SELECT id,username,pwhash,salt,session_token,displayname,email,created_at FROM users WHERE session_token='''
  sql =. sql , (sql_esc dltb y) , ''''
  sh =. DB ddsel~ sql
  if. _1 = sh do. r return. end.
  r =. db_row_or_empty sh
  r
)

NB. db_cleartoken — clear session token for user id
db_cleartoken =: 3 : 0
  sql =. 'UPDATE users SET session_token=NULL WHERE id=' , (": y)
  DB ddsql~ sql
  i. 0
)
