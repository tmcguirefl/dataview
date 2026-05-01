# Vocabulary/squarelf - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/squarelfdot "Vocabulary/squarelfdot") [<<](https://code.jsoftware.com/wiki/Vocabulary/bslashdot "Vocabulary/bslashdot")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d500.htm "jdic:d500")

<table class="wikitable"><tbody><tr><td><tt>[ y</tt></td><td>Same</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank "Vocabulary/RankInfo") _\-- operates on x and y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Returns [noun](https://code.jsoftware.com/wiki/Vocabulary/AET#Noun "Vocabulary/AET") y unchanged: \[y is equivalent to y.

```
   z=: i.6          NB. try any noun here
   assert z -: \[z

```

**_NOTE:_** [Same](https://code.jsoftware.com/wiki/Vocabulary/squarert "Vocabulary/squarert") (\] y) is equivalent to (\[ y)

---

### Common uses

See [Same](https://code.jsoftware.com/wiki/Vocabulary/squarert "Vocabulary/squarert") (\]), which is conventionally the one used in this role.

---

[Same](https://code.jsoftware.com/wiki/Vocabulary/squarert "Vocabulary/squarert") (\] y)

---

### Use These Combinations

Combinations using \[ y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Extract substring/subarray</td><td>table or list</td><td><tt>x ];.0 y</tt></td><td>or <tt>[;.0</tt></td><td>avoids creating indexes</td></tr><tr><td>Reshape infixes</td><td></td><td><tt>x ]\ y</tt></td><td><tt>[ ,</tt> <small>in place of</small> <tt>]</tt></td><td></td></tr></tbody></table>

---

<table class="wikitable"><tbody><tr><td><tt>x [ y</tt></td><td>Left</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank "Vocabulary/RankInfo") _\-- operates on x and y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Returns the ([noun](https://code.jsoftware.com/wiki/Vocabulary/AET#Noun "Vocabulary/AET")) [value](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary") of x

```
   x=: 3
   y=: 5
   x \[ y
3
   assert x -: x \[ y   NB. try with any 2 nouns as x and y

```
---

### Common uses

1\. Separate two [assignments](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Assignment "Vocabulary/Glossary") on the same line

The right-hand [phrase](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Phrase "Vocabulary/Glossary") must evaluate to a [noun](https://code.jsoftware.com/wiki/Vocabulary/AET#Noun "Vocabulary/AET"), to represent a valid y for use in (x \[ y).

```
   p=: 3 \[ q=: 5

```

2\. In a [dyadic](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Dyad "Vocabulary/Glossary") [tacit verb](https://code.jsoftware.com/wiki/Vocabulary/Glossary#TacitVerb "Vocabulary/Glossary"): bring in the [value](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary") of [argument](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET") x

```
   13 : 'x+(x-y)\*y'
\[ + - \* \]

```

3\. In a [dyadic](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Dyad "Vocabulary/Glossary") [tacit verb](https://code.jsoftware.com/wiki/Vocabulary/Glossary#TacitVerb "Vocabulary/Glossary"): use u@\[ to execute u on the x [argument](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET") to a [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET")

```
   3 (< , <) 'a'       NB. No good: the , are executed as dyads
|domain error
   3 (<@\[ , <@\]) 'a'   NB. Execute as monads on the appropriate argument
+-+-+
|3|a|
+-+-+

```
---

[Right](https://code.jsoftware.com/wiki/Vocabulary/squarert "Vocabulary/squarert") (x \] y)

---

### Use These Combinations

Combinations using \[ y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Extract substring/subarray</td><td>table or list</td><td><tt>x ];.0 y</tt></td><td>or <tt>[;.0</tt></td><td>avoids creating indexes</td></tr><tr><td>Fetch from multiple index lists (each row of <tt>x</tt> is one index list into <tt>y</tt>)</td><td></td><td><tt>x (&lt;"1@[ { ]) y</tt></td><td></td><td>avoids boxing <tt>x</tt></td></tr></tbody></table>

---
