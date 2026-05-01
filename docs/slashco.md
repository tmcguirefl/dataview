# Vocabulary/slashco - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/bslash "Vocabulary/bslash") [<<](https://code.jsoftware.com/wiki/Vocabulary/slashdot "Vocabulary/slashdot")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d422.htm "jdic:d422")

<table class="wikitable"><tbody><tr><td><tt>/: y</tt></td><td>Grade Up</td><td>Verb</td></tr></tbody></table>

<table class="wikitable"><tbody><tr><td><tt>\: y</tt></td><td>Grade Down</td><td>Verb</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank_iy "Vocabulary/RankInfo") _\-- operates on x and y as a whole, by items of y --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

The [permutation](http://www.jsoftware.com/help/phrases/permutations.htm "jphr:permutations") that sorts the [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of y into ascending (/:) or descending (\\:) order (numerical or lexicographical)

The atom at position i of (/: y) is the index in y of the ith-largest value of y.

```
   \] Wk=: ;:'Su Mo Tu We Th Fr Sa'
+--+--+--+--+--+--+--+
|Su|Mo|Tu|We|Th|Fr|Sa|
+--+--+--+--+--+--+--+
   \] p=: /: Wk
5 1 6 0 4 2 3
   p { Wk
+--+--+--+--+--+--+--+
|Fr|Mo|Sa|Su|Th|Tu|We|
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
Fr
Mo
Sa
Su
Th
Tu
We

```
---

### Common uses

Invert the [permutation](http://www.jsoftware.com/help/phrases/permutations.htm "jphr:permutations") q

Note that p{q is the _permutation product_ of permutations p and q

```
   \] q=: 10?10
8 7 6 9 5 2 0 4 1 3
   \] p=: /:q
6 8 5 9 7 4 2 1 0 3
   p{q
0 1 2 3 4 5 6 7 8 9

```
---

### Details

1\. The [permutations](http://www.jsoftware.com/help/phrases/permutations.htm "jphr:permutations") (/: y) and (\\: y) produce a [stable sort](https://en.wikipedia.org/wiki/Sorting_algorithm#Stability) (identical keys stay in order). To produce an anti-stable sort (identical keys order is reversed) use the following idioms:

```
   |.@\\: 1 3 3 2  NB. anti-stable Grade Up
0 3 2 1
   |.@/: 1 3 3 2  NB. anti-stable Grade Down
2 1 3 0

```

2\. Grading uses [intolerant comparison](https://code.jsoftware.com/wiki/Vocabulary/Glossary#TolerantComp "Vocabulary/Glossary").

3\. **Total ordering**: Any [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") can be ordered. The first [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") in a row is the most significant for ordering purposes; any [item](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") higher than 1 is flattened into a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") before ordering.

-   [Characters](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Character "Vocabulary/Glossary") are ordered according to the Unicode collating sequence. (For [bytes](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Byte "Vocabulary/Glossary"), this is the same as the ordering given by a.).
-   [Symbols](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Symbol "Vocabulary/Glossary") are ordered according to the order of the [character](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Character "Vocabulary/Glossary") [lists](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") they represent (if one [string](https://code.jsoftware.com/wiki/Vocabulary/Glossary#String "Vocabulary/Glossary") is a [prefix](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Prefix "Vocabulary/Glossary") of the other, the shorter string comes first)
-   [Complex](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Complex "Vocabulary/Glossary") values are ordered on real part first, then imaginary part.

[Boxes](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Box "Vocabulary/Glossary") are ordered according to their contents.

The order of priority for ordering-up between boxes with inhomogeneous contents is:

-   [Type:](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Type "Vocabulary/Glossary") [numeric](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Numeric "Vocabulary/Glossary") or [empty](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Empty "Vocabulary/Glossary"), [symbol](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Symbol "Vocabulary/Glossary"), [character](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Character "Vocabulary/Glossary") ([byte](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Byte "Vocabulary/Glossary") or [unicode](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Unicode "Vocabulary/Glossary")), and [boxed](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boxed "Vocabulary/Glossary"), are so ordered
-   [Rank:](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") lower comes before higher
-   [Values:](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary") compared after padding with [fills](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Fill "Vocabulary/Glossary") to the same [shape](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET")  -   [Symbols](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Symbol "Vocabulary/Glossary") are compared based on their symbol index, not the [character](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Character "Vocabulary/Glossary") [lists](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") they represent.
---

### Use These Combinations

Combinations using /: y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Find ordinal numbers of <tt>y</tt> (the relative rank of each item of <tt>y</tt> in the sort order</td><td></td><td><tt>/:@/: y</tt></td><td>note <tt>\:</tt> is <b>not</b> special</td><td>better than <tt>/:^:2 y</tt></td></tr><tr><td>Find the index of the <tt>x</tt>th-largest value of <tt>y</tt></td><td><tt>x</tt> is a Boolean or integer atom, <tt>y</tt> is an integer or floating-point list</td><td><tt>x ({ /:) y</tt></td><td><b>not</b> <tt>\:</tt></td><td>Partitions <tt>y</tt> using a randomly-selected pivot, so time and space results are variable, even for unchanging arguments</td></tr></tbody></table>

---

<table class="wikitable"><tbody><tr><td><tt>x /: y</tt></td><td><tt>y /: y</tt></td><td>Sort Up (Using)</td><td>Verb</td></tr></tbody></table>

<table class="wikitable"><tbody><tr><td><tt>x \: y</tt></td><td><tt>y \: y</tt></td><td>Sort Down (Using)</td><td>Verb</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank_ixiy "Vocabulary/RankInfo") _\-- operates on x and y as a whole, by items --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Sorts x using the order given by y.

i. e. applies to [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") x the [permutation](http://www.jsoftware.com/help/phrases/permutations.htm "jphr:permutations") that sorts [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") y into ascending (/:) or descending (\\:) order (whether numerical or lexicographical). Formally, (x /: y is ((/: y) { x).

If x and y are the same, the [noun](https://code.jsoftware.com/wiki/Vocabulary/AET#Noun "Vocabulary/AET") is sorted into order

```
   Wk=: ;:'Su Mo Tu We Th Fr Sa'   NB. As defined above
   (100+i.7) /: Wk
105 101 106 100 104 102 103

```
---

### Common uses

1\. Sort a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") y

```
   sort=: /:~   NB. (/:~ y) is the same as: (y /: y)
   sort Wk
+--+--+--+--+--+--+--+
|Fr|Mo|Sa|Su|Th|Tu|We|
+--+--+--+--+--+--+--+

```

**Note:** [Verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") sort\_z\_ is defined in stdlib.ijs as

```
sort=: /:~ :/:

```

sort is a

-   [Standard Library](http://www.jsoftware.com/help/user/library.htm) word(s) residing in the 'z'-locale
-   Defined in the factory script stdlib.ijs which is located in  ~system/main/stdlib.ijs-   View the definition(s) in a JQt session by entering:  open '~system/main/stdlib.ijs'

This uses [Monad-Dyad](https://code.jsoftware.com/wiki/Vocabulary/cou "Vocabulary/cou") (:) to define two separate [verbs](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") (/:~) and (/:) for [monadic](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Monad "Vocabulary/Glossary") and [dyadic](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Dyad "Vocabulary/Glossary") usage of the verb: sort.

2\. Find the _ordinal number_ of each [item](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of y, that is, the position each item would have if the [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") were sorted.

```
   /:@/: 3 1 4 1 5 9
2 0 3 1 4 5

```
---

### Details

1\. If x is an [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET"), x /: y is a one-atom [list.](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET")

2\. Sorting uses [intolerant comparison](https://code.jsoftware.com/wiki/Vocabulary/Glossary#TolerantComp "Vocabulary/Glossary").

3\. y may have fewer items than x. The result is ((/: y) { x).

### Use These Combinations

Combinations using x /: y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Find <tt>x</tt>th-largest value of <tt>y</tt></td><td><tt>x</tt> is a Boolean or integer atom, <tt>y</tt> is an integer or floating-point list</td><td><tt>x ({ /:~) y</tt></td><td><b>not</b> <tt>\:</tt></td><td>Partitions <tt>y</tt> using a randomly-selected pivot, so time and space results are variable, even for unchanging arguments</td></tr></tbody></table>

---
