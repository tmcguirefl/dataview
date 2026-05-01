# Vocabulary/lt - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/ltdot "Vocabulary/ltdot") [<<](https://code.jsoftware.com/wiki/Vocabulary/eqco "Vocabulary/eqco")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d010.htm "jdic:d010")

<table class="wikitable"><tbody><tr><td><tt>&lt; y</tt></td><td>Box</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank "Vocabulary/RankInfo") _\-- operates on x and y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Convert the [noun](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Noun "Vocabulary/AbsolutelyEssentialTerms") y to [boxed](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boxed "Vocabulary/Glossary") form, by creating a [box](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Box "Vocabulary/AbsolutelyEssentialTerms") whose [contents](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Contents "Vocabulary/Glossary") are y. A box is treated as an [atom](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Atom "Vocabulary/AbsolutelyEssentialTerms") and can be put into an [array](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Array "Vocabulary/Glossary") with other boxes, regardless of the contents of the boxes.

```
   < 1 2 3
+-----+
|1 2 3|
+-----+
   < 'abc'
+---+
|abc|
+---+

```

Boxes are used to create heterogeneous [arrays](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Array "Vocabulary/Glossary"). Arrays in J must be rectangular, and must contain only [values](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary") of the same [type](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Type "Vocabulary/Glossary") and [precision](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Precision "Vocabulary/Glossary"). But if you put a [noun](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Noun "Vocabulary/Glossary") into a box, it becomes an [atom](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Atom "Vocabulary/Glossary") that you can array with other boxes.

Consider a [list](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#List "Vocabulary/AbsolutelyEssentialTerms") of [strings](https://code.jsoftware.com/wiki/Vocabulary/Glossary#String "Vocabulary/Glossary") of varying length: you can't make a table of varying-length strings, but you can box each string and make a list of those boxes. [Words](https://code.jsoftware.com/wiki/Vocabulary/semico "Vocabulary/semico") (;:) does this:

```
   ;: 'Three different words'
+-----+---------+-----+
|Three|different|words|
+-----+---------+-----+

```

You might need to join dissimilar types into an array. [Link](https://code.jsoftware.com/wiki/Vocabulary/semi#dyadic "Vocabulary/semi") (;) can join them by boxing them:

```
   \_2 \]\\ 'front nine';36;'back nine';38
+----------+--+
|front nine|36|
+----------+--+
|back nine |38|
+----------+--+

```
---

### Common uses

1\. To add elements to a [vector](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Vector "Vocabulary/Glossary") of boxed strings:

```
   \]zub=: ;:'alpha bravo charlie'
+-----+-----+-------+
|alpha|bravo|charlie|
+-----+-----+-------+
   zub,<'delta'
+-----+-----+-------+-----+
|alpha|bravo|charlie|delta|
+-----+-----+-------+-----+

```

2\. To compare a string with contents of a vector of boxed strings:

```
   zub = <'bravo'
0 1 0

```

3\. Some primitives and [Foreigns](https://code.jsoftware.com/wiki/Vocabulary/bangco "Vocabulary/bangco") (!:), especially those designed to work on a boxed list of [names](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Name "Vocabulary/Glossary"), demand a boxed [argument](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Argument "Vocabulary/AbsolutelyEssentialTerms") if only one name is given.

```
   xx=: yy=: zz=: 99
   4!:55 'zz'     NB. try to erase word: zz
|domain error
|       4!:55'zz'
   4!:55 <'zz'    NB. erase word: zz
1
   4!:55 'xx' ; 'yy'
1 1

```

The z-[locale](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Locale "Vocabulary/AbsolutelyEssentialTerms") verb: erase, which invokes 4!:55, accepts either a boxed or an unboxed string.

4\. The z-locale verb: boxopen boxes its argument, but only if unboxed or empty:

```
   boxopen 'zz'
+--+
|zz|
+--+
   boxopen <'zz'
+--+
|zz|
+--+

```

5\. The z-locale verb: boxxopen boxes its argument, but only if unboxed and not empty:

```
   boxxopen 'notempty'
+--------+
|notempty|
+--------+
   boxxopen ''

   boxopen ''
++
||
++

```
---

[Open](https://code.jsoftware.com/wiki/Vocabulary/gt "Vocabulary/gt") (\> y)

---

### Use These Combinations

Combinations using < y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Box items of list</td><td></td><td><tt>;/ y</tt></td><td></td><td>linear time (like <tt>&lt;"_1 y</tt>)</td></tr><tr><td>Join contents of boxed items along first axis</td><td></td><td><tt>,&amp;.&gt;/ y</tt></td><td></td><td><b>Bug warning:</b> Atomic replication is inaccurate. OK if contents of same rank. Better to use <tt>&lt;@; y</tt></td></tr><tr><td>Extract multiple substrings into a list</td><td>Boolean list, byte list</td><td><tt>x&nbsp;;@:(&lt;;.0) y</tt></td><td>or <tt>[:&nbsp;; &lt;;.0</tt></td><td>avoids boxing, avoids creating subarrays</td></tr><tr><td>Fetch from multiple index lists (each row of <tt>x</tt> is one index list into <tt>y</tt>)</td><td></td><td><tt>x (&lt;"1@[ { ]) y</tt></td><td></td><td>avoids boxing <tt>x</tt></td></tr><tr><td>Boxing intervals</td><td></td><td><tt>&lt;@f/;.n y</tt><p><tt>x &lt;@f/;.n y</tt><br><small>(<tt>f</tt> is any verb)</small></p></td><td><tt>n e. _2 _1 1 2</tt></td><td></td></tr><tr><td rowspan="2">Concatenated results on intervals</td><td></td><td><tt>;@:(&lt;@u;.n) y</tt></td><td rowspan="2"><tt>n e. _2 _1 1 2</tt>;<p>also <tt>[:&nbsp;; (&lt;@:u;.n)</tt>;<br>also <tt>&lt;@u;.n</tt></p></td><td rowspan="2"></td></tr><tr><td><tt>x</tt> is a <b>Boolean list</b> (<b>not</b> an atom or an integer list with values <tt>0</tt> or <tt>1</tt>)</td><td><tt>x&nbsp;;@:(&lt;@u;.n) y</tt></td></tr><tr><td>Concatenated running totals on intervals (running total, but total is reset at start of each interval)</td><td></td><td><tt>;@:(&lt;@(f/\);.n) y</tt><p><tt>x&nbsp;;@:(&lt;@(f/\);.n) y</tt><br><small>(<tt>f</tt> is any verb)</small></p></td><td><tt>n e. _2 _1 1 2</tt>; also <tt>[:&nbsp;; (f...</tt> also <tt>&lt;@:(f/\)</tt>; also <tt>&lt;@:</tt></td><td></td></tr><tr><td>Box the indexes of identical items</td><td></td><td><tt>(&lt;/. i.@#) y</tt><p><tt>y &lt;/. i. # y</tt></p></td><td><tt>(&lt;/. i.@#) y</tt> uses less space</td><td></td></tr></tbody></table>

---

<table class="wikitable"><tbody><tr><td><tt>x &lt; y</tt></td><td>Less Than</td></tr></tbody></table>

[Rank 0 0](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank00a "Vocabulary/RankInfo") _\-- operates on individual atoms of x and y, producing a result of the same shape --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Compares x and y [atom](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Atom "Vocabulary/Glossary")\-by-atom. See [Equal](https://code.jsoftware.com/wiki/Vocabulary/eq "Vocabulary/eq") (\=) for the details.

Wherever x is greater than, or equal to, y, returns 1 in that position, else 0.

```
   z=: 7 8 9
   z < 8
1 0 0

```

x and y must both be [numeric](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Numeric "Vocabulary/Glossary"), else you get a domain error

```
   'a' < 9
|domain error
|   'a'    <9

```

This differs from what happens with [Equal](https://code.jsoftware.com/wiki/Vocabulary/eq "Vocabulary/eq") (\=)

```
   'a' = 9
0

```

**Less Than** (<) uses [tolerant comparison](https://code.jsoftware.com/wiki/Vocabulary/Glossary#TolerComp "Vocabulary/Glossary") in the same way as [Equal](https://code.jsoftware.com/wiki/Vocabulary/eq "Vocabulary/eq") (\=).

To require exact comparison, use (<!.0) in place of (<) to temporarily set the comparison [tolerance](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Tolerance "Vocabulary/Glossary") to zero

```
   1.99999999999999 < 2
0
   1.99999999999999 (<!.0) 2
1

```
---

### Common uses

1\. Make a conditional [phrase](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Phrase "Vocabulary/Glossary") in a [verb](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Verb "Vocabulary/Glossary") definition ([explicit](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Explicit "Vocabulary/Glossary") definition)

```
if. x<y do.  'x y'=. y;x  end.

```

2\. Make a mask of the same [shape](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Shape "Vocabulary/AbsolutelyEssentialTerms") as array, to process array in some chosen way

```
   array=: 3 1 4 1 5 9 2 6
   mask=: array < 5

   array ,: mask
3 1 4 1 5 9 2 6
1 1 1 1 0 0 1 0

   mask # array       NB. keep only the atoms that are < 5
3 1 4 1 2

```

**NOTE:** The [boolean](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boolean "Vocabulary/Glossary") atoms of mask are not only truth values but also valid numbers, 0 or 1. Therefore you can use mask directly to process array like this:

```
   array + 3 \* mask   NB. add 3 to the atoms that are < 5
6 4 7 4 5 9 5 6

```
---

[Equal](https://code.jsoftware.com/wiki/Vocabulary/eq#dyadic "Vocabulary/eq") (x = y), [Not-Equal](https://code.jsoftware.com/wiki/Vocabulary/tildeco#dyadic "Vocabulary/tildeco") (x ~: y), [Larger Or Equal](https://code.jsoftware.com/wiki/Vocabulary/gtco#dyadic "Vocabulary/gtco") (x >: y), [Less Or Equal](https://code.jsoftware.com/wiki/Vocabulary/ltco#dyadic "Vocabulary/ltco") (x <: y), [Larger Than](https://code.jsoftware.com/wiki/Vocabulary/gt#dyadic "Vocabulary/gt") (x > y)

---

### More Information

1\. If an [argument](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Argument "Vocabulary/AbsolutelyEssentialTerms") to x < y is [complex](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Complex "Vocabulary/Glossary"), its imaginary part must be tolerantly equal to 0, using the default [tolerance](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Tolerance "Vocabulary/Glossary") of 2^\_44 even if the comparison x < y itself uses a different tolerance.

---

### Performance Note

Comparisons are fastest when the precisions are identical. If an atom is compared against an array, it helps to choose the right precision for the atom.

```
   0. < %: i. 10  NB. float list: faster than 0 <
   00 < i. 10  NB.  integer list: faster than 0 <

```
---

### Use These Combinations

Combinations using x < y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include those shown in [Searching and Matching Items: Fast List Operations (FLOs)](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations#FLOs "Vocabulary/SpecialCombinations"), as well as the following:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Boolean reductions along diagonals</td><td>Boolean</td><td><tt>+.//. y</tt></td><td><tt>*. = ~: &lt; &lt;: &gt; &gt;:</tt> <small>in place of</small> <tt>+.</tt></td><td>avoids building argument cells</td></tr></tbody></table>

---
