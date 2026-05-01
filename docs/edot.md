# Vocabulary/edot - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/ecapdot "Vocabulary/ecapdot") [<<](https://code.jsoftware.com/wiki/Vocabulary/dcapco "Vocabulary/dcapco")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/dedot.htm "jdic:dedot")

<table class="wikitable"><tbody><tr><td><tt>e. y</tt></td><td>Raze In</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank_iy "Vocabulary/RankInfo") _\-- operates on x and y as a whole, by items of y --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Returns a [Boolean](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boolean "Vocabulary/Glossary") [table](https://code.jsoftware.com/wiki/Vocabulary/AET#Table "Vocabulary/AET") comparing each [box](https://code.jsoftware.com/wiki/Vocabulary/AET#Box "Vocabulary/AET") of y (a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") of [boxed](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boxed "Vocabulary/Glossary") [atoms](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET")) against each atom in ;y (the **Raze** of y).

There is one row for each [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") in y, and one column for each [item](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") in ;y

```
   \] y=: 'alpha' ; 'bravo' ; 'charlie'
+-----+-----+-------+
|alpha|bravo|charlie|
+-----+-----+-------+
   ;y
alphabravocharlie
   e.y
1 1 1 1 1 0 0 1 0 0 0 1 1 0 1 0 0
1 0 0 0 1 1 1 1 1 1 0 0 1 1 0 0 0
1 1 0 1 1 0 1 1 0 0 1 1 1 1 1 1 1

```
---

### Common Uses

1\. To create an _n_\-by-_n_ identity matrix

```
   e. i. 4
1 0 0 0
0 1 0 0
0 0 1 0
0 0 0 1

```
---

### More Information

1\.  e. y is identical to (;y)&e.@> y. If any of the items of y contain [arrays](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") of [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") 2 or higher, the result is complicated.

2\.  e. y uses [tolerant comparison](https://code.jsoftware.com/wiki/Vocabulary/Glossary#TolerantComp "Vocabulary/Glossary"). Use  e.!.0 in place of  e. for exact comparison.

3\. **Analysis:** The following expression attaches captions to (e.y) which explain it:

```
   2 2 $ '' ; (,' ',.~;y) ; (>y) ; (e.y)
+-------+----------------------------------+
|       |a l p h a b r a v o c h a r l i e |
+-------+----------------------------------+
|alpha  |1 1 1 1 1 0 0 1 0 0 0 1 1 0 1 0 0 |
|bravo  |1 0 0 0 1 1 1 1 1 1 0 0 1 1 0 0 0 |
|charlie|1 1 0 1 1 0 1 1 0 0 1 1 1 1 1 1 1 |
+-------+----------------------------------+

```

1 at the top-left denotes that the block <'alpha' contains 'a' -- and so forth.

---

<table class="wikitable"><tbody><tr><td><tt>x e. y</tt></td><td>Member (In)</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank_iy "Vocabulary/RankInfo") _\-- operates on x and y as a whole, by items of y --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Returns 1 if [item](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") x is in [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") y, otherwise 0.

```
   'a' e. 'alpha'    NB. yes, the atom: 'a' is in the literal list
1
   'd' e. 'alpha'    NB. no, the atom: 'd' is NOT in 'alpha'
0
   'a' e. 1 2 3      NB. 'a' is not in the numeric list (Note: no error signalled)
0

```

y is treated as a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") of its [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET"), and each [cell](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Cell "Vocabulary/Glossary") of x that has the same [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") as an item of y is checked to see if it matches an item of y. The [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") has one atom for each such cell of x.

---

### Common Uses

1\. Test if a given [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") is in a given [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET")

```
   'b' e. 'abracadabra'
1
   'x' e. 'abracadabra'
0

```

2\. Test multiple atoms at once

```
   'bz' e. 'abracadabra'
1 0

```

3\. Test for the presence of certain characters in input [strings](https://code.jsoftware.com/wiki/Vocabulary/Glossary#String "Vocabulary/Glossary")

```
   if=: 3 : 'if. y do. ''TRUE'' else. ''FALSE'' end.'   NB. utility to test if.-conditions

   FILENAME=: '/Users/myusername/Desktop/myfile.txt'
   if +./ ('\\/' e. FILENAME) do.                        NB. does FILENAME have a path?

```

The preferred form (see below) is '\\/' +./@:e. FILENAME

4\. The [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") can be [boxes](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boxe "Vocabulary/Glossary"), in which case the [contents](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Content "Vocabulary/Glossary") must match... exactly

```
   \]y =. ;: 'There is a tide in the affairs of men'     NB. A boxed list
+-----+--+-+----+--+---+-------+--+---+
|There|is|a|tide|in|the|affairs|of|men|
+-----+--+-+----+--+---+-------+--+---+
   (<'the') e. y                                        NB. contains 'the'
1
   (<'a') e. y                                          NB. What? Doesn't contain <'a' ??
0
   (<,'a') e. y                                         NB. No, it contains <,'a'
1

```

5\. The item to search for may be a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET"), if the search space is a [table.](https://code.jsoftware.com/wiki/Vocabulary/AET#Table "Vocabulary/AET")

The entire list must match

```
   \] t=: >'alpha' ; 'bravo' ; 'charlie'
alpha
bravo
charlie

   $t               NB. It's 3x7, with spaces added for fill
3 7

   'alpha' e. t     NB. e. doesn't find 'alpha' because it's only part of t
0
   'alpha  ' e. t
1
   'charlie' e. t   NB. 'charlie' stretches across the whole width of t, so no need to pad it
1

```
---

### More Information

1\. x e. y is a member of the [i.-family](https://code.jsoftware.com/wiki/Vocabulary/IFamily "Vocabulary/IFamily").

2\. The [internal rank](https://code.jsoftware.com/wiki/Vocabulary/IFamily "Vocabulary/IFamily") of x e. y uses [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") whose [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") is the rank of items of y.

3\. If _riy_ is the rank of an item of y, the [shape](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET") of the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") is  (-riy)}.$x

4\. If x and y are of different [types](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Type "Vocabulary/Glossary"), or if their items couldn't possibly match because of differing [shapes](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET"), no error is signaled: each search simply fails to match.

5\. x e. y is equivalent to (#y) ~: y i. x.

---

### Use These Combinations

Combinations using x e. y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include those shown in [Searching and Matching Items: Fast List Operations (FLOs)](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations#FLOs "Vocabulary/SpecialCombinations") and [Searching and Matching Items: Precomputed searches](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations#precomputed "Vocabulary/SpecialCombinations"), as well as the following:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Operations on a flattened array</td><td></td><td><tt>x ({ ,) y</tt><p><tt>x ({. ,) y</tt><br><tt>x (}. ,) y</tt><br><tt>x (e. ,) y</tt><br><tt>f/@, y</tt><br><small>(<tt>f</tt> is any verb)</small></p></td><td>or <tt>@:</tt> <tt>&amp;</tt> <tt>&amp;:</tt> <small>in place of</small> <tt>@</tt></td><td>Avoids copying the array to compute (<tt>,y</tt>)</td></tr></tbody></table>

---
