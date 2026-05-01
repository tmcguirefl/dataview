# Vocabulary/percent - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/percentdot "Vocabulary/percentdot") [<<](https://code.jsoftware.com/wiki/Vocabulary/minusco "Vocabulary/minusco")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d130.htm "jdic:d130")

<table class="wikitable"><tbody><tr><td><tt>% y</tt></td><td>Reciprocal</td></tr></tbody></table>

[Rank 0](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank0a "Vocabulary/RankInfo") _\-- operates on individual atoms of y, producing a result of the same shape --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Equivalent to 1 % y, the _reciprocal_ of the number y

```
   % 2
0.5
   % i.6
\_ 1 0.5 0.333333 0.25 0.2

```
---

### Details

1\. The reciprocals of positive and negative [infinity](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Infinity "Vocabulary/Glossary") are [positive and negative zero](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Zero "Vocabulary/Glossary"). Positive and negative zero are equal in all comparisons and behave identically except when you divide by them:

```
   poszero =: % \_
   negzero =: % \_\_
   poszero =!.0 negzero
1
   % poszero
\_
   % negzero
\_\_

```

The details of positive and negative zero are not repeatable across all J platforms.

### More Information

[Reciprocal video](https://www.youtube.com/watch?v=OqDVjoMGdsg)

---

<table class="wikitable"><tbody><tr><td><tt>x&nbsp;% y</tt></td><td>Divide</td></tr></tbody></table>

[Rank 0 0](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank00a "Vocabulary/RankInfo") _\-- operates on individual atoms of x and y, producing a result of the same shape --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

x divided by y

```
   1 % 2
0.5
   100 % i.6
\_ 100 50 33.3333 25 20

```
---

### Details

1\. 0 % 0 produces 0. See design rationale in [the paper by E. E. McDonnell](http://www.jsoftware.com/papers/zero.htm).

2\. Dividing nonzero by positive or negative [infinity](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Infinity "Vocabulary/Glossary") produces [positive or negative zero](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Zero "Vocabulary/Glossary"), and vice versa.

The details of positive and negative zero are not repeatable across all J platforms.

Positive and negative zero are equal in all comparisons and behave identically except when you divide by them.

```
   poszero =: % \_
   negzero =: % \_\_
   1 % (1 % \_)
\_
   1 % (1 % \_\_)
\_\_

```

3\. Dividing zero by a nonzero produces positive or negative zero.

```
   % 0 % \_1
\_\_
   % negzero % \_1
\_

```

4\. Dividing nonzero by positive or negative zero gives positive or negative [infinity.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Infinity "Vocabulary/Glossary")

5\. Dividing an extended integer by an integer (extended or not) produces an extended integer if the quotient is an integer, or a rational otherwise.

---

### Use These Combinations

Combinations using x % y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Mean on infixes</td><td>integer and floating-point</td><td><tt>x (+/%#)\ y</tt></td><td><tt>x</tt> positive<p><tt>*. = ~:</tt> <small>in place of</small> <tt>+</tt></p></td><td><b>much</b> faster than alternatives</td></tr><tr><td>Find mean of each partition</td><td></td><td><tt>x (+/&nbsp;% #)/. y</tt></td><td></td><td>avoids building argument cells</td></tr><tr><td>Integer divide</td><td>integer</td><td><tt>x &lt;.@% y</tt><p><tt>x &gt;.@% y</tt></p></td><td><tt>@:</tt> <small>in place of</small> <tt>@</tt></td><td>uses integer division</td></tr><tr><td>Mean with rank</td><td></td><td><tt>(+/&nbsp;% #) y</tt></td><td></td><td>Supported as a primitive by <tt>(+/&nbsp;% #)"n</tt></td></tr></tbody></table>

---
