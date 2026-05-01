# Vocabulary/bslashco - J Wiki

From J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/squarelf "Vocabulary/squarelf") [<<](https://code.jsoftware.com/wiki/Vocabulary/bslashdot "Vocabulary/bslashdot")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d432.htm "jdic:d432")

<table class="wikitable"><tbody><tr><td><tt>\: y</tt></td><td>Grade Down</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank_iy "Vocabulary/RankInfo") _\-- operates on x and y as a whole, by items of y --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

The [permutation](http://www.jsoftware.com/help/phrases/permutations.htm) that sorts list y into descending order (numerical or lexicographical)

Companion verb to /:

```
   \] p=: \\: Wk
3 2 4 0 6 1 5
   p { Wk
+--+--+--+--+--+--+--+
|We|Tu|Th|Su|Sa|Mo|Fr|
+--+--+--+--+--+--+--+
   \] Wko=: > Wk
Su
Mo
Tu
We
Th
Fr
Sa
   p { Wko   NB. also works with unboxed list
We
Tu
Th
Su
Sa
Mo
Fr

```

### See Also

-   [Grade Up](https://code.jsoftware.com/wiki/Vocabulary/slashco "Vocabulary/slashco") /:
-   [Entry in the J Dictionary](https://www.jsoftware.com/help/dictionary/d432.htm "jdic:d432") for \\:
---

<table class="wikitable"><tbody><tr><td><tt>x \: y</tt></td><td>Sort</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank_ixiy "Vocabulary/RankInfo") _\-- operates on x and y as a whole, by items --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Applies to list x the [permutation](http://www.jsoftware.com/help/phrases/permutations.htm) that sorts list y into descending order (numerical or lexicographical)

Companion verb to /:

```
   (100+i.7) \\: Wk
103 102 104 100 106 101 105

```

### Common uses

Sort a list y into descending order

(Wk is as defined above)

```
   tros=: \\:~   NB. (/:~ y) is the same as: (y /: y)
   tros Wk
+--+--+--+--+--+--+--+
|We|Tu|Th|Su|Sa|Mo|Fr|
+--+--+--+--+--+--+--+

```

### See Also

-   [Grade Up](https://code.jsoftware.com/wiki/Vocabulary/slashco "Vocabulary/slashco") /:
-   [Entry in the J Dictionary](https://www.jsoftware.com/help/dictionary/d432.htm "jdic:d432") for \\:
---
