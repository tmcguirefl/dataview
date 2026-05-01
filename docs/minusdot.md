# Vocabulary/minusdot - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/minusco "Vocabulary/minusco") [<<](https://code.jsoftware.com/wiki/Vocabulary/minus "Vocabulary/minus")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d121.htm "jdic:d121")

<table class="wikitable"><tbody><tr><td><tt>-. y</tt></td><td>Not</td></tr></tbody></table>

[Rank 0](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank0a "Vocabulary/RankInfo") _\-- operates on individual atoms of y, producing a result of the same shape --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Equivalent to 1 - y .

-   for [Boolean](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boolean "Vocabulary/Glossary") y (0 or 1) -- (\-.y) is the Boolean function _Not_.
-   for y as a _probability_ (in the _closed interval_ \[0,1\]) -- (\-.y) is the _complementary_ probability.
```
   -. 0 1                         NB. Boolean "Not"
1 0
   -. 0.25 0.3333333 0.8          NB. Complements of the probabilities ("1-p" versus "p")
0.75 0.6666667 0.2

```

### Common Uses

1\. Invert a [Boolean](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boolean "Vocabulary/Glossary") [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary")

```
   -.'encephalogram' e. 'aeiouAEIOU'                   NB. Which characters are not vowels?
0 1 1 0 1 1 0 1 0 1 1 0 1

   str#~-.str e. 'aeiouAEIOU' \[ str=. 'encephalogram'  NB. Show only non-vowels
ncphlgrm

```

This latter example is more elegantly accomplished using the [dyadic](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Dyadic "Vocabulary/Glossary") form - see below.

2\. Reverse the meaning of the trigger of an if.\-statement

```
   if. aa -.@-: bb do. ...         NB. If "aa" is not equivalent to "bb" ...

```

Get in the habit of writing aa -.@-: bb rather than \-. aa -: bb - it's faster.

3\. Calculate the probability of event not happening, given the probability of it happening

```
   %6         NB. Probability of six turning up on roll of fair 6-sided die
0.16666667
   -.%6       NB. Probability of six not turning up on roll of same...
0.83333333
   (-.%6)^4   NB. Probability of no sixes turning up on roll of 4 dice
0.48225309
   -.(-.%6)^4 NB. Probability of at least one six turning up on roll of 4 dice
0.51774691

```
---

### More Info

[Not video](https://www.youtube.com/watch?v=BJTw5YmpbPo)

[Or](https://code.jsoftware.com/wiki/Vocabulary/plusdot#dyadic "Vocabulary/plusdot") (x +. y), [Not-Or](https://code.jsoftware.com/wiki/Vocabulary/plusco#dyadic "Vocabulary/plusco") (x +: y), [LCM (And)](https://code.jsoftware.com/wiki/Vocabulary/stardot#dyadic "Vocabulary/stardot") (x \*. y), [Not-And](https://code.jsoftware.com/wiki/Vocabulary/starco#dyadic "Vocabulary/starco") (x \*: y), [Boolean Functions](https://code.jsoftware.com/wiki/Vocabulary/bdot "Vocabulary/bdot") (m b.)

---

### Use These Combinations

Combinations using \-. y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Not-match</td><td></td><td><tt>x -.@-: y</tt></td><td><tt>@:</tt> <small>in place of</small> <tt>@</tt></td><td>Use this form for not-match. Supported as a primitive by <tt>(-.@-:)"n</tt></td></tr></tbody></table>

---

<table class="wikitable"><tbody><tr><td><tt>x -. y</tt></td><td>Less</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank_ix "Vocabulary/RankInfo") _\-- operates on x and y as a whole, by items of x --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

When x and y are [lists](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET"), x -. y is all the [atoms](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") of x that are **not** in y, preserving the original order in x. (A-.B) has the following _Venn diagram_

[![](https://code.jsoftware.com/mediawiki/images/8/89/AwithoutB.png)](https://code.jsoftware.com/wiki/File:AwithoutB.png).

---

### Common Uses

1\. Remove all vowels from a [string](https://code.jsoftware.com/wiki/Vocabulary/Glossary#String "Vocabulary/Glossary")

```
   'encephalogram' -. 'aeiouAEIOU'
ncphlgrm

```

2\. Use (\[ -. -.) for the _intersection_ of 2 [lists](https://code.jsoftware.com/wiki/Vocabulary/Glossary#List "Vocabulary/Glossary")

```
   intersection=: \[ -. -.
   'encephalogram' intersection 'aeiouAEIOU'
eeaoa

```

In the implementation, x (\[ -. -.) y actually performs the function of x (\[ -.!.0 -.) y.

3\. Read a text file but exclude all CR (carriage-return characters)

```
   fl=. (fread 'file.txt') -. CR

   fl=. CR-.~fread 'file.txt'     NB. alternative form

```
---

### More Information

1\. x -. y uses [tolerant comparison](https://code.jsoftware.com/wiki/Vocabulary/Glossary#TolerComp "Vocabulary/Glossary") on [numeric](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Numeric "Vocabulary/Glossary") [values.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary") Use \-.!.0 to force exact comparison. For intersection, use (\[ -. -.!.n) to change the comparison tolerance

2\. x -. y and x (\[ -. -.) y are members of the [i.-family](https://code.jsoftware.com/wiki/Vocabulary/IFamily "Vocabulary/IFamily").

3\. If x is an [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") then it is turned into a 1-element [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") before being processed. The [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") is always an [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET").

4\. The [internal rank](https://code.jsoftware.com/wiki/Vocabulary/IFamily "Vocabulary/IFamily") of x -. y uses [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") whose [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") is the rank of items of x. Calling the rank of an item of x _rix_, any item of x that matches an _rix_\-[cell](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Cell "Vocabulary/Glossary") of y is deleted.

```
   (i. 9) -. 2 2 $ 1 3 5 6  NB. Items of x are atoms
0 2 4 7 8
   (i. 3 4) -. 0 1 2 3  NB. Items of x are lists
4 5  6  7
8 9 10 11

```

5\. If x and y are of different [types](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Type "Vocabulary/Glossary"), or if their [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") couldn't possibly match because of differing [shapes](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET"), no error is signaled: each search simply fails to match, and no items are removed.

---

### Use These Combinations

Combinations using x -. y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Remove items of <tt>m</tt> from <tt>y</tt></td><td></td><td><tt>-.&amp;m y</tt></td><td><tt>-.!.0</tt> for exact comparison</td><td><b>Bug warning:</b> removes items of <tt>m</tt> from <tt>y</tt>, rather than removing items of <tt>y</tt> that match cells of <tt>m</tt>. This may lead to error if it attempts to delete part of an item of <tt>y</tt>.</td></tr></tbody></table>

---
