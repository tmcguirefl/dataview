# Vocabulary/xco - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/hook "Vocabulary/hook") [<<](https://code.jsoftware.com/wiki/Vocabulary/uco "Vocabulary/uco")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/dxco.htm "jdic:dxco")

<table class="wikitable"><tbody><tr><td><tt>x: y</tt></td><td>Extended Precision</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank "Vocabulary/RankInfo") _\-- operates on x and y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Converts [number](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Number "Vocabulary/Glossary") y to _extended precision_, either [extended integer](https://code.jsoftware.com/wiki/Vocabulary/Glossary#ExtendedInteger "Vocabulary/Glossary") or [rational](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Rational "Vocabulary/Glossary").

If y has [integer](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Integer "Vocabulary/Glossary") [precision](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Precision "Vocabulary/Glossary"), the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") is an [extended integer](https://code.jsoftware.com/wiki/Vocabulary/Glossary#ExtendedInteger "Vocabulary/Glossary").

```
   \]z=: x: 99
99
   datatype z
extended

```

If y has [floating-point](https://code.jsoftware.com/wiki/Vocabulary/Glossary#FloatingPoint "Vocabulary/Glossary") [precision](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Precision "Vocabulary/Glossary"), the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") is a [rational](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Rational "Vocabulary/Glossary"), of which both the numerator and denominator are [extended integers](https://code.jsoftware.com/wiki/Vocabulary/Glossary#ExtendedInteger "Vocabulary/Glossary").

```
   x: 0.33333333333
33333330575r99999991726
   x: 0.333333333333
1r3

```

x:^:\_1, the inverse of x:, converts an extended precision number to a fixed precision ([Boolean](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boolean "Vocabulary/Glossary"), [integer](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Integer "Vocabulary/Glossary"), or [floating-point](https://code.jsoftware.com/wiki/Vocabulary/Glossary#FloatingPoint "Vocabulary/Glossary") as appropriate)

```
   3!:0 x:^:\_1 \] 1r2 + 1r2   NB. 1 becomes Boolean
1
   3!:0 x:^:\_1 \] 1r2 + 2r2   NB. 1/2 becomes floating-point
8
   3!:0 x:^:\_1 \] 1r2 + 3r2   NB. 2 becomes integer
4

```

However you may find: [dyadic x:](#dyadic) more convenient than x:^:\_1

---

### Common uses

1\. Avoid rounding errors in arithmetic with large numbers

```
   \] z=: 2^64
1.84467e19
   z -: 1+z          NB. rounding error loses the increment
1

   \] zxco=: (x:2)^64
18446744073709551616
   1+zxco            NB. no rounding error to lose the increment
18446744073709551617

   \] zx=: 2x ^ 64    NB. x-notation produces an identical number
18446744073709551616
   1+zx
18446744073709551617

   datatype each z ; zx ; zxco
+--------+--------+--------+
|floating|extended|extended|
+--------+--------+--------+

```

2\. Explore the numerology of pi

```
   dpi=: \[: ": \[: <.@o. 10 ^ \[: x: <:   NB. Digits of pi (as a string)

   \] z=: dpi 770
3141592653589793238462643383279502884197169399375105820974944592307816406286208998628034825342117067982148086513282306647093844609550582231725359408128481117450284102701938521105559644622948954930381964428810975665933446128475648233786783165271201909145648...

   $$ pi=: ". 'x',~z   NB. Digits of pi as a large number
0
   >. 10 ^. pi         NB. (Next highest power of 10) > pi
770
   \_50\]\\z              NB. z in rows of 50 atoms/column
31415926535897932384626433832795028841971693993751
05820974944592307816406286208998628034825342117067
98214808651328230664709384460955058223172535940812
84811174502841027019385211055596446229489549303819
64428810975665933446128475648233786783165271201909
14564856692346034861045432664821339360726024914127
37245870066063155881748815209209628292540917153643
67892590360011330530548820466521384146951941511609
43305727036575959195309218611738193261179310511854
80744623799627495673518857527248912279381830119491
29833673362440656643086021394946395224737190702179
86094370277053921717629317675238467481846766940513
20005681271452635608277857713427577896091736371787
21468440901224953430146549585371050792279689258923
54201995611212902196086403441815981362977477130996
05187072113499999983

```

**NOTE:** The six 9s near the end, starting at 762{z are not a bug, but an expected random occurrence. 762{z is known as the _Feynman Point_. See Chapter 17 of [At Play With J](https://code.jsoftware.com/wiki/Doc/Articles/Play151 "Doc/Articles/Play151") by Eugene E. McDonnell.

---

### More information

1\. Conversion to [rational](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Rational "Vocabulary/Glossary") precision uses [tolerant comparison](https://code.jsoftware.com/wiki/Vocabulary/Glossary#TolerantComp "Vocabulary/Glossary").

Use [Fit](https://code.jsoftware.com/wiki/Vocabulary/bangdot "Vocabulary/bangdot") (x:!.0) for an exact result.

```
   x: \]5 ^~ 1%3
1r243
   x:!.0 \]5 ^~ 1%3
37066663599757r9007199254740992

```
---

<table class="wikitable"><tbody><tr><td><tt>x x: y</tt></td><td>Num/Denom</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank "Vocabulary/RankInfo") _\-- operates on x and y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Converts a [number](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Number "Vocabulary/Glossary") y **of any precision** to a precision chosen by [argument](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET") x

```
   \]z=: 2 x: 1r3
1 3
   datatype z     NB. …maybe not what you expect
extended

```

**NOTE:** Rational numerals such as 2r6 **are cancelled out** as soon as they are interpreted

```
   2r6
1r3
   2 x: 2r6
1 3

```

[Dyad](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Dyad "Vocabulary/Glossary") x: is actually a collection of assorted functions for [extended precision](https://code.jsoftware.com/wiki/Vocabulary/Glossary#ExtendedInteger "Vocabulary/Glossary") conversion, the function being chosen by the value of x

<table class="wikitable"><tbody><tr><td><b><tt>x</tt></b></td><td><b>What it does</b></td><td><b>Precision of <tt>y</tt></b></td><td><b>Result <tt>x x: y</tt></b></td></tr><tr><td>1</td><td>Convert to extended precision</td><td>any</td><td>same as <tt>x: y</tt><br>Result is extended integer or rational, as appropriate.</td></tr><tr><td>_1</td><td>Convert to fixed precision</td><td>any</td><td>same as <tt>x:^:_1 y</tt>, the <a title="Vocabulary/Glossary" href="/wiki/Vocabulary/Glossary#Inverse">inverse</a> of <tt>x: y</tt><br>Result is Boolean, integer, or floating point, as appropriate.</td></tr><tr><td>2</td><td>Convert to numerator,denominator form</td><td>any</td><td>2-atom list of (<tt>numerator;denominator</tt>)<br>Result has extended precision.</td></tr><tr><td rowspan="2">_2</td><td rowspan="2">Convert from numerator,denominator form</td><td>fixed</td><td>Same as <tt>%/"1 y</tt><br>Result has floating precision.</td></tr><tr><td>extended</td><td>Same as <tt>%/"1 y</tt><br>Result has extended precision.</td></tr></tbody></table>

---

### Common uses

1\. Convert _extended_ or _rational_ to _floating_

```
   \_1 x: 1r3
0.333333

```

2\. Convert _rational_ to 2-list: (numerator;denominator)

```
   2 x: 1r3
1 3

```

3\. Convert a number-pair (2-list) y of the form: (a,b) to the number  a%b

```
   \_2 x: 1 3
0.333333
   \_2 x: 1 3x     NB. HINT for rational result make y extended precision
1r3

```

Convert a table of number-pairs y likewise

```
   \] y=: 3 2$ 1 3 1 5 1 10
1  3
1  5
1 10
   \_2 x: y
0.333333 0.2 0.1
   \_2 x:  x: y
1r3 1r5 1r10

```
---

### More Information

1\. Conversion to [rational](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Rational "Vocabulary/Glossary") precision uses [tolerant comparison](https://code.jsoftware.com/wiki/Vocabulary/Glossary#TolerantComp "Vocabulary/Glossary").

Use [Fit](https://code.jsoftware.com/wiki/Vocabulary/bangdot "Vocabulary/bangdot") (x:!.0) for an exact result

```
  2  x: \]5 ^~ 1%3
1 243
  2  x:!.0 \]5 ^~ 1%3
37066663599757 9007199254740992

```
---
