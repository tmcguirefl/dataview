# Vocabulary/commaco - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/semi "Vocabulary/semi") [<<](https://code.jsoftware.com/wiki/Vocabulary/commadot "Vocabulary/commadot")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d322.htm "jdic:d322")

<table class="wikitable"><tbody><tr><td><tt>,: y</tt></td><td>Itemize</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank "Vocabulary/RankInfo") _\-- operates on x and y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Creates an [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") whose [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") is 1 more than the rank of y, and whose single [item](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Item "Vocabulary/Glossary") is y .

The [shape](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET") of  ,:y is always (1 , $y).

-   if y is an [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET"),  ,: y is a 1-atom [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET")
-   if y is a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET"),  ,: y is a 1-row [table](https://code.jsoftware.com/wiki/Vocabulary/AET#Table "Vocabulary/AET")
-   if y is a [table](https://code.jsoftware.com/wiki/Vocabulary/AET#Table "Vocabulary/AET"),  ,: y is a 1-plane [brick](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Brick "Vocabulary/Glossary")
-   etc.
```
   y=: 'alpha'   NB. list ==> one-row table
alpha
   ,: y
alpha
   $ ,: y
1 5

   $ ,: i. 3 4   NB. table => one-layer brick
1 3 4

```
---

### Common uses

1\. When building a 2-[matrix](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Matrix "Vocabulary/Glossary") row-by-row, ensures that it begins as a 2-matrix

```
   z=: 'alpha'

   \]z=: z , 'bravo'
alphabravo
   NB. --not the result we wanted.

   z=: ,:'alpha'

   \]z=: z , 'bravo'
alpha
bravo
   \]z=: z , 'charlie'
alpha
bravo
charlie

```

2\. To create an [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") whose [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") are copies of y

```
   \]y =: 2 3 $ 'abcdef'   NB. A 2x3 table
abc
def
   \]z =: 2 2$ ,: y        NB. z is a 2x2 array of 2x3 tables.  Note ,:
abc
def

abc
def


abc
def

abc
def
   $z                     NB. 2x2 array of 2x3 tables
2 2 2 3

```

3\. As a 2-matrix literal syntax:

```
   1 2 3 , 4 5 6 , ,:7 8 9
1 2 3
4 5 6
7 8 9

```

NOTE: this happens to be equivalent to: 1 2 3 , 4 5 6 ,: 7 8 9

---

<table class="wikitable"><tbody><tr><td><tt>x ,: y</tt></td><td>Laminate</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank_s "Vocabulary/RankInfo") _\-- operates on x and y as a whole, after adjusting the smaller operand --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Creates a two-[item](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") (with [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") at least 2) whose first [item](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") comes from x and whose second [item](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") comes from y .

```
   x=: 'alpha'
   y=: 'bravo'

   \] z=: x ,: y  NB. x is item 0, y is item 1
alpha
bravo
   $z
2 5
   #z
2

```
---

### Common uses

1\. Build a [table](https://code.jsoftware.com/wiki/Vocabulary/AET#Table "Vocabulary/AET") from [strings](https://code.jsoftware.com/wiki/Vocabulary/Glossary#String "Vocabulary/Glossary")

```
   'alpha' , 'bravo' ,: 'charlie'
alpha
bravo
charlie

```

**Note:** in J's right-to-left [execution](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Execution "Vocabulary/Glossary") order, the first 2 [strings](https://code.jsoftware.com/wiki/Vocabulary/Glossary#String "Vocabulary/Glossary") to be combined are 'bravo' and 'charlie' -- which need (,:). For additional rows you must use (,).

---

[Append](https://code.jsoftware.com/wiki/Vocabulary/comma#dyadic "Vocabulary/comma") (x , y), [Append Items](https://code.jsoftware.com/wiki/Vocabulary/commadot#dyadic "Vocabulary/commadot") (x ,. y), [Raze](https://code.jsoftware.com/wiki/Vocabulary/semi "Vocabulary/semi") (; y)

---

### More Information

x ,: y loosely follows the [detailed description](https://code.jsoftware.com/wiki/Vocabulary/semi#RazeDetails "Vocabulary/semi") of ; y, except that [atomic](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Atom "Vocabulary/Glossary") [arguments](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET") are handled differently.

1\. If x and y are both [atoms](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET"), they are converted to [lists](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") so that they become the rows of a 1-column [table](https://code.jsoftware.com/wiki/Vocabulary/AET#Table "Vocabulary/AET")

```
   1 ,: 2
1
2

```

2\. If only one of x and y is an [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET"), it is **replicated** to the [shape](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET") of the other before the two are joined

```
   6 ,: 1 2 3   NB. 6 is replicated before joining
6 6 6
1 2 3

```

Note that a [scalar](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Scalar "Vocabulary/Glossary") [argument](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET") laminated to an [empty](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Empty "Vocabulary/Glossary") one will disappear

```
   0 ,: ''      NB. 0 is 'replicated' to become an empty list
   $ 0 ,: ''
2 0

```

The replication of an [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") to the [shape](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET") of the other occurs **after** the type and [precision](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Precision "Vocabulary/Glossary") of the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") are decided. This means that the atom counts as a "non-empty [argument](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET")" for that decision, even though it will not contribute atoms to the final [result.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary")

```
   3!:0 (0 ,: '')      NB. Boolean atom has its say
1
   3!:0 ((0$0) ,: '')  NB. Boolean empty has lower priority
2

```

3\. After atoms are extended or replicated, they are brought to the same [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") by adding leading [axes](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Axis "Vocabulary/Glossary") of length 1, and to the same shape by adding [fill](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Fill "Vocabulary/Glossary"), which can be specified by  !.f

```
  (i. 2 3) ,: (i. 3 2)
0 1 2
3 4 5
0 0 0

0 1 0
2 3 0
4 5 0
  (i. 2 3) ,:!.99 (i. 4)
 0  1  2 99
 3  4  5 99

 0  1  2  3
99 99 99 99

```
---

### Oddities

1\. The J Dictionary says that the [fill](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Fill "Vocabulary/Glossary") [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") can be empty, but the J7 engine does not support this.

---

### Use These Combinations

Combinations using x ,: y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Composite item</td><td>the <tt>x</tt> arrays are the same precision and not boxed, extended integer, or rational</td><td><tt>name =: i} x0,x1,...,xm,:xn</tt></td><td><tt>=.</tt> <small>in place of</small> <tt>=:</tt><p>If there are 2 <tt>x's</tt>, <tt>i</tt> may be Boolean or integer, but if more than 2 <tt>x's</tt>, <tt>i</tt> must be integer</p></td><td>avoids catenation and lamination</td></tr><tr><td>Composite item in place</td><td><tt>b</tt> is Boolean; <tt>x</tt> and <tt>name</tt> are the same precision and not boxed, extended integer, or rational</td><td><tt>name =. b} x,:name</tt><p><tt>name =. b} name,: x</tt></p></td><td><tt>=:</tt> <small>in place of</small> <tt>=.</tt><p>Must be same <tt>name</tt> either side</p></td><td>avoids making a new copy of <tt>name</tt></td></tr></tbody></table>

---
