# Vocabulary/stardot - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/starco "Vocabulary/starco") [<<](https://code.jsoftware.com/wiki/Vocabulary/star "Vocabulary/star")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d111.htm "jdic:d111")

<table class="wikitable"><tbody><tr><td><tt>*. y</tt></td><td>Length/Angle</td></tr></tbody></table>

[Rank 0](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank0l "Vocabulary/RankInfo") _\-- operates on individual atoms of y, producing a result of higher rank --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Converts x-y coordinates (given as a [complex](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Complex "Vocabulary/Glossary") number) to r-theta coordinates ("theta" being in radians). The angle is in the range (-π,π\]

```
   \*. 3j4   NB. x and y of 3-4-5 triangle
5 0.927295

```
---

### Common uses

To convert (x,y) to polar coordinates

```
   polar=: 4 : '\*. x j. y'
   30 polar 40
50 0.927295

```
---

[Real/Imag](https://code.jsoftware.com/wiki/Vocabulary/plusdot "Vocabulary/plusdot") (+. y), [Imaginary \* Complex](https://code.jsoftware.com/wiki/Vocabulary/jdot "Vocabulary/jdot") (j.), [Circle Functions](https://code.jsoftware.com/wiki/Vocabulary/odot "Vocabulary/odot") (x o. y), [Angle \* Polar](https://code.jsoftware.com/wiki/Vocabulary/rdot "Vocabulary/rdot") (r.)

---

<table class="wikitable"><tbody><tr><td><tt>x *. y</tt></td><td>LCM (And)</td></tr></tbody></table>

[Rank 0 0](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank00a "Vocabulary/RankInfo") _\-- operates on individual atoms of x and y, producing a result of the same shape --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

The logical operation **And** between two [Boolean](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boolean "Vocabulary/Glossary") [nouns](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Noun "Vocabulary/AbsolutelyEssentialTerms") x and y.

In the more general case where x or y are not Boolean, the result is the **Least Common Multiple** (LCM) of x and y.

```
   0 0 1 1 \*. 0 1 0 1
0 0 0 1
   (0 1) \*./ (0 1)      NB. Truth-table of: \*.
0 0
0 1
   (0 1) \*.table (0 1)  NB. Truth-table with borders
+--+---+
|\*.|0 1|
+--+---+
|0 |0 0|
|1 |0 1|
+--+---+
   \*. table i.13        NB. table defaults x to: y
+--+----------------------------------------+
|\*.|0  1  2  3  4  5  6  7  8  9  10  11  12|
+--+----------------------------------------+
| 0|0  0  0  0  0  0  0  0  0  0   0   0   0|
| 1|0  1  2  3  4  5  6  7  8  9  10  11  12|
| 2|0  2  2  6  4 10  6 14  8 18  10  22  12|
| 3|0  3  6  3 12 15  6 21 24  9  30  33  12|
| 4|0  4  4 12  4 20 12 28  8 36  20  44  12|
| 5|0  5 10 15 20  5 30 35 40 45  10  55  60|
| 6|0  6  6  6 12 30  6 42 24 18  30  66  12|
| 7|0  7 14 21 28 35 42  7 56 63  70  77  84|
| 8|0  8  8 24  8 40 24 56  8 72  40  88  24|
| 9|0  9 18  9 36 45 18 63 72  9  90  99  36|
|10|0 10 10 30 20 10 30 70 40 90  10 110  60|
|11|0 11 22 33 44 55 66 77 88 99 110  11 132|
|12|0 12 12 12 12 60 12 84 24 36  60 132  12|
+--+----------------------------------------+

```
---

### Common uses

To form a conditional statement

```
if. (0=#y) \*. (0=#x) do.
  ...

```

**Note** that both sides of x \*. y are always evaluated. There is no primitive that suppresses evaluation of one side if the other side is 0.

---

### More Information

[And video](https://www.youtube.com/watch?v=U1lXp6d7X50)

[Or](https://code.jsoftware.com/wiki/Vocabulary/plusdot#dyadic "Vocabulary/plusdot") (x +. y), [Not-Or](https://code.jsoftware.com/wiki/Vocabulary/plusco#dyadic "Vocabulary/plusco") (x +: y), [Not-And](https://code.jsoftware.com/wiki/Vocabulary/starco#dyadic "Vocabulary/starco") (x \*: y), [Not](https://code.jsoftware.com/wiki/Vocabulary/minusdot "Vocabulary/minusdot") (\-. y), [Boolean Functions](https://code.jsoftware.com/wiki/Vocabulary/bdot "Vocabulary/bdot") (m b.)

---

### Use These Combinations

Combinations using x \*. y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include:

<table class="wikitable"><tbody><tr><td><b>What It Does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td colspan="2"><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Primitives permitted in place of <tt>f</tt></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Is <tt>&nbsp;x f y </tt>true everywhere?</td><td><i>Permitted:</i> Boolean, integer, floating point, byte, symbol (<b>not</b> unicode).<p><br><tt>x</tt> and <tt>y</tt> need not be the same precision.</p></td><td><tt>x ([: *./ f) y</tt></td><td><tt>x *./@:f y</tt></td><td><tt>= ~: &lt; &lt;: &gt; &gt;: e.</tt></td><td><i>Permitted:</i> <tt>(f!.0)</tt><i> to force exact comparison.</i><br><i>(parentheses obligatory for </i><tt>x *./@:(f!.0) y</tt><i>)</i><p><br>J recognizes FLO <b>only if</b> <tt>f</tt> returns an atom or list.</p></td><td>Avoids computing entire <tt>&nbsp;x f y</tt><p><br><b>Bug warning:</b> if <tt>f</tt> is <tt>e.</tt> it does (<tt>,@e.</tt>) rather than <tt>e.</tt> regardless of ranks of arguments</p></td></tr></tbody></table>

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Do all cells of <tt>y</tt> match an <tt>m</tt>-item?</td><td></td><td><tt>*./@e.&amp;m y</tt></td><td></td><td><b>Bug warning:</b> it does <tt>(,@e.)</tt> rather than <tt>e.</tt></td></tr><tr><td>Boolean reductions on infixes</td><td>Boolean</td><td><tt>x +./\ y</tt></td><td><tt>x</tt> positive<p><tt>*. = ~:</tt> <small>in place of</small> +.</p></td><td><b>much</b> faster than alternatives</td></tr><tr><td>Mean on infixes</td><td>integer and floating-point</td><td><tt>x (+/%#)\ y</tt></td><td><tt>x</tt> positive<p><tt>*. = ~:</tt> <small>in place of</small> <tt>+</tt></p></td><td><b>much</b> faster than alternatives</td></tr><tr><td>Boolean reductions on partitions</td><td>Boolean</td><td><tt>x +//. y</tt></td><td><tt>= &lt;. &gt;. +. * *. ~:</tt> <small>in place of</small> <tt>+</tt></td><td>avoids building argument cells</td></tr><tr><td>Polynomial Multiplication (Boolean)</td><td>Boolean</td><td><tt>x ~://.@(*./) y</tt><p><tt>x ~://.@(+./) y</tt><br><tt>x +//.@(*./) y</tt><br><tt>x +//.@(+./) y</tt></p></td><td></td><td>avoids building argument cells</td></tr><tr><td>Boolean reductions along diagonals</td><td>Boolean</td><td><tt>+.//. y</tt></td><td><tt>*. = ~: &lt; &lt;: &gt; &gt;:</tt> <small>in place of</small> <tt>+.</tt></td><td>avoids building argument cells</td></tr></tbody></table>

---
