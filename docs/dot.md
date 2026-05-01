# Vocabulary/dot - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/dotdot "Vocabulary/dotdot") [<<](https://code.jsoftware.com/wiki/Vocabulary/barco "Vocabulary/barco")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d300.htm "jdic:d300")

<table class="wikitable"><tbody><tr><td><tt>u . v y</tt></td><td>Determinant</td><td>Conjunction</td></tr></tbody></table>

[Rank 2](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank2 "Vocabulary/RankInfo") _\-- operates on tables of y --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

\-/ . \* y is the _[determinant](https://en.wikipedia.org/wiki/Determinant)_ of square [matrix](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Matrix "Vocabulary/Glossary") y .

+/ . \* y is the _[permanent](https://en.wikipedia.org/wiki/Permanent_(mathematics))_ of square [matrix](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Matrix "Vocabulary/Glossary") y .

```
   \] y=: 3 3 $ 0 0 1  1 0 0  0 1 0
0 0 1
1 0 0
0 1 0
   -/ . \* y
1

   \] y=. 3 3 $ i. 9
0 1 2
3 4 5
6 7 8
   det=: 3 : '-/ .\* y'    NB. determinant (monad)
   per=: 3 : '+/ .\* y'    NB. permanent (monad)
   det y                  NB. 72-72
0
   per y                  NB. 72+72
144

```
---

### More Information

1\. The space _before_ . is required.

2\. \-/ . \* y (which calculates the standard determinant) is fast.

3\. u . v y is defined for general u and v in terms of expansion by minors and cofactors. Minors are calculated in the usual way and dyadic u . v is applied between the minors and cofactors. This is prohibitively slow for [arrays](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") larger than, say, 15x15.

---

<table class="wikitable"><tbody><tr><td><tt>x u . v y</tt></td><td>Matrix Product</td><td>Conjunction</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank "Vocabulary/RankInfo") _\-- operates on x and y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

x +/ . \* y is the _inner product_ or _matrix product_ of [matrices](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Matrix "Vocabulary/Glossary") x and y.

```
   \]y=: i.2 3
0 1 2
3 4 5
   x=: 0 1
   x +/ . \* y
3 4 5

```
---

### Common Uses

1\. Multiply matrices x and y

```
   \]x=: 3 3 $ 0 0 1  1 0 0  0 1 0  NB. permutation mtx (unitary)
0 0 1
1 0 0
0 1 0
   \]y=: |:x     NB. Transpose of x is its inverse
0 1 0
0 0 1
1 0 0
   x +/ . \* y   NB. so the matrix product should be the Identity matrix
1 0 0
0 1 0
0 0 1

```

2\. Compute the Dot product aka Scalar product of two vectors

```
   x=. 1 3 \_5
   y=. 4 \_2 \_1
   x \* y                NB. multiply the two lists atom by atom
4 \_6 5
   +/ x \* y             NB. sum over component products
3
   x +/ .\* y            NB. using Matrix product
3

```

3\. Transitive closure of a connection matrix (If A connects to B and B connects to C, make A connect to C)

```
   tc=: (+. +./ .\*.~)^:\_                                NB. Compute transitive closure
   \]cmtx =. 4 4 $ 1 1 0 0  1 1 1 0  0 1 1 0 0 0 0 0 1   NB. A connection matrix
1 1 0 0
1 1 1 0
0 1 1 0
0 0 0 0
   tc cmtx      NB. closure
1 1 1 0
1 1 1 0
1 1 1 0
0 0 0 0

```
---

### More Information

1\. x +/ . \* y is the standard matrix product of x and y, also called the _inner product_. If the left argument of the inner product is a list, it is treated as a row vector; if the right argument is a list, it is treated as a column vector.

2\. Alternative inner products can be defined by using x u/ . v y where v is a verb with rank 0. When such a verb is applied to x and y arguments that are tables, the result r will be a table where each atom of r is an inner product of one row of x and one column of y; formally, (<i,j){r in this special case is u/ (i { x) v (j {"1 y).

```
   x=. 1 2
   \] y=. ,. 3 4
3
4
   $ x
2
   $ y
2 1
   aip=: -/ .%                NB. an alternative definition of Inner product using Divide
   x aip y                    NB. 1/3 - 2/4 = -1/6
\_0.166667
   - % 6
\_0.166667

```

3\. x u . v y is also defined for other cases, where the arguments are not tables or u and v have different forms or ranks, as x u@(v"(1+lv,\_)) y, where lv is the left [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") of [dyadic](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Dyad "Vocabulary/Glossary") v. This means that the [operand](https://code.jsoftware.com/wiki/Vocabulary/AET#Operand "Vocabulary/AET") x is broken up into pieces that have [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") one higher than lv; i.e. x is broken up into an **[array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") of [lists](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") of [left-argument](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET") [cells](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Cell "Vocabulary/Glossary") to v**. Then, for each such list-of-cells from x, v is applied **between each x\-cell and the entire y**, which creates a list of [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") cells that are assembled into an [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") result for the list-of-x\-cells; then u is applied to that array to produce the part of the result of u . v resulting from that list-of-x\-cells. The results of u on all the lists-of-x\-cells are [assembled into the final result](https://code.jsoftware.com/wiki/Vocabulary/FramingFill "Vocabulary/FramingFill").

To see how this applies, consider the usual case of +/ . \* applied to matrices. The rank of [dyad](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Dyad "Vocabulary/Glossary") \* is 0 0, so lv is 0. Therefore the verb executes as +/@(\*"1 \_). The pieces of x referred to above are then the 1-[cells](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Cell "Vocabulary/Glossary") of x, that is, the rows. Each row is processed as row \* y which multiplies each entire row of y by the corresponding [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") of x. Then +/ is applied, which sums the rows to produce one row of the result.

4\. The space _before_ . is required.

5\. [Some walkthrough explanations](https://code.jsoftware.com/wiki/User:Pascal_Jasmin/hopelessly_lost%27s_guide_to_.)

6\. As a generality, mathematical functions have rank 0 0, and many structural functions have rank 1 \_. The usual case of v being a mathematical function (left rank 0) means that u . v is equivalent to u@(v"1 \_). It is extremely rare to manufacture a use case for dyadic structural functions such as # , {. , but u . # would be equivalent to u@(#"2 \_). Though not the strict definition, it is best to think of u . v as "for a 0 (left) rank function v, u . v is shorthand for u@(v"1 \_)"

---
