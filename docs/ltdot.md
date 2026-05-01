# Vocabulary/ltdot - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/ltco "Vocabulary/ltco") [<<](https://code.jsoftware.com/wiki/Vocabulary/lt "Vocabulary/lt")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d011.htm "jdic:d011")

<table class="wikitable"><tbody><tr><td><tt>&lt;. y</tt></td><td>Floor</td></tr></tbody></table>

[Rank 0](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank0a "Vocabulary/RankInfo") _\-- operates on individual atoms of y, producing a result of the same shape --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

The _floor_ of y i.e. the largest [integer](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Integer "Vocabulary/Glossary") less than or equal to y

```
   <. 4.6
4

   <. 4.2 4.5 4.6
4 4 4

   <. 4.6 4 \_4 \_4.6
4 4 \_4 \_5

```

> [![](https://code.jsoftware.com/mediawiki/images/c/cb/Warning.png)](https://code.jsoftware.com/wiki/File:Warning.png) The result of <. y may not have integer type.
> 
>   
> If y is too large or too small to be represented as an integer, it will be left in floating point form. Furthermore, <. y is always complex for complex y.

**Floor** (<.) uses [tolerant comparison](https://code.jsoftware.com/wiki/Vocabulary/Glossary#TolerComp "Vocabulary/Glossary"). <. y is y rounded towards -∞, except that if y is tolerantly equal to an integer, <. y is that integer. For more information, read about [tolerant floor and ceiling](https://code.jsoftware.com/wiki/Essays/Tolerant_Comparison#Tolerant_Floor_and_Ceiling "Essays/Tolerant Comparison"). To require exact comparison, use (<.!.0) in place of (<.) to temporarily set the comparison [tolerance](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Tolerance "Vocabulary/Glossary") to zero.

```
   <. 100.999999999999  NB. tolerant floor of y can be greater than y!
101
   <.!.0  (100.999999999999)
100

```
---

### Common uses

1\. Test whether numbers are integers or not.

can also use [Ceiling](https://code.jsoftware.com/wiki/Vocabulary/gtdot#monadic "Vocabulary/gtdot") (\>.)

```
   3 3.14 5 = <. 3 3.14 5
1 0 1

```

2\. Convert floating point representations of integers (8 bytes per value) to integers (4 bytes per value) in order to save memory

Such [values](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary") can arise as a result of arithmetic operations like [Divide](https://code.jsoftware.com/wiki/Vocabulary/percent#dyadic "Vocabulary/percent") (%)

```
   \] N=: 27 % 9
3
   datatype N
floating
   \] n=: <. 27 % 9         NB. alternatively:  n=: 27 <.@:% 9
3
   datatype n
integer

```

3\. Round fractional z to the nearest integer

```
   z=: 4.2 4.5 4.6

   <. 0.5 + z
4 5 5

```
---

### Details

<. y uses tolerant comparison, which means an integer is considered equal to y if its difference from y is less than the y\*_tolerance_. If y is so big that y\*_tolerance_ is greater than 1, results can be surprising: the largest integer tolerantly equal to y could be considerably **larger** than y. The implementation defines <. y as the integer closest to y, if that integer is tolerantly equal to y; otherwise the next-lower integer.

---

[Ceiling](https://code.jsoftware.com/wiki/Vocabulary/gtdot#monadic "Vocabulary/gtdot") (\>. y)

---

### More Information

#### Complex Floor

For purposes of <. y, the complex plane is tiled into rectangles tilted 45 degrees with respect to the real and complex axes. The sides running northwest-to-southeast have length (%:2), while the sides running northeast-to-southwest have half that length. This makes the area of each rectangle 1. The north and east vertices of each rectangle are on Gaussian integers (i. e. points with integral real and imaginary parts). The west and south vertices are each in the center of a square made up of 4 Gaussian integers. In the center of the southwest edge is the Gaussian integer at (northvertex-0j1) and (eastvertex-1j0). This southwest Gaussian integer is the value associated with the rectangle, and any point inside the rectangle is rounded to the southwest point.

```
   NB. The rectangle associated with the origin has vertices 0j1, \_0.5j0.5, 0.5j\_0.5, 1j0
   <. \_0.1j0.5   NB. All these points are inside...
0
   <. 0.1j0.5
0
   <. 0.4j0.4
0
   <. 0.7j0.2
0
   <. 0.7j\_0.2
0
   <. 0.2j0.7
0
   <. 0.7j0.4   NB. ...but this is outside
1
   <. 0.5j0.6   NB. this one too
0j1

```

Tolerant comparison enters the picture in two places. The sequence for calculating the floor is as follows:

1.  The **_base point_** to use is calculated as the (tolerant) floor of the real and imaginary parts separately.
2.  Two lines are drawn through the 1x1 square whose lower-left corner is the base point, and y is classified with respect to these lines.  
    y might be slightly outside the square as a result of tolerance, but that's OK.  1.  A line a drawn from the bottom-left to the top-right corner of the square, and y is marked 'southeast' if it lies on or below the line. This test is intolerant.  
          The model in the J Dictionary incorrectly shows this test as tolerant.
      2.  A line is drawn from the top-left to the bottom-right corner of the square, and y is marked 'southwest' if it lies below the line. This test is tolerant (i. e. points very close to the line are **not** southwest).
    
3.  The complex floor is the base point if y is southwest; base point + 1j0 if southeast but not southwest; base point + 0j1 if neither southeast nor southwest.
```
   <. 0.6j0.4   NB. Right on the line, southeast and southwest
1
   <. 0.6j0.3999999999999999  NB. southeast and tolerantly northeast...
1
   (<.!.0) 0.6j0.3999999999999999   NB. ...but intolerantly southwest
0

```

<table class="wikitable"><tbody><tr><td><span class="mw-default-size"><a class="mw-file-description" href="/wiki/File:Complex_floor.png"><img data-file-height="480" data-file-width="480" class="mw-file-element" height="480" width="480" decoding="async" src="/mediawiki/images/c/c1/Complex_floor.png"></a></span></td></tr><tr><td><b>4 Gaussian integers, showing what regions are resolved to each</b></td></tr></tbody></table>

#### Differences between complex floor and real floor

The complex floor model described above is used for all numbers with complex data type as given by 3!:0. This means that complex numbers with zero imaginary parts may respond to <. y differently from equivalent real numbers:

```
   <.x0 =: \_1e\_14  NB. Not tolerantly equal to 0
\_1
   <.x1 =: \_1e\_14 j. 0  NB. But close enough for complex floor
0
   x0 =!.0 x1
1

```

##### Further information:

COMPLEX FLOOR, Eugene McDonnell, IBM Scientific Center, Philadelphia <sup>[\[1\]](#cite_note-1)</sup> COMPLEX FLOOR REVISITED, Doug Forkes, I. P. Sharp Associates <sup>[\[2\]](#cite_note-2)</sup>

---

### Use These Combinations

Combinations using <. y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Integer-result operations</td><td>extended integer</td><td><tt>&lt;.@f y</tt><p><tt>x &lt;.@f y</tt><br><small>(<tt>f</tt> is any verb)</small></p></td><td><tt>&lt;.</tt> <small>in place of</small> <tt>&gt;.</tt></td><td>Avoids non-integer intermediate results</td></tr><tr><td>Integer divide</td><td>integer</td><td><tt>x &lt;.@% y</tt><p><tt>x &gt;.@% y</tt></p></td><td><tt>@:</tt> <small>in place of</small> <tt>@</tt></td><td>uses integer division</td></tr></tbody></table>

---

<table class="wikitable"><tbody><tr><td><tt>x &lt;. y</tt></td><td>Lesser of (Min)</td></tr></tbody></table>

[Rank 0 0](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank00a "Vocabulary/RankInfo") _\-- operates on individual atoms of x and y, producing a result of the same shape --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

The lesser [atoms](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Atom "Vocabulary/AbsolutelyEssentialTerms") of x and y

```
   3 <. 4
3

   3 <. 4 \_4
3 \_4

   2 3 <. 4 1
2 1

```
---

### Common uses

1\. Find the minimum [value](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary") in a [list](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#List "Vocabulary/AbsolutelyEssentialTerms")

Use in conjunction with [Insert](https://code.jsoftware.com/wiki/Vocabulary/slash "Vocabulary/slash") (/)

```
   <./ 7 8 5 9 2
2

```

2\. Find the running minimum in a list (scanned from left to right)

Use in conjunction with [Insert](https://code.jsoftware.com/wiki/Vocabulary/slash "Vocabulary/slash") (/) and [Prefix](https://code.jsoftware.com/wiki/Vocabulary/bslash "Vocabulary/bslash") (\\)

```
   <./\\ 7 8 5 9 2
7 7 5 5 2

```
---

[Larger Of (Max)](https://code.jsoftware.com/wiki/Vocabulary/gtdot#dyadic "Vocabulary/gtdot") (x >. y)

---

### More Information

1\. If an [argument](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Argument "Vocabulary/AbsolutelyEssentialTerms") to x <. y is complex, its imaginary part must be tolerantly equal to 0, using the default [tolerance](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Tolerance "Vocabulary/Glossary") of 2^\_44 even if the comparison x <. y itself uses a different tolerance. The result will have floating-point precision.

2\. If x <. y has arguments of different precisions, the arguments are converted to the higher-priority precision as described [here](https://code.jsoftware.com/wiki/Vocabulary/NumericPrecisions "Vocabulary/NumericPrecisions"). The conversion may turn an argument into a smaller or larger value, especially if a large 64-bit integer is converted to floating-point.

```
   <. 9223372036854765500 <. 1e19
9223372036854765568
   <. 9223372036854765580 <. 1e19
9223372036854765568

```
---

### Use These Combinations

Combinations using x <. y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Find index of first/last occurrence of largest/smallest value</td><td>integer or floating-point list</td><td><tt>(i. &lt;./) y</tt><p><tt>(i. &gt;./) y</tt></p></td><td>or <tt>i:</tt></td><td>it actually does <tt>(i. &gt;.!.0/)</tt> etc.; is faster than <tt>0 ({ /:~) y</tt></td></tr><tr><td>Reductions on infixes</td><td>Boolean, integer, floating-point</td><td><tt>x +/\ y</tt></td><td><tt>&lt;. &gt;.</tt> <small>in place of</small> <tt>+</tt></td><td><b>much</b> faster than alternatives</td></tr><tr><td>Boolean reductions on partitions</td><td>Boolean</td><td><tt>x +//. y</tt></td><td><tt>= &lt;. &gt;. +. * *. ~:</tt> <small>in place of</small> <tt>+</tt></td><td>avoids building argument cells</td></tr><tr><td>Reductions on partitions</td><td>integer, floating-point</td><td><tt>x +//. y</tt></td><td><tt>&lt;. &gt;.</tt> <small>in place of</small> <tt>+</tt></td><td>avoids building argument cells</td></tr><tr><td>Max/min along diagonals</td><td>non-complex numeric</td><td><tt>&gt;.//. y</tt></td><td><tt>&lt;.</tt> <small>in place of</small> <tt>&gt;.</tt></td><td>avoids building argument cells</td></tr><tr><td>Integer-result operations</td><td>extended integer</td><td><tt>&lt;.@f y</tt><p><tt>x &lt;.@f y</tt><br><small>(<tt>f</tt> is any verb)</small></p></td><td><tt>&lt;.</tt> <small>in place of</small> <tt>&gt;.</tt></td><td>Avoids non-integer intermediate results</td></tr><tr><td>Integer divide</td><td>integer</td><td><tt>x &lt;.@% y</tt><p><tt>x &gt;.@% y</tt></p></td><td><tt>@:</tt> <small>in place of</small> <tt>@</tt></td><td>uses integer division</td></tr></tbody></table>

---

1.  [↑](#cite_ref-1 "Jump up") [https://www.jsoftware.com/papers/eem/complexfloor.htm](https://www.jsoftware.com/papers/eem/complexfloor.htm)
2.  [↑](#cite_ref-2 "Jump up") [https://files.catbox.moe/msm1bj.pdf](https://files.catbox.moe/msm1bj.pdf)
