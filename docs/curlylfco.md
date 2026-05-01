# Vocabulary/curlylfco - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/curlylfcoco "Vocabulary/curlylfcoco") [<<](https://code.jsoftware.com/wiki/Vocabulary/curlylfdot "Vocabulary/curlylfdot")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d522.htm "jdic:d522")

<table class="wikitable"><tbody><tr><td><tt>{: y</tt></td><td>Tail</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank_iy "Vocabulary/RankInfo") _\-- operates on x and y as a whole, by items of y --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

The last [item](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of y

```
   {: 'abc'
c

```
---

### Common uses

1\. Convert a single-[item](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") y into an [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET")

```
   'a' -: {: ,'a'
1

```

2\. More generally, take the last [item](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of array y, producing an [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") of lower [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET")

```
   \]z =: i. 3 4
0 1  2  3
4 5  6  7
8 9 10 11
   {: z
8 9 10 11

```

3\. When applied on a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET"), e.g. the rows of a [table](https://code.jsoftware.com/wiki/Vocabulary/AET#Table "Vocabulary/AET"), take the last [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") on each row

```
   {:"1 z
3 7 11

```
---

[Head](https://code.jsoftware.com/wiki/Vocabulary/curlylfdot "Vocabulary/curlylfdot") ({. y), [Behead](https://code.jsoftware.com/wiki/Vocabulary/curlyrtdot "Vocabulary/curlyrtdot") (}. y), [Curtail](https://code.jsoftware.com/wiki/Vocabulary/curlyrtco "Vocabulary/curlyrtco") (}: y)

---

### More Information

0\. A video lab has been created for Tail and is available in jqt and JHS. The videos can be viewed here in complete form [Tail monadic verb complete video](https://www.youtube.com/watch?v=mgUj5d-9Nbo) or as lab components [Tail monadic verb Part 1](https://www.youtube.com/watch?v=G9Ivm7lQCYA) and [Tail monadic verb Part 2](https://www.youtube.com/watch?v=FiTdyLoNnAc)

1\. Unless y is an [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET"), the [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") of {: y is 1 less than the [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") of y. This is different from \_1{.y which is a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") of items of y (and therefore has the same rank as y unless y is an atom).

({: y) is equivalent to (0 { \_1 {. y)

```
   \]z =: i. 3 4
0 1  2  3
4 5  6  7
8 9 10 11
   {: z
8 9 10 11
   \_1 {. z     NB. they look the same...
8 9 10 11
   $ {: z
4
   $ \_1 {. z   NB. ...but they have different shapes
1 4

```

2\. If y has no [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET"), {: y produces an item of [fill atoms](https://code.jsoftware.com/wiki/Vocabulary/Glossary#FillAtom "Vocabulary/Glossary"). {:!.f sets the fill atom, which by default is the [fill](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Fill "Vocabulary/Glossary") appropriate for the [type](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Type "Vocabulary/Glossary") of y. See [Head](https://code.jsoftware.com/wiki/Vocabulary/curlylfdot#fill "Vocabulary/curlylfdot") for examples.

---
