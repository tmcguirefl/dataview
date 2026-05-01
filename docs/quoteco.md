# Vocabulary/quoteco - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/grave "Vocabulary/grave") [<<](https://code.jsoftware.com/wiki/Vocabulary/quotedot "Vocabulary/quotedot")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d602.htm "jdic:d602")

<table class="wikitable"><tbody><tr><td><tt>": y</tt></td><td>Default Format</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank "Vocabulary/RankInfo") _\-- operates on x and y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Converts y to an [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") of [bytes](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Byte "Vocabulary/Glossary"), converting non-[character](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Character "Vocabulary/Glossary") [types](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Type "Vocabulary/Glossary") to displayable form.

If y is already [bytes](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Byte "Vocabulary/Glossary"), then ":y is the same as y.

```
   \] y=: 1 2 3 ; 4 5 6
+-----+-----+
|1 2 3|4 5 6|
+-----+-----+
   \]z=: ": y
+-----+-----+
|1 2 3|4 5 6|
+-----+-----+
   $ z
3 13

```
---

### Common uses

1\. Embed a [number](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Number "Vocabulary/Glossary") n in an output message

which needs n to be in [string](https://code.jsoftware.com/wiki/Vocabulary/Glossary#String "Vocabulary/Glossary") form

```
   n=: 99.5
   smoutput 'Time taken: ' , (":n) , ' seconds'
Time taken: 99.5 seconds

```

**Note:** The [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") nb (which hinges on the use of ":) gives an easy way to make output messages

```
   nb =: (;:^:\_1) @: (":&.>)
   smoutput nb 'Time taken:';99.5;'seconds'
Time taken: 99.5 seconds

```

2\. Convert [numbers](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Number "Vocabulary/Glossary") to [string](https://code.jsoftware.com/wiki/Vocabulary/Glossary#String "Vocabulary/Glossary") form so they can be written to a file

```
   \]list =. 3 1 4 1 5 9
3 1 4 1 5 9
   ": list
3 1 4 1 5 9

```

5!:5 <'list' is a more general way to create the [string](https://code.jsoftware.com/wiki/Vocabulary/Glossary#String "Vocabulary/Glossary") form of a [noun:](https://code.jsoftware.com/wiki/Vocabulary/AET#Noun "Vocabulary/AET") list .

---

### More Information

1\. For more complex formatting using a format string to specify particular behavior, e.g. for negative numbers, or character insertion, like commas in a long number, see [the foreign _8!:0_](https://www.jsoftware.com/help/dictionary/dx008.htm).

2\. You don't need to bother with the [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") of y because ": has infinite [rank.](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") It automatically puts spaces within [boxes](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Box "Vocabulary/Glossary") and between numbers to line up everything correctly. It does this no matter how many axes y has. As a general rule, what you would see in the J [session](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Session "Vocabulary/Glossary") window is what you get in the [result.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary")

3\. A [box](https://code.jsoftware.com/wiki/Vocabulary/AET#Box "Vocabulary/AET") gets formatted as a [byte](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Byte "Vocabulary/Glossary") [table](https://code.jsoftware.com/wiki/Vocabulary/AET#Table "Vocabulary/AET") whose border uses the _box-drawing characters_ set by [Vocabulary/Foreigns#m9](https://code.jsoftware.com/wiki/Vocabulary/Foreigns#m9 "Vocabulary/Foreigns") (9!:7). The contents of the [box](https://code.jsoftware.com/wiki/Vocabulary/AET#Box "Vocabulary/AET") are formatted as a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") or [table.](https://code.jsoftware.com/wiki/Vocabulary/AET#Table "Vocabulary/AET") If the [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") of the contents exceeds 2, the contents are converted to a [table](https://code.jsoftware.com/wiki/Vocabulary/AET#Table "Vocabulary/AET") by adding a blank row between the last [cell](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Cell "Vocabulary/Glossary") of each [axis](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Axis "Vocabulary/Glossary") and the following cell 0 for that axis.

4\. Each [2-cell](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Cell "Vocabulary/Glossary") of y becomes a 2-cell of the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") of  ":y .

5\. If y is [non-empty](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Empty "Vocabulary/Glossary") and [boxed](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boxed "Vocabulary/Glossary") with [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") less than 2,  ":y is a [table.](https://code.jsoftware.com/wiki/Vocabulary/AET#Table "Vocabulary/AET")

6\. If y is [empty](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Empty "Vocabulary/Glossary") or not [boxed](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boxed "Vocabulary/Glossary"), and has [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") less than 2,  ":y is a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET").

7\. Each [number](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Number "Vocabulary/Glossary") in y is formatted independently. If the number is [complex](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Complex "Vocabulary/Glossary"), its real and imaginary parts are formatted independently.

8\. Each [character](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Character "Vocabulary/Glossary") [noun](https://code.jsoftware.com/wiki/Vocabulary/AET#Noun "Vocabulary/AET") in y is formatted using [Unicode](https://code.jsoftware.com/wiki/Vocabulary/uco "Vocabulary/uco") (8&u:"1). This will leave [byte](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Byte "Vocabulary/Glossary") [precisions](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Precision "Vocabulary/Glossary") unchanged, but convert any [unicodes](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Unicode "Vocabulary/Glossary") to UTF-8 encoding. It may also add [framing fill](https://code.jsoftware.com/wiki/Vocabulary/FramingFill "Vocabulary/FramingFill"), if 1-[cells](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Cell "Vocabulary/Glossary") have varying lengths after UTF-8 encoding.

9\. The horizontal and vertical alignment for the contents of boxed y is set by [Vocabulary/Foreigns#m9](https://code.jsoftware.com/wiki/Vocabulary/Foreigns#m9 "Vocabulary/Foreigns") (9!:17) and used as described for [phrase](#boxed) (x ": y).

---

### Boxed y

When y is boxed, the contents of each box is formatted into a table of characters, and the contents of the boxes are separated by [box-drawing characters](#boxing) to produce a ruled display.

The boxing characters produce a pleasant ruled display only when they are viewed with a monospace font, such as Courier New.

#### UTF-8 characters in boxes

When boxes contain non-ASCII byte strings, these strings are interpreted as UTF-8. ". y performs the following steps:

1\. If any string contains non-ASCII characters, it is converted to Unicode characters.  
If the rank of y is greater than 1, each list of y is converted independently and the results assembled into an array.

2\. If any string contains Unicode characters, either because the string started as Unicode or because it was converted to Unicode in step 1, all characters are converted to Unicode precision.

3\. Boxing characters are installed, with the assumption that each character will occupy one space on the display

4\. If the array has Unicode precision, it is converted back to byte precision, with each non-ASCII character represented as a multibyte UTF-8 sequence.

Because the lines of the Unicode array produced by step 2 may contain different numbers of non-ASCII characters, the final step of conversion back to byte precision may introduce spaces at the ends of lines. These spaces are required to produce a valid J result, since J does not support ragged arrays.

#### CJK (Chinese/Japanese/Korean) characters

Unicode characters for East Asian languages (referred to as Chinese/Japanese/Korean or _**CJK**_) require a special font for proper boxed display. [Unifont](http://unifoundry.com/pub/) is one such font. A suitable font must:

1\. support two widths of character (called _**fullwidth**_ and _**halfwidth**_ in the Unicode documents)

2\. define each fullwidth character to be exactly twice as wide as each halfwidth character

3\. define the boxing characters as halfwidth characters

4\. give each character the proper width as defined by the [Unicode standard](http://www.unicode.org/Public/UCD/latest/ucd/EastAsianWidth.txt)

With a suitable font installed, boxed CJK characters will display correctly in their boxes.

Support for CJK characters inserts one extra step into the processing flow given [above](#UTF8):

2a. Each fullwidth CJK character has a NUL character (U+0000) appended following the CJK character. Since the NUL character has no display, and the fullwidth character takes two display positions, the pair of characters takes a pair of display positions, and the internal array including the boxing characters does not require fill.

The added NUL characters are removed during the conversion of the Unicode characters to UTF-8-encoded bytes. If the original characters included NUL characters following fullwidth characters, those original NUL characters will be removed; if you need to keep them, you must duplicate the NUL character.

### Details

1\. The _print precision_ d is the number of digits of significance that will be displayed by  ": y. By default it is the value set by [(9!:11](https://code.jsoftware.com/wiki/Vocabulary/Foreigns#m9 "Vocabulary/Foreigns")), initially 6, but it may be overridden by using the form  ":!.d .

2\. The format for each number is specified in terms of the field specifiers used by [x ": y](#dyadic) :

<table class="wikitable"><tbody><tr><td colspan="3"><b>Field Specifier Used For Numbers</b></td></tr><tr><td><b>Type</b></td><td><b>Magnitude</b></td><td><b>Field Specifier</b></td></tr><tr><td colspan="2">Integer</td><td><tt>0</tt></td></tr><tr><td rowspan="3">Floating<p>or<br>Complex</p></td><td><tt>&lt; 0.0001</tt></td><td><tt>0 j. -d</tt> (scientific notation with d significant digits)</td></tr><tr><td><tt>&gt; 0.0001</tt><p><tt>&lt; 10^d</tt></p></td><td><tt>0 j. 0 &gt;. d - &gt;. 10 ^. </tt><i><tt>value</tt></i> (decimal notation, with a total of <tt>d</tt> significant digits)</td></tr><tr><td><tt>&gt;: 10^d</tt></td><td><tt>0 j. -d)</tt> (scientific notation with <tt>d-1</tt> fractional digits)</td></tr></tbody></table>

3\. Regardless of the field specifier, trailing zeros below the decimal point, and the decimal point itself if there are no nonzero decimal places, are omitted.

4\. Box-drawing characters selected from the set specified by [(9!:7)](https://code.jsoftware.com/wiki/Vocabulary/Foreigns#m9 "Vocabulary/Foreigns") are placed around the contents of each [box](https://code.jsoftware.com/wiki/Vocabulary/AET#Box "Vocabulary/AET")

```
      tohex =: \[: ,"2 ' ' (,"1) '0123456789ABCDEF' {~ 16 16 #: a. i. \]  NB. display in hex
   9!:6''               NB. Using the special boxing characters
+++++++++|-
   tohex 9!:6 ''        NB. This is their hex form
 10 11 12 13 14 15 16 17 18 19 1A
   tohex ": 5 ; 'abc'   NB. displayable form is 3x6 array of bytes
 10 1A 11 1A 1A 1A 12
 19 35 19 61 62 63 19
 16 1A 17 1A 1A 1A 18

```

Here 35 represents 5, 61 62 63 represents abc, and the rest are box-drawing characters. The [byte](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Byte "Vocabulary/Glossary") [indexes](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Index "Vocabulary/Glossary") 10\-1A (hex) used above are special [values](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary") that are [translated to Unicode during display](https://code.jsoftware.com/wiki/Vocabulary/ScreenOutputInput "Vocabulary/ScreenOutputInput").

If you want to set your own boxing characters, use  9!:7 y where y is a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") of precisely 11 [bytes.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Byte "Vocabulary/Glossary") This sets the box-drawing characters.

<table class="wikitable"><tbody><tr><td colspan="8"><b>The meaning of the bytes in <tt>9!:7 y</tt></b></td></tr><tr><td><b>Index</b></td><td><b>Meaning</b></td><td><b>Index</b></td><td><b>Meaning</b></td><td><b>Index</b></td><td><b>Meaning</b></td><td><b>Index</b></td><td><b>Meaning</b></td></tr><tr><td><tt>0</tt></td><td>Top left corner +</td><td><tt>3</tt></td><td>Left tee +</td><td><tt>6</tt></td><td>Bottom left corner +</td><td><tt>9</tt></td><td>Vertical bar |</td></tr><tr><td><tt>1</tt></td><td>Top tee +</td><td><tt>4</tt></td><td>4-way intersection +</td><td><tt>7</tt></td><td>Bottom tee +</td><td><tt>10</tt></td><td>Horizontal bar -</td></tr><tr><td><tt>2</tt></td><td>Top right corner +</td><td><tt>5</tt></td><td>Right tee +</td><td><tt>8</tt></td><td>Bottom right corner +</td></tr></tbody></table>

5\. When y is a [sparse array](https://code.jsoftware.com/wiki/Vocabulary/Glossary#SparseArray "Vocabulary/Glossary"), ": y is a [table](https://code.jsoftware.com/wiki/Vocabulary/AET#Table "Vocabulary/AET") of [characters](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Character "Vocabulary/Glossary") with one row for each [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") that is stored in the [array.](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") The row contains the [index](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Index "Vocabulary/Glossary") [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") of the [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET"), followed by |, followed by the [value](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary") of the atom.

```
   ": %: $. i. 3 3   NB. Note that the atom at (0 0) is not stored
0 1 |       1
0 2 | 1.41421
1 0 | 1.73205
1 1 |       2
1 2 | 2.23607
2 0 | 2.44949
2 1 | 2.64575
2 2 | 2.82843

```
---

### Use These Combinations

Combinations using  ": y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Convert an integer to a numeric list of digits</td><td>Boolean, integer, extended integer</td><td><tt>"."0@": y</tt></td><td><tt>@:</tt> <tt>&amp;</tt> <tt>&amp;:</tt> <small>in place of</small> <tt>@</tt></td><td>fastest way, especially for extended integers</td></tr></tbody></table>

---

<table class="wikitable"><tbody><tr><td><tt>x ": y</tt></td><td>Format</td></tr></tbody></table>

[Rank 1 \_](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank1_r "Vocabulary/RankInfo") _\-- operates on lists of x and the entirety of y, with replication of atomic x --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Converts y to a [byte](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Byte "Vocabulary/Glossary") [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") formatted according to the specification x

y must be [numeric](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Numeric "Vocabulary/Glossary") or [boxed](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boxed "Vocabulary/Glossary")

```
   \]y=: 2 2 $ 23.567 123456.23 \_32.4 0.00347
23.567  123456
 \_32.4 0.00347
   NB. --formatting looks capricious

   x=: 6j2 11j\_5   NB. this format spec has an atom for each column of y

   x ": y
 23.57 1.23456e5
\_32.40 3.47000e\_3

```
---

### Common Uses

1\. Convert a [number](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Number "Vocabulary/Glossary") to a precise format

```
   10j2 ": 6
      6.00

```

2\. Force _scientific notation_ to appear

```
   10j\_2 ": 654000
 6.54e5

```
---

### More Information

#### Numeric y

Let y be as follows:

```
   \] y=: 2 3 $ \_3.56e5 6 \_1  0.56789 0 1.56e\_5
\_356000 6      \_1
0.56789 0 1.56e\_5

```

1\. Each [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") of x is a _field specifier_ for the corresponding atom in each 1-[cell](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Cell "Vocabulary/Glossary") of y

```
   7 5j1 8j3 ": y
\_356000  6.0  \_1.000
      1  0.0   0.000

```

If x is a single atom it is used to format every atom of y

This may result in the fractional part of some numbers getting dropped

```
   7 ": y
\_356000      6     \_1
      1      0      0

```

2\. The field specifier is a [complex](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Complex "Vocabulary/Glossary") [number](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Number "Vocabulary/Glossary") (in the general case):

<table class="wikitable"><tbody><tr><td><b>Real part:</b></td><td><tt>w</tt></td><td>field width</td><td><b>at least</b> the total characters occupied by the number in its field (with any (<tt>-</tt>) or (<tt>.</tt>))</td></tr><tr><td><b>Imaginary part:</b></td><td><tt>d</tt></td><td>decimal places</td><td>the <b>fixed</b> number of decimal places to show, for <b>every</b> number</td></tr></tbody></table>

```
   12j3 ": y
 \_356000.000       6.000      \_1.000
       0.568       0.000       0.000

```

**WARNING:** No space is automatically skipped between fields.

3\. If either w or d above is negative, the [number](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Number "Vocabulary/Glossary") is displayed using J's own form of _scientific notation_, e.g. \_1.234e\_4

The absolute values of w and d are what get used for formatting.

```
   12j\_3 ": y    NB. need to guess appropriate field width
\_3.560e5     6.000e0    \_1.000e0
 5.679e\_1    0.000e0     1.560e\_5

```

4\. If the field width is 0, the field is made just wide enough to display the [value](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary"), including

-   the sign if negative
-   the digits before the decimal point
-   the decimal point, if the number of decimal places is not 0
-   the decimal places
-   the exponent and its optional sign (if x asks for scientific notation)
-   a space, if there is another number following
```
   0j3 ": y     NB. auto calculates minimum field width required
\_356000.000 6.000 \_1.000
      0.568 0.000  0.000

```

The largest width needed at a given [index](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Index "Vocabulary/Glossary") in the 1-[cell](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Cell "Vocabulary/Glossary") is used as the width for all [numbers](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Number "Vocabulary/Glossary") at that [index.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Index "Vocabulary/Glossary")

5\. If the field is too narrow for a given number (i.e. to hold its entire integer part), the entire field fills with asterisks.

```
   6 ": y       NB. not enough room in field
\*\*\*\*\*\*     6    \_1
     1     0     0

```

6\. If y is [complex](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Complex "Vocabulary/Glossary"), the imaginary part is ignored.

```
   \]z=: y + 0j999
\_356000j999 6j999      \_1j999
0.56789j999 0j999 1.56e\_5j999

   0j\_3 ": z
\_3.560e5 6.000e0 \_1.000e0
 5.679e\_ 0.000e0  1.560e\_

```

7\. Alternative ways to format numbers:

-   the [8!:n](https://www.jsoftware.com/help/dictionary/dx008.htm "jdic:dx008") [verbs](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET")
-   the printf [addon](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Addon "Vocabulary/Glossary")

#### Boxed y

1\. x is an [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET"), or a list 1 or 2 atoms, giving the _alignment_ of box-contents. If only one [value](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary") is given, 0 is used for the second [atom.](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET")

<table class="wikitable"><tbody><tr><td colspan="3"><b>Alignment specified by <tt>x</tt> when <tt>y</tt> is boxed</b></td></tr><tr><td></td><td><b>First atom of <tt>x</tt></b></td><td><b>Second atom of <tt>x</tt></b></td></tr><tr><td><b>0</b></td><td>top</td><td>left</td></tr><tr><td><b>1</b></td><td>center</td><td>center</td></tr><tr><td><b>2</b></td><td>bottom</td><td>right</td></tr></tbody></table>

```
   \]a =. 2 2 $ 'a';'b';'c';3 3$'\*'   NB. A boxed array default left/top
+-+---+
|a|b  |
+-+---+
|c|\*\*\*|
| |\*\*\*|
| |\*\*\*|
+-+---+
   1 ": a                            NB. Display with alignment center/left
+-+---+
|a|b  |
+-+---+
| |\*\*\*|
|c|\*\*\*|
| |\*\*\*|
+-+---+
   1 2 ": a                          NB. Display with alignment center/right

+-+---+
|a|  b|
+-+---+
| |\*\*\*|
|c|\*\*\*|
| |\*\*\*|
+-+---+

```

2\. The contents of each [box](https://code.jsoftware.com/wiki/Vocabulary/AET#Box "Vocabulary/AET") of y are formatted using [Default Format](#monadic) (": y), **except** that the alignment specified by x is used at all levels of boxing.

```
   \]a =. 2 2 $ 123456789000 ; 0.00000000001 ; (<'b') ; <('+++';'+'),:'a';3 3 $ '\*'   NB. default top/left
+----------+---------+
|1.23457e11|1e\_11    |
+----------+---------+
|+-+       |+---+---+|
||b|       ||+++|+  ||
|+-+       |+---+---+|
|          ||a  |\*\*\*||
|          ||   |\*\*\*||
|          ||   |\*\*\*||
|          |+---+---+|
+----------+---------+
   2 1 ": a    NB. bottom/center
+----------+---------+
|1.23457e11|  1e\_11  |
+----------+---------+
|          |+---+---+|
|          ||+++| + ||
|          |+---+---+|
|          ||   |\*\*\*||
|   +-+    ||   |\*\*\*||
|   |b|    || a |\*\*\*||
|   +-+    |+---+---+|
+----------+---------+
   1 2 ": a    NB. center/right
+----------+---------+
|1.23457e11|    1e\_11|
+----------+---------+
|          |+---+---+|
|          ||+++|  +||
|       +-+|+---+---+|
|       |b|||   |\*\*\*||
|       +-+||  a|\*\*\*||
|          ||   |\*\*\*||
|          |+---+---+|
+----------+---------+

```
---

### Oddities

1\. If y is [empty](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Empty "Vocabulary/Glossary"), its [type](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Type "Vocabulary/Glossary") still determines what values of x are permitted.

This is not an error but it is unusual for J to do this sort of thing.

---
