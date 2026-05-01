# Vocabulary/curlylfdot - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/curlylfco "Vocabulary/curlylfco") [<<](https://code.jsoftware.com/wiki/Vocabulary/curlylf "Vocabulary/curlylf")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d521.htm "jdic:d521")

<table class="wikitable"><tbody><tr><td><tt>{. y</tt></td><td>Head</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank_iy "Vocabulary/RankInfo") _\-- operates on x and y as a whole, by items of y --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

The leading [item](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of y

```
   {. 'abc'
a

```
---

### Common uses

1\. Convert a single-item [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") y into an [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET")

```
   'a' -: {. ,'a'
1

```

2\. More generally, take the first [item](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") y, producing an array of lower [rank.](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET")

```
   \]z =: i. 3 4
0 1  2  3
4 5  6  7
8 9 10 11
   {. z
0 1 2 3

```

3\. When applied on a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET"), e.g. the rows of a [table](https://code.jsoftware.com/wiki/Vocabulary/AET#Table "Vocabulary/AET"), take the first [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") on each row

```
   {."1 z
0 4 8

```
---

[Behead](https://code.jsoftware.com/wiki/Vocabulary/curlyrtdot "Vocabulary/curlyrtdot") (}. y), [Tail](https://code.jsoftware.com/wiki/Vocabulary/curlylfco "Vocabulary/curlylfco") ({: y), [Curtail](https://code.jsoftware.com/wiki/Vocabulary/curlyrtco "Vocabulary/curlyrtco") (}: y)

---

### More Information

0\. A video lab has been created for J901 on both the JHS and jqt platforms in the add-ons category of the labs section of J. It includes two videos covering some of these topics as well as interactive opportunities to explore the Head Monadic Verb. It can be viewed all at once '[Head monadic verb complete video](https://www.youtube.com/watch?v=FV9G5zeRnPg)' or in parts [Head monadic verb Part 1](https://www.youtube.com/watch?v=Szo4FNzsXa0) ; [Head monadic verb Part 2](https://www.youtube.com/watch?v=Wup3WjZrqkI)

1\. Unless y is an atom, the rank of {. y is 1 less than the [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") of y. This is different from 1{.y which is a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") of [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of y (and therefore has the same rank as y unless y is an [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET")).

({. y) is equivalent to (0 { 1 {. y)

```
   \]z =: i. 3 4
0 1  2  3
4 5  6  7
8 9 10 11
   {. z
0 1 2 3
   1 {. z    NB. they look the same...
0 1 2 3
   $ {. z
4
   $ 1 {. z  NB. ...but they have different shapes
1 4

```

2\. If y has no [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET"), {. y produces an item of [fill atoms](https://code.jsoftware.com/wiki/Vocabulary/Glossary#FillAtom "Vocabulary/Glossary"). {.!.f sets the fill atom, which by default is the [fill](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Fill "Vocabulary/Glossary") appropriate for the [type](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Type "Vocabulary/Glossary") of y.

y has no items but each of the (nonexistent) items can have a [shape.](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET") The result is a [noun](https://code.jsoftware.com/wiki/Vocabulary/AET#Noun "Vocabulary/AET") with that shape made up of fill atoms.

```
   {. 0 $ a:
++
||
++
   {. 0 $ 0
0
   {.!.'b' 0 $ 0
b
   i. 0 3 4      NB. 0 items, each of shape 3 4
   {. i. 0 3 4   NB. create an item of fills
0 0 0 0
0 0 0 0
0 0 0 0
   {. i. 0 0 4   NB. The item has shape 0 4
   $ {. i. 0 0 4
0 4

```
---

### Use These Combinations

Combinations using {. y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Apply dyads to infixes (or entire axes) of length 2</td><td></td><td><tt>2 f/\ y</tt></td><td></td><td>fastest way to apply <tt>f</tt> when there are 2 items (faster than <tt>({. f {:)</tt>)</td></tr><tr><td>Count number of equal items per partition, and one copy of the item</td><td>list</td><td><tt>x (#,{.)/. y</tt></td><td>also <tt>({.,#)</tt></td><td>avoids building argument cells of <tt>y</tt></td></tr></tbody></table>

---

<table class="wikitable"><tbody><tr><td><tt>x {. y</tt></td><td>Take</td></tr></tbody></table>

[Rank 1 \_](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank1_s "Vocabulary/RankInfo") _\-- operates on lists of x and the entirety of y --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

The leading x [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of y.

...the _trailing_ x items, if x is negative.

```
   2 {. 'abcde'
ab
   \_2 {. 'abcde'
de

```
---

### Common uses

1\. Convert a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") to a fixed size

```
   6 {. 3 1 4 1 5 9 6 2 3 5
3 1 4 1 5 9
   6 {. 3 1 4
3 1 4 0 0 0

```

2\. (With [Drop](https://code.jsoftware.com/wiki/Vocabulary/curlyrtdot#dyadic "Vocabulary/curlyrtdot") }.) Chop out an [interval](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Interval "Vocabulary/Glossary") from a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET")

C/f MID$ in BASIC, substr() in other languages

```
   az=: 'abcdefghijklmnopqrstuvwxyz'
   3 {. 5 }. az
fgh

```

[Subarray](https://code.jsoftware.com/wiki/Vocabulary/semidot0#dyadic "Vocabulary/semidot0") \];.0 is a better way to do this.

3\. (With [Drop](https://code.jsoftware.com/wiki/Vocabulary/curlyrtdot#dyadic "Vocabulary/curlyrtdot") }.) Split a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") into beginning and ending sections

```
   split   NB. defined in stdlib
{. ,&< }.
   lst=: 'abcde'
   2 split lst
+--+---+
|ab|cde|
+--+---+
   'hd lst'=: split lst
   hd ; lst
+-+----+
|a|bcde|
+-+----+

```

split is a

-   [Standard Library](http://www.jsoftware.com/help/user/library.htm) word(s) residing in the 'z'-locale
-   Defined in the factory script stdlib.ijs which is located in  ~system/main/stdlib.ijs-   View the definition(s) in a JQt session by entering:  open '~system/main/stdlib.ijs'
---

[Drop](https://code.jsoftware.com/wiki/Vocabulary/curlyrtdot#dyadic "Vocabulary/curlyrtdot") (x }. y)

---

### More Information

1\. An x greater than #y specifies an [overtake](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Overtake "Vocabulary/Glossary"): the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") will have x [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET"), with the items past #y containing [fill atoms](https://code.jsoftware.com/wiki/Vocabulary/Glossary#FillAtom "Vocabulary/Glossary"). {.!.f sets the fill atom, which by default is the [fill](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Fill "Vocabulary/Glossary") appropriate for the [type](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Type "Vocabulary/Glossary") of y.

```
   \_5 {. 'abc'        NB. Overtake: result is 5 atoms, with blank fill
  abc
   \_5 {.!.'\*' 'abc'   NB. Changed fill atom
\*\*abc
   \]a =: i. 2 4
0 1 2 3
4 5 6 7
   3 {. a             NB. result has 3 items, filled
0 1 2 3
4 5 6 7
0 0 0 0

```

2\. If x is a list, each [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") of x specifies a _take_ operation along the corresponding [axis](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Axis "Vocabulary/Glossary") of y.

```
   \]a =: \_4 \]\\ 'abcdefghijkl'
abcd
efgh
ijkl
   \_4 2 {.!.'\*' a     NB. overtake the first axis, and take 1st two atoms in each row
\*\*
ab
ef
ij

```
---

### Details

1\. An [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") of x equal to \_ or \_\_ specifies that the corresponding [axis](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Axis "Vocabulary/Glossary") is to be _taken in full_.

```
   \_ 2 {. a           NB. Take all rows, and 1st 2 atoms in each row
ab
ef
ij

```

2\. When x is a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET"), axes of y beyond the length of x are taken in full.

3\. If y is an [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET"), x must not be longer than the [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") of y.

```
   2 3 {. i. 4
|length error

```

4\. If y is an [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET"), leading axes of length 1 are added as needed to bring its [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") up to the same as the length of x, and then the _take_ operations are applied.

5\. If x is [empty](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Empty "Vocabulary/Glossary"), x {. y is the same as y. This is the only way that the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") of x {. y can be an [atom.](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET")

---

### Use These Combinations

Combinations using  x{. y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Operations on a flattened array</td><td></td><td><tt>x ({ ,) y</tt><p><tt>x ({. ,) y</tt><br><tt>x (}. ,) y</tt><br><tt>x (e. ,) y</tt><br><tt>f/@, y</tt><br><small>(<tt>f</tt> is any verb)</small></p></td><td>or <tt>@:</tt> <tt>&amp;</tt> <tt>&amp;:</tt> <small>in place of</small> <tt>@</tt></td><td>Avoids copying the array to compute (<tt>,y</tt>)</td></tr></tbody></table>

---
