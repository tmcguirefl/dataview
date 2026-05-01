# Vocabulary/ampdot - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/ampco "Vocabulary/ampco") [<<](https://code.jsoftware.com/wiki/Vocabulary/ampv "Vocabulary/ampv")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d631.htm "jdic:d631")

<table class="wikitable"><tbody><tr><td><tt>[x] u&amp;.v y</tt></td><td>Under (Dual)</td><td>Conjunction</td></tr></tbody></table>

[Rank](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rankv "Vocabulary/RankInfo") _\-- depends on the rank of v --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

u&.v is equivalent to (u&.:v)"mv , where mv is the monadic rank of v. That is,

```
  u&.v y  <-->          {{v^:\_1 u (v y)}}"mv y
x u&.v y  <-->  x {{v^:\_1 (v x) u (v y)}}"mv y

```

You should understand [Rank (")](https://code.jsoftware.com/wiki/Vocabulary/quote "Vocabulary/quote") and [the rankless form of Under (&.:)](https://code.jsoftware.com/wiki/Vocabulary/ampdotco "Vocabulary/ampdotco") before trying to understand Under (Dual) (&.).

Executes u on the [argument](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET")(s) with a temporary change of viewpoint, indicated by v. First v is executed, to move to the new viewpoint; then u is executed in the new viewpoint; then the operation of v is undone, restoring the original viewpoint.  
like Daylight Saving Time, or buying online in a different currency.

The operation is executed on each [cell](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Cell "Vocabulary/Glossary") as defined by the [rank](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Rank "Vocabulary/Glossary") of v:

-   For each cell, u is applied to the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary")(s) of v
-   Then v^:\_1 (i.e. the [obverse](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Obverse "Vocabulary/Glossary") of v) is applied to the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") of u — giving the result for that [cell.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Cell "Vocabulary/Glossary")  
    Some v's can be undone even though as functions they may have no mathematical inverse.

Finally the [results](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") for all [mv\-cells](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Cell "Vocabulary/Glossary") are [collected](https://code.jsoftware.com/wiki/Vocabulary/FramingFill#Collection "Vocabulary/FramingFill") into the end result.

This contrasts with u&.:v which applies v to the entire argument(s) and then applies v^:\_1@:u on the entire [filled and assembled](https://code.jsoftware.com/wiki/Vocabulary/FramingFill "Vocabulary/FramingFill") result(s) of v .

We say that u _is applied under_ v .

**Example:** Apply (i.) to the [contents](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Contents "Vocabulary/Glossary") of each [box](https://code.jsoftware.com/wiki/Vocabulary/AET#Box "Vocabulary/AET") separately, and re-box each result separately

```
   \] y =: 1;2;2 3
+-+-+---+
|1|2|2 3|
+-+-+---+

   u =: i.
   v =: >
   u&.v y
+-+---+-----+
|0|0 1|0 1 2|
| |   |3 4 5|
+-+---+-----+

```
---

### Common uses

1\. The most common use of &. is \[x\] u&.> y which applies the verb u inside each box of the arguments. This follows the rules above: u&.> has rank 0 regardless of u, so each box is opened separately, operated on, and then reboxed.

Examples:

Convert a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") of [boxed](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boxed "Vocabulary/Glossary") [strings](https://code.jsoftware.com/wiki/Vocabulary/Glossary#String "Vocabulary/Glossary") to uppercase

```
   \] z =: ;:'alpha bravo charlie'
+-----+-----+-------+
|alpha|bravo|charlie|
+-----+-----+-------+
   toupper&.> z
+-----+-----+-------+
|ALPHA|BRAVO|CHARLIE|
+-----+-----+-------+

```

Add the contents of corresponding boxes

```
   \]l =. 1;2 3;4 5 6
+-+---+-----+
|1|2 3|4 5 6|
+-+---+-----+
   \]r =. 3 1 4;1 5;9
+-----+---+-+
|3 1 4|1 5|9|
+-----+---+-+
   l +&.> r
+-----+---+--------+
|4 2 5|3 8|13 14 15|
+-----+---+--------+

```

The standard library defines the name each as &.>

```
   (<'Mr. ') , each 'Smith';'Jones'
+---------+---------+
|Mr. Smith|Mr. Jones|
+---------+---------+

```

each is a

-   [Standard Library](http://www.jsoftware.com/help/user/library.htm) word(s) residing in the 'z'-locale
-   Defined in the factory script stdlib.ijs which is located in  ~system/main/stdlib.ijs-   View the definition(s) in a JQt session by entering:  open '~system/main/stdlib.ijs'

2\. A useful trick is to use each when one or more arguments are not boxed. Since \> y leaves y unchanged if it is not boxed, an unboxed argument will be processed as individual unboxed atoms:

```
   i.&.> 3 4  NB. i. on each atom, boxing results separately
+-----+-------+
|0 1 2|0 1 2 3|
+-----+-------+
   3 3 4 {. each 'Washington';'Sheffield';'Hereford'
+---+---+----+
|Was|She|Here|
+---+---+----+
   100 + each 3;1 4;1 5 9   NB. Add 100 inside each box
+---+-------+-----------+
|103|101 104|101 105 109|
+---+-------+-----------+

```
---

### Semiduals x u&.(a:\`v) y and x u&.(v\`a:) y

The operation encapsulated by u&.v is used often and is important as a notation to aid thought. When the operation is dyadic, sometimes the sequence of transforming/operating/transforming back should be applied to just one argument, with the other argument being passed unchanged into u. This can be represented by a gerund form where a: indicates which argument is to be used unmodified. The form using &. is defined in terms of the infinite-rank version &.::

-   x u&.(a:\`v) y is x u&.:(a:\`v)"(_lu,mv_) where _lu_ is the left rank of u and _mv_ is the monadic rank of v
-   x u&.(v\`a:) y is x u&.:(v\`a:)"(_mv,ru_) where _ru_ is the right rank of u and _mv_ is the monadic rank of v
```
   <"2 i. 3 2 4   NB. y is 3 boxes
+-------+-----------+-----------+
|0 1 2 3| 8  9 10 11|16 17 18 19|
|4 5 6 7|12 13 14 15|20 21 22 23|
+-------+-----------+-----------+
   100 200 +"\_&.(a:\`>) <"2 i. 3 2 4  NB. open y (but not x), add x to each contents, rebox
+---------------+---------------+---------------+
|100 101 102 103|108 109 110 111|116 117 118 119|
|204 205 206 207|212 213 214 215|220 221 222 223|
+---------------+---------------+---------------+
   +"\_&.(a:\`>) b. 0  NB. This works because the left rank of u&.(a:\`v) comes from u
0 \_ 0

```
---

### Structural Under - u&.v y when v has no inverse

Even when v has no inverse, when v _rearranges_ or _selects from_ y, it may be possible to define a notional inverse that, referring to the value of y, reverses the effect of the rearrangement/selection. This surrogate inverse is defined for the following values of v:

<table class="wikitable"><tbody><tr><td><b><tt>v</tt></b></td><td><b>Inverse used<br></b></td><td><b>Description of operation<br></b></td></tr><tr><td><tt>,</tt></td><td><tt>($y)&amp;($,)</tt></td><td>Execute <tt>u</tt> on (<tt>,y</tt>), then put result into original shape of <tt>y</tt></td></tr><tr><td><tt>m&amp;{</tt></td><td><tt>m}&amp;y</tt></td><td>Execute <tt>u</tt> on selected cells of <tt>y</tt>, then put result back into those cells</td></tr><tr><td><tt>m&amp;(];.0)</tt><br>where <tt>m</tt> is a single integer column</td><td><tt>((+ i.)/@, m)}&amp;y</tt></td><td>Execute <tt>u</tt> on selected cells of <tt>y</tt>, then put result back into those cells</td></tr></tbody></table>

-   u&.(m&(\];.0)) y is the preferred idiom for applying u to a continuous subarray of y. The update may be performed in 0lace.
-   If m&{ selects a contiguous section of y, the update may be performed in place.
---

[Under](https://code.jsoftware.com/wiki/Vocabulary/ampdotco "Vocabulary/ampdotco") (&.:)

---

### More Information

1\. Under (Dual) (&.) differs from [Under](https://code.jsoftware.com/wiki/Vocabulary/ampdotco "Vocabulary/ampdotco") (&.:) in that  u&.v applies u under v [cell-by-cell](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Cell "Vocabulary/Glossary"), whereas  u&.:v applies u under v to the entire argument(s) (x and) y .

---

### Use These Combinations

Combinations using  &. y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Join contents of boxed items along first axis</td><td></td><td><tt>,&amp;.&gt;/ y</tt></td><td></td><td><b>Bug warning:</b> Atomic replication is inaccurate. OK if contents of same rank. Better to use <tt>&lt;@; y</tt></td></tr><tr><td>Join contents of boxed items along last axis</td><td></td><td><tt>,.&amp;.&gt;/ y</tt></td><td></td><td></td></tr><tr><td rowspan="2">Bitwise operations on bytes</td><td rowspan="2">byte</td><td><tt>u&amp;.(a.&amp;i.) y</tt></td><td><tt>(u y) -: u"0 y</tt></td><td rowspan="2">avoids conversion to integer</td></tr><tr><td><tt>(m b.)/&amp;.(a.&amp;i.) y</tt><p><tt>x (m b.)&amp;.(a.&amp;i.) y</tt></p></td><td><tt>m</tt> is 16 to 31</td></tr></tbody></table>

---
