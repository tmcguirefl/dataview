# Vocabulary/pdot - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/pdotdot "Vocabulary/pdotdot") [<<](https://code.jsoftware.com/wiki/Vocabulary/odot "Vocabulary/odot")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/dpdot.htm "jdic:dpdot")

<table class="wikitable"><tbody><tr><td><tt>p. y</tt></td><td>Roots</td></tr></tbody></table>

[Rank 1](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank1l "Vocabulary/RankInfo") _\-- operates on lists of y, producing a list for each one --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Converts the polynomial y between _coefficient_ and _multiplier-and-roots_ form.

**Example:** The roots of _2y<sup>2</sup> - 16y + 30 = 2(y-5)(y-3) = 0_ are 5 and 3

```
   c=: 30 \_16 2       NB. coefficients (in ascending powers)
   \]z=: p. c          NB. coefficients as argument yield roots
+-+---+
|2|5 3|
+-+---+
   p. z               NB. (multiplier and) roots as \[boxed\] argument yield coefficients
30 \_16 2

```

The _coefficient form_ of a polynomial is the [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") of coefficients of **ascending** powers of _y_ representing the polynomial _c<sub>0</sub>+c<sub>1</sub>y<sup>1</sup>\+ ... +c<sub>n</sub>y<sup>n</sup>_

30 \_16 2 ↔ _30 - 16y + 2y<sup>2</sup>_

The _multiplier-and-roots form_ of a polynomial is a [two-atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") [boxed](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boxed "Vocabulary/Glossary") [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET")  m;r representing the polynomial _m(y-r<sub>0</sub>)(y-r<sub>1</sub>)...(y-r<sub>n</sub>)_

2;5 3 ↔ _2(y-5)(y-3)_

---

### Common uses

1\. Solve a polynomial equation whose right side is 0 (the solutions are the roots).

2\. Convert a polynomial into its different forms.

---

### More Information

1\. y may also be in _exponent form_, which is a [singleton](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Singleton "Vocabulary/Glossary") [box](https://code.jsoftware.com/wiki/Vocabulary/AET#Box "Vocabulary/AET") (either an atom or a 1-atom list) containing a [table.](https://code.jsoftware.com/wiki/Vocabulary/AET#Table "Vocabulary/AET") Each row of the table is a 2-atom list c,n representing the term _cy<sup>n</sup>_ (c is the coefficient, n the nonnegative integer exponent).

If y is in exponent form, p. y produces the corresponding coefficient form.

```
   \]p =. <\_2 \]\\ \_16 1 2 2 30 0  NB. three (c,n) pairs; order of powers doesn't matter
+-----+
|\_16 1|
|  2 2|
| 30 0|
+-----+
   p. p
30 \_16 2

```
---

### Details

1\. If y is a single [boxed](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boxed "Vocabulary/Glossary") [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") containing a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET"), it is assumed to be roots with an omitted multiplier of 1:

```
   \]z=. < -: 1&(+,-) %:5      NB. roots \[Phi,-phi\]
+-----------------+
|1.61803 \_0.618034|
+-----------------+
   p. z
\_1 \_1 1

```

2\. If in exponent form powers appear repeated, the last occurring (c,n) pair for that power is used:

```
   \]p =. < \_16 1 ,99 2 ,30 0 ,:2 2
+-----+
|\_16 1|
| 99 2|
| 30 0|
|  2 2|
+-----+
   p. p
30 \_16 2

```
---

<table class="wikitable"><tbody><tr><td><tt>x p. y</tt></td><td>Polynomial</td></tr></tbody></table>

[Rank 1 0](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank10 "Vocabulary/RankInfo") _\-- operates on lists of x, and individual atoms of y --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Evaluates polynomial x for given value(s) of y.

[Argument](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET") x can be in [_coefficient_](#coefficient), [_multiplier-and-roots_](#mandroots), [_exponent_](#exponent), or [_multinomial_](#multinomial) form.

Remember, the powers of _y_ in coefficient form are in **ascending order**.

**Example:** The roots of _2y<sup>2</sup> - 16y + 30 = 2(y-5)(y-3) = 0_ are 5 and 3

See [above](#monadic) for conversion of this polynomial between forms

```
   y=: i. 6
   30 \_16 2 p. y                 NB. coefficient form
30 16 6 0 \_2 0
   (2;5 3) p. y                  NB. m&r form
30 16 6 0 \_2 0
   (<\_2 \]\\ 2 2 \_16 1 30 0) p. y  NB. exponent form
30 16 6 0 \_2 0

```
---

### Common uses

1\. The usual ways to evaluate a polynomial

```
   c=: 15 \_8 1             NB. coefficients for case: multiplier 1, roots 5 and 3
   y=: i. 9                NB. range \[0..8\]

   y,:(c p. y)             NB. the 'short' way
 0 1 2 3  4 5 6 7  8
15 8 3 0 \_1 0 3 8 15
   +/"1 c \*"1 y^/i.#c      NB. the 'long' way
15 8 3 0 \_1 0 3 8 15
   y #.("0 1) |. c         NB. the 'tricky' way, useful if the coefficients are in descending exponent order
15 8 3 0 \_1 0 3 8 15

```
---

[Base](https://code.jsoftware.com/wiki/Vocabulary/numberdot#dyadic "Vocabulary/numberdot") (x #. y)

---

### More Information

1\. _Multinomial form_ is an extension of [exponent form](#exponent) to multiple independent variables.

[Argument](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET") x is a [singleton](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Singleton "Vocabulary/Glossary") [box](https://code.jsoftware.com/wiki/Vocabulary/AET#Box "Vocabulary/AET") containing a [table.](https://code.jsoftware.com/wiki/Vocabulary/AET#Table "Vocabulary/AET") Each row of the table is a list c,e0,e1... representing the term (_cy<sub>0</sub><sup>e0</sup>y<sub>1</sub><sup>e1</sup>..._) (c is the coefficient, e the exponents). The result is the sum of the terms.

When x is in multinomial form, y must be a [boxed](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boxed "Vocabulary/Glossary") [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") of _y<sub>0</sub>, y<sub>1</sub>, ..._ with one [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") for each e\-column of the [table](https://code.jsoftware.com/wiki/Vocabulary/AET#Table "Vocabulary/AET")  >x .

```
   \]multi =: <4 3 1,:5 0 2  NB. 4(x^3)y + 5y^2
+-----+
|4 3 1|
|5 0 2|
+-----+
   \]pts=. \_1 \_1; 0 0; 1 1; 1 \_1; \_1 1; 0 1; 1 0; 2 2
+-----+---+---+----+----+---+---+---+
|\_1 \_1|0 0|1 1|1 \_1|\_1 1|0 1|1 0|2 2|
+-----+---+---+----+----+---+---+---+
   multi p. pts             NB. Evaluate each point
9 0 9 1 1 5 0 84

   \]multi2 =: <3 2 1,5 1 2,:1 0 3  NB. 3(x^2)y + 5xy^2 + y^3
+-----+
|3 2 1|
|5 1 2|
|1 0 3|
+-----+
   multi2 p. pts
\_9 0 9 1 \_1 1 0 72
   multi2 p. 0 0;2 2;1 3;1 2;3 1;4 4
0 72 81 34 43 576

```

2\. Formally, (x p. y) is (+/x \* y^ i.#x)

3\. The form (x p.!.n y) gives the **Stope polynomial** (+/x \* y^!.n i.#x)

### Details

1\. When x is in multinomial form, the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") is (|:c) +/ .\* e \*/ .(^~) >y. If  >y is an [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") it is treated as a [1-atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET").

2\. Boolean x and y are always promoted to floating-point (see exception below). For an alternative, see [x #. y](https://code.jsoftware.com/wiki/Vocabulary/numberdot#dyadic "Vocabulary/numberdot").

3\. If x is integer and y is singleton integer, the result is an integer (except in case of overflow)

---
