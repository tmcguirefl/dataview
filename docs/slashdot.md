# Vocabulary/slashdot - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/slashco "Vocabulary/slashco") [<<](https://code.jsoftware.com/wiki/Vocabulary/slash "Vocabulary/slash")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d421.htm "jdic:d421")

<table class="wikitable"><tbody><tr><td><tt>u/. y</tt></td><td>Oblique</td><td>Adverb</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank_iy "Vocabulary/RankInfo") _\-- operates on x and y as a whole, by items of y --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

(u/.y) applies [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") u to the _oblique diagonals_ of [table](https://code.jsoftware.com/wiki/Vocabulary/AET#Table "Vocabulary/AET") y

```
   \] y=: 4 4 $ i.3
0 1 2 0
1 2 0 1
2 0 1 2
0 1 2 0
   </. y
+-+---+-----+-------+-----+---+-+
|0|1 1|2 2 2|0 0 0 0|1 1 1|2 2|0|
+-+---+-----+-------+-----+---+-+

```
---

### Common Uses

1\. As part of the idiom for polynomial multiplication

```
    (1 2) \*/ (3 4 2)         NB. consider this product
3 4 2
6 8 4
   +/ /. (1 2) \*/ (3 4 2)    NB. sum up the oblique diagonals
3 10 10 4
   pmul =: +//.@(\*/)         NB. define a dyadic verb to calculate the coefficients
   1 2 pmul 3 4 2            NB. of e.g. (2x+1)(2x^2+4x+3)=4x^3+10x^2+10x+3
3 10 10 4

```
---

### More Information

1\. u can be a [cyclic gerund](https://code.jsoftware.com/wiki/Vocabulary/CyclicGerund "Vocabulary/CyclicGerund").

---

### Details

1\. The [arguments](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET") to the invocations of u are [lists](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") of [(\_2)-cells](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Cell "Vocabulary/Glossary") of y

2\. If y has no [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET"), the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") of u/. y will also have no items.

However, u will be executed once on a cell of 0 [\_2-cells](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Cell "Vocabulary/Glossary") to establish the [shape](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET") of a [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") of u, and then the result of  u/. y will be a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") of 0 of that [shape](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET")

```
   $ \]/. i. 0 3    NB. u is executed on a cell of shape 0
0 0
   $ \]/. i. 0 3 4  NB. u is executed on a cell of shape 0 4
0 0 4

```
---

### Use These Combinations

Combinations using u/. y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") are shown in [Diagonals and Polynomials](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations#diagonals "Vocabulary/SpecialCombinations").

---

<table class="wikitable"><tbody><tr><td><tt>x u/. y</tt></td><td>Key</td><td>Adverb</td></tr><tr><td><tt>x u/.. y</tt></td><td>Key dyad</td><td>Adverb</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank_ixiy "Vocabulary/RankInfo") _\-- operates on x and y as a whole, by items --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Classifies [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of x into [partitions](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Partition "Vocabulary/Glossary") of identical items. Then y is [partitioned](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Partition "Vocabulary/Glossary") using the partitioning that was calculated for x, and u is applied on each [partition](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Partition "Vocabulary/Glossary") of y.

**Note:** x and y must have the same number of [items.](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET")

Each item of x is the **key** of the corresponding item of y, and u is applied to each set of items of y with equal keys.

For /., [noun](https://code.jsoftware.com/wiki/Vocabulary/AET#Noun "Vocabulary/AET") x is used only for the partitioning and is not an [argument](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET") to [operand](https://code.jsoftware.com/wiki/Vocabulary/AET#Operand "Vocabulary/AET") u. For /.., the key value from x becomes the x argument to u.

x is classified by tolerant comparison. The value used for the x argument to u is the first one in the partition.

```
   y=: 'AbcDeFGhijk'
   \] x=: y e. 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'   NB. 1=uppercase, 0=lowercase
1 0 0 1 0 1 1 0 0 0 0

   x \]/. y  NB. partitions of y
ADFG
bcehijk
   x </. y
+----+-------+
|ADFG|bcehijk|
+----+-------+
   x ;/.. y  NB. key from x and partition of y
+-+-------+
|1|ADFG   |
+-+-------+
|0|bcehijk|
+-+-------+

```
---

### Common Uses

1\. Count the numbers of different [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET"), using  #/.

```
   a =: 3 1 4 1 5 9 2 6 5 3 5 8 9 7 9
   (~.a) ,: (a #/. a)                    NB. unique digits, then frequency of each
3 1 4 5 9 2 6 8 7
2 2 1 3 3 1 1 1 1

```

2\. Collect information from records with identical keys

```
   \]data =: \_2 \]\\ 'Fred';90;'John';75;'Fred';95;'John';85;'Susan';100;'John';86   NB. A table
+-----+---+
|Fred |90 |
+-----+---+
|John |75 |
+-----+---+
|Fred |95 |
+-----+---+
|John |85 |
+-----+---+
|Susan|100|
+-----+---+
|John |86 |
+-----+---+
   \]s =: ({."1 data) <@;/. ({:"1 data)   NB. Use first column as keys; collect second-column values
+-----+--------+---+
|90 95|75 85 86|100|
+-----+--------+---+
   (~. {."1 data) ,. s                   NB. Reinstall the name
+-----+--------+
|Fred |90 95   |
+-----+--------+
|John |75 85 86|
+-----+--------+
|Susan|100     |
+-----+--------+

```
---

### More Information

1\. u can be a [cyclic gerund](https://code.jsoftware.com/wiki/Vocabulary/CyclicGerund "Vocabulary/CyclicGerund")

```
   x tolower\`toupper/. y
adfg
BCEHIJK

```
---

### Details

1\.  x u/. y is a member of the [i.-family](https://code.jsoftware.com/wiki/Vocabulary/IFamily "Vocabulary/IFamily").

2\. The [argument](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET") to each invocation of u is a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") of [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of y (this has the same [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") as y unless y is an [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET")).

3\. The [partitions](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Partition "Vocabulary/Glossary") are processed in the same order as the [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") in  ~. x .

4\. The [partitioning](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Partition "Vocabulary/Glossary") uses [tolerant comparison](https://code.jsoftware.com/wiki/Vocabulary/Glossary#TolerantComp "Vocabulary/Glossary"). Use u/.!.0 for intolerant comparison.

5\. If y has no [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET"), the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") of  x u/. y will also have no items.

However, u will be executed once on a [cell](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Cell "Vocabulary/Glossary") of 0 items to establish the [shape](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET") of a [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") of u, and then the result of  x u/. y will be a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") of 0 of that [shape](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET")

```
   $ '' \]/. ''        NB. u is executed on cell of shape 0
0 0
   $ '' {./. ''       NB. u produces an atomic result
0
   $ '' {./. i. 0 3   NB. u is executed on cell of shape 0 3
0 3

```

\---

### Oddities

If a tolerance is specified using u/.!.f, that tolerance is used as the default tolerance during the execution of u. ---

### Use These Combinations

Combinations using x u/. y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") are shown in [Partitions](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations#partitions "Vocabulary/SpecialCombinations") and [Diagonals and Polynomials](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations#diagonals "Vocabulary/SpecialCombinations").

---
