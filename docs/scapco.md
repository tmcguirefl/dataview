# Vocabulary/scapco - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/tdot "Vocabulary/tdot") [<<](https://code.jsoftware.com/wiki/Vocabulary/sco "Vocabulary/sco")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/dscapco.htm "jdic:dscapco")

<table class="wikitable"><tbody><tr><td><tt>[x] u S: n y</tt></td><td>Spread</td><td>Conjunction</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank_~ "Vocabulary/RankInfo") _\-- operates on \[x and\] y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

(u S:0 y) applies [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") u to each [leaf](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Leaf "Vocabulary/Glossary") of y, creating an [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") whose [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") are the [results](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") of the leaves, with [framing fill](https://code.jsoftware.com/wiki/Vocabulary/FramingFill "Vocabulary/FramingFill") added as needed.

Contrast this with [Level At](https://code.jsoftware.com/wiki/Vocabulary/lcapco "Vocabulary/lcapco") (u L:0 y), which returns a result in which each leaf of y has been **replaced** by the result of executing u on it.

A [leaf](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Leaf "Vocabulary/Glossary") of y is a [noun](https://code.jsoftware.com/wiki/Vocabulary/AET#Noun "Vocabulary/AET") inside y that itself has no [boxed](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boxed "Vocabulary/Glossary") [contents.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Content "Vocabulary/Glossary")

A leaf is either [empty](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Empty "Vocabulary/Glossary") or [unboxed.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Unboxed "Vocabulary/Glossary")

```
   \] y=: (<0 1),(<<2 3),(<<<4 5)
+---+-----+-------+
|0 1|+---+|+-----+|
|   ||2 3|||+---+||
|   |+---+|||4 5|||
|   |     ||+---+||
|   |     |+-----+|
+---+-----+-------+
   NB. y is sample noun of nested boxed items
   NB. --The leaves are (0 1), (2 3) and (4 5)

   u=: |.   NB. sample verb (Reverse) to apply to leaves

   u S:0 y
1 0
3 2
5 4

```

Compare this with the action of [Level At](https://code.jsoftware.com/wiki/Vocabulary/lcapco "Vocabulary/lcapco") (L:)

(\[x\] u S:n y) applies u to the leaves of y in the same way as (\[x\] u L:n y) but it collects the [results](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") as the [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of an [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET").

See [Level At](https://code.jsoftware.com/wiki/Vocabulary/lcapco "Vocabulary/lcapco") (L:) for details, including

-   values of n other than 0
-   negative values of n
-   the dyadic case (x S: n y)
---

### Common Uses

Apply [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") u to the [leaves](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Leaf "Vocabulary/Glossary") (innermost [opened](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Open "Vocabulary/Glossary") [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET")) of a [boxed](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boxed "Vocabulary/Glossary") [noun](https://code.jsoftware.com/wiki/Vocabulary/AET#Noun "Vocabulary/AET") y

```
   \] y=: 'alpha' ; 'bravo' ;'charlie'
+-----+-----+-------+
|alpha|bravo|charlie|
+-----+-----+-------+

   toupper S:0 y
ALPHA
BRAVO
CHARLIE

```
---

[Level Of](https://code.jsoftware.com/wiki/Vocabulary/lcapdot "Vocabulary/lcapdot") (L. y), [Level At](https://code.jsoftware.com/wiki/Vocabulary/lcapco "Vocabulary/lcapco") (u L: n)

---
