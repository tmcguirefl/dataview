# Vocabulary/gtdot - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/gtco "Vocabulary/gtco") [<<](https://code.jsoftware.com/wiki/Vocabulary/gt "Vocabulary/gt")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d021.htm "jdic:d021")

<table class="wikitable"><tbody><tr><td><tt>&gt;. y</tt></td><td>Ceiling</td></tr></tbody></table>

[Rank 0](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank0a "Vocabulary/RankInfo") _\-- operates on individual atoms of y, producing a result of the same shape --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

The _ceiling_ of y i.e. the smallest [integer](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Integer "Vocabulary/Glossary") greater than or equal to y

```
   >. 4.6
5

   >. 4.2 4.5 4.6
5 5 5

   >. 4.6 4 \_4 \_4.6
5 4 \_4 \_4

```

> [![](https://code.jsoftware.com/mediawiki/images/c/cb/Warning.png)](https://code.jsoftware.com/wiki/File:Warning.png) The result of \>. y may not have integer type.
> 
>   
> If y is too large or too small to be represented as an integer, it will be left in floating point form. Furthermore, \>. y is always complex for complex y.

**Ceiling** (\>.) uses [tolerant comparison](https://code.jsoftware.com/wiki/Vocabulary/Glossary#TolerComp "Vocabulary/Glossary"). \>. y is y rounded towards ∞, except that if y is tolerantly equal to an integer, \>. y is that integer. For more information, read about [tolerant floor and ceiling](https://code.jsoftware.com/wiki/Essays/Tolerant_Comparison#Tolerant_Floor_and_Ceiling "Essays/Tolerant Comparison"). To require exact comparison, use (\>.!.0) in place of (\>.) to temporarily set the comparison [tolerance](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Tolerance "Vocabulary/Glossary") to zero.

```
   >. 100.000000000001
100
   >.!.0 (100.000000000001)
101

```
---

### Common uses

1\. Test whether [numbers](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Numeric "Vocabulary/Glossary") are [integers](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Integer "Vocabulary/Glossary") or not.

can also use [Floor](https://code.jsoftware.com/wiki/Vocabulary/ltdot#monadic "Vocabulary/ltdot") (<.))

```
   3 3.14 5 = >. 3 3.14 5
1 0 1

```

2\. Convert [floating-point](https://code.jsoftware.com/wiki/Vocabulary/Glossary#FloatingPoint "Vocabulary/Glossary") representations of [integers](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Integer "Vocabulary/Glossary") (8 bytes per value) to integers (4 bytes per value) in order to save memory

Such [values](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary") can arise as a result of arithmetic operations like [Divide](https://code.jsoftware.com/wiki/Vocabulary/percent#dyadic "Vocabulary/percent") (%)

```
   \] N=: 27 % 9
3
   datatype N
floating
   \] n=: >. 27 % 9         NB. alternatively:  n=: 27 >.@:% 9
3
   datatype n
integer

```
---

[Floor](https://code.jsoftware.com/wiki/Vocabulary/ltdot#monadic "Vocabulary/ltdot") (<. y)

---

### Details

1\. \>. y is equal to \- <. - y.

2\. For [complex](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Complex "Vocabulary/Glossary") y, consider the equivalent form: (\- <. - y) and refer to [complex floor](https://code.jsoftware.com/wiki/Vocabulary/ltdot#ComplexFloor "Vocabulary/ltdot").

3\. \>. y uses tolerant comparison, which means an integer is considered equal to y if its difference from y is less than the y\*_tolerance_. If y is so big that y\*_tolerance_ is greater than 1, results can be surprising: the smallest integer tolerantly equal to y could be considerably **smaller** than y. The implementation defines \>. y as the integer closest to y, if that integer is tolerantly equal to y; otherwise the next-larger integer.

---

### Use These Combinations

Combinations using \>. y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Integer-result operations</td><td>extended integer</td><td><tt>&lt;.@f y</tt><p><tt>x &lt;.@f y</tt><br><small>(<tt>f</tt> is any verb)</small></p></td><td><tt>&lt;.</tt> <small>in place of</small> <tt>&gt;.</tt></td><td>Avoids non-integer intermediate results</td></tr><tr><td>Integer divide</td><td>integer</td><td><tt>x &lt;.@% y</tt><p><tt>x &gt;.@% y</tt></p></td><td><tt>@:</tt> <small>in place of</small> <tt>@</tt></td><td>uses integer division</td></tr></tbody></table>

---

<table class="wikitable"><tbody><tr><td><tt>x &gt;. y</tt></td><td>Larger of (Max)</td></tr></tbody></table>

[Rank 0 0](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank00a "Vocabulary/RankInfo") _\-- operates on individual atoms of x and y, producing a result of the same shape --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

The larger [atoms](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Atom "Vocabulary/Glossary") of x and y

```
   3 >. 4
4

   3 >. 4 \_4
4 3

   2 3 >. 4 1
4 3

```
---

### Common uses

1\. Find the maximum [value](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary") in a [list](https://code.jsoftware.com/wiki/Vocabulary/Glossary#List "Vocabulary/Glossary")

Use in conjunction with [Insert](https://code.jsoftware.com/wiki/Vocabulary/slash "Vocabulary/slash") (/)

```
   >./ 7 8 5 9 2
9

```

2\. Find the running maximum in a [list](https://code.jsoftware.com/wiki/Vocabulary/Glossary#List "Vocabulary/Glossary") (scanned from left to right)

Use in conjunction with [Insert](https://code.jsoftware.com/wiki/Vocabulary/slash "Vocabulary/slash") (/) and [Prefix](https://code.jsoftware.com/wiki/Vocabulary/bslash "Vocabulary/bslash") (\\)

```
   >./\\ 7 8 5 9 2
7 8 8 9 9

```
---

[Lesser Of (Min)](https://code.jsoftware.com/wiki/Vocabulary/ltdot#dyadic "Vocabulary/ltdot") (x <. y)

---

### More Information

0\. [Larger Of (Max) video](https://www.youtube.com/watch?v=nlqFEzmWT1w)

1\. If an [argument](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Argument "Vocabulary/AbsolutelyEssentialTerms") to x >. y is [complex](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Complex "Vocabulary/Glossary"), its imaginary part must be tolerantly equal to 0, using the default [tolerance](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Tolerance "Vocabulary/Glossary") of 2^\_44 even if the comparison x >. y itself uses a different tolerance. The result will have floating-point [precision.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Precision "Vocabulary/Glossary")

2\. If x >. y has arguments of different precisions, the arguments are converted to the higher-priority precision as described [here](https://code.jsoftware.com/wiki/Vocabulary/NumericPrecisions "Vocabulary/NumericPrecisions"). The conversion may turn an argument into a smaller or larger value, especially if a large 64-bit integer is converted to floating-point.

```
   <. 9223372036854765500 >. 0.5
9223372036854765568
   <. 9223372036854765580 >. 0.5
9223372036854765568

```
---

### Use These Combinations

Combinations using x >. y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Find index of first/last occurrence of largest/smallest value</td><td>integer or floating-point list</td><td><tt>(i. &lt;./) y</tt><p><tt>(i. &gt;./) y</tt></p></td><td>or <tt>i:</tt></td><td>it actually does <tt>(i. &gt;.!.0/)</tt> etc.; is faster than <tt>0 ({ /:~) y</tt></td></tr><tr><td>Reductions on infixes</td><td>Boolean, integer, floating-point</td><td><tt>x +/\ y</tt></td><td><tt>&lt;. &gt;.</tt> <small>in place of</small> <tt>+</tt></td><td><b>much</b> faster than alternatives</td></tr><tr><td>Boolean reductions on partitions</td><td>Boolean</td><td><tt>x +//. y</tt></td><td><tt>= &lt;. &gt;. +. * *. ~:</tt> <small>in place of</small> <tt>+</tt></td><td>avoids building argument cells</td></tr><tr><td>Reductions on partitions</td><td>integer, floating-point</td><td><tt>x +//. y</tt></td><td><tt>&lt;. &gt;.</tt> <small>in place of</small> <tt>+</tt></td><td>avoids building argument cells</td></tr><tr><td>Max/min along diagonals</td><td>non-complex numeric</td><td><tt>&gt;.//. y</tt></td><td><tt>&lt;.</tt> <small>in place of</small> <tt>&gt;.</tt></td><td>avoids building argument cells</td></tr></tbody></table>

---
