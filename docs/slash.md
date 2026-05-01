# Vocabulary/slash - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/slashdot "Vocabulary/slashdot") [<<](https://code.jsoftware.com/wiki/Vocabulary/bangco "Vocabulary/bangco")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d420.htm "jdic:d420")

<table class="wikitable"><tbody><tr><td><tt>u/ y</tt></td><td>Insert</td><td>Adverb</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank_iy "Vocabulary/RankInfo") _\-- operates on x and y as a whole, by items of y --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Inserts [dyad](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Dyad "Vocabulary/Glossary") u between the [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of y

```
   \] z=: >: i.6
1 2 3 4 5 6

   +/z      NB. equivalent to (1+2+3+4+5+6)
21

```
---

### Common Uses

u/ y is one of the main looping [modifiers](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Modifier "Vocabulary/Glossary") of J. It can be used whenever you want to create a total, find the maximum, or generally examine [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") one by one.

1\. Find the total of a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") of numbers

```
   +/ 3 1 4 1 5 1 9
24

```

2\. Find the maximum of a list of numbers

```
   >./ 3 1 4 1 5 1 9
9

```

3\. Count the number of [atoms](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") in an [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET")

```
   \*/ $ i. 2 3 4
24

```

4\. Sum the columns of a [table](https://code.jsoftware.com/wiki/Vocabulary/AET#Table "Vocabulary/AET")

```
   \]a =: 3 4 ?@$ 100
90 47 58 29
22 32 55  5
55 73 58 50
   +/ a
167 152 171 84

```

5\. Sum the rows of a table

```
   +/"1  a
224 114 236

```

6\. Emulate x #: y by taking x | y for each item of x

```
   quorem =: ((\[ %~ \] - |) , |)  NB. returns quotient,remainder of y%x
   antibase =: }.@(((quorem {.) , }.@\])/)@,  NB. Applies quorem repeatedly
   24 60 60 antibase 142344
15 32 24
   24 60 60 #: 142344
15 32 24

```
---

### Details

1\. u can be a [cyclic gerund](https://code.jsoftware.com/wiki/Vocabulary/CyclicGerund "Vocabulary/CyclicGerund"). [Gerund](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Gerund "Vocabulary/Glossary") 0 is inserted between [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") 0 and 1, gerund 1 between items 1 and 2, and so on. Since they are executed right-to-left, they will be executed in the reverse order.

```
   +\`-/ z   NB. equivalent to (1+2-3+4-5+6)
7

```

2\. If y has 1 [item](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET"), u is not executed and u/ y is the single **item** of y. This will have rank one less than y (unless y is an atom). In other words, if y is an array with one item, u/ y is the same as {. y, while if y is an atom, u/ y is the same as y.

3\. If y has **no** items, u/ y produces the [identity element](https://code.jsoftware.com/wiki/Vocabulary/Glossary#IdentityElement "Vocabulary/Glossary") for u, as described below.

---

#### Identity Elements (Neutrals)

The [identity element](https://code.jsoftware.com/wiki/Vocabulary/Glossary#IdentityElement "Vocabulary/Glossary") (or [neutral](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Neutral "Vocabulary/Glossary")) for a [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") u is a [value](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary") e such that ({.x) -: ({.x) u e or ({.x) -: e u {.x, for every x in the domain (or some significant sub-domain such as [boolean](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boolean "Vocabulary/Glossary")) of u.

The [identity function](https://code.jsoftware.com/wiki/Vocabulary/Glossary#IdentityFunction "Vocabulary/Glossary") of a verb u is a function that, given y with no [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET"), will return an identity element of the correct [shape](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET") to work with an item of y. This identity element will be the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") of u/ y.

The defined identity elements are:

<table class="wikitable"><tbody><tr><td colspan="2"><b>Defined Identity Functions</b> (<tt>ifu</tt> is the identity function of <tt>u</tt>)</td></tr><tr><td><b>Verbs</b></td><td><b>Identity Function</b></td></tr><tr><td><tt>&lt; &gt; + - +. ~: | (2 4 5 6 b.)</tt></td><td><tt>0 $~ }.@$</tt></td></tr><tr><td><tt>= &lt;: &gt;: * &nbsp;% *. &nbsp;%: ^ &nbsp;! (1 9 11 13 b.)</tt></td><td><tt>1 $~ }.@$</tt></td></tr><tr><td><tt>&lt;.</tt></td><td><tt>_ $~ }.@$</tt></td></tr><tr><td><tt>&gt;.</tt></td><td><tt>__ $~ }.@$</tt></td></tr><tr><td><tt>u&amp;.v</tt></td><td><tt>(v^:_1 ifu$0) $~ }.@$</tt></td></tr><tr><td><tt>,</tt></td><td><tt>i.@(0&amp;,)@(2&amp;}.)@$</tt></td></tr><tr><td><tt>C. {</tt></td><td><tt>/:@{.</tt></td></tr><tr><td><tt>%. +/ . *</tt></td><td><tt>=@/:@{.</tt></td></tr><tr><td><tt>u/</tt></td><td><tt>ifu@#</tt></td></tr></tbody></table>

You can find the identity function of a verb u by executing u b. 1

```
   + b. 1
0 $~ }.@$
   +&\* b. 1
0 $~ }.@$
   \*&+ b. 1
1 $~ }.@$
   \*@+ b. 1   NB. They're not all defined
|domain error

```
---

### Use These Combinations

Combinations using u/ y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include those shown in [Searching and Matching Items: Fast List Operations (FLOs)](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations#FLOs "Vocabulary/SpecialCombinations"), [Searching and Matching Items: Precomputed searches](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations#precomputed "Vocabulary/SpecialCombinations"), [Whole-Array Operations](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations#wholearray "Vocabulary/SpecialCombinations"), [Intervals](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations#intervals "Vocabulary/SpecialCombinations"), [Infixes](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations#infixes "Vocabulary/SpecialCombinations"), [Partitions](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations#partitions "Vocabulary/SpecialCombinations"), and [Diagonals and Polynomials](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations#diagonals "Vocabulary/SpecialCombinations"), as well as the following:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Find index of first/last occurrence of largest/smallest value</td><td>integer or floating-point list</td><td><tt>(i. &lt;./) y</tt><p><tt>(i. &gt;./) y</tt></p></td><td>or <tt>i:</tt></td><td>it actually does <tt>(i. &gt;.!.0/)</tt> etc.; is faster than <tt>0 ({ /:~) y</tt></td></tr><tr><td>Bitwise reduction and scan</td><td>integer</td><td><tt>x (m b.)/ y</tt><p>(<tt>m</tt> is 16 to 31)</p></td><td><tt>/\</tt> <tt>/\.</tt> <small>in place of</small> <tt>/</tt></td><td>much faster than alternatives</td></tr><tr><td>Mean with rank</td><td></td><td><tt>(+/&nbsp;% #) y</tt></td><td></td><td>Supported as a primitive by <tt>(+/&nbsp;% #)"n</tt></td></tr><tr><td>Odometer function (<tt>y</tt> gives the size of each wheel; result is all readings from 0 0 0 0 to <tt>y</tt>)</td><td>integer</td><td><tt>(#: i.@(*/)) y</tt></td><td><tt>@:</tt> <small>in place of</small> <tt>@</tt></td><td></td></tr><tr><td>Bitwise operations on bytes</td><td>byte</td><td><tt>(m b.)/&amp;.(a.&amp;i.) y</tt><p><tt>x (m b.)&amp;.(a.&amp;i.) y</tt></p></td><td><tt>(u y) -: u"0 y</tt></td><td>avoids conversion to integer</td></tr></tbody></table>

---

<table class="wikitable"><tbody><tr><td><tt>x u/ y</tt></td><td>Table</td><td>Adverb</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank "Vocabulary/RankInfo") _\-- operates on x and y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

(x u/ y) returns a [table](https://code.jsoftware.com/wiki/Vocabulary/AET#Table "Vocabulary/AET") having entries (a u b) for every a in x and b in y

provided [dyadic](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Dyad "Vocabulary/Glossary") verb u has [Rank](https://code.jsoftware.com/wiki/Vocabulary/quote "Vocabulary/quote") 0

```
   \] z=: >: i.6
1 2 3 4 5 6
   z \*/ z          NB. Show multiplication table
1  2  3  4  5  6
2  4  6  8 10 12
3  6  9 12 15 18
4  8 12 16 20 24
5 10 15 20 25 30
6 12 18 24 30 36

```

If you are looking for APL's dyadic reduction operator, u/ J performs this function with the more general [infix](https://code.jsoftware.com/wiki/Vocabulary/bslash "Vocabulary/bslash"), as u/\\ .

---

### Common uses

Show the _truth table_ for a given [Boolean](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boolean "Vocabulary/Glossary") [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") b

```
   not=: -.
   and=: \*.
   b=: (4 : 'not (x and not y)')"0   NB. (x implies y).  Note rank 0
   0 1 b/ 0 1                        NB. Create truth table
1 1
0 1

```
---

### More Information

1\. If the [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") of u is not 0, it doesn't produce a [table](https://code.jsoftware.com/wiki/Vocabulary/AET#Table "Vocabulary/AET")

```
   'abc' ,/ 'def'
abcdef

```

2\. x u/ y is still meaningful for u of other ranks. [Verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") u is applied between each **[operand](https://code.jsoftware.com/wiki/Vocabulary/AET#Operand "Vocabulary/AET") [cell](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Cell "Vocabulary/Glossary") of x** (the [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") of which is given by the left [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") of u) and the **entire y**. The [results](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") of these [executions](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Execution "Vocabulary/Glossary") are [collected](https://code.jsoftware.com/wiki/Vocabulary/FramingFill#Collection "Vocabulary/FramingFill") into the final [result.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary")

This definition causes much confusion among students, probably because of incorrect generalization from the rank-0 examples. Verb u is applied on each of its **cells**, not _items_ or _atoms_.

Example: demonstrate that a [matrix](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Matrix "Vocabulary/Glossary") is orthonormal by taking the dot product of each of its columns with each other. The matrix is converted to a list of columns and then the rank-1 dot-product [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") creates a table of combination

```
   dotproduct =: +/@:\*"1
   \]mtx =: 3 3 $ 0 \_0.8 \_0.6  0.8 \_0.36 0.48  0.6 0.48 \_0.64
  0  \_0.8  \_0.6
0.8 \_0.36  0.48
0.6  0.48 \_0.64
   (|: mtx) dotproduct/ (|: mtx)  NB. Each column against all columns - looks orthonormal
1           0           0
0           1 5.55112e\_17
0 5.55112e\_17           1

```
---

### Details

1\. x u/ y is equivalent to x u"(lu,\_) y where lu is the left [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") of u. Note that u/ is simply u applied with a different rank.

---
