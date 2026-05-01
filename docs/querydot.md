# Vocabulary/querydot - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/adot "Vocabulary/adot") [<<](https://code.jsoftware.com/wiki/Vocabulary/query "Vocabulary/query")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d641.htm "jdic:d641")

<table class="wikitable"><tbody><tr><td><tt>?. y</tt></td><td>Roll / fixed seed</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank "Vocabulary/RankInfo") _\-- operates on x and y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

<table class="wikitable"><tbody><tr><td><tt>x&nbsp;?. y</tt></td><td>Deal / fixed seed</td></tr></tbody></table>

[Rank 0 0](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank00var "Vocabulary/RankInfo") _\-- operates on individual atoms of x and y, producing a result that may require fill --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Behaves like [Roll/Deal](https://code.jsoftware.com/wiki/Vocabulary/query "Vocabulary/query") (?) — except that the random-number generator (RNG) is reset each time ?. is executed.

This ensures that any two executions of ?. with the same [arguments](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET") will produce the same sequence of random numbers

```
   (?.10) ; (?.10)
+-+-+
|6|6|
+-+-+
   ?. 10#100
46 55 79 52 54 39 60 57 60 94
   ?. 10#100
46 55 79 52 54 39 60 57 60 94

   3?.10
6 9 1
   3?.10
6 9 1

```
---

### Common uses

Generate reproducible "random number" samples.

Run a reproducible Monte-Carlo simulation.

---

[Roll/Deal](https://code.jsoftware.com/wiki/Vocabulary/query "Vocabulary/query") (?)

---

### More Information

1\. Executing ?. does not change the state of the RNG used by ? .

2\. The [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") of  ?.y is infinite, in contrast to  ?y which has rank 0. This is because re-executing (?.) on each [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") would reset the RNG for each atom, with the result that all the [results](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") would be the same.

---

### Details

1\. (?.) uses RNG 1, GB\_Flip.

2\. Each execution of ?. resets the RNG using a seed of 16807 before generating results.

---

### Use These Combinations

Combinations using  ?. y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Arrays of random numbers</td><td></td><td><tt>x&nbsp;?@$ y</tt><p><tt>x([:&nbsp;? $)y</tt></p></td><td><tt>?.</tt> <small>in place of</small> <tt>?</tt><p><tt>@:</tt> <small>in place of</small> <tt>@</tt><br><tt>#</tt> <small>in place of</small> <tt>$</tt></p></td><td>does not create <tt>x $ y</tt></td></tr></tbody></table>

---
