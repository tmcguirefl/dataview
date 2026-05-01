# J Language Cheatsheet (Updated for J9.x)

**Note:** Calculus primitives (`d.`, `D.`, `D:`, `t.`, `t:`, `T.`, etc.) were removed in J9.01 and are no longer available.  
For numeric differentiation, implement finite differences manually or use community addons.

---

## Assignment
```j
x =: y                    NB. global assign value of y to x
x =. y                    NB. local assign value of y to x
'a b c' =: n m w          NB. a =: n, b =: m, c =: w
('a';'b';'c') =: n m w    NB. "
'a b c' =: n;m;w          NB. "
('a';'b';'c') =: n;m;w    NB. "
```

## Logic
```j
x *. y                    NB. x and y
x +. y                    NB. x or y
-. y                      NB. not y
x *: y                    NB. not (x and y)
x +: y                    NB. not (x or y)
x -: y                    NB. x matches y (identical, atomic result)
x = y                     NB. x equals y (item-wise)
x >: y                    NB. x >= y
x <: y                    NB. x <= y
```

## Number Representation
```j
Yx                        NB. extended integer (bigint)
XeY                       NB. scientific notation [X*10^Y]
XrY                       NB. rational [X/Y, both extended]
XjY                       NB. complex [real=X, imag=Y]
XarY                      NB. complex [magnitude=X, angle-rad=Y]
XadY                      NB. complex [magnitude=X, angle-deg=Y]
XpY                       NB. X * pi^Y
XxY                       NB. X * e^Y
NbDDD.DDD                 NB. base-N literal (a-z for digits >9)
```

## Numerical Math
```j
_                         NB. infinity
__                        NB. negative infinity
_.                        NB. NaN
| y                       NB. magnitude / abs(y)
x | y                     NB. y modulo x
Xx % Yx                   =: XrY   NB. literal x/r forms
x: y                      NB. rational from float y
x:^:_1 y                  NB. float from rational
(2 x: XrY)                =: X Y
x j. y                    NB. complex [real=x, imag=y]
x r. y                    NB. complex [mag=x, angle-rad=y]
+. XjY                    =: x y
*. XjY                    =: (|X) 'ANGLE-RAD'
(128 !: 5) y              NB. is y NaN (_.)
x + y                     NB. add
+ XjY                     =: Xj_Y   NB. conjugate
x - y                     NB. subtract
- y                       NB. negate
x * y                     NB. multiply
* y                       NB. sign / unit complex
*: y                      =: y * y
x % y                     NB. divide (1%0=_, 0%0=0)
% y                       =: 1 % y
+: y                      =: y * 2
-: y                      =: y % 2
x ^ y                     NB. power
^ y                       NB. e^y
x %: y                    =: y ^ %x
%: y                      NB. square root
x ^. y                    NB. log base x
^. y                      NB. natural log
x +. y                    NB. GCD
x *. y                    NB. LCM
x # y                     NB. replicate (x occurrences of y items)
#. y                      NB. binary list → number
#: y                      NB. number → binary list
x #. y                    NB. base-x list → number
x #: y                    NB. number → base-x list
>. y                      NB. ceil
<. y                      NB. floor
x >. y                    NB. max
x <. y                    NB. min
>: y                      =: y + 1
<: y                      =: y - 1
! y                       NB. factorial
x ! y                     NB. binomial (combinations)
? y                       NB. random int [0, y-1]
? 0                       NB. random float [0,1)
x ? y                     NB. x distinct random ints [0,y-1]
o. y                      NB. y * pi
n o. y                    NB. trig/hyperbolic/etc. (n selects function)
q: y                      NB. prime factors
x q: y                    NB. first x exponents of primes of y
p: y                      NB. (y-1)th prime
x p: y                    NB. prime-related functions (x selects)
y p. x                    =: +/ y * x ^ i.#y   NB. polynomial eval
(m, roots) p. x           =: m * */(x - roots)
(<C ,. E) p. x            NB. coeff/exponent pairs
p. y                      NB. roots <-> coeff form (with leading multiplier m)
```

**Note on derivatives:** The lines `x d. n`, `x d. _1`, and `x D. n` have been removed in J9.x.

## Matrices
```j
M1 (+/ . *) M2            NB. matrix product / dot product
u . v                     =: (u @: v)"(1+L,_)   NB. L = left rank of v
(- / . *) M               NB. determinant
R %. M                    NB. solve M U = R
M %. M                    NB. identity (M dot I = M)
%. M                      NB. inverse
```

## Arrays
```j
x $ y                     NB. reshape to shape x
# y                       NB. tally (length of leading axis)
|. y                      NB. reverse
x |. y                    NB. rotate (positive left)
x (|. !. n) y             NB. shift (fill with n)
, y                       NB. ravel (flatten)
x , y                     NB. append
,. y                      NB. ravel items
x ,. y                    NB. stitch
,: y                      NB. laminate (add leading axis of 1)
x ,: y                    NB. two-item table
x { y                     NB. from (index)
x {. y                    NB. take
{. y                      =: 1 {. y
x }. y                    NB. drop
}. y                      =: 1 }. y
{: y                      NB. last
}: y                      NB. all but last
x } y                     NB. amend (merge)
x (n }) y                 NB. amend at n
x (U`V`W) } y             =: (x U y) (x V y) } (x W y)
i. y                      NB. integers 0..(y-1)
x i. y                    NB. index of first occurrence
/: y                      NB. grade up (permutation for ascending sort)
\: y                      NB. grade down
x /: y                    =: (/: y) { x     NB. sort x by y (ascending)
x \: y                    =: (\: y) { x     NB. descending
C. y                      NB. direct ↔ cyclic permutation
x C. y                    NB. apply permutation
(/: x) C. (x C. y)        =: y
A. y                      NB. anagram index from permutation
x A. y                    NB. permutation from anagram index
|: y                      NB. transpose (reverse axes)
x |: y                    NB. transpose according to x
u ;. 0 y                  NB. apply u after full reversal
x u ;. 0 y                NB. cut according to (starts ,: lengths)
u ;. n y                  NB. cut on frets (n controls inclusion/exclusion)
x u ;. n y                NB. fret mask version
x u :. 3 y                NB. tiles (3=include shards, _3=exclude)
;: y                      NB. tokenize J expression
```

## Sparse Arrays
```j
$. y                      NB. dense → sparse
3 $. y                    NB. sparse element default
0 $. y                    NB. sparse → dense (or dense → sparse)
1 $. s;a;z                NB. create sparse (shape;axes;default)
4 $. y                    NB. index matrix of sparse
5 $. y                    NB. values of sparse
```

## Sets
```j
x e. y                    NB. membership
x -. y                    NB. without (set difference, order-preserving)
~. y                      NB. nub (remove duplicates)
~: y                      NB. duplicate sieve
= y                       =: (~. y) =/ y
```

## Trees
```j
{:: y                     NB. paths to leaves
x {:: y                   NB. fetch from tree (path x)
L. y                      NB. max depth (levels)
f L: n y                  NB. apply f at level n (negative from root)
f S: n y                  NB. like L: but flatten result
```

## Box
```j
< y                       NB. box
> y                       NB. open (unbox)
; y                       NB. raze (open all)
x ; y                     NB. link (box x if needed)
```

## Functions (Verbs, Adverbs, Conjunctions)
```j
[ y                       NB. identity (left)
] y                       NB. identity (right)
x [ y                     NB. x
x ] y                     NB. y
n:                        NB. constant noun n (n=-9..9)
y b.                      NB. boolean/bitwise from truth table y
f b. 0                    NB. ranks of f (G L R)
f / y                     NB. insert (reduce)
f`g`h / y                 NB. alternating insert
x f / y                   NB. table
x f /. y                  =: (=x) (u@#) y
x f~ y                    =: y f x          NB. commute
f~ y                      =: y f y          NB. reflexive
g f.                      NB. fix / freeze
f \ y                     NB. prefix scan
n f \ y                   NB. infix
f \. y                    NB. suffix
n f \. y                  NB. outfix
g ^: _1                   NB. inverse
f !. n                    NB. fit / customize
(f &. g) y                =: (g^:_1) f g y
u each y                  =: &.>             NB. each (rebox)
(f & k) y                 =: y f k
(k & f) y                 =: k f y
u every y                 =: &>              NB. each (open)
(f @: g) y                =: f (g y)
x (f @: g) y              =: f (x g y)
(f &: g) y                =: f (g y)
x (f &: g) y              =: (g x) f (g y)
(f @ g) y                 =: (f @: g)"G y
x (f @ g) y               =: x (f @: g)"LR y
(f & g) y                 =: (f @: g)"G y
x (f & g) y               =: (g x)(f"(G,G))(g y)
(f g) y                   =: y f (g y)       NB. hook
x (f g) y                 =: x f (g y)
(f g h) y                 =: (f y) g (h y)   NB. fork
x (f g h) y               =: (x f y) g (x h y)
[: f g                    =: f @: g
f`g`h                     NB. gerund
f`g`h`:6                  =: (f g h)
(1 { f`g`h)`:6            =: g
u0`u1`...`un @. t y       NB. agenda (select by t y)
u`v`w @. y                =: (y { u`v`w)`:6
u`v`w`:0 y                =: (u y),(v y),(w y)
$:                        NB. self-reference (recursion)
(f ^: n) y                NB. power (n applications)
(f ^: _) y                NB. until fixed point
(f ^: g) y                =: f ^: (g y) y
(f ^: g ^: _) y           NB. while g(y); y =: f(y)
(u ^: (v1`v2)) y          =: u ^: (v1 y) (v2 y)   NB. "for"
```

**Explicit definitions:**
```j
1 : BODY                  NB. adverb
2 : BODY                  NB. conjunction
3 : BODY                  NB. monad/dyad (ambivalent)
4 : BODY                  NB. dyad
13 : BODY                 NB. tacit from explicit (single line)
verb define ... )         NB. multiline
```

## Misc
```j
_                         NB. infinity
i. 0 0                    NB. empty (convention)
type 'N'                  NB. part of speech
datatype y                NB. data type
s: y                      NB. symbol / symbol table
". y                      NB. do (execute)
7!:5 <'N'                 NB. size of named object
x I. y                    NB. interval index
```

## Representation
```j
": y                      NB. format to string
x ": y                    NB. formatted (width.precision)
x 8 !: y                  NB. extended formatting
9!:6 ''                   NB. box drawing chars
9!:7 y                    NB. set box drawing
9!:3 y                    NB. representation style
5!:n <'y'                 NB. atomic representation
y 5!:0                    NB. inverse (restore)
```

## Locales
```j
N_L_ =: value             NB. define in locale L
N__y =: value             NB. in locale named by y
N =: value                NB. current locale
(0 !: 0) <'f.ijs'         NB. load script
names ''                  NB. names in current locale
nl ''                     NB. boxed names
erase <'L'                NB. erase
coname ''                 NB. current locale name
cocurrent 'L'             NB. switch locale
conl 0                    NB. all locale names
copath 'L'                NB. path
y copath 'L'              NB. set path
coerase 'L'               NB. destroy
```

## Object-Oriented Programming
```j
coclass 'L'               NB. define class
coinsert 'L'              NB. inherit
conew 'L'                 NB. create object
codestroy_L_ ''           NB. destroy (usually in destroy method)

NB. Typical class creation:
coclass 'ClsName'
create =: 3 : '...'       NB. constructor
some_method =: +
destroy =: codestroy
cocurrent 'base'          NB. return to base
obj =: x conew 'ClsName'  NB. instantiate
x some_method__obj y      NB. call method
destroy__obj ''
```

## Scripts
```j
jpath '~user'             NB. user directory
load 'f1.ijs'             NB. load (private =.)
loadd 'f1.ijs'            NB. load + display
require 'f1.ijs'          NB. load if needed
0!:0 <'f1.ijs'            NB. low-level load
4!:3 ''                   NB. loaded scripts
4!:4 <'N'                 NB. script index for name N
```

## Binary Data (Serialization)
```j
3!:1 y                    NB. noun → J binary
3!:2 y                    NB. J binary → noun
2&(3!:5) y                NB. float → 8 bytes
_2&(3!:5) y               NB. 8 bytes → float
...                       NB. (similar for 4-byte, ints 2/4/8-byte, signed/unsigned)
```

## Unicode
```j
u: y                      NB. to unicode
4&u: y                    NB. int → unicode
8&u: y                    NB. unicode → UTF-8
7&u: y                    NB. UTF-8 → unicode
3&u: y                    NB. code points
```

## Files
```j
s fwrite 'P'              NB. write
fread 'P'                 NB. read
s fappend 'P'             NB. append
fread 'P';B;L             NB. partial read
s fwrites 'P'             NB. write text (platform line ends)
freads 'P'                NB. read text
fexist 'P'                NB. exists?
ferase 'P'                NB. delete
x (1!:2) <'P'             NB. low-level write
(1!:1) <'P'               NB. low-level read
smoutput y                NB. stdout
x (1!:2) 2                NB. stdout low-level
(1!:1) 1                  NB. stdin
```

## Error Handling
```j
assert. y                 NB. (explicit only)
(9!:34)''                 NB. assertions enabled?
(9!:35) y                 NB. enable/disable assertions
try. B1 catch. B2 end.    NB. try/catch (explicit)
(f :: g) y                NB. f or g on failure
(13!:0) 1                 NB. suspend on error
(13!:12)''                NB. error message
(13!:13)''                NB. stack trace (suspend mode)
```

## Performance
```j
6!:2 y                    NB. time execution of y (string)
x 6!:2 y                  NB. average over x runs
load 'jpm'                NB. profiler
start_jpm_ ''             NB. start
showdetail_jpm_ 'F'       NB. details for F
```

## Control Structures (explicit definitions)
```j
if. T do. B1 else. B2 end.
if. T1 do. B1 elseif. T2 do. B2 elseif. 1 do. B3 end.

select. n
case. n1 do. B1
case. n2;n3 do. B2
case. do. B3
end.

while. T do. B end.
whilst. T do. B end.      NB. =: (B; while. T do. B end.)

for. A do. B end.         NB. #A times
for_elem. A do. B end.    NB. elem and elem_index in scope

return.                   NB. short-circuit with last value
```

## Parsing / Evaluation Rules
(See original for full mark/edge/asgn/vn/cavn rules, bidents, scope notes — unchanged in J9.x.)

---
