# Vocabulary/star - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/stardot "Vocabulary/stardot") [<<](https://code.jsoftware.com/wiki/Vocabulary/plusco "Vocabulary/plusco")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d110.htm "jdic:d110")

<table class="wikitable"><tbody><tr><td><tt>* y</tt></td><td>Signum</td></tr></tbody></table>

[Rank 0](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank0a "Vocabulary/RankInfo") _\-- operates on individual atoms of y, producing a result of the same shape --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

The _sign_ of the number y

<table class="wikitable"><tbody><tr><td><b>Condition</b></td><td><b>Result of <tt>*y</tt></b></td></tr><tr><td><tt>y&gt;0</tt></td><td><tt>1</tt></td></tr><tr><td><tt>y=0</tt></td><td><tt>0</tt></td></tr><tr><td><tt>y&lt;0</tt></td><td><tt>_1</tt></td></tr></tbody></table>

---

### Common uses

Locate negative elements in an [array](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Array "Vocabulary/AbsolutelyEssentialTerms") for special treatment

```
   \] z=: 10 - ?6 6 $ 20
 7 \_6  5  7 10 \_7
\_5  2  1  6  6  0
\_3 \_8 \_1  6 \_1 \_9
 3 \_2  5  3  3 \_7
\_1 \_5  5 \_8 \_3  0
\_1 \_4  6  9 \_6 \_4

   \*z
 1 \_1  1  1  1 \_1
\_1  1  1  1  1  0
\_1 \_1 \_1  1 \_1 \_1
 1 \_1  1  1  1 \_1
\_1 \_1  1 \_1 \_1  0
\_1 \_1  1  1 \_1 \_1

```
---

### More Information

[SignNum video](https://www.youtube.com/watch?v=Cxs5PpxSvi4)

[Real/Imag](https://code.jsoftware.com/wiki/Vocabulary/plusdot "Vocabulary/plusdot") (+. y), [Length/Angle](https://code.jsoftware.com/wiki/Vocabulary/stardot "Vocabulary/stardot") (\*. y), [Magnitude](https://code.jsoftware.com/wiki/Vocabulary/bar "Vocabulary/bar") (| y), [Imaginary \* Complex](https://code.jsoftware.com/wiki/Vocabulary/jdot "Vocabulary/jdot") (j.), [Circle Functions](https://code.jsoftware.com/wiki/Vocabulary/odot "Vocabulary/odot") (x o. y), [Angle \* Polar](https://code.jsoftware.com/wiki/Vocabulary/rdot "Vocabulary/rdot") (r.)

---

### Details

1\. \* y uses tolerant comparison; use \*!.0 for intolerant comparison. The [tolerance](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Tolerance "Vocabulary/Glossary") for \* is **absolute**: any number whose magnitude is less than the tolerance is considered to equal 0.

```
   1e\_30 = 0   NB. not zero by relative tolerance
0
   \* 1e\_30   NB. zero by absolute tolerance
0

```

2\. If y is [complex](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Complex "Vocabulary/Glossary"), [values](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary") that are not tolerantly equal to 0 produce (y % | y), which is a point on the unit circle on the line going from the origin to y (similar to a normalized or unit vector).

```
   \* -3j4
\_0.6j\_0.8
   -3r5j4r5
\_0.6j\_0.8
   | \* -3j4
1

```
---

<table class="wikitable"><tbody><tr><td><tt>x * y</tt></td><td>Times</td></tr></tbody></table>

[Rank 0 0](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank00a "Vocabulary/RankInfo") _\-- operates on individual atoms of x and y, producing a result of the same shape --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

The product of two [numeric](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Numeric "Vocabulary/Glossary") [nouns](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Noun "Vocabulary/AbsolutelyEssentialTerms"), x and y

```
   5 \* 7
35

   z \*/ z=. >: i.10	NB. multiplication table
 1  2  3  4  5  6  7  8  9  10
 2  4  6  8 10 12 14 16 18  20
 3  6  9 12 15 18 21 24 27  30
 4  8 12 16 20 24 28 32 36  40
 5 10 15 20 25 30 35 40 45  50
 6 12 18 24 30 36 42 48 54  60
 7 14 21 28 35 42 49 56 63  70
 8 16 24 32 40 48 56 64 72  80
 9 18 27 36 45 54 63 72 81  90
10 20 30 40 50 60 70 80 90 100

```
---

### Common uses

1\. Multiply two numbers

```
   100 \* 0 1 2
0 100 200

```

2\. Multiply the numbers in a given [list](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#List "Vocabulary/AbsolutelyEssentialTerms")

```
   \*/2 3 4
24

```
---

### Details

1\. Any number multiplied by 0, even the infinities \_ and \_\_, produces 0.  
The result has positive sign. This does not conform to IEEE-754, which mandates that the zero result have the proper sign and that multiplying by an infinity raise an error.

---

### Use These Combinations

Combinations using x \* y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Boolean reductions on partitions</td><td>Boolean</td><td><tt>x +//. y</tt></td><td><tt>= &lt;. &gt;. +. * *. ~:</tt> <small>in place of</small> <tt>+</tt></td><td>avoids building argument cells</td></tr><tr><td>Polynomial Multiplication</td><td></td><td><tt>x +//.@(*/) y</tt></td><td></td><td>avoids building argument cells</td></tr><tr><td>Odometer function (<tt>y</tt> gives the size of each wheel; result is all readings from 0 0 0 0 to <tt>y</tt>)</td><td>integer</td><td><tt>(#: i.@(*/)) y</tt></td><td><tt>@:</tt> <small>in place of</small> <tt>@</tt></td><td></td></tr></tbody></table>

---
