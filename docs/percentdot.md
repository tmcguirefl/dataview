# Vocabulary/percentdot - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/percentco "Vocabulary/percentco") [<<](https://code.jsoftware.com/wiki/Vocabulary/percent "Vocabulary/percent")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d131.htm "jdic:d131")

<table class="wikitable"><tbody><tr><td><tt>%. y</tt></td><td>Matrix Inverse</td></tr></tbody></table>

[Rank 2](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank2 "Vocabulary/RankInfo") _\-- operates on tables of y --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---
-   The _inverse matrix_ of square [matrix](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Matrix "Vocabulary/Glossary") y, denoted _y_<sup>\-1</sup>.
-   If y is not square, %. y is the _left inverse_ of y, defined below.
```
   \]P=: 0 0 1 , 1 0 0 ,: 0 1 0   NB. permutation matrix
0 0 1
1 0 0
0 1 0
   %. P                          NB. The inverse of P is also a permutation matrix
0 1 0
0 0 1
1 0 0

```
---

### Common Uses

1\. To reverse the effect of a linear transformation.

2\. Given a rotation [matrix](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Matrix "Vocabulary/Glossary"), to form the matrix that rotates in the opposite direction.

```
   sin=: 1&o.
   cos=: 2&o.
   angle=: (o.2) % 12                      NB. 30 degrees, in radians

   \] R=: 2 2$  (cos,-@sin,sin,cos) angle   NB. R: rotate by (angle)
0.866025     \_0.5
     0.5 0.866025

   \] S=: 2 2$  (cos,-@sin,sin,cos) -angle  NB. S: rotate by (-angle)
0.866025      0.5
    \_0.5 0.866025

   S -: %.R                                NB. S is the inverse of R
1
   R -: %.S                                NB. R is the inverse of S
1

```

3\. If y is a [vector](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Vector "Vocabulary/Glossary"), %. y is a vector in the same direction as y but with reciprocal length.

---

[Matrix Product](https://code.jsoftware.com/wiki/Vocabulary/dot "Vocabulary/dot") (x +/ . \* y)

---

### More Information

1\. If the columns of y are dependent, domain error is signaled.

2\. If y is not square, %. y is (in standard mathematical notation) ((_y_\*_y_)<sup>\-1</sup>_y_\*) where _y_\* is the **adjoint** of _y_, that is the _complex conjugate_ of the transpose of _y_ (for real matrices, this is the same as the transpose of _y_).

With this definition it is always true that (%. y) +/ . \* y is an identity matrix.

---

### Details

1\. If y is an [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") or a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET"), it is reshaped to a 1-column [table](https://code.jsoftware.com/wiki/Vocabulary/AET#Table "Vocabulary/AET"), and the result is reshaped to the same [shape](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET") as y.

1\. If y is a [table](https://code.jsoftware.com/wiki/Vocabulary/AET#Table "Vocabulary/AET"), the [shape](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET") of %. y is the reverse of the shape of y; put another way, %. y has the same [shape](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET") as |: y.

---

<table class="wikitable"><tbody><tr><td><tt>x&nbsp;%. y</tt></td><td>Matrix Divide</td></tr></tbody></table>

[Rank \_ 2](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank_2s "Vocabulary/RankInfo") _\-- operates on the entirety of x and tables of y --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

x %. y is (%. y) mux x where mux denotes matrix multiplication.

-   When y is square, the result R of x %. y solves the matrix equation y mux R -: x.

\-: corresponds to \= in standard mathematical notation.

-   When y is not square, the result R comes as close as possible to solving the equation, in the minimum-squared-error sense.
```
   sin=: 1&o.
   cos=: 2&o.
   mux=: +/ . \*                           NB. matrix-multiply

   angle=: (o.2) % 12                     NB. 30 degrees

   \]R=: 2 2$  (cos,-@sin,sin,cos) angle   NB. rotate by (angle=30 deg)
0.866025     \_0.5
     0.5 0.866025

   angle=: (o.2) % 24                     NB. 15 degrees

   \]Q=: 2 2$  (cos,-@sin,sin,cos) angle   NB. rotate by (angle=15 deg)
0.965926 \_0.258819
0.258819  0.965926

   angle=: (o.2) % 8                      NB. 45 degrees

   \]P=: 2 2$  (cos,-@sin,sin,cos) angle   NB. rotate by (angle=45 deg)
0.707107 \_0.707107
0.707107  0.707107

   Q mux R                                NB. Rotate successively by 15 deg, then by 30 deg (total=45 deg)
0.707107 \_0.707107
0.707107  0.707107

   P -: Q mux R                           NB. Rotation by 45 degrees is the same even if done in 2 steps
1
   (P %. R) -: Q                          NB. Matrix-divide both sides of the equation by R
1

```
---

### Common Uses

1\. To solve a system of linear equations.

2\. To calculate a linear regression:

```
   indep =. 1 2 3 5 6    NB. independent variable
   dep =. 3 4 5 8 9      NB. dependent variable
   dep %. (indep ,. 1)   NB. calculate line of best fit
1.24419 1.56977

```

The best fit is dep = 1.57 + 1.24 \* indep.

3\. To calculate the current flows in a given electrical circuit network using [Kirchhoff's Laws](https://en.wikipedia.org/wiki/Kirchhoff%27s_circuit_laws).

---

[Matrix Product](https://code.jsoftware.com/wiki/Vocabulary/dot "Vocabulary/dot") (x +/ . \* y)

---

### More Information

1\. The columns of y must be independent, or domain error is signaled.

1\. In standard mathematical notation, the result is ((_y_\*_y_)<sup>\-1</sup>_y_\*_x_) where _y_\* is the **adjoint** of _y_, i.e. the complex conjugate of the transpose of _y_ (for real matrices, this is the same as the transpose of _y_). If y is square this simplifies to (_y_<sup>\-1</sup>_x_)

1\. If y is an atom or a list, it is reshaped to a 1-column table.

1\. If x is a list, it is reshaped to a 1-column table.

1\. If x is an atom, it is repeated as needed to make a 1-column table that conforms to %. y. 1. The shape of x %. y is y ,&}.&$ x, which is rather subtle. If y and x are both tables, the result has many rows as y has columns, and the same number of columns as x. But if x or y is an atom or list, the corresponding axis of the result (which would be of length 1) is omitted. Thus:

```
   $ (,. 1 2 3) %. (,. 6 7 9)   NB. 3x1 table %, 3x1 table: 1x1 result
1 1
   $ (1 2 3) %. (,. 6 7 9)      NB. list %. 3x1 table: result is 1-atom list
1
   $ (1 2 3) %. (6 7 9)         NB. list %. list: scalar result.

```
---
