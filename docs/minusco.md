# Vocabulary/minusco - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/percent "Vocabulary/percent") [<<](https://code.jsoftware.com/wiki/Vocabulary/minusdot "Vocabulary/minusdot")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d122.htm "jdic:d122")

<table class="wikitable"><tbody><tr><td><tt>-: y</tt></td><td>Halve</td></tr></tbody></table>

[Rank 0](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank0a "Vocabulary/RankInfo") _\-- operates on individual atoms of y, producing a result of the same shape --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Equivalent to y % 2 (y divided by 2).

---

### Common Uses

Has advantages in [tacit](https://code.jsoftware.com/wiki/Vocabulary/Glossary#TacitVerb "Vocabulary/Glossary") definitions over (expression)%2.

---

### More Information

[Halve video](https://www.youtube.com/watch?v=8s3rZLvixFI)

[Double](https://code.jsoftware.com/wiki/Vocabulary/plusco "Vocabulary/plusco") (+: y), [Square](https://code.jsoftware.com/wiki/Vocabulary/starco "Vocabulary/starco") (\*: y), [Square Root](https://code.jsoftware.com/wiki/Vocabulary/percentco "Vocabulary/percentco") (%: y)

---

<table class="wikitable"><tbody><tr><td><tt>x -: y</tt></td><td>Match</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank "Vocabulary/RankInfo") _\-- operates on x and y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Returns a [boolean](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boolean "Vocabulary/Glossary") [value](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary"), 1 if and only if x is the same as y in [shape](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Shape "Vocabulary/Glossary") and [elements](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Contents "Vocabulary/Glossary"). [Tolerant comparison](https://code.jsoftware.com/wiki/Vocabulary/Glossary#TolerantComp "Vocabulary/Glossary") is used whenever [numeric](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Numeric "Vocabulary/Glossary") types are compared; use \-:!.0 to force exact comparison.

```
   'no' -: |. 'on'
1
   'no' -: 'yes'
0

```

Use x -: y to compare two entire [nouns](https://code.jsoftware.com/wiki/Vocabulary/AET#Noun "Vocabulary/AET") for equality. If you want to test equality of individual [atoms](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") in a noun, use [\=.](https://code.jsoftware.com/wiki/Vocabulary/eq "Vocabulary/eq")

---

### Common Uses

1\. Matching [strings](https://code.jsoftware.com/wiki/Vocabulary/Glossary#String "Vocabulary/Glossary") of varying length.

```
   reply=: 'yes'

   reply = 'yes'
1 1 1
   reply = 'no'
|length error
|   reply    ='no'
   reply -: 'yes'
1
   reply -: 'no'
0

```

2\. Comparing entire [arrays](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") for equality.

```
   \]a =. i. 2 3
0 1 2
3 4 5
   \]b =. |. a  NB. Reverse order of rows
3 4 5
0 1 2
   a -: b
0
   a -: |. b
1

```

3\. [Shape](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET") matters for matching

```
   \]a =. 9   NB. Create a noun
9
   \]b =. a -. 5   NB. Remove any items that match 5.  There aren't any, so no change
9
   b -: a   NB. Want to bet there was no change?
0
   $a    NB. What happened?  a is an atom...

   $b    NB. ...but b became a list
1
   b -: ,a
1

```
---

[Equal](https://code.jsoftware.com/wiki/Vocabulary/eq "Vocabulary/eq") (x = y)

---

### More Information

1\. Two [nouns](https://code.jsoftware.com/wiki/Vocabulary/AET#Noun "Vocabulary/AET") that match are equivalent for most purposes, the exception being [empty](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Empty "Vocabulary/Glossary") [arrays.](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") (An empty array is one that contains no [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET")). J primitives that accept [lists](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") as control [arguments](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET") perform the same on [empty](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Empty "Vocabulary/Glossary") [arrays](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") of any [type](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Type "Vocabulary/Glossary") (examples: x in x { y or x {. y). However, if an empty array must be [filled](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Fill "Vocabulary/Glossary"), because it is a data [argument](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET") or is applied to a [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") of lower [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET"), the [fill](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Fill "Vocabulary/Glossary") will depend on the [type](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Type "Vocabulary/Glossary") of the empty [argument](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET").

```
   '' -: 0$0   NB. Empty arrays match...
1
   ({. '') -: ({. 0 $ 0)  NB. but are not always equivalent
0

```

2\. Nouns that match may have different [types](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Type "Vocabulary/Glossary") as disclosed by 3!:0.

---

### Use These Combinations

Combinations using x -: y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Not-match</td><td></td><td><tt>x -.@-: y</tt></td><td><tt>@:</tt> <small>in place of</small> <tt>@</tt></td><td>Use this form for not-match. Supported as a primitive by <tt>(-.@-:)"n</tt></td></tr></tbody></table>

---
