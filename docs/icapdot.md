# Vocabulary/icapdot - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/jdot "Vocabulary/jdot") [<<](https://code.jsoftware.com/wiki/Vocabulary/ico "Vocabulary/ico")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/dicapdot.htm "jdic:dicapdot")

<table class="wikitable"><tbody><tr><td><tt>I. y</tt></td><td>Indices</td></tr></tbody></table>

[Rank 1](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank1varl "Vocabulary/RankInfo") _\-- operates on lists of y, producing a list of variable length for each one --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

The [indexes](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Index "Vocabulary/Glossary") of every 1 in the [Boolean](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boolean "Vocabulary/Glossary") [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") y

```
   I. 0 0 1 0 1 0
2 4
   I. 3 1 4 \> 1 5 9  NB. It's true only in position 0
0

```

---

### Common uses

1\. Convert a Boolean _mask_ to the [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") of [indexes](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Indexe "Vocabulary/Glossary") where the mask is 1

```
   \] y\=: i:3
\_3 \_2 \_1 0 1 2 3
   \] cond\=: y<0
1 1 1 0 0 0 0

   cond # i.#y
0 1 2

```

2\. For example, comparisons produce [Boolean](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boolean "Vocabulary/Glossary") lists, but { and } needs lists of indexes.

To replace all [atoms](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") in y satisfying the [Boolean](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boolean "Vocabulary/Glossary") condition (y<0) with 0

```
   y\=: i:3

   0 (I. y<0) } y  NB. y<0 creates a mask, which I. converts to indexes
0 0 0 0 1 2 3

```

---

### More Information

1\. In general, I. y is (y # i. # y)

2\. If an atom of y is greater than 1, the corresponding [index](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Index "Vocabulary/Glossary") is repeated.

follows from 1.

3\. I.^:\_1 (the obverse of I.) gives the frequencies of the atoms of y, which must be nonnegative. The atom with index _i_ gives the number of occurrences of _i_ in y.

---

<table class="wikitable"><tbody><tr><td><tt>x I. y</tt></td><td>Interval Index</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank_ix "Vocabulary/RankInfo") _\-- operates on x and y as a whole, by items of x --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

x must be **in sorted order**, and thus defines (1+#x) [intervals](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Interval "Vocabulary/Glossary"), where each interval but the last **ends** on an [item](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of x (inclusive) and the last interval ends at [infinity.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Infinity "Vocabulary/Glossary")

If x is not sorted, a domain error might be signaled, or a nonsense result of the correct shape might be returned.

x I. y gives the _index of the interval_ in which y lies.

This is also called the _insert-before point_ of y: the smallest [index](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Index "Vocabulary/Glossary") of x **before which** y could be inserted while keeping the [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") in order.

If x is in ascending order, x I. y is the number of atoms of x that are less than y. If x is in descending order, x I. y is the number of atoms of x that are greater than y.

```
   x\=: 0 1 2 4 8 16 32   NB. x represents the 8 intervals:
                         NB. \[\_\_,0\], (0,1\], (1,2\], (2,4\],
                         NB. (4,8\], (8,16\], (16,32\], (32,\_\]

   x I. \_100   NB. \_100 is in \[\_\_,0\] -- which has index 0 in x
0
   x I. 0.9    NB. 0.9 is in (0,1\] -- which has index 1 in x
1
   x I. 3.9    NB. 3.9 is in (2,4\] -- which has index 3 in x
3
   x I. 16     NB. 16 is in (8,16\] -- which has index 5 in x (exact match)
5
   x I. 17     NB. 17 is in (16,32\] -- which has index 6 in x
6
   x I. 32     NB. 32 is in (16,32\] -- which has index 6 in x
6
   x I. 33     NB. 33 is in (33,\_\] -- which has index 7 in x
7
   x I. 15 16 17   NB. 3 search terms at once
5 5 6

```

---

### Common uses

1\. Find which section of a piecewise-linear function applies to a given y

```
   xpieces \=: 0 1 2
   NB. point,slope for the interval ENDING at each x value.  There is one more
   NB. point,slope than x positions, because the last interval ends at \_
   \]pointslope \=: \_2 \]\\ 0 0  0 1  1 2  3 3
0 0
0 1
1 2
3 3
   xpieces I. 0.5 5   NB. Which interval applies to these values?
1 3

```

---

### More Information

1\. x I. y performs _binary search_ in x. **It is vital that the items of x be in sorted order**, or the search will give erroneous results.

2\. x must be in sorted order, but it can be either ascending or descending order! If all the [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of x are identical, they are assumed to be in "ascending" order.

3\. x I. y is **not** a member of the [i.-family](https://code.jsoftware.com/wiki/Vocabulary/IFamily "Vocabulary/IFamily"), but it does use the concept of **[internal rank](https://code.jsoftware.com/wiki/Vocabulary/IFamily#Irank "Vocabulary/IFamily")**. The [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") used is the rank of items of x.

4\. The comparisons during [execution](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Execution "Vocabulary/Glossary") of x I. y are exact (i.e. [intolerant](https://code.jsoftware.com/wiki/Vocabulary/Glossary#TolerantComp "Vocabulary/Glossary")).

5\. For arguments other than [numeric](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Numeric "Vocabulary/Glossary") [lists](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET"), the rules for [sorting](https://code.jsoftware.com/wiki/Vocabulary/slashco#sortorder "Vocabulary/slashco") define the proper insertion point of y.

6\. It's possible to match against open (a,b) interval by shifting an edge in x down, or a value in y up:

```
   2 4 I. 1 2 3 4 5             NB. standard use case: to match against 3 intervals: \[-∞,2\],(2,4\],(4,+∞\]
0 0 1 1 2
   up\=. 1 + 2 ^ IF64 { \_23 \_52  NB. to shift y up
   dn\=. 1 \- 2 ^ IF64 { \_24 \_53  NB. to shift x down
   ((2\*dn) , 4) I. 1 2 3 4 5    NB. to match against 3 intervals: \[-∞,2),\[2,4\],(4,+∞\]
0 1 1 1 2
   2 4 I. 1 , (2\*up) , 3 4 5    NB. the same as above
0 1 1 1 2
   (2 , 4\*dn) I. 1 2 3 4 5      NB. to match against 3 intervals: \[-∞,2\],(2,4),\[4,+∞\]
0 0 1 2 2
   2 4 I. 1 2 3 , (4\*up) , 5    NB. the same as above
0 0 1 2 2

```

7\. It's possible to match against right-open interval \[a,b) by reversing x:

```
   2 4 I. 1 2 3 4 5                 NB. standard use case: to match against 3 intervals: \[-∞,2\],(2,4\],(4,+∞\]
0 0 1 1 2
   2 4 (#@\[ \- (I.~ |.)~) 1 2 3 4 5  NB. to match against 3 intervals: \[-∞,2),\[2,4),\[4,+∞\]
0 1 1 2 2

```

See Idotr utility verb in [univariate.ijs](https://code.jsoftware.com/wiki/Addons/stats/base/univariate "Addons/stats/base/univariate") of [stats/base](https://code.jsoftware.com/wiki/Addons/stats/base "Addons/stats/base") addon.

---
