NB. auth.ijs — password hashing and session token management
NB. API summary:
NB.   auth_hashpw y         hash password string -> salt;pwhash (both 40-char hex)
NB.   auth_checkpw y        y is (plaintext;storedHash;storedSalt) -> 1 or 0
NB.   auth_maketoken ''     generate 40-char random hex session token
NB.   auth_getuid y         validate token string -> userid (integer) or _1

cocurrent 'jhs'

NB. --------------------------------------------------------
NB. Hex encoding helpers

NB. hex_encode — convert integer vector (0-255) to lowercase hex string
hex_encode =: 3 : 0
  hc =. '0123456789abcdef'
  hi =. <. y % 16
  lo =. 16 | y
  r =. , hc {~ , hi ,. lo
  r
)

NB. --------------------------------------------------------
NB. auth_hashpw — hash a plaintext password
NB. returns (salt ; pwhash) where both are 40-char hex strings
NB. uses SHA-1 (128!:6) with a random 20-byte salt
auth_hashpw =: 3 : 0
  salt    =. hex_encode 20 ? 256
  pwhash  =. 128!:6 salt , y
  salt ; pwhash
)

NB. auth_checkpw — verify a plaintext password against stored hash+salt
NB. y is (plaintext ; storedHash ; storedSalt)
auth_checkpw =: 3 : 0
  'plain stored salt' =. y
  candidate =. 128!:6 (dltb salt) , (dltb plain)
  r =. (dltb stored) -: candidate
  r
)

NB. --------------------------------------------------------
NB. auth_maketoken — generate a 40-char random hex session token
auth_maketoken =: 3 : 0
  r =. hex_encode 20 ? 256
  r
)

NB. --------------------------------------------------------
NB. auth_getuid — validate a token string, return user id or _1
NB. Looks up the token in the database via db_userbytoken
auth_getuid =: 3 : 0
  r =. _1
  tok =. dltb y
  if. 40 ~: # tok do. r return. end.
  row =. db_userbytoken_jhs_ tok
  if. 0 = # row do. r return. end.
  r =. > > {. row     NB. first column is id
  r
)

NB. --------------------------------------------------------
NB. auth_getuid_fromheader — extract Bearer token from Authorization header
NB. returns user id or _1
auth_getuid_fromheader =: 3 : 0
  r =. _1
  hdr =. dltb gethv 'Authorization:'
  if. 0 = # hdr do. r return. end.
  if. -. 'Bearer ' -: 7 {. hdr do. r return. end.
  tok =. dltb 7 }. hdr
  r =. auth_getuid tok
  r
)
