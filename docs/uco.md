# Vocabulary/uco - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/xco "Vocabulary/xco") [<<](https://code.jsoftware.com/wiki/Vocabulary/tcapdot "Vocabulary/tcapdot")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/duco.htm "jdic:duco")

<table class="wikitable"><tbody><tr><td><tt>u: y</tt></td><td>Unicode</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank "Vocabulary/RankInfo") _\-- operates on x and y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

The _unicode character_ corresponding to y.

If y is a [number](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Number "Vocabulary/Glossary"),  u: y returns the [unicode character](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Unicode "Vocabulary/Glossary") having y as its [unicode code point (UCP)](https://code.jsoftware.com/wiki/Vocabulary/UnicodeCodePoint "Vocabulary/UnicodeCodePoint").

```
   y=: 16b03c0   NB. The UCP: U+03C0 of the symbol: π
   u: y
π

```

If y is a [character](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Character "Vocabulary/Glossary"),  u: y converts y to [unicode](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Unicode "Vocabulary/Glossary") [precision](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Precision "Vocabulary/Glossary").

If y is already unicode characters,  u: y is the same as y. If y is bytes, each byte is extended with high-order zeros to unicode precision. This does not change the meaning of ASCII characters, because the ASCII standard is embedded in the Unicode standard, thus the character 'A' is ASCII character number 41 (hex) and the UCP for 'A' is U+0041.

```
   \] z=: u: y
π
   datatype z
unicode
   3!:0 z
131072
   NB. Compare with...
   3!:0 'A'
2
   3!:0 (65)
4

```
---

### Common uses

1\. Display the [character](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Character "Vocabulary/Glossary") with UCP: 960

```
   u: 960   NB. (mathematical) pi
π

```

2\. Make a unicode atom of UCP: 960

```
   #$ pi=: u: 960
0
   datatype pi
unicode

   \] z=: 'C=2' , pi , 'r'
C=2πr
   datatype z
unicode

```
---

### More Information

---

#### Character Precisions

The _character_ type comprises 3 [precisions](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Precision "Vocabulary/Glossary"): [byte precision](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Byte "Vocabulary/Glossary"), [unicode precision](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Unicode "Vocabulary/Glossary"), and [unicode4 precision](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Unicode4 "Vocabulary/Glossary").

An atom with byte precision has one of the 256 different byte values, which are all listed in the primitive noun a. .

-   Byte indexes 0-127 are the _ASCII_ characters (described by the [ASCII standard](https://en.wikipedia.org/wiki/ASCII "wikipedia:ASCII")).
-   Byte indexes 128-255 do not correspond to characters, but are used for representing data in byte form (as when interacting with external hardware and software).

In other words, [byte](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Byte "Vocabulary/Glossary") [precision](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Precision "Vocabulary/Glossary") has two different uses:

-   to represent ASCII characters
-   to hold general 8-bit data.

An [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") with [unicode precision](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Unicode "Vocabulary/Glossary"), also known as a _wide character_ or a _16-bit character_, is a _unicode character_, i.e. a character described by the [Unicode standard](http://www.unicode.org/) in the range U+0000 to U+FFFF.

An [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") with [unicode4 precision](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Unicode "Vocabulary/Glossary"), also known as a _4-byte character_, is a _unicode character_, i.e. a character described by the [Unicode standard](http://www.unicode.org/) in the range U+0000 to U+10FFFF. Unicode4 characters can encode all the characters in Chinese/Japanese/Korean (_**CJK**_) character sets.

---

#### UTF-8 encoding

[UTF-8](https://en.wikipedia.org/wiki/UTF-8 "wikipedia:UTF-8") is a widely used method of encoding Unicode characters in a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") of [bytes](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Byte "Vocabulary/Glossary").

Taking advantage of the fact that there are 256 byte values, only 128 of which are used by ASCII, it assigns meaning to the other 128 byte values and encodes each non-ASCII Unicode character in a string of bytes.

[UTF-8](https://code.jsoftware.com/wiki/Vocabulary/Glossary#UTF8 "Vocabulary/Glossary") is **not a character precision** in J. It is an encoding scheme for nouns having the precision: [byte](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Byte "Vocabulary/Glossary").

J's only support for UTF-8 is to support conversion between UTF-8 bytes and the J precisions [byte](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Byte "Vocabulary/Glossary") and [unicode](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Unicode "Vocabulary/Glossary"). See table below.

---

#### Examples

1\. Display characters represented in the (obsolescent) _Latin 1_ standard.

Example: consider the French word: 'ça'. On pre-Unicode platforms (e.g. Windows XP) this would be stored with a single byte for each character, i.e. as two Latin 1 codes in byte precision: (231 97).

```
   u: 231 97  NB. unicode characters display correctly
ça
   231 97 { a.   NB. non-ASCII bytes do not display
�a
   231 97 { u:a.
ça
   u: 231 97 { a.
ça

```

2\. Use in tacit verbs in conjunction with dyadic (u:)

-   If y is characters, u:y is equivalent to 2 u: y
-   If y is numbers, u:y is equivalent to 4 u: y

3\. If y is a number, it must be in the range \_65536 to 65535, and the UCP will be (65536 | y).

---

### Details

1\. y may have any [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET"). The [shape](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET") of u: y is the same as the shape of y.

---

<table class="wikitable"><tbody><tr><td><tt>x u: y</tt></td><td>Unicode</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank "Vocabulary/RankInfo") _\-- operates on x and y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Converts between numbers, character precisions and encodings according to the [Unicode](http://www.unicode.org/) and [UTF-8](https://en.wikipedia.org/wiki/UTF-8 "wikipedia:UTF-8") standards.

<table class="wikitable"><tbody><tr><td colspan="5"><b><tt>x u: y</tt> functions</b></td></tr><tr><td><b>Description</b></td><td><b><tt>x</tt></b></td><td><b>Type/</b><p><b>Precision</b><br><b>of Result</b></p></td><td><b>Type/</b><p><b>Precision</b><br><b>of <tt>y</tt></b></p></td><td><b>Action</b></td></tr><tr><td rowspan="2">Truncate to byte precision (ouch!)</td><td rowspan="2"><tt>1</tt></td><td rowspan="2">byte</td><td>byte</td><td>Leave unchanged</td></tr><tr><td>unicode or unicode4</td><td>Discard upper bits</td></tr><tr><td rowspan="3">Convert to unicode (2-byte) precision</td><td rowspan="3"><tt>2</tt></td><td rowspan="3">unicode</td><td>byte</td><td>Extend with high-order <tt>0</tt> bits</td></tr><tr><td>unicode</td><td>Leave unchanged</td></tr><tr><td>unicod4</td><td>Discard 2 high bytes</td></tr><tr><td rowspan="2">Convert to integer</td><td rowspan="2"><tt>3</tt></td><td rowspan="2">integer</td><td>byte</td><td>Convert to byte number (index in <tt>a.</tt>)</td></tr><tr><td>unicode or unicode4</td><td>Convert to number of UCP</td></tr><tr><td>UCP to unicode</td><td><tt>4</tt></td><td>unicode</td><td>integer in (-65536,65535)</td><td>Create unicode character whose UCP is <tt>y</tt></td></tr><tr><td rowspan="2">Shrink to byte precision</td><td rowspan="2"><tt>5</tt></td><td rowspan="2">byte</td><td>byte</td><td>Leave unchanged</td></tr><tr><td>unicode</td><td>Discard upper bits, but give error if any nonzeros would be discarded</td></tr><tr><td>Convert external 2-byte characters</td><td><tt>6</tt></td><td>unicode</td><td>byte</td><td>Convert each pair of bytes into a unicode character. The bytes are in little-endian order.</td></tr><tr><td rowspan="6">Convert unicode/unicode4/<a href="#UTF8">UTF-8</a> to smallest precision needed to hold <tt>y</tt></td><td rowspan="6"><tt>7</tt></td><td rowspan="2">byte</td><td>byte, ASCII (all byte indexes &lt; 128)</td><td>Leave unchanged</td></tr><tr><td>unicode or unicode4, all UCPs &lt; 128</td><td>Discard upper bits</td></tr><tr><td rowspan="4">unicode</td><td>byte, some non-ASCII (some byte indexes &gt; 127)</td><td>Convert to unicode with high-order zeros</td></tr><tr><td>unicode, some UCPs &gt; 127</td><td>Leave unchanged</td></tr><tr><td>unicode4, some UCPs &gt; 127</td><td>Convert to unicode. UCPs in the range (16b10000,16b10ffff) are represented in the result by a <i>surrogate pair</i> of 2 unicode characters</td></tr><tr><td>integer in (0,16b10ffff)</td><td>Convert to unicode. UCPs in the range (16b10000,16b10ffff) are represented in the result by a <i>surrogate pair</i> of 2 unicode characters</td></tr><tr><td rowspan="2">Convert to <a href="#UTF8">UTF-8</a></td><td rowspan="2"><tt>8</tt></td><td rowspan="2">byte</td><td>byte</td><td>Leave unchanged</td></tr><tr><td>unicode, unicode4 or integer in (0,16b10ffff)</td><td>Convert to UTF-8 encoded bytes</td></tr><tr><td rowspan="2">Convert to unicode4 unless all characters are ASCII</td><td rowspan="2"><tt>9</tt></td><td>byte</td><td></td><td>Leave unchanged</td></tr><tr><td>unicode4</td><td>any character precision containing a UCPs &gt; 127; or integer in (0,16b10ffff)</td><td>Convert to unicode4. Any UTF-8 is converted to unicode4, and surrogate pairs in unicode are converted (at rank 1).</td></tr><tr><td>Convert to unicode4</td><td><tt>10</tt></td><td>unicode4</td><td>any character precision, or integer in (0,16b10ffff)</td><td>Convert to unicode4 (at rank 0)</td></tr></tbody></table>

---

### Common uses

1\. Find the [unicode code point (UCP)](https://code.jsoftware.com/wiki/Vocabulary/UnicodeCodePoint "Vocabulary/UnicodeCodePoint") (as a decimal numeral) of (a pasted) glyph: y

```
   cp=: 3 u: 7 u: \]
   cp 'π'            NB. glyph pasted between apostrophes: ''
960

```
---

### More Information

1\. Use these factory verbs for conversions:

-   ucp — converts [byte](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Byte "Vocabulary/Glossary") to [unicode](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Unicode "Vocabulary/Glossary"), but _not if it's ascii-only!_
-   uucp — converts [byte](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Byte "Vocabulary/Glossary") to [unicode](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Unicode "Vocabulary/Glossary"), even if it's ascii-only
-   ucpcount — reliably counts the characters in a string of either precision
-   utf8 — converts [unicode](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Unicode "Vocabulary/Glossary") to [byte](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Byte "Vocabulary/Glossary"), turning non-ascii characters into multi-byte substrings.
```
   ucp\_z\_
7&u:
   uucp\_z\_  NB. Convert UTF-8 to char/unicode, then convert char/unicode to unicode
u:@(7&u:)
   ucpcount\_z\_
#@(7&u:)
   utf8\_z\_  NB. Convert char/unicode to bytes, using UTF-8 if needed
8&u:

```

ucp, uucp, ucpcount, utf8 are

-   [Standard Library](http://www.jsoftware.com/help/user/library.htm) word(s) residing in the 'z'-locale
-   Defined in the factory script stdlib.ijs which is located in  ~system/main/stdlib.ijs-   View the definition(s) in a JQt session by entering:  open '~system/main/stdlib.ijs'

Use uucp to convert a string to unicode precision, do any text manipulation, then use utf8 to convert back to byte precision (e.g. for output).

2\. If y is empty in  7 u: y , the result is an empty list of byte precision.

3\. In  7 u: y and  8 u: y , y must be an atom or a list. In  6 u: y , y must not be an atom. Otherwise, y may have any rank.

4\. The result of  x u: y for  x e. 1 2 3 4 5 has the same shape as y.

-   For  6 u: y , each row of y must have an even number of bytes, and the rows of the result have half that length.
-   For  7 u: y , the result is a list except that it is an atom if y is a unicode atom.
-   For 8 u: y the result is a list if y is unicode, otherwise it has the same shape as y.
---
