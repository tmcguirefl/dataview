# Vocabulary/ecapdot - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/fdot "Vocabulary/fdot") [<<](https://code.jsoftware.com/wiki/Vocabulary/edot "Vocabulary/edot")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/decapdot.htm "jdic:decapdot")

<table class="wikitable"><tbody><tr><td><tt>x E. y</tt></td><td>Find Matches</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank "Vocabulary/RankInfo") _\-- operates on x and y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Create a [Boolean](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boolean "Vocabulary/Glossary") [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") indicating starting points in y of subarrays equal to x.

If x and y are [character](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Character "Vocabulary/Glossary") [lists](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET"), this [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") marks the starts of the _matching substrings_ in y

```
   'co' E. 'cocoa'
1 0 1 0 0

```
---

### Common uses

1\. Find the positions of all matching substrings

```
   'co' I.@:E. 'cocoa'
0 2

```

2\. To test whether a [string](https://code.jsoftware.com/wiki/Vocabulary/Glossary#String "Vocabulary/Glossary") x appears in the [string](https://code.jsoftware.com/wiki/Vocabulary/Glossary#String "Vocabulary/Glossary") y

```
   'he' +./@:E. 'boustrophedonic'
1

```

3\. Find positions in y that match [subarray](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Subarray "Vocabulary/Glossary") x

```
   \]y =: 4 4 $ 'abcdefghijklmnop'  NB. An array
abcd
efgh
ijkl
mnop
   \]x =: 2 2 $ 'fgjk'              NB. Another array
fg
jk
   x E. y                          NB. Do any subarrays of \`y\` match \`x\`?
0 0 0 0
0 1 0 0
0 0 0 0
0 0 0 0

```
---

### More Information

1\. The [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") of  x E. y has the same [shape](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET") as y.

2\. If x is an [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") and y is a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET"), x is treated as a 1-atom list. Apart from that exception, x must have the same [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") as y.

3\. The [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary"), at each atom of y, is 1 if a [subarray](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Subarray "Vocabulary/Glossary") of y starting at that position matches x.

4\. If a position is too close to the end of y to have room for a subarray with the shape of x, that is simply recorded as a non-match.

```
   y                  NB. A 2x2 array
abcd
efgh
ijkl
mnop
   'bcd' E. y         NB. Rank of x must equal rank of y
|rank error
   (,:'bcd') E. y     NB. Better
0 1 0 0
0 0 0 0
0 0 0 0
0 0 0 0
   (,:'abcde') E. y   NB. x too big: no matches anywhere
0 0 0 0
0 0 0 0
0 0 0 0
0 0 0 0

```

5\. x E. y uses [tolerant comparison](https://code.jsoftware.com/wiki/Vocabulary/Glossary#TolerantComp "Vocabulary/Glossary"). Use  E.!.0 in place of  E. for exact comparison.

6\. If x and y are [character](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Character "Vocabulary/Glossary") [lists](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET"),  x E. y uses the [Boyer-Moore algorithm](https://en.wikipedia.org/wiki/Boyer-Moore_string_search_algorithm "wikipedia:Boyer-Moore string search algorithm").

---

### Known Bug

1\. **_Warning:_** E. and the special forms u@:E. corrupt the J session if x and y are [integer](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Integer "Vocabulary/Glossary") [lists.](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET")

---

### Use These Combinations

Combinations using x E. y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") are shown in [Searching and Matching Items: Fast List Operations (FLOs)](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations#FLOs "Vocabulary/SpecialCombinations").

---
