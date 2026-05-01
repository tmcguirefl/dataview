# Vocabulary/bardot - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/barco "Vocabulary/barco") [<<](https://code.jsoftware.com/wiki/Vocabulary/bar "Vocabulary/bar")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d231.htm "jdic:d231")

<table class="wikitable"><tbody><tr><td><tt>|. y</tt></td><td>Reverse</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank "Vocabulary/RankInfo") _\-- operates on x and y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Rearranges the _[items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET")_ of y in reverse order

```
   |. i.6
5 4 3 2 1 0

```

y can be a [matrix](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Matrix "Vocabulary/Glossary")

```
   \] z=: 3 4 {. i.10 10         NB. sample noun
 0  1  2  3
10 11 12 13
20 21 22 23

   |.z                          NB. items are the rows of z
20 21 22 23
10 11 12 13
 0  1  2  3

   |."1 z                       NB. items of the rows are the numbers in each row
 3  2  1  0
13 12 11 10
23 22 21 20

```
---

### Common Uses

1\. To put an [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") into reverse order so that u/\\. can be applied

```
   data =. 3 1 4 1 5 9
   ((1 + \[) \* \])/\\ data                 NB. start with 3, then add 1 to value calculated so far, multiply by the next number
3 4 32 40 400 4320
   |. ((1 + \]) \* \[)/\\. |. data          NB. same computation in reverse order
3 4 20 21 110 999
   data =. 1000 ?@$ 10                  NB. A larger dataset
   6!:2 '((1 + \[) \* \])/\\ data'
0.311868
   6!:2 '|. ((1 + \]) \* \[)/\\. |. data'   NB. reverse order is much faster
0.000484056

```

2\. To find the inverse of a permutation in cycle form

```
   \]perm =: 2 4;5 0 3
+---+-----+
|2 4|5 0 3|
+---+-----+

   \]invperm =: |. each perm
+---+-----+
|4 2|3 0 5|
+---+-----+
   invperm C. perm C. 'abcdef'   NB. it is a true inverse
abcdef

```
---

<table class="wikitable"><tbody><tr><td><tt>|.!.f y</tt></td><td>Shift Right 1</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank "Vocabulary/RankInfo") _\-- operates on x and y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

The same as (\_1 |.!.f y)

f is the _fill atom_ you want to use (typically 0 or \_ for numbers, ' ' for strings)

See below for an explanation, in section: [Shift](#shift).

---

<table class="wikitable"><tbody><tr><td><tt>x |. y</tt></td><td>Rotate</td></tr></tbody></table>

<table class="wikitable"><tbody><tr><td><tt>x |.!.f y</tt></td><td>Shift</td></tr></tbody></table>

[Rank 1 \_](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank1_s "Vocabulary/RankInfo") _\-- operates on lists of x and the entirety of y --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

_Rotates_ the [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of y leftwards or upwards x positions. See below for _Shift_ instead of _Rotate_.

-   Rotation left or up by a negative amount is equivalent to a rotation right or down
-   _Rotating an [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") x positions_ means moving each item to a new position x places away
-   _Rotating left 1_ moves each item into the location of the previous item, with item 0 moving into the last position
-   _Rotating right 1_ moves each item into the location of the next item, with the last item moving into the position 0
-   Rotation by more than one position is equivalent to repeated rotation by 1.
-   Atoms of x apply to the axes of y in order.
```
   2 |. i.6    NB.  Rotate left 2
2 3 4 5 0 1

   \_1 |. i.6   NB. negative x -- other direction
5 0 1 2 3 4

```

y can be a [matrix](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Matrix "Vocabulary/Glossary")

```
   \] y=: 6 4 {. i.10 10
 0  1  2  3
10 11 12 13
20 21 22 23
30 31 32 33
40 41 42 43
50 51 52 53

   3 |. y
30 31 32 33
40 41 42 43
50 51 52 53
 0  1  2  3
10 11 12 13
20 21 22 23

   \_1 |."1 y   NB. Rotate each row separately
 3  0  1  2
13 10 11 12
23 20 21 22
33 30 31 32
43 40 41 42
53 50 51 52

```
```


```

**Shift**:

_Shifting_ an [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") resembles _rotation_, except that the positions at the end of the [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") are filled with the [fill atom](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Fill "Vocabulary/Glossary"): f .

The items shifted out of the array are lost.

Contrast this with _rotation_, where the items shifted out of the array are brought in at the other end as _fill (items)_.

To get _shifting_ instead of _rotation_, use |. with [Fit (Customize)](https://code.jsoftware.com/wiki/Vocabulary/bangdot "Vocabulary/bangdot") (!.f) to yield the phrase  |.!.f

f is the _fill atom_ you want to use (typically 0 or \_)

```
   2 |.!.\_ i.6   NB. fill atom (f) is \_
2 3 4 5 \_ \_
   |.!.\_ i.6     NB. Monad: |.!.\_ y (shift right 1) is same as Dyad: x |.!.\_ y with x=\_1
\_ 0 1 2 3 4
   |.!.\_ i.6 6
 \_  \_  \_  \_  \_  \_
 0  1  2  3  4  5
 6  7  8  9 10 11
12 13 14 15 16 17
18 19 20 21 22 23
24 25 26 27 28 29

```

In other words, items of y are shifted in the direction of increasing indices.

---

### Common uses

1\. Compare each [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") in a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") with the next atom, making 1 in each position where the next atom has a higher [value](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary")

```
   p =. 3 1 4 1 5 9 2 6 5 3 5 8 9
   p > (|.!.0 p)
1 0 1 0 1 1 0 1 0 0 1 1 1

```
---

### Details

1\. The result of shift or rotate always has the same [shape](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET") as y.

-   Exception: if y is an atom and x is a list, the shape of y is extended with 1s to the length of x.

2\. x may be a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET"), in which case the atoms of x give the rotate/shift amount for successive [axes](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Axis "Vocabulary/Glossary") of y

```
   \]a =: 4 4 $ 'abcdefghijklmnop'
abcd
efgh
ijkl
mnop
   1 \_1 |. a   NB. Rotate up 1, right 1
hefg
lijk
pmno
dabc

```

3\. If the [fill atom](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Fill "Vocabulary/Glossary") f is empty, the standard [fill](https://code.jsoftware.com/wiki/Vocabulary/FramingFill "Vocabulary/FramingFill") based on the type of y will be used.

---
