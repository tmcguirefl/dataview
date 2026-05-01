# Vocabulary/semidot0 - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/semidot1 "Vocabulary/semidot1") [<<](https://code.jsoftware.com/wiki/Vocabulary/semidot "Vocabulary/semidot")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d331.htm "jdic:d331")

<table class="wikitable"><tbody><tr><td><tt>u;.0 y</tt></td><td>Reversed</td><td>Adverb</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank "Vocabulary/RankInfo") _\-- operates on x and y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Trivial case: If y is a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET"), u;.0 y is the same as u |. y .

```
   y=. 2 3 5 7            NB. a list
   u=. -:                 NB. some verb
   |. y                   NB. using Reverse
7 5 3 2
   u |. y                 NB. applying verb
3.5 2.5 1.5 1
   u;.0 y                 NB. using verb with adverb Reversed (to the same effect)
3.5 2.5 1.5 1

```

In general, u;.0 y **reverses** y **along all** its **axes**, and then applies the [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") u to the reversed y.

```
   \] y=. 2 3 $ p: i.6     NB. an array
2  3  5
7 11 13
   u=. <:                 NB. some verb
   |. y                   NB. reversing at horizontal axis
7 11 13
2  3  5
   |."1 |. y              NB. reversing at vertical axis as well
13 11 7
 5  3 2
   u;.0 y                 NB. Reversed reverses along \*all\* axes before applying verb
12 10 6
 4  2 1

```
---

### Common uses

1\. Apply u to the reversal of y:

```
   isinstring =: +./@:E.  NB. 1 if x is found in y
   'ode'&isinstring 'boustrophedonic'
0
   'ode'&isinstring;.0 'boustrophedonic'
1

```
---

[Reverse](https://code.jsoftware.com/wiki/Vocabulary/bardot "Vocabulary/bardot") (|. y)

---

<table class="wikitable"><tbody><tr><td><tt>x u;.0 y</tt></td><td>Subarray</td><td>Adverb</td></tr></tbody></table>

[Rank 2 \_](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank2_s "Vocabulary/RankInfo") _\-- operates on tables of x and the entirety of y --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

In x u;.0 y, x describes a subarray of y. The subarray is extracted from y, and then [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") u is applied to it.

---

In these examples u is \], which simply passes the selected subarray unchanged.

```
   \]a =. a. {~ (a. i. 'a') + i. 4 4   NB. A 4x4 array
abcd
efgh
ijkl
mnop
   (0 0 ,: 2 2) \];.0 a                NB. starting at 0 0, take a subarray of shape 2 2
ab
ef
   (1 2 ,: 3 2) \];.0 a                NB. Starting at 1 2, take a subarray of shape 3 2
gh
kl
op

```

[Argument](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET") x is a [table](https://code.jsoftware.com/wiki/Vocabulary/AET#Table "Vocabulary/AET") with two rows. Each column of x gives the selection for the corresponding [axis](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Axis "Vocabulary/Glossary") of y. The first number in each column gives the starting position, and the second number gives the number of [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") selected.

Looking at it another way, the first row of x is the index list of the starting corner of the subarray, and the second [item](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") gives the [shape](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET") of the subarray.

---

### Common uses

1\. Use  x \];.0 y to extract a subarray. It is the fastest way to do it.

2\. The **substr** function, which extracts a substring from a [string](https://code.jsoftware.com/wiki/Vocabulary/Glossary#String "Vocabulary/Glossary"), can be coded using  x \];.0 y

```
   substr =: (\];.0~ ,.)~"1   NB. x is (start,len), y is string to take from
   2 4 substr 'boustrophedonic'
ustr

```

3\. If you want to apply a [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") to the subarray, use that verb as u

```
   (0 0 ,: 2 2) ,;.0 a       NB. Select subarray, then enfile into a list
abef

```

4\. x \];.0 y can be used to perform the function of x {. y, but without overtaking:

```
   3 \];.0 i. 5
0 1 2
   5 \];.0 i. 3
0 1 2

```
---

### Details

1\. If the length causes the subarray to extend past the beginning or end of the [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET"), the subarray is truncated at the end of the array. The resulting length may be 0.

```
   (1 2 ,: 2 8) \];.0 a
gh
kl

```

2\. A length of [infinity](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Infinity "Vocabulary/Glossary") (\_ or \_\_) means "to the end of the array".

```
   (2 ,: \_) \];.0 'abcdefgh'

cdefgh

```

3\. If x is an [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") or a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET"), it calls for a subarray whose [shape](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET") is ,x, starting at the beginning of the [array.](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") In other words, x is treated as the second row of the left argument, and the first row is taken to be 0.

```
   2 3 \];.0 a
abc
efg

```

4\. If x has fewer columns than the [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") of y, trailing columns of 0 \_ are added, which take the omitted axes in their entirety

```
   (2,:2) \];.0 a
ijkl
mnop

```

5\. If a starting position is negative, it indicates a position relative to the _end_ of that [axis](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Axis "Vocabulary/Glossary"), and is used as the _ending_ position of the selection

**Note:** even though the selected region runs backwards from the start position, the selection retains its normal order

```
   (2 \_1 ,: 2 2) \];.0 a
kl
op

```

6\. If a length is negative, that [axis](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Axi "Vocabulary/Glossary") is reversed after the selection.

```
   (2 \_1 ,: 2 \_2) \];.0 a  NB. Axis 1 reversed
lk
po

```

7\. The starting position must be a valid [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") of the [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET"), or one atom before or after the array (in which case the length of the result will always be 0).

8\. The subarray of y always has the same [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") as y.

9\. If x has no columns, it selects all of y.

10\. Bug: if x is an empty array containing no rank-2 subarrays (example: 0 2 2$0), u is applied to y instead of an empty subarray of y.

---

### Use These Combinations

Combinations using x ;.0 y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Extract multiple substrings into a list</td><td>Boolean list, byte list</td><td><tt>x&nbsp;;@:(&lt;;.0) y</tt></td><td>or <tt>[:&nbsp;; &lt;;.0</tt></td><td>avoids boxing, avoids creating subarrays</td></tr><tr><td>Extract substring/subarray</td><td>table or list</td><td><tt>x ];.0 y</tt></td><td>or <tt>[;.0</tt></td><td>avoids creating indexes</td></tr></tbody></table>

---
