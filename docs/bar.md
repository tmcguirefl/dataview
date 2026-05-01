# Vocabulary/bar - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/bardot "Vocabulary/bardot") [<<](https://code.jsoftware.com/wiki/Vocabulary/tildeco "Vocabulary/tildeco")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d230.htm "jdic:d230")

<table class="wikitable"><tbody><tr><td><tt>| y</tt></td><td>Magnitude</td></tr></tbody></table>

[Rank 0](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank0a "Vocabulary/RankInfo") _\-- operates on individual atoms of y, producing a result of the same shape --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

The _absolute value_ of [numeric](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Numeric "Vocabulary/Glossary") y. If y is [complex](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Complex "Vocabulary/Glossary"), |y is the magnitude of y.

```
   |5
5
   |\_5                 NB. absolute value
5
   i:3
\_3 \_2 \_1 0 1 2 3
   |i:3                NB. absolute values
3 2 1 0 1 2 3
   |3j\_4               NB. magnitude of complex number
5

```
---

### Common Uses

To separate out the absolute values and the signs of a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") of numbers

```
   (| ; \*) i:3
+-------------+----------------+
|3 2 1 0 1 2 3|\_1 \_1 \_1 0 1 1 1|
+-------------+----------------+

```
---

[Real/Imag](https://code.jsoftware.com/wiki/Vocabulary/plusdot "Vocabulary/plusdot") (+. y), [Signum (Unit Circle)](https://code.jsoftware.com/wiki/Vocabulary/star "Vocabulary/star") (\* y), [Length/Angle](https://code.jsoftware.com/wiki/Vocabulary/stardot "Vocabulary/stardot") (\*. y), [Imaginary \* Complex](https://code.jsoftware.com/wiki/Vocabulary/jdot "Vocabulary/jdot") (j.), [Circle Functions](https://code.jsoftware.com/wiki/Vocabulary/odot "Vocabulary/odot") (x o. y), [Angle \* Polar](https://code.jsoftware.com/wiki/Vocabulary/rdot "Vocabulary/rdot") (r.)

---

<table class="wikitable"><tbody><tr><td><tt>x | y</tt></td><td>Residue</td></tr></tbody></table>

[Rank 0 0](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank00a "Vocabulary/RankInfo") _\-- operates on individual atoms of x and y, producing a result of the same shape --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

The remainder when dividing a given number y by another given number x.

```
   7 | 50
1
   7 | 49
0

```
---

### Common uses

1\. Detect odd numbers in a given [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") of numbers

```
   i.7
0 1 2 3 4 5 6
   2 | i.7
0 1 0 1 0 1 0

```

2\. Detect perfect multiples in a given list of numbers

```
   0= 3 | i.7
1 0 0 1 0 0 1

```
---

[Antibase](https://code.jsoftware.com/wiki/Vocabulary/numberco "Vocabulary/numberco") ((0,x) #: y)

---

### More Information

1\. If you want both the quotient and remainder from a division, look at [Antibase](https://code.jsoftware.com/wiki/Vocabulary/numberco "Vocabulary/numberco") ((0,x) #: y).

---

### Details

1\. For finite x, x | y is extended to negative and [complex](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Complex "Vocabulary/Glossary") numbers by the definition x|y ==> y-x\*<. y % x+0=x. For infinite x, see below.

2\. The [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") will be between 0 and x, with equality possible only on the 0 side.

-   if x=0, the result is the same as y.
-   if x is real and infinite, the result is y if y has the same sign as x, x if y has opposite sign, 0 if y=0.
-   if x is [complex](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Complex "Vocabulary/Glossary") it may not have an infinite real or imaginary part.

3\. There is an implied [tolerant comparison](https://code.jsoftware.com/wiki/Vocabulary/Glossary#TolerantComp "Vocabulary/Glossary") in the computation of the residue. If y % x is tolerantly equal to an [integer](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Integer "Vocabulary/Glossary"), the result of x | y is 0. You can force intolerant comparison using |!.0.

---

### Use These Combinations

Combinations using x | y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Powers mod(m)</td><td>integer, extended integer</td><td><tt>x m&amp;|@^ y</tt><p><tt>m&amp;|@(n&amp;^) y</tt></p></td><td></td><td>Avoids the large result of exponentiation</td></tr><tr><td rowspan="2">Integer [quotient/]remainder of power of 2</td><td rowspan="2">integer</td><td><tt>x | y</tt></td><td>with <tt>x</tt> a power of 2</td><td>If x is positive, <tt>(-x) 17 b. y</tt> is better to get remainder</td></tr></tbody></table>

---
