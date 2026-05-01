# Vocabulary/commadot - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/commaco "Vocabulary/commaco") [<<](https://code.jsoftware.com/wiki/Vocabulary/comma "Vocabulary/comma")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d321.htm "jdic:d321")

<table class="wikitable"><tbody><tr><td><tt>,. y</tt></td><td>Ravel Items</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank_iy "Vocabulary/RankInfo") _\-- operates on x and y as a whole, by items of y --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Creates a _[table](https://code.jsoftware.com/wiki/Vocabulary/AET#Table "Vocabulary/AET")_ where each row of the [table](https://code.jsoftware.com/wiki/Vocabulary/AET#Table "Vocabulary/AET") comes from an _[item](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET")_ of y.

Converts an [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") to a (1-by-1) [table](https://code.jsoftware.com/wiki/Vocabulary/AET#Table "Vocabulary/AET")

```
   $ ,. 'a'
1 1

```

Converts a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") to a 1-column [table](https://code.jsoftware.com/wiki/Vocabulary/AET#Table "Vocabulary/AET")

```
   \] ,. i.3
0
1
2

```

Converts a [table](https://code.jsoftware.com/wiki/Vocabulary/AET#Table "Vocabulary/AET") to itself (i.e. unchanged)

```
\]   z=: 3 4 {. i. 2#10   NB. self-indexing table
 0  1  2  3
10 11 12 13
20 21 22 23
   z -: ,.z
1

```

Converts an [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") of rank 3 or higher to a [table](https://code.jsoftware.com/wiki/Vocabulary/AET#Table "Vocabulary/AET")

```
\]   z=: 2 3 4 {. i. 3#10   NB. self-indexing brick
  0   1   2   3
 10  11  12  13
 20  21  22  23

100 101 102 103
110 111 112 113
120 121 122 123
   ,.z
  0   1   2   3  10  11  12  13  20  21  22  23
100 101 102 103 110 111 112 113 120 121 122 123

```
---

### Common Uses

1\. Arrange the [atoms](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") of a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") of [boxed](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boxed "Vocabulary/Glossary") [strings](https://code.jsoftware.com/wiki/Vocabulary/Glossary#String "Vocabulary/Glossary") vertically for easier reading

```
   d
+------------------------------------------+--------...
|The curfew tolls the knell of parting day,|The lowi...
+------------------------------------------+--------...
   ,. d
+-------------------------------------------+
|The curfew tolls the knell of parting day, |
+-------------------------------------------+
|The lowing herd wind slowly o'er the lea   |
+-------------------------------------------+
|The ploughman homeward plods his weary way,|
+-------------------------------------------+
|And leaves the world to darkness and to me.|
+-------------------------------------------+

```
---

[Ravel](https://code.jsoftware.com/wiki/Vocabulary/comma "Vocabulary/comma") (,)

---

### More Information

1\. When y is an [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET"),  ,.y applies [Ravel](https://code.jsoftware.com/wiki/Vocabulary/comma "Vocabulary/comma") (,) to each _[item](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET")_ of y — which gives the monad (,.) its name.

---

<table class="wikitable"><tbody><tr><td><tt>x ,. y</tt></td><td>Stitch</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank_s "Vocabulary/RankInfo") _\-- operates on x and y as a whole, after adjusting the smaller operand --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Joins each **[item](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET")** of x to the corresponding [item](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of y

```
   x ; y =: toupper x=: 3 5 $ 97}.a.
+-----+-----+
|abcde|ABCDE|
|fghij|FGHIJ|
|klmno|KLMNO|
+-----+-----+
   x ,. y
abcdeABCDE
fghijFGHIJ
klmnoKLMNO

```

If x or y is an [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET"), it is appended to each [item](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of the other

```
      x ,. '/'
abcde/
fghij/
klmno/
      '\\' ,. y
\\ABCDE
\\FGHIJ
\\KLMNO

```
---

### Common uses

1\. Create a two-column [table](https://code.jsoftware.com/wiki/Vocabulary/AET#Table "Vocabulary/AET") from two [lists](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET"), or from a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") and an [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET")

```
   1 2 3 ,. 5 6 7
1 5
2 6
3 7
   1 2 3 ,. 4
1 4
2 4
3 4
   10 ,. 1 2 3
10 1
10 2
10 3

```

2\. Attach an index column to a table

```
   \]z=: 5 3 {. i.10 10   NB. sample noun
 0  1  2
10 11 12
20 21 22
30 31 32
40 41 42
      (\_ ,. z) ,.~ i. #z    NB. uses (\_) as a column separator
0 \_  0  1  2
1 \_ 10 11 12
2 \_ 20 21 22
3 \_ 30 31 32
4 \_ 40 41 42

```

3\. Prefix a space (or other [character](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Character "Vocabulary/Glossary")) to each line of a [literal](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Literal "Vocabulary/Glossary") [table](https://code.jsoftware.com/wiki/Vocabulary/AET#Table "Vocabulary/AET")

```
   \] z=: > ;: 'this is a matrix'
this
is
a
matrix

   ' ' ,. z
 this
 is
 a
 matrix

```
---

[Append](https://code.jsoftware.com/wiki/Vocabulary/comma#dyadic "Vocabulary/comma") (,), [Laminate](https://code.jsoftware.com/wiki/Vocabulary/commaco#dyadic "Vocabulary/commaco") (,:), [Raze](https://code.jsoftware.com/wiki/Vocabulary/semi "Vocabulary/semi") (;)

---

### More Information

1\.  x ,. y is exactly equivalent to  x ,"\_1 y .

---

### Use These Combinations

Combinations using x ,. y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Combine axes 1 and 2</td><td></td><td><tt>,./ y</tt></td><td></td><td>linear time</td></tr><tr><td>Join contents of boxed items along axis 1</td><td></td><td><tt>,.&amp;.&gt;/ y</tt></td><td></td><td></td></tr></tbody></table>

---
