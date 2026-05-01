# Vocabulary/tildeco - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/bar "Vocabulary/bar") [<<](https://code.jsoftware.com/wiki/Vocabulary/tildedot "Vocabulary/tildedot")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d222.htm "jdic:d222")

<table class="wikitable"><tbody><tr><td><tt>~: y</tt></td><td>Nub Sieve</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank_iy "Vocabulary/RankInfo") _\-- operates on x and y as a whole, by items of y --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

A [Boolean](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boolean "Vocabulary/Glossary") [vector](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Vector "Vocabulary/Glossary") with one [value](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary") per [item](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of y . Which is 1 if the item does not match any previous item.

Therefore, 1s in the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") indicate the positions of the unique items of y.

```
   z=: 'abracadabra'
   ~.z	NB. Nub z - the unique values
abrcd
   ~:z	NB. Nub Sieve z
1 1 1 0 1 0 1 0 0 0 0
   (~:z) # z   NB. another way to get the unique values
abrcd

```
---

### Common Uses

1\. Wherever data is held in 2 parallel [lists](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET"), Nub Sieve (~:) yields a [vector](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Vector "Vocabulary/Glossary") capable of pruning the second list to match the [Nub](https://code.jsoftware.com/wiki/Vocabulary/tildedot "Vocabulary/tildedot") (~.) of the first.

```
   NAME=: 'Joe' ; 'Bob' ; 'Jim' ; 'Mary' ; 'Jim'
   AGE=: 25 60 32 21 33

   \] z=. ~: NAME	NB. "sieve" to apply to AGE
1 1 1 1 0
   \] NAME=: ~. NAME
+---+---+---+----+
|Joe|Bob|Jim|Mary|
+---+---+---+----+
   \] AGE=: z # AGE
25 60 32 21

```
---

[Nub](https://code.jsoftware.com/wiki/Vocabulary/tildedot "Vocabulary/tildedot") (~. y)

---

### Details

1\. ~: y is a member of [the i. family](https://code.jsoftware.com/wiki/Vocabulary/IFamily "Vocabulary/IFamily"). 1. ~: y uses [tolerant comparison](https://code.jsoftware.com/wiki/Vocabulary/Glossary#TolerantComp "Vocabulary/Glossary"). Use ~:!.0 y for intolerant comparison. Because of tolerant comparison, the number of 1s in ~: y may depend on the order of the [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of y. 1. ~. y is equivalent to (~: y) # y. 1. The [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") of ~: y is always a [list.](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET")

---

<table class="wikitable"><tbody><tr><td><tt>x ~: y</tt></td><td>Not-Equal</td></tr></tbody></table>

[Rank 0 0](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank00a "Vocabulary/RankInfo") _\-- operates on individual atoms of x and y, producing a result of the same shape --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

The [Boolean](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boolean "Vocabulary/Glossary") [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") of comparing two [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET"), or [lists](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") of items, [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") by atom.

Use NotMatch (x -.@-: y) to see if two **entire nouns** are different.

```
   \]z=: i.5
0 1 2 3 4
   3 ~: z
1 1 1 0 1
   z ~: z
0 0 0 0 0
   z ~: |.z
1 1 0 1 1

```

[Not-Equal](#dyadic) (~:) works between [boxed](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boxed "Vocabulary/Glossary") items too:

```
   z=: 'alpha' ; 'bravo' ; 'charlie'
   z ~: |.z
1 0 1
   z ~: <'bravo'
1 0 1

```

To avoid x~:y giving length error, the [Shape Of](https://code.jsoftware.com/wiki/Vocabulary/dollar "Vocabulary/dollar") ($) x and y must follow the rules for [Plus](https://code.jsoftware.com/wiki/Vocabulary/plus#dyadic "Vocabulary/plus") (+).

---

### Common Uses

1\. To construct criteria for conditional expressions in [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") [definitions](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Defined "Vocabulary/Glossary")

```
 if. '.' ~: y do. return. end.
NB. instead of:
 if. -. '.' = y do. return. end.

```
---

[Equal](https://code.jsoftware.com/wiki/Vocabulary/eq#dyadic "Vocabulary/eq") (x = y), [Larger Than](https://code.jsoftware.com/wiki/Vocabulary/gt#dyadic "Vocabulary/gt") (x > y), [Larger Or Equal](https://code.jsoftware.com/wiki/Vocabulary/gtco#dyadic "Vocabulary/gtco") (x >: y), [Less Than](https://code.jsoftware.com/wiki/Vocabulary/lt#dyadic "Vocabulary/lt") (x < y), [Less Or Equal](https://code.jsoftware.com/wiki/Vocabulary/ltco#dyadic "Vocabulary/ltco") (x <: y), [Match](https://code.jsoftware.com/wiki/Vocabulary/minusco#dyadic "Vocabulary/minusco") (x -: y)

---

### More Information

1\. See [the rules for equality](https://code.jsoftware.com/wiki/Vocabulary/eq#eqdetails "Vocabulary/eq") for a discussion of [tolerant comparison](https://code.jsoftware.com/wiki/Vocabulary/Glossary#TolerantComp "Vocabulary/Glossary") and [nonnumeric](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Numeric "Vocabulary/Glossary") [arguments](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET").

---

### Performance Note

Comparisons are fastest when the precisions are identical. If an atom is compared against an array, it helps to choose the right precision for the atom.

```
   0. ~: %: i. 10  NB. float list: faster than 0 ~:
   00 ~: i. 10  NB.  integer list: faster than 0 ~:

```
---

### Use These Combinations

Combinations using x ~: y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include those shown in [Searching and Matching Items: Fast List Operations (FLOs)](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations#FLOs "Vocabulary/SpecialCombinations"), as well as the following:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Boolean reductions on infixes</td><td>Boolean</td><td><tt>x +./\ y</tt></td><td><tt>x</tt> positive<p><tt>*. = ~:</tt> <small>in place of</small> +.</p></td><td><b>much</b> faster than alternatives</td></tr><tr><td>Mean on infixes</td><td>integer and floating-point</td><td><tt>x (+/%#)\ y</tt></td><td><tt>x</tt> positive<p><tt>*. = ~:</tt> <small>in place of</small> <tt>+</tt></p></td><td><b>much</b> faster than alternatives</td></tr><tr><td>Boolean reductions on partitions</td><td>Boolean</td><td><tt>x +//. y</tt></td><td><tt>= &lt;. &gt;. +. * *. ~:</tt> <small>in place of</small> <tt>+</tt></td><td>avoids building argument cells</td></tr><tr><td>Polynomial Multiplication (Boolean)</td><td>Boolean</td><td><tt>x ~://.@(*./) y</tt><p><tt>x ~://.@(+./) y</tt><br><tt>x +//.@(*./) y</tt><br><tt>x +//.@(+./) y</tt></p></td><td></td><td>avoids building argument cells</td></tr><tr><td>Boolean reductions along diagonals</td><td>Boolean</td><td><tt>+.//. y</tt></td><td><tt>*. = ~: &lt; &lt;: &gt; &gt;:</tt> <small>in place of</small> <tt>+.</tt></td><td>avoids building argument cells</td></tr></tbody></table>

---
