# Vocabulary/ampdotco - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/query "Vocabulary/query") [<<](https://code.jsoftware.com/wiki/Vocabulary/ampco "Vocabulary/ampco")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d631c.htm "jdic:d631c")

<table class="wikitable"><tbody><tr><td><tt>[x] u&amp;.:v y</tt></td><td>Under</td><td>Conjunction</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank_~ "Vocabulary/RankInfo") _\-- operates on \[x and\] y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Executes v on the [argument](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET")(s); then executes u on the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary")(s) of v; then executes  v^:\_1 (i.e. the [obverse](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Obverse "Vocabulary/Glossary") of v) on the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") of u, giving the end result. We say that u is _applied under_ v.

u&.:v is equivalent to v^:\_1@:(u&:v). That is,

```
  u&.:v y  <-->        v^:\_1 u (v y)
x u&.:v y  <-->  v^:\_1 (v x) u (v y)

```

**Example:** Addition (+) _applied under_ logarithm (^.) gives multiplication

```
   u =: +
   v =: ^.
   3 4  u&.:v  5 1
15 4

```

[Under (Dual)](https://code.jsoftware.com/wiki/Vocabulary/ampdot "Vocabulary/ampdot") (&.) happens to give the same answer as (&.:) here. But this is only because (+) and (^.) both have [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") 0, which ensures (say) that  3 4 ^. 5 1 is the same as  (3 ^. 5) , (4 ^. 1)

```
   3 4  u&.v  5 1
15 4

```
---

### Common Uses

1\. Compute the Geometric Mean as: the Arithmetic Mean taken in the "log-domain"

```
   y =: 2 4 8 16

   mean =: +/ % #         NB. The Arithmetic Mean of y
   mean y
7.5

   ^ mean ^. y            NB. The Geometric Mean: log (^.), then arithmetic mean, then antilog (^)
5.65685
   mean&.:^. y            NB. ditto, but done using (&.:)  NOTE: (&.) DOES NOT WORK
5.65685

```

**Note:** [Under (Dual)](https://code.jsoftware.com/wiki/Vocabulary/ampdot "Vocabulary/ampdot") (&.) **does not give the same answer** as (&.:)

```
   mean&.:^. y
5.65685
   mean&.^. y
2 4 8 16

```

Contrast this with the above Example of addition under logarithm.

This is because mean does not have [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") 0, it has rank Infinity

```
   mean b.0
\_ \_ \_
   (mean&.^.) b.0
0 0 0

```

See below: **More Information (1.)**

2\. Compute _standard deviation_ as the root-mean-square of a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") of differences from the mean value

```
   y =: 0 \_3 1 2          NB. list of differences from the mean value

   u =: mean =: +/ % #    NB. mean value of y
   v =: \*:                NB. square of y
   stddev =: u&.:v        NB. square root of mean of sum of squares of y
   stddev 0 \_3 1 2
1.87083

```

3\. Compute Vector Length (Euclidean Length) in **R**<sup>n</sup>

```
   u=. +/
   v=. \*:
   y=. 6 3 2
   u &. v y        NB. u is acting on each list item of v y (that wasn't the intension)
6 3 2
   u &.: v y       NB. u is acting on the result of v y (the whole list)
7
   %: +/ \*: y      NB. straight forward computing of the norm
7

```
---

### Semiduals x u&.:(a:\`v) y and x u&.:(v\`a:) y

The operation encapsulated by u&.:v is used often and is important as a notation to aid thought. When the operation is dyadic, sometimes the sequence of transforming/operating/transforming back should be applied to just one argument, with the other argument being passed unchanged into u. This can be represented by a gerund form where a: indicates which argument is to be used unmodified:

-   x u&.:(a:\`v) y is v^:\_1 x u (v y)
-   x u&.:(v\`a:) y is v^:\_1 (v x) u y
```
   1 +&.:(a:\`^.) 2 3
5.43656 8.15485
   ^ 1 + ^. 2 3
5.43656 8.15485

```
---

[Under (Dual)](https://code.jsoftware.com/wiki/Vocabulary/ampdot "Vocabulary/ampdot") (&.)

---

### More Information

1\. [Under (Dual)](https://code.jsoftware.com/wiki/Vocabulary/ampdot "Vocabulary/ampdot") (&.) differs from Under (&.:) in that  u&.v is defined as (u&.:v)"v; that is,  u&.v _applies_ u _under_ v [cell-by-cell](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Cell "Vocabulary/Glossary"), whereas  u&.:v _applies_ u _under_ v to the entire argument(s) (x and) y.

---
