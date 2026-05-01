# Vocabulary/plus - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/plusdot "Vocabulary/plusdot") [<<](https://code.jsoftware.com/wiki/Vocabulary/underco "Vocabulary/underco")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d100.htm "jdic:d100")

<table class="wikitable"><tbody><tr><td><tt>+ y</tt></td><td>Conjugate</td></tr></tbody></table>

[Rank 0](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank0a "Vocabulary/RankInfo") _\-- operates on individual atoms of y, producing a result of the same shape --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

The [complex conjugate](https://en.wikipedia.org/wiki/Complex_conjugation "wikipedia:Complex conjugation") of the number y

```
   + 3
3
   + 3j5
3j\_5

```
---

### Common uses

1\. Test z is real not [complex](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Complex "Vocabulary/Glossary")

```
   if. z=+z do.
      ...
   end.

```

2\. Find the real part of z

```
   z=: 3j4
   -: z+ +z   NB. (-:) is: Halve
3

```

A better solution is 9&o. (see [Circle Functions](https://code.jsoftware.com/wiki/Vocabulary/odot "Vocabulary/odot") (o.).

---

### More Information

0\. [Conjugate video](https://www.youtube.com/watch?v=7K4RzOe2rTk)

1\. [Complex conjugates](https://en.wikipedia.org/wiki/Complex_conjugation "wikipedia:Complex conjugation") are a pair of complex numbers, both having the same real part, but with imaginary parts of equal magnitude and opposite signs.

If y is real, then (+y) is the same as y

```
   + 7 0 \_7
7 0 \_7

```

2\. J supports [complex](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Complex "Vocabulary/Glossary") numbers and returns them as required by a calculation.

The way to write the [scalar](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Scalar "Vocabulary/Glossary") numeral having real part 3 and imaginary part 4_i_ is: (3j4).

```
   sqrt=: 3 : 'y^0.5'  NB. (sqrt y) is y to the power of 0.5
   sqrt=: ^&0.5        NB. (tacit alternative)
   sqrt 49
7
   sqrt \_1
0j1
   + sqrt \_1
0j\_1
   |sqrt \_1   NB. The sq root of \_1 has magnitude 1
1
   | z=: 3j4  NB. vector repn of z is 3-4-5 triangle
5             NB. hence its magnitude is the hypotenuse
   + z
3j\_4
   | +z       NB. Conjugate of z has same magnitude as z
5

```
---

<table class="wikitable"><tbody><tr><td><tt>x + y</tt></td><td>Plus</td></tr></tbody></table>

[Rank 0 0](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank00a "Vocabulary/RankInfo") _\-- operates on individual atoms of x and y, producing a result of the same shape --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Adds two [numeric](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Numeric "Vocabulary/Glossary") [nouns:](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Noun "Vocabulary/AbsolutelyEssentialTerms") x and y

```
   2 + 3
5

```

Either or both of x, y can be [atoms](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Atom "Vocabulary/Glossary").

```
   x=: 5
   y=: 2 3 4

   x + y
7 8 9
   y + x
7 8 9

```
---

### Common uses

1\. Increment an [array](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Array "Vocabulary/AbsolutelyEssentialTerms") by the same amount throughout

```
   100 + 0 1 2
100 101 102

```

2\. Sum the numbers in a given [list](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#List "Vocabulary/AbsolutelyEssentialTerms")

```
   +/0 1 2 3
6

```
---

[Minus](https://code.jsoftware.com/wiki/Vocabulary/minus "Vocabulary/minus") (\-)

---

### More Information

0\. [Plus video](https://www.youtube.com/watch?v=PIfB8aJ94vU)

1\. If both x and y are [arrays](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Array "Vocabulary/AbsolutelyEssentialTerms"), they must [agree](https://code.jsoftware.com/wiki/Vocabulary/Agreement "Vocabulary/Agreement").

```
   x=: 100 200
   y=: 2 3$i.6

   x + y
100 101 102
203 204 205
   x=: 100 200 300
   x + y
|length error
|   x    +y\[x=:100 200 300\[y=:2 3$i.6

```

Note however the use of [Rank](https://code.jsoftware.com/wiki/Vocabulary/quote "Vocabulary/quote") (") to add 1-[cells](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Cell "Vocabulary/Glossary") of x and y

```
   x +"1 y
100 201 302
103 204 305

```
---

### Use These Combinations

Combinations using x + y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include:

<table class="wikitable"><tbody><tr><td><b>What It Does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td colspan="2"><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Primitives permitted in place of <tt>f</tt></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Count number of places where <tt>&nbsp;x f y </tt>is true</td><td><i>Permitted:</i> Boolean, integer, floating point, byte, symbol (<b>not</b> unicode).<p><br><tt>x</tt> and <tt>y</tt> need not be the same precision.</p></td><td><tt>x ([: +/ f) y</tt></td><td><tt>x +/@:f y</tt></td><td><tt>= ~: &lt; &lt;: &gt; &gt;: e. E.</tt></td><td><i>Permitted:</i> <tt>(f!:0)</tt> <i>(parentheses obligatory!)</i> to force exact comparison.<p><br>J recognizes FLO <b>only if</b> <tt>f</tt> returns an atom or list.</p></td><td>Avoids computing entire <tt>&nbsp;x f y</tt><p><br><b>Bug warning:</b> if <tt>f</tt> is <tt>e.</tt> it does (<tt>,@e.</tt>) rather than <tt>e.</tt> regardless of ranks of arguments</p></td></tr></tbody></table>

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Count number of cells of <tt>y</tt> that match <tt>m</tt>-items</td><td></td><td><tt>+/@e.&amp;m y</tt></td><td></td><td><b>Bug warning:</b> it does <tt>(,@e.)</tt> rather than <tt>e.</tt></td></tr><tr><td>Reductions on infixes</td><td>Boolean, integer, floating-point</td><td><tt>x +/\ y</tt></td><td><tt>&lt;. &gt;.</tt> <small>in place of</small> <tt>+</tt></td><td><b>much</b> faster than alternatives</td></tr><tr><td>Mean on infixes</td><td>integer and floating-point</td><td><tt>x (+/%#)\ y</tt></td><td><tt>x</tt> positive<p><tt>*. = ~:</tt> <small>in place of</small> <tt>+</tt></p></td><td><b>much</b> faster than alternatives</td></tr><tr><td>Boolean reductions on partitions</td><td>Boolean</td><td><tt>x +//. y</tt></td><td><tt>= &lt;. &gt;. +. * *. ~:</tt> <small>in place of</small> <tt>+</tt></td><td>avoids building argument cells</td></tr><tr><td>Reductions on partitions</td><td>integer, floating-point</td><td><tt>x +//. y</tt></td><td><tt>&lt;. &gt;.</tt> <small>in place of</small> <tt>+</tt></td><td>avoids building argument cells</td></tr><tr><td>Find mean of each partition</td><td></td><td><tt>x (+/&nbsp;% #)/. y</tt></td><td></td><td>avoids building argument cells</td></tr><tr><td>Polynomial Multiplication</td><td></td><td><tt>x +//.@(*/) y</tt></td><td></td><td>avoids building argument cells</td></tr><tr><td>Polynomial Multiplication (Boolean)</td><td>Boolean</td><td><tt>x ~://.@(*./) y</tt><p><tt>x ~://.@(+./) y</tt><br><tt>x +//.@(*./) y</tt><br><tt>x +//.@(+./) y</tt></p></td><td></td><td>avoids building argument cells</td></tr><tr><td>Sum along diagonals</td><td></td><td><tt>+//. y</tt></td><td></td><td>avoids building argument cells</td></tr><tr><td>Mean with rank</td><td></td><td><tt>(+/&nbsp;% #) y</tt></td><td></td><td>Supported as a primitive by <tt>(+/&nbsp;% #)"n</tt></td></tr></tbody></table>

---
