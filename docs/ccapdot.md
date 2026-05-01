# Vocabulary/ccapdot - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/ddot "Vocabulary/ddot") [<<](https://code.jsoftware.com/wiki/Vocabulary/bdotu "Vocabulary/bdotu")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/dccapdot.htm "jdic:dccapdot")

<table class="wikitable"><tbody><tr><td><tt>C. y</tt></td><td>Cycle-Direct</td></tr></tbody></table>

[Rank 1](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank1varl "Vocabulary/RankInfo") _\-- operates on lists of y, producing a list of variable length for each one --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Converts the permutation y between _direct_ and _cycle_ representations.

```
   \]cycle =: C. 1 2 0 5 4 3  NB. Convert to cycle form
+-----+-+---+
|2 0 1|4|5 3|
+-----+-+---+
   C. cycle                  NB. Convert back to direct form
1 2 0 5 4 3

```

A _permutation_ of an [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") _a_ is an array _b_ containing the same [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") as _a_ but possibly in a different order. The relation between the ordering of the items of _a_ and _b_ is called a _permutation_, and the action of creating _b_ from _a_ is called _applying the permutation_ to _a_.

The _direct representation, d_, of a permutation, lists for each index _i_ in _b_ the [index](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Index "Vocabulary/Glossary") in _a_ that moved to position _i_. In the example above, [item](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") 1 in _a_ moves to be item 0 of _b_, item 2 of _a_ moves to be item 1 of _b_, item 0 of _a_ to item 2 of _b_, and so on.

A _cycle representation c_ of a permutation breaks the permutation into _cycles_ where each listed item moves to the position of the next number in the cycle, with the last item in the cycle going to the first position in the cycle. In the example above, the first cycle (2 0 1) indicates that the item in position 2 moves to position 0, the item in position 0 to position 1, and the item in position 1 to position 2. The cycle (5 3) indicates that items 5 and 3 exchange places, and the cycle (4) indicates that item 4 does not move.

---

### Common Uses

1\. Find the cycle form of a permutation, as above. In standard math notation the cycles are represented in parentheses, as

```
1 2 0 5 4 3 <--> (2 0 1)(4)(5 3)

```

2\. Examine the cycle structure of a given permutation p.

The cycle representation reveals many of the properties of p to a group theorist. Moreover the cycle representation is one of the most compact and convenient forms for handling permutations in books and hand-calculations.

---

### More Information

1\. The cycle representation of a permutation is not unique: the cycles may be presented in any order and each cycle may start with any of its members.

Cycle representations produced by  C. y are put into a canonical form as follows:

-   The largest [index](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Index "Vocabulary/Glossary") in each cycle comes first
-   The cycles are sorted into ascending order of their largest index

Note that with this canonical form, the cycles can easily be identified even from the raze of the canonical form, as each value higher than all preceding values starts a cycle.

This ordering is expressed in canoncycle below. To use a different canonical form, modify canoncycle.

```
   NB. verb to put a cyclic representation into canonical order
   NB. There must be no omitted or negative indexes
   canoncycle =: (/: {.@>) @: (,@(|.~ (i. >./))&.>)

   \]permc =: 6;0 5 1;2 3 4   NB. A cycle form
+-+-----+-----+
|6|0 5 1|2 3 4|
+-+-----+-----+
   canoncycle permc          NB. canonical form
+-----+-----+-+
|4 2 3|5 1 0|6|
+-----+-----+-+
   C. C. permc               NB. J produces canonical form
+-----+-----+-+
|4 2 3|5 1 0|6|
+-----+-----+-+

```

2\. The length _n_ of a permutation _y_ is  n =. >: >./;y , i.e., one more than the largest value in y. This value must be positive. Any negative index _i_ in _y_, whether in a [box](https://code.jsoftware.com/wiki/Vocabulary/AET#Box "Vocabulary/AET") or not, is processed as  i+n .

In other words, negative values count back from the end, just like negative [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") [indexing.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Index "Vocabulary/Glossary")

```
   C. C. \_3 1 2   NB. n = >:2 = 3
0 1 2

```

3\. A completely-described permutation of length _n_ includes each value of  i. n exactly once. If some of those values are omitted, default values are assumed.

-   for permutations y in direct form, omitted values are prepended to the beginning of y before the conversion to cycle form.
-   for permutations y in cycle form, omitted values are assumed to represent cycles of length 1, in other words, positions that are unaffected by the permutation.

To see the complete form of an incomplete permutation, apply C. y twice, which will convert the permutation to canonical form in its original representation:

```
   C. C. 4 2 6    NB. incomplete direct form: omitted values move to front
0 1 3 5 4 2 6
   C. C. 1 3;2 5  NB. incomplete cycle form: omitted values do not move
+-+---+-+---+
|0|3 1|4|5 2|
+-+---+-+---+

```

4\. If, after the conversion of originally negative values, y has duplicate values, or any values less than 0 or greater than or equal to the length _n_ of the permutation, an error is signaled.

---

### Details

1\. If y is an [empty](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Empty "Vocabulary/Glossary") [numeric](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Numeric "Vocabulary/Glossary") or [character](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Character "Vocabulary/Glossary") [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET"), an error is signaled. If y is an [empty](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Empty "Vocabulary/Glossary") [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") of [boxes](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boxe "Vocabulary/Glossary"), the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") is an empty [numeric](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Numeric "Vocabulary/Glossary") list (i.e. an empty permutation).

---

<table class="wikitable"><tbody><tr><td><tt>C.!.2 y</tt></td><td>Permutation Parity</td></tr></tbody></table>

[Rank 1](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank1l "Vocabulary/RankInfo") _\-- operates on lists of y, producing a list for each one --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Calculates the [Levi-Civita symbol](https://en.wikipedia.org/wiki/Levi-Civita_Symbol "wikipedia:Levi-Civita Symbol") (ε) of y:

<table class="wikitable"><tbody><tr><td><tt>1</tt></td><td><tt>y</tt> is a permutation with even parity</td></tr><tr><td><tt>_1</tt></td><td><tt>y</tt> is a permutation with odd parity</td></tr><tr><td><tt>0</tt></td><td><tt>y</tt> is not a permutation</td></tr></tbody></table>

```
   C.!.2 (0 1 2 3)    NB. Even parity
1
   C.!.2 (1 0 2 3)    NB. Odd parity
\_1
   C.!.2 (1 0 0 3)    NB. Repeated index - not a permutation
0

```
---

### Common Uses

_Parity_ is an invariant property of a permutation. _Even parity_ means that the permutation can be split into an even number of transpositions (2-cycles), not necessarily disjoint. There will be several distinct ways of doing this, but the number of transpositions will always be even.

```
   z2=: <0 1          NB. a single transposition --> odd parity
   z2 C. A            NB. -applied to 12 points
BACDEFGHIJKL
   C. z2              NB. monadic C. returns a direct permutation, but the shortest possible.
1 0
   C.!.2 (C. z2)      NB. Compute parity: \_1 means Odd parity
\_1

```
```
   z3=: (0 1);(2 3)   NB. two transpositions --> even parity
   z3 C. A            NB. -applied to 12 points
BADCEFGHIJKL
   C. z3              NB. monadic C. returns a direct permutation
1 0 3 2
   C.!.2 (C. z3)      NB. Compute parity: 1 means Even parity
1

```
---

<table class="wikitable"><tbody><tr><td><tt>x C. y</tt></td><td>Permute</td></tr></tbody></table>

[Rank 1 \_](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank1_s "Vocabulary/RankInfo") _\-- operates on lists of x and the entirety of y --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Applies the permutation x to the [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of y.

```
   1 3 0 2 C. 'abcd'    NB. Direct form of permutation: same as x { y
bdac
   (1 2;3 0) C. 'abcd'  NB. cycle form: exchange items 1 & 2, 3 & 0
dcba

```
---

### Common Uses

1\. To apply a permutation given in cycle form.

If the permutation is complete and in direct form, just use x { y.

2\. To apply an incomplete permutation (one in which values are missing from x)

```
   (<1 2) C. 'abcde'  NB. Cycle form: exchange items 1 & 2, leave others unchanged
acbde
   (2 1) C. 'abcde'   NB. Direct form: select items 2 1, put the other items in front
adecb

```
---

### More Information

1\. The length _n_ of the permutation is always \# y, the number of items of y.

2\. Negative values in x are handled as for the [monadic](#negative) case of  C. y , except that _n_ is #y.

3\. If x is a _complete_ permutation of length #y, that is, if all values of i.#y are in ;x, x C. y is the same as:

-   x { y, if x is in direct form (i. e. [unboxed](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Unboxed "Vocabulary/Glossary"))
-   (C. x) { y, if x is [boxed](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boxed "Vocabulary/Glossary").

4\. If x is not complete, it is filled out according to the rules given for the [monadic](#incomplete) case, **except** that _n_ is #y. This means that when x is not complete,  x C. y is **not** the same as  (C. x) C. y .

---

### Details

1\. The [shape](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET") of the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") of x C. y is always the [shape](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET") of y.

2\. if x is an [empty](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Empty "Vocabulary/Glossary") [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") of any [type](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Type "Vocabulary/Glossary"),  x C. y is y.

---
