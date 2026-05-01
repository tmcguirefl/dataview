# Vocabulary/curlylf - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/curlylfdot "Vocabulary/curlylfdot") [<<](https://code.jsoftware.com/wiki/Vocabulary/squarert "Vocabulary/squarert")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d520.htm "jdic:d520")

<table class="wikitable"><tbody><tr><td><tt>{ y</tt></td><td>Catalogue</td></tr></tbody></table>

[Rank 1](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank1varany "Vocabulary/RankInfo") _\-- operates on lists of y, producing a result of variable shape for each one --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Combines [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") from the [atoms](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") inside a [boxed](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boxed "Vocabulary/Glossary") [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") to form a _catalogue_.

```
   { 0 1 ; 7 8 9
+---+---+---+
|0 7|0 8|0 9|
+---+---+---+
|1 7|1 8|1 9|
+---+---+---+

```
---

### Common uses

Form the Cartesian Product of two [lists](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET"), x and y

```
   CP=: {@(,&<)   NB. example from Voc
   0 1 CP 7 8 9
+---+---+---+
|0 7|0 8|0 9|
+---+---+---+
|1 7|1 8|1 9|
+---+---+---+

```

**Note:** [Table](https://code.jsoftware.com/wiki/Vocabulary/slash#dyadic "Vocabulary/slash") (/) has a similar action. It is the more usual [primitive](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Primitive "Vocabulary/Glossary") to use for this task.

```
   0 1 (<@,"0)/ 7 8 9
+---+---+---+
|0 7|0 8|0 9|
+---+---+---+
|1 7|1 8|1 9|
+---+---+---+

```
---

### Details

1\. The shape of the [contents](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Content "Vocabulary/Glossary") of each box of the result is  $y .

2\. The [shape](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET") of the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") is the concatenation of the shapes of the [opened](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Open "Vocabulary/Glossary") [atoms](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") of y, i.e.  ; $&.> y .

3\. The [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") that go into the [box](https://code.jsoftware.com/wiki/Vocabulary/AET#Box "Vocabulary/AET") whose [index list](https://code.jsoftware.com/wiki/Vocabulary/Glossary#IndexList "Vocabulary/Glossary") is i are selected by i <;.1~ ; (1 {.~ #@$)&.> y

```
   y =. (2 2 $ 'cbmw');'ae';'tpn'
   {y
+---+---+---+
|cat|cap|can|
+---+---+---+
|cet|cep|cen|
+---+---+---+

+---+---+---+
|bat|bap|ban|
+---+---+---+
|bet|bep|ben|
+---+---+---+


+---+---+---+
|mat|map|man|
+---+---+---+
|met|mep|men|
+---+---+---+

+---+---+---+
|wat|wap|wan|
+---+---+---+
|wet|wep|wen|
+---+---+---+
   ${y
2 2 2 3
   ; $&.> y
2 2 2 3
   $y
3
   (<1 0 1 2) { {y
+---+
|men|
+---+
   \]s =.1 0 1 2 <;.1~ ; (1 {.~ #@$)&.> y   NB. item selected from each box of y
+---+-+-+
|1 0|1|2|
+---+-+-+
   s ({ >)"0 y  NB. select them
men

```
---

<table class="wikitable"><tbody><tr><td><tt>x { y</tt></td><td>From</td></tr></tbody></table>

[Rank 0 \_](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank0 "Vocabulary/RankInfo") _\-- operates on atoms of x, and the entirety of y --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Selects the [item](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") with [index](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Index "Vocabulary/Glossary") x from the [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") y . Negative [values](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary") of x count back from the end of the [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET"), which is [item](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") number \_1.

Takes the place of _indexing an array_ in other computer languages.

For indexing into a multidimensional array, see [(x {:: y)](https://code.jsoftware.com/wiki/Vocabulary/curlylfcoco#multidim "Vocabulary/curlylfcoco")

To replace item x in y, see: [Amend](https://code.jsoftware.com/wiki/Vocabulary/curlyrt#Dyadic "Vocabulary/curlyrt") (})

```
   z=: 'abcde'
   1 { z
b
   1 \_1 { z
be
   2 4 { z
ce

```

Each [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") of x specifies one selection. The selected [results](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") are assembled into an [array.](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET")

```
   i. 2 2
0 1
2 3
   (i. 2 2) { z
ab
cd

```

{ works with y of any [rank.](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET")

-   The [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of an [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") are the [cell](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Cell "Vocabulary/Glossary") one rank less than the array.
-   The items of a [table](https://code.jsoftware.com/wiki/Vocabulary/AET#Table "Vocabulary/AET") are [lists](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET"); the items of a [brick](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Brick "Vocabulary/Glossary") are [tables.](https://code.jsoftware.com/wiki/Vocabulary/AET#Table "Vocabulary/AET")
```
   \] z=: i.3 5
 0  1  2  3  4
 5  6  7  8  9
10 11 12 13 14
   1 { z
5 6 7 8 9
   2 0 { z
10 11 12 13 14
 0  1  2  3  4

```

[Boxed](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boxed "Vocabulary/Glossary") x can specify indexing along multiple axes, selection of subarrays, and more.

```
   (<2 1) { z  NB. Select row 2, column 1
11
   (<2 1;1 3) { z   NB. Select rows 2&1, columns 1&3
11 13
 6  8

```
---

### Common uses

1\. Convert from an [ASCII](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Ascii "Vocabulary/Glossary") code to the corresponding [byte](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Byte "Vocabulary/Glossary")

```
   65 97 { a.
Aa

```

2\. Select a column from a table

```
   \] z=: i.3 5
 0  1  2  3  4
 5  6  7  8  9
10 11 12 13 14
   1 {"1 z
1 6 11
   (<a:;1) { z
1 6 11

```

3\. The [Foreign](https://code.jsoftware.com/wiki/Vocabulary/bangco "Vocabulary/bangco") (5!:5) (Linear Representation) employs **From** ({) in its output when designating the position in the J-alphabet of a non-printable [character](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Character "Vocabulary/Glossary"), e.g. Linefeed (LF):

```
   linefeed=: LF"\_
   type 'linefeed'
+----+
|verb|
+----+
   5!:5 <'linefeed'
(10{a.)"\_

```
---

[Amend](https://code.jsoftware.com/wiki/Vocabulary/curlyrt#Dyadic "Vocabulary/curlyrt") (x m} y)

---

### More Information

#### Beyond Items: Boxed x

x { y at its most general can select a specified subarray of y, where the selected elements and their order can be controlled independently for each [axis.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Axis "Vocabulary/Glossary") Since each [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") of x is processed separately (because the left [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") of (x { y) is 0), [values](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary") of x that specify more complex indexing must be put into a single [atomic](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Atom "Vocabulary/Glossary") **box**.

A subarray is specified by a **[list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") of [boxes](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boxe "Vocabulary/Glossary")** where each box contains the [selector](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Selector "Vocabulary/Glossary") for one [axis.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Axis "Vocabulary/Glossary") **The list of selectors is itself put into a box** so that it becomes an [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") and is therefore usable as a left [argument](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET") to x { y.

The selectors are applied in order:

-   the first selector selects an [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") of [\_1-cells](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Cell "Vocabulary/Glossary") of y
-   the second selector selects an array from each of those cells
-   and so on.

A [selector](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Selector "Vocabulary/Glossary") is a [noun](https://code.jsoftware.com/wiki/Vocabulary/AET#Noun "Vocabulary/AET"), each [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") of which gives one selection for the [axis.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Axis "Vocabulary/Glossary")

-   If the selector is an atom, the selected position is taken and no corresponding axis is created in the [result.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary")
-   If the selector is an array, the selected positions are collected into an array of selections whose [shape](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET") equals the shape of the selector.

We will use the following test array and test verb

```
   \]a =: 5 6 $ 'abcdefghijklmnopqrstuvwxyz0123'
abcdef
ghijkl
mnopqr
stuvwx
yz0123
   NB. Verb to show shape
showshape =: 'empty' \[^:(0=\*@#@\]) $
   NB. Verb to show one selection
headings =. ('Array';('Selectors','-',:' Shapes ');'Selection';'Selected Shape')
showsel =: headings ,: (\] ; (,: showshape L:0)@:>@\[ ; { (;<) showshape@{)

```

To select a single [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET"), specify its [index list](https://code.jsoftware.com/wiki/Vocabulary/Glossary#IndexList "Vocabulary/Glossary")

```
   (<(<2),(<3)) showsel a

+------+-------------+---------+--------------+
|Array |Selectors    |Selection|Selected Shape|
|      |--------     |         |              |
|      | Shapes      |         |              |
+------+-------------+---------+--------------+
|abcdef|+-----+-----+|p        |empty         |
|ghijkl||2    |3    ||         |              |
|mnopqr|+-----+-----+|         |              |
|stuvwx||empty|empty||         |              |
|yz0123|+-----+-----+|         |              |
+------+-------------+---------+--------------+

```

Row 2, column 3. A single atom is selected.

If a selector contains an array, the selections are arrayed along those axes:

```
   (<(<2 1),(<2 3 5)) showsel a
+------+-----------+---------+--------------+
|Array |Selectors  |Selection|Selected Shape|
|      |--------   |         |              |
|      | Shapes    |         |              |
+------+-----------+---------+--------------+
|abcdef|+---+-----+|opr      |2 3           |
|ghijkl||2 1|2 3 5||ijl      |              |
|mnopqr|+---+-----+|         |              |
|stuvwx||2  |3    ||         |              |
|yz0123|+---+-----+|         |              |
+------+-----------+---------+--------------+

```

Selecting 2 positions in the first axis, 3 in the second, to yield a 2x3 array. Note that the order of the atoms of the selector is preserved in the selection.

As usual, there is a difference between an atom and a 1-element list

```
   (<(<,2),(<3)) showsel a
+------+---------+---------+--------------+
|Array |Selectors|Selection|Selected Shape|
|      |-------- |         |              |
|      | Shapes  |         |              |
+------+---------+---------+--------------+
|abcdef|+-+-----+|p        |1             |
|ghijkl||2|3    ||         |              |
|mnopqr|+-+-----+|         |              |
|stuvwx||1|empty||         |              |
|yz0123|+-+-----+|         |              |
+------+---------+---------+--------------+

```

The same atom is selected, but it is part of an array (a list).

---

#### Complementary Indexing and Omitted Axes

If a selector is [boxed](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boxed "Vocabulary/Glossary"), (which means it is a box within a list of boxes within another box), it specifies all the positions **except** the ones in the [opened](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Opened "Vocabulary/Glossary") [selector](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Selector "Vocabulary/Glossary"). These positions are arranged into a list, in ascending order.  
The boxed selector must be an atomic box. Its contents may have any shape but each atom of the contents must be a valid index for the axis.

```
   (<(<<1 3),(<3 4)) showsel a
+------+-----------+---------+--------------+
|Array |Selectors  |Selection|Selected Shape|
|      |--------   |         |              |
|      | Shapes    |         |              |
+------+-----------+---------+--------------+
|abcdef|+-----+---+|de       |3 2           |
|ghijkl||+---+|3 4||pq       |              |
|mnopqr|||1 3||   ||12       |              |
|stuvwx||+---+|   ||         |              |
|yz0123|+-----+---+|         |              |
|      ||+-+  |2  ||         |              |
|      |||2|  |   ||         |              |
|      ||+-+  |   ||         |              |
|      |+-----+---+|         |              |
+------+-----------+---------+--------------+

```

The selection was all rows **except** 1 and 3, and columns 3 and 4.

To select all of an [axis](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Axis "Vocabulary/Glossary") without knowing its length, use complementary selection to select all positions except an [empty](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Empty "Vocabulary/Glossary") [list.](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") That will select everything. Such a selector would be (<0$0) which happens to be the primitive a::

A selector of a: designates an _omitted axis_ which is **taken in full**.

```
   (<(<a:),(<3 4)) showsel a
+------+---------+---------+--------------+
|Array |Selectors|Selection|Selected Shape|
|      |-------- |         |              |
|      | Shapes  |         |              |
+------+---------+---------+--------------+
|abcdef|+---+---+|de       |5 2           |
|ghijkl||++ |3 4||jk       |              |
|mnopqr|||| |   ||pq       |              |
|stuvwx||++ |   ||vw       |              |
|yz0123|+---+---+|12       |              |
|      ||+-+|2  ||         |              |
|      |||0||   ||         |              |
|      ||+-+|   ||         |              |
|      |+---+---+|         |              |
+------+---------+---------+--------------+

```

All rows, columns 3 and 4.

If there are fewer selectors than axes, the trailing axes are omitted axes and are taken in full:

```
   (<(<<4 2)) showsel a
+------+---------+---------+--------------+
|Array |Selectors|Selection|Selected Shape|
|      |-------- |         |              |
|      | Shapes  |         |              |
+------+---------+---------+--------------+
|abcdef|+-----+  |abcdef   |3 6           |
|ghijkl||+---+|  |ghijkl   |              |
|mnopqr|||4 2||  |stuvwx   |              |
|stuvwx||+---+|  |         |              |
|yz0123|+-----+  |         |              |
|      ||+-+  |  |         |              |
|      |||2|  |  |         |              |
|      ||+-+  |  |         |              |
|      |+-----+  |         |              |
+------+---------+---------+--------------+

```

All rows except 2 and 4, and all columns.

---

#### Singly-boxed x

If an [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") of x contains a [numeric](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Numeric "Vocabulary/Glossary") [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") rather than a list of [boxes](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Box "Vocabulary/Glossary"), each 1-cell of the array is an index list of a cell to be selected; the cells are arranged into an array according to the shape of x. This is the way to perform _**scatter-indexing**_ of disordered cells.

In the simplest case where \>x is a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET"), each atom of the list is treated as a selector. This generates an atomic selection for as many axes as there are numbers in the list.

Remaining axes are taken in full.

This is the normal way to perform multidimensional indexing where the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") is a single [cell](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Cell "Vocabulary/Glossary")

```
   (<2 3) { a
p

```

Row 2, column 3.

---

#### Unboxed x

When x is [unboxed](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boxed "Vocabulary/Glossary"), each [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") of x is treated as a single selector for the first [axis](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Axis "Vocabulary/Glossary"), with the remaining axes taken in full. This is the case we encountered in the beginning: each atom of x selects an [item](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of y.

---

#### Empty x

There are many ways of selecting nothing. The results are surprising, but they follow the rules for applying verbs on empty arguments.

```
   $ '' { i. 3 4
0 4

```

Here there was _no selection_. The verb ({) was executed on a cell of fills, as (0 { i. 3 4). This result has shape 4, and the frame (0) was prepended to give the shape of the overall result.

```
   $ (<'') { i. 3 4
3 4

```

Here there was a selection with _no axes_. All axes after the last one specified are taken in full; with nothing specified, they are all taken in full, so everything is selected.

```
   $ (0$a:) { i. 3 4
0 3 4

```

Again _no selection_, but now the fill-cell is a: and (a: { i. 3 4) was executed to find its shape. This result has shape 3 4, and the frame (0) was prepended to give the shape of the overall result.

```
   $ (<<'') { i. 3 4
0 4

```

Here there was a selection with _one axis with no values_. The corresponding axis in the result is empty, and all axes after it are taken in full.

---

### Details

1\. a: { y selects all of y. This follows the rules. a: is a single-[boxed](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boxed "Vocabulary/Glossary") [empty](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Empty "Vocabulary/Glossary") [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET"), so it makes an [atomic](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") selection from no axes, and then takes the remaining axes in full; that is, all axes are taken in full.

2\. An [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") has one [item](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET"), which can be selected.

```
   0 \_1 { 5
5 5

```

If the [selector](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Selector "Vocabulary/Glossary") from an atomic y is boxed, its contents must be [empty.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Empty "Vocabulary/Glossary")

3\. An [index](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Index "Vocabulary/Glossary") _i_ for an [axis](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Axis "Vocabulary/Glossary") of length _n_ must be in the range (_\-n_)≤_i_<_n_. This restriction holds even if the selector is complementary.

4\. A selector may be a [noun](https://code.jsoftware.com/wiki/Vocabulary/AET#Noun "Vocabulary/AET") of any [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET"), not just an [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") or a [list.](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") The selected positions are collected into an [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") using the [shape](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET") of the [selector](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Selector "Vocabulary/Glossary"), with each atom of the selector replaced by its selection.

5\. The shape of the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") is the concatenation of the shapes of all the selectors, after x has been put into selector form (i.e. a box containing a list of boxed selectors) and all omitted and complementary axes have been replaced with equivalent lists.

---

### Use These Combinations

Combinations using x { y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include those shown in [Selections](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations#selections "Vocabulary/SpecialCombinations") and [Sorting and Ordering](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations#sorting "Vocabulary/SpecialCombinations"), as well as the following:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Operations on a flattened array</td><td></td><td><tt>x ({ ,) y</tt><p><tt>x ({. ,) y</tt><br><tt>x (}. ,) y</tt><br><tt>x (e. ,) y</tt><br><tt>f/@, y</tt><br><small>(<tt>f</tt> is any verb)</small></p></td><td>or <tt>@:</tt> <tt>&amp;</tt> <tt>&amp;:</tt> <small>in place of</small> <tt>@</tt></td><td>Avoids copying the array to compute (<tt>,y</tt>)</td></tr></tbody></table>

<table class="wikitable"><tbody><tr><td>Follow a chain of variable-length records</td><td>integer <tt>x</tt> and <tt>y</tt></td><td><tt>{&amp;x^:a: y</tt><p><tt>x {~^:a: y</tt></p></td><td><tt>&lt;_</tt> <small>in place of</small> <tt>a:</tt></td><td>Produces list of starting positions. Limit all values of <tt>x</tt> to at most <tt>#x</tt>, then append <tt>_1</tt> to the end of <tt>x</tt>. Discard the final starting position of <tt>_1</tt>.</td></tr></tbody></table>

---
