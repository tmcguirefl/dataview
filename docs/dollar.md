# Vocabulary/dollar - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/dollardot "Vocabulary/dollardot") [<<](https://code.jsoftware.com/wiki/Vocabulary/hatco "Vocabulary/hatco")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d210.htm "jdic:d210")

<table class="wikitable"><tbody><tr><td><tt>$ y</tt></td><td>Shape Of</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank "Vocabulary/RankInfo") _\-- operates on x and y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

The _shape_ of the [noun](https://code.jsoftware.com/wiki/Vocabulary/AET#Noun "Vocabulary/AET") y .

The shape of the noun y is **always** a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET"), even if that list contains just 1 atom (i.e. y itself is a list).

Contrast this behavior with [Tally](https://code.jsoftware.com/wiki/Vocabulary/number "Vocabulary/number") (\# y).

The _shape_ of a given noun is...

-   [empty](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Empty "Vocabulary/Glossary") (i.0) for an [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") (eg the single letter 'a')
-   the number of atoms for a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") (eg a list of numbers)  -   0 for the empty list
    
-   (3 2) for a 3-by-2 [table](https://code.jsoftware.com/wiki/Vocabulary/AET#Table "Vocabulary/AET").
---

### Common Uses

1\. Find the shape of a [noun](https://code.jsoftware.com/wiki/Vocabulary/AET#Noun "Vocabulary/AET")

```
   $ 'abc'                  NB. A 3-atom list
3
   $ 'a'                    NB. An atom - no axes

   $ ''                     NB. An empty list - 1 axis, 0 elements
0
   $ i. 2 3                 NB. A 2x3 table
2 3
   \] empty =: 0 # i. 3 4    NB. Create a table, then delete all the rows
   $ empty                  NB. The rows are still 4 long, even though there are 0 of them!
0 4

```

2\. Find the [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") of a noun using \# $ y

```
   # $ 'a'                  NB. Rank of an atom is 0
0
   # $ 'abc'                NB. Rank of a list is ALWAYS 1
1
   # $ ''                   NB. ... even an empty list
1
   # $ i. 3 2               NB. Rank of a table is 2
2

```
---

[Tally](https://code.jsoftware.com/wiki/Vocabulary/number "Vocabulary/number") (\# y)

---

### More Information

1\. Shape Of ($ y) gives the shape of y (always a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET")), while [Tally](https://code.jsoftware.com/wiki/Vocabulary/number "Vocabulary/number") (\# y) gives the number of [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of y (always an atom).

```
   ($ ; #) y=: ''
+-+-+
|0|0|
+-+-+
   ($ ; #) y=: 'a'
++-+
||1|
++-+
   ($ ; #) y=: ,'a'
+-+-+
|1|1|
+-+-+
   ($ ; #) y=: 'abc'
+-+-+
|3|3|
+-+-+

```
---

### Use These Combinations

Combinations using $ y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Calculate rank of a noun</td><td></td><td><tt>#@$ y</tt><br><tt>([: # $) y</tt></td><td><tt>@:</tt> in place of <tt>@</tt></td><td></td></tr><tr><td>Calculate number of atoms in a noun</td><td></td><td><tt>#@, y</tt><br><tt>*/@$ y</tt><br><tt>([: # ,) y</tt><br><tt>([: */ $) y</tt></td><td><tt>@:</tt> in place of <tt>@</tt></td><td></td></tr><tr><td>Is the noun empty?</td><td></td><td><tt>(0 e. $) y</tt></td><td></td><td></td></tr><tr><td>Is the noun nonempty?</td><td></td><td><tt>*@#@, y</tt></td><td></td><td></td></tr><tr><td>Does the noun have items?</td><td></td><td><tt>*@# y</tt></td><td></td><td></td></tr></tbody></table>

---

<table class="wikitable"><tbody><tr><td><tt>x $ y</tt><br><tt>x ($,) y</tt></td><td>Shape</td></tr></tbody></table>

[Rank 1 \_](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank1_s "Vocabulary/RankInfo") _\-- operates on lists of x and the entirety of y --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Creates an [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") whose shape depends on x and the shape of y. $ uses [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of y; ($,) uses [atoms](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") of y;

```
   2 3 $ 'ab'
aba
bab

```
---

### Common Uses

1\. Create a [noun](https://code.jsoftware.com/wiki/Vocabulary/AET#Noun "Vocabulary/AET") with a given shape and [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET")

```
   2 3 $ 5
5 5 5
5 5 5

```

2\. Reshape a noun to a different shape x.

In general, it's wise to use ($,) rather than  $ .

If y is an [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") or a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET"), it's ok to use  $ instead of ($,) .

```
   \]i. 2 3
0 1 2
3 4 5
   2 3 4 ($,) i. 2 3
0 1 2 3
4 5 0 1
2 3 4 5

0 1 2 3
4 5 0 1
2 3 4 5

```
---

### More Information

The **items** of the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") of  x $ y are the **items** of y, taken cyclically (i.e. when y is exhausted, the first item of y is reused).

1\. If y is an [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") or a list, the shape of the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") is x.

```
   $ y=: 'abcdefghijkl'
12
   \] z=: 2 2 $ y
ab
cd
   $ z
2 2

```

2\. If y has [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") > 1, the shape of the result is (x,}.$y); i.e. the result is an [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") of [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of y whose [frame](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Frame "Vocabulary/Glossary") is x.

To be pedantic, the shape of the result is **always** (x,}.$y) no matter the rank of y.

```
   i. 2 3          NB. A 2x3 array
0 1 2
3 4 5
   2 3 $ i. 2 3    NB. A 2x3 array of 3-atom lists, i. e. shape 2 3 3
0 1 2
3 4 5
0 1 2

3 4 5
0 1 2
3 4 5
   $ 2 3 $ i. 2 3  NB. the shape of the above
2 3 3

```

3\. x ($,) y always produces a [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") whose shape is x.

4\. If a [fill](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Fill "Vocabulary/Glossary") [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") f is specified (by using $!.f), cyclic reuse of y is suppressed: after y is exhausted further [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of the result are filled with the fill atom.

```
   5 $ 'a'
aaaaa
   5 $!.'b' 'a'    NB. With fill atom, y is used only once
abbbb

```

5\. If the fill atom is an [empty](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Empty "Vocabulary/Glossary") [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET"), an atom of the same [type](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Type "Vocabulary/Glossary") as y is used.

```
   5 $!.'' 6       NB. integer type, use 0 for fill
6 0 0 0 0
   5 $!.'' <'a'    NB. boxed type, use a: for fill
+-+++++
|a|||||
+-+++++

```

6\. x may be [empty.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Empty "Vocabulary/Glossary") The [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") will be consistent with the rules given above.

```
   '' $ 5 6 7      NB. Shape of result is empty, i. e. result is an atom
5
   '' $ i. 2 3     NB. Shape of result is 3
0 1 2

```

'' ($,) y is a good way to get the first atom of y, as long as y is not empty.

7\. If exactly one atom of x is infinity (\_), the atom is replaced by whatever length is required to use all items of y exactly once.

```
   \_ 2 $ i. 6
0 1
2 3
4 5
   2 \_ $ i. 6
0 1 2
3 4 5
   2 \_ $ i. 7   NB. Error, y cannot be used exactly
|domain error, executing dyad $

```

8\. An additional use of !. with a verb argument allows you to change the value used to replace \_.

```
   2 \_ $!.<. i. 7  NB. Round to number of full items
0 1 2
3 4 5
   2 \_ $!.>. i. 7   NB. Round up to include partial item
0 1 2 3
4 5 6 0
   2 \_ $!.99!.>. i. 7  NB.  Fill and \_-calculation can be combined
0 1 2  3
4 5 6 99

```
---

### Details

1\. If y is [empty](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Empty "Vocabulary/Glossary"), the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") must also be empty, i. e. its shape must contain a 0 .

The reason is that the [values](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary") of the result must come from y, and if y has no values, what could the result possibly be?

```
   5 $ ''
|length error
|   5    $''

```

2\. Exception to the previous rule: if a [fill](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Fill "Vocabulary/Glossary") [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") is specified (even an empty one), x need not contain a 0 when y is empty, because the fill atom can be used for the [values.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary")

```
   5 $!.6 ''
6 6 6 6 6

```

'' ($!.f ,) y will get the first atom of y even if y is empty.

---

### Use These Combinations

Combinations using x $ y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Reshape to exactly <tt>x</tt></td><td></td><td><tt>x ($ ,) y</tt></td><td></td><td>Supported as a primitive by <tt>($ ,)"n</tt></td></tr><tr><td>Arrays of random numbers</td><td></td><td><tt>x&nbsp;?@$ y</tt><p><tt>x([:&nbsp;? $)y</tt></p></td><td><tt>?.</tt> <small>in place of</small> <tt>?</tt><p><tt>@:</tt> <small>in place of</small> <tt>@</tt><br><tt>#</tt> <small>in place of</small> <tt>$</tt></p></td><td>does not create <tt>x $ y</tt></td></tr></tbody></table>

---
