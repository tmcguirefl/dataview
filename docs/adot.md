# Vocabulary/adot - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/aco "Vocabulary/aco") [<<](https://code.jsoftware.com/wiki/Vocabulary/querydot "Vocabulary/querydot")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/dadot.htm "jdic:dadot")

<table class="wikitable"><tbody><tr><td><tt>a.</tt></td><td>Alphabet</td><td>Noun</td></tr></tbody></table>

---

The _alphabet_ of the J language — a built-in list of all [bytes](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Byte "Vocabulary/Glossary")

i.e. [atoms](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") of [type:](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Type "Vocabulary/Glossary") [character](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Character "Vocabulary/Glossary") with [byte](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Byte "Vocabulary/Glossary") [precision](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Precision "Vocabulary/Glossary").

```
   $ a.
256

```

Bytes 0 to 127 are (mostly) the [ASCII characters](https://en.wikipedia.org/wiki/ASCII "wikipedia:ASCII").

[Bytes](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Byte "Vocabulary/Glossary") in J serve two purposes:

-   To store [ASCII](https://code.jsoftware.com/wiki/Vocabulary/Glossary#ASCII "Vocabulary/Glossary") [characters](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Character "Vocabulary/Glossary") (using [byte](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Byte "Vocabulary/Glossary") indexes 32 to 127)
-   To store 8-bit bytes for interacting with external hardware and software.

Though a. is a simple [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET"), **displaying** it is a challenge because only half of it contains displayable ASCII characters, and a quarter of the ASCII codes are control characters that mess up the display. See [Screen Output and Input](https://code.jsoftware.com/wiki/Vocabulary/ScreenOutputInput "Vocabulary/ScreenOutputInput") for details.

**_Note:_** [Unicode characters](http://www.unicode.org/) may be stored in [character](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Character "Vocabulary/Glossary") [nouns](https://code.jsoftware.com/wiki/Vocabulary/AET#Noun "Vocabulary/AET") of _[unicode](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Unicode "Vocabulary/Glossary")_ [precision.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Precision "Vocabulary/Glossary") _Bytes_ using UTF-8 encoding are **not** automatically recognized as representing Unicode characters; you must explicitly [convert them to unicode precision](https://code.jsoftware.com/wiki/Vocabulary/uco#precision "Vocabulary/uco") using (u:).

---

### Common uses

1\. Find the _ASCII code(s)_ of any letter (or [string](https://code.jsoftware.com/wiki/Vocabulary/Glossary#String "Vocabulary/Glossary")). This **converts from characters to numbers**

```
   a. i. 'A'
65
   a. i. 'AZaz09'
65 90 97 122 48 57

```

2\. Find the letter for a given _ASCII code_

```
   65 { a.
A

```

3\. Make lists of the _ASCII roman alphabet_, upper- and lowercase, plus the number digits

```
   a. {~ 65+i.26
ABCDEFGHIJKLMNOPQRSTUVWXYZ
   a. {~ 97+i.26
abcdefghijklmnopqrstuvwxyz
   a. {~ 48+i.10
0123456789

```

See the stdlib verbs: tolower and toupper for their use of this construct.

4\. Translate one set of characters to another

```
   lc =: 'abcdefghijklmnopqrstuvwxyz'
   uc =: 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
   tolow =: (lc,a.) {~ (uc,a.) i. \]   NB. a. fills in the other characters
   tolow 'Ike Newton'
ike newton

```
---

### Use These Combinations

Combinations using  a. y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td rowspan="2">Bitwise operations on bytes</td><td rowspan="2">byte</td><td><tt>u&amp;.(a.&amp;i.) y</tt></td><td><tt>(u y) -: u"0 y</tt></td><td rowspan="2">avoids conversion to integer</td></tr><tr><td><tt>(m b.)/&amp;.(a.&amp;i.) y</tt><p><tt>x (m b.)&amp;.(a.&amp;i.) y</tt></p></td><td><tt>m</tt> is 16 to 31</td></tr></tbody></table>

---
