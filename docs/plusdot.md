# Vocabulary/plusdot - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/plusco "Vocabulary/plusco") [<<](https://code.jsoftware.com/wiki/Vocabulary/plus "Vocabulary/plus")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d101.htm "jdic:d101")

<table class="wikitable"><tbody><tr><td><tt>+. y</tt></td><td>Real / Imaginary</td></tr></tbody></table>

[Rank 0](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank0l "Vocabulary/RankInfo") _\-- operates on individual atoms of y, producing a result of higher rank --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Decomposes complex numbers into real and imaginary parts

```
   +. 3j5
3 5
   +. 3j5 4j7
3 5
4 7
   +. 2 2$ 3j5 4j7 2j1 8
3 5
4 7

2 1
8 0

```
---

### Common uses

[Real/Imaginary video](https://www.youtube.com/watch?v=vOODKeE3OL0)

[Complex arithmetic](https://code.jsoftware.com/wiki/Essays/Complex_Operations "Essays/Complex Operations").

---

[Signum (Unit Circle)](https://code.jsoftware.com/wiki/Vocabulary/star "Vocabulary/star") (\* y), [Length/Angle](https://code.jsoftware.com/wiki/Vocabulary/stardot "Vocabulary/stardot") (\*. y), [Magnitude](https://code.jsoftware.com/wiki/Vocabulary/bar "Vocabulary/bar") (\* y), [Imaginary \* Complex](https://code.jsoftware.com/wiki/Vocabulary/jdot "Vocabulary/jdot") (j.), [Circle Functions](https://code.jsoftware.com/wiki/Vocabulary/odot "Vocabulary/odot") (x o. y), [Angle \* Polar](https://code.jsoftware.com/wiki/Vocabulary/rdot "Vocabulary/rdot") (r.)

---

<table class="wikitable"><tbody><tr><td><tt>x +. y</tt></td><td>GCD (Or)</td></tr></tbody></table>

[Rank 0 0](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank00a "Vocabulary/RankInfo") _\-- operates on individual atoms of x and y, producing a result of the same shape --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

The logical operation **Or** between two [Boolean](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boolean "Vocabulary/Glossary") [nouns](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Noun "Vocabulary/AbsolutelyEssentialTerms") x and y.

In the more general case where x or y are not Boolean, the result is the **Greatest Common Divisor** ([GCD](https://en.wikipedia.org/wiki/Greatest_common_denominator "wikipedia:Greatest common denominator")) of x and y.

```
   0 0 1 1 +. 0 1 0 1
0 1 1 1
   (0 1) +./ (0 1)      NB. Truth-table of: +.
0 1
1 1
   (0 1) +.table (0 1)  NB. Truth-table with borders
+--+---+
|+.|0 1|
+--+---+
|0 |0 1|
|1 |1 1|
+--+---+
   +. table i.13        NB. table defaults x to: y
+--+-----------------------------+
|+.| 0 1 2 3 4 5 6 7 8 9 10 11 12|
+--+-----------------------------+
| 0| 0 1 2 3 4 5 6 7 8 9 10 11 12|
| 1| 1 1 1 1 1 1 1 1 1 1  1  1  1|
| 2| 2 1 2 1 2 1 2 1 2 1  2  1  2|
| 3| 3 1 1 3 1 1 3 1 1 3  1  1  3|
| 4| 4 1 2 1 4 1 2 1 4 1  2  1  4|
| 5| 5 1 1 1 1 5 1 1 1 1  5  1  1|
| 6| 6 1 2 3 2 1 6 1 2 3  2  1  6|
| 7| 7 1 1 1 1 1 1 7 1 1  1  1  1|
| 8| 8 1 2 1 4 1 2 1 8 1  2  1  4|
| 9| 9 1 1 3 1 1 3 1 1 9  1  1  3|
|10|10 1 2 1 2 5 2 1 2 1 10  1  2|
|11|11 1 1 1 1 1 1 1 1 1  1 11  1|
|12|12 1 2 3 4 1 6 1 4 3  2  1 12|
+--+-----------------------------+

```
---

### Common uses

To form a conditional statement

```
if. (0=#y) +. (y=0) do.
  ...

```

**Note** that both sides of x +. y are always evaluated. There is no primitive that suppresses evaluation of one side if the other side produces 1.

To test if x and y are _relatively-prime_ (result will be 1 if so)

```
   12 +. 20     NB. factor 4 is the largest both numbers share (GCD)
4
   21 +. 20     NB. both numbers are composite, but co-prime (no common prime factors)
1

```
---

### More Information

[Or video](https://www.youtube.com/watch?v=jq7l9XSMCG0)

[Not-Or](https://code.jsoftware.com/wiki/Vocabulary/plusco#dyadic "Vocabulary/plusco") (x +: y), [LCM (And)](https://code.jsoftware.com/wiki/Vocabulary/stardot#dyadic "Vocabulary/stardot") (x \*. y), [Not-And](https://code.jsoftware.com/wiki/Vocabulary/starco#dyadic "Vocabulary/starco") (x \*: y), [Not](https://code.jsoftware.com/wiki/Vocabulary/minusdot "Vocabulary/minusdot") (\-. y), [Boolean Functions](https://code.jsoftware.com/wiki/Vocabulary/bdot "Vocabulary/bdot") (m b.)

---

### Use These Combinations

Combinations using x +. y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include:

<table class="wikitable"><tbody><tr><td><b>What It Does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td colspan="2"><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Primitives permitted in place of <tt>f</tt></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Is <tt>&nbsp;x f y </tt>true anywhere?</td><td><i>Permitted:</i> Boolean, integer, floating point, byte, symbol (<b>not</b> unicode).<p><br><tt>x</tt> and <tt>y</tt> need not be the same precision.</p></td><td><tt>x ([: +./ f) y</tt></td><td><tt>x +./@:f y</tt></td><td><tt>= ~: &lt; &lt;: &gt; &gt;: e. E.</tt></td><td><i>Permitted:</i> <tt>(f!.0)</tt><br><i>to force exact comparison.</i><p><i>(parentheses obligatory eg.</i><br><tt>x +./@:(f!.0) y </tt><i>)</i><br>J recognizes FLO <b>only if</b> <tt>f</tt> returns an atom or list.</p></td><td>Avoids computing entire <tt>&nbsp;x f y</tt><p><br><b>Bug warning:</b> if <tt>f</tt> is <tt>e.</tt> it does (<tt>,@e.</tt>) rather than <tt>e.</tt> regardless of ranks of arguments</p></td></tr></tbody></table>

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Do any cells of <tt>y</tt> match an <tt>m</tt>-item?</td><td></td><td><tt>+./@e.&amp;m y</tt></td><td></td><td><b>Bug warning:</b> it does <tt>(,@e.)</tt> rather than <tt>e.</tt></td></tr><tr><td>Boolean reductions on infixes</td><td>Boolean</td><td><tt>x +./\ y</tt></td><td><tt>x</tt> positive<p><tt>*. = ~:</tt> <small>in place of</small> +.</p></td><td><b>much</b> faster than alternatives</td></tr><tr><td>Boolean reductions on partitions</td><td>Boolean</td><td><tt>x +//. y</tt></td><td><tt>= &lt;. &gt;. +. * *. ~:</tt> <small>in place of</small> <tt>+</tt></td><td>avoids building argument cells</td></tr><tr><td>Polynomial Multiplication (Boolean)</td><td>Boolean</td><td><tt>x ~://.@(*./) y</tt><p><tt>x ~://.@(+./) y</tt><br><tt>x +//.@(*./) y</tt><br><tt>x +//.@(+./) y</tt></p></td><td></td><td>avoids building argument cells</td></tr><tr><td>Boolean reductions along diagonals</td><td>Boolean</td><td><tt>+.//. y</tt></td><td><tt>*. = ~: &lt; &lt;: &gt; &gt;:</tt> <small>in place of</small> <tt>+.</tt></td><td>avoids building argument cells</td></tr></tbody></table>

---
