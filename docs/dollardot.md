# Vocabulary/dollardot - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/dollarco "Vocabulary/dollarco") [<<](https://code.jsoftware.com/wiki/Vocabulary/dollar "Vocabulary/dollar")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d211.htm "jdic:d211")

<table class="wikitable"><tbody><tr><td><tt>$. y</tt></td><td>Sparse</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank "Vocabulary/RankInfo") _\-- operates on x and y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Gives a [noun](https://code.jsoftware.com/wiki/Vocabulary/AET#Noun "Vocabulary/AET") that can replace ([numeric](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Numeric "Vocabulary/Glossary")) y in working code, with only the non-zero [atoms](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") of $.y stored in memory. See the [entry in the J Dictionary](https://www.jsoftware.com/help/dictionary/d211.htm "jdic:d211") for details

When $.y is displayed in the J session, only its non-zero atoms are shown, together with their [indexes.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Index "Vocabulary/Glossary")

```
   $ y=: 0 0 1 0 2.5 0 0 999 \_ 0 0 0
12
   \] z=: $.y
2 |   1
4 | 2.5
7 | 999
8 |   \_
   $ z
12

```
---

### Common uses

To save storage when storing a sparse [array.](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET")

---

### Oddities

Operations on a sparse matrix can change the sparse value. Confusing to the unaware.

```
   $. 3 {. 1
0 │ 1

   NB. One might expect to see 999 here.
   999 \* -. $. 3 {. 1
0 │ 0

   NB. the sparse element changed.
   3 $. 999 \* -. $. 3 {. 1
999

```
---

<table class="wikitable"><tbody><tr><td><tt>x $. y</tt></td><td>Sparse</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank "Vocabulary/RankInfo") _\-- operates on x and y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

n&$. is a collection of functions for creating and handling [sparse arrays](https://code.jsoftware.com/wiki/Vocabulary/Glossary#SparseArray "Vocabulary/Glossary") and converting them to/from ordinary arrays.

The noun n can take one of the values 0 1 2 3 4 5 7 8 or their negations. See the [entry in the J Dictionary](https://www.jsoftware.com/help/dictionary/d211.htm "jdic:d211") for details of the actual function specified by n plus the form of the y\-[argument](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET") it expects.

---

Chapter [30](http://www.jsoftware.com/help/learning/30.htm) of 'Learning J' by Roger Stokes (also accessible via 'LJ' from the J Help pages) gently introduces to Sparse Arrays, going through various examples.

---
