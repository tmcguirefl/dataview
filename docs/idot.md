# Vocabulary/idot - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/ico "Vocabulary/ico") [<<](https://code.jsoftware.com/wiki/Vocabulary/hcapdot "Vocabulary/hcapdot")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/didot.htm "jdic:didot")

<table class="wikitable"><tbody><tr><td><tt>i. y</tt></td><td>Integers</td></tr></tbody></table>

[Rank 1](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank1varany "Vocabulary/RankInfo") _\-- operates on lists of y, producing a result of variable shape for each one --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Returns an ascending (or descending) sequence of [integers](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Integer "Vocabulary/Glossary"), wrapped to the [shape](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET") specified by (|y).

```
   i. 6
0 1 2 3 4 5
   i. 2 3
0 1 2
3 4 5
   i. 6 1
0
1
2
3
4
5

```

If an [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") of y is negated, this specifies reversal along that dimension.

```
   i. \_6
5 4 3 2 1 0
   i. 2 \_3
2 1 0
5 4 3
   i. \_2 3
3 4 5
0 1 2
   i. \_2 \_3
5 4 3
2 1 0

```

If y is all-positive, then y is the [shape](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET") of the [table](https://code.jsoftware.com/wiki/Vocabulary/AET#Table "Vocabulary/AET") (i.y).

That is, if shape is any given positive integer [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET"), then (i.shape) is the same as: shape $ i. (\*/shape)

```
   shape=: 2 3
   i.shape
0 1 2
3 4 5

   shape $ i. (\*/shape)
0 1 2
3 4 5

```
---

### Common uses

0\. A video has been made showing common uses of the [Integers monadic verb](https://www.youtube.com/watch?v=jUsfoB7FE18)

1\. Make a sample [numeric](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Numeric "Vocabulary/Glossary") [matrix](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Matrix "Vocabulary/Glossary") for miscellaneous test purposes

```
   \] z=: i. 3 5
 0  1  2  3  4
 5  6  7  8  9
10 11 12 13 14
   +/ z
15 18 21 24 27
   +/"1 z
10 35 60

```

2\. Generate the identity permutation

e.g. see the samples in [Anagram Index](https://code.jsoftware.com/wiki/Vocabulary/acapdot "Vocabulary/acapdot") (A.)

```
   N=: 4
   \] i=: i.N    NB. the identity permutation on N points
0 1 2 3

```

3\. Make a "self-indexing" [numeric](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Numeric "Vocabulary/Glossary") [matrix](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Matrix "Vocabulary/Glossary") for investigating the behavior of a given J [primitive](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Primitive "Vocabulary/Glossary"), e.g. [Transpose](https://code.jsoftware.com/wiki/Vocabulary/barco "Vocabulary/barco") (|:).

"self-indexing" here means that each atom represents its own array index

```
   ii=: \] {. \[: i. 10 #~ #    NB. utility verb for generating a test matrix

   \] z=: ii 2 3 4
  0   1   2   3
 10  11  12  13
 20  21  22  23

100 101 102 103
110 111 112 113
120 121 122 123

```
---

### Use These Combinations

Combinations using i. y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") are shown in [Miscellaneous Functions](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations#misc "Vocabulary/SpecialCombinations").

---

<table class="wikitable"><tbody><tr><td><tt>x i. y</tt></td><td>Index Of</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank_ix "Vocabulary/RankInfo") _\-- operates on x and y as a whole, by items of x --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Finds the _first occurrence_ of y in x

```
   'abracadabra' i. 'a'
0
   'abracadabra' i. 'acd'   NB. several search terms at once
0 4 6

   7 < 2^i.5
0 0 0 1 1                   NB. 1, 2 and 4 are smaller than 7
   (7 < 2^i.5) i. 1
3                           NB. inequality satisfied starting with list element no 3
   7 (< i. 1:) 2^i.5
3

```

If [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") x doesn't contain y, then (i.) returns (#x)

If you subsequently use this value to index x then J signals  index error

```
   'abcdef' i. 'k'
6
   6 { 'abcdef'
|index error

```

Use (i.) with a [table](https://code.jsoftware.com/wiki/Vocabulary/AET#Table "Vocabulary/AET") x (i.e. a [list of](https://code.jsoftware.com/wiki/Vocabulary/Glossary#ListOf "Vocabulary/Glossary") [lists](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET")) to find the first row of x that matches y

This is a special case of [internal rank](https://code.jsoftware.com/wiki/Vocabulary/IFamily "Vocabulary/IFamily")

```
   \] x=: > 'alpha' ; 'bravo' ; 'charlie'
alpha
bravo
charlie

   x i. 'charlie'
2

```

y must match the _entire row_ of x (including any trailing [fill](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Fill "Vocabulary/Glossary") letters) for (i.) to find it. Otherwise (i.) returns (#x) (signifying "not found"), concealing your error.

So be sure to get the search term y right!

```
   #x
3
   x i. 'bravo'     NB. i.e. not found
3
   $x               NB. shape of table (width is seven chars)
3 7
   x i. 'bravo  '   NB. y needs to be the full width of x (including the two trailing blanks)
1

```
---

[Index Of Last](https://code.jsoftware.com/wiki/Vocabulary/ico "Vocabulary/ico") (x i: y)

---

### More Information

1\. x i. y is a member of the [i.-family](https://code.jsoftware.com/wiki/Vocabulary/IFamily "Vocabulary/IFamily").

2\. The [internal rank](https://code.jsoftware.com/wiki/Vocabulary/IFamily "Vocabulary/IFamily") of x i. y uses [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") whose [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") is the rank of items of x.

3\. If _rix_ is the rank of an item of x, the [shape](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET") of the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") is  (-rix)}.$y

4\. If x and y are of different classes, or if their items couldn't possibly match because of differing shapes, no error is signaled: each search simply fails to match.

5\. To find _all occurrences_ of y in x, not just the first, use [Equal](https://code.jsoftware.com/wiki/Vocabulary/eq "Vocabulary/eq") (\=) or [Match](https://code.jsoftware.com/wiki/Vocabulary/eq "Vocabulary/eq") (\-:) , together with [Indices](https://code.jsoftware.com/wiki/Vocabulary/icapdot "Vocabulary/icapdot") (I.) to convert the resulting [Boolean](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boolean "Vocabulary/Glossary") [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") into [indices](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Index "Vocabulary/Glossary").

```
   'abracadabra' = 'a'
1 0 0 1 0 1 0 1 0 0 1
   I. 'abracadabra' = 'a'
0 3 5 7 10
   'abracadabra' I.@:= 'a'
0 3 5 7 10

```

6\. The variant x i.!.0 y has better performance on inexact numeric arrays of rank>2. See discussion [here](https://code.jsoftware.com/wiki/Vocabulary/IFamily#Performance "Vocabulary/IFamily")

7\. The variant x i.!.1 y has better performance when the cells of x and y are known to be lists of integers sorted in nondescending order. The results are unpredictable if the arguments are not sorted.

---

### Use These Combinations

Combinations using x i. y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include:

<table class="wikitable"><tbody><tr><td><b>What It Does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td colspan="2"><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Primitives permitted in place of <tt>f</tt></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Find first place where <tt>&nbsp;x f y </tt>is true</td><td rowspan="2"><i>Permitted:</i> Boolean, integer, floating point, byte, symbol (<b>not</b> unicode).<p><br><tt>x</tt> and <tt>y</tt> need not be the same precision.</p></td><td><tt>x (f i. 1:) y</tt></td><td><tt>x i.&amp;1@:f y</tt></td><td><tt>= ~: &lt; &lt;: &gt; &gt;: e. E.</tt></td><td rowspan="2"><i>Permitted:</i> <tt>(f!.0)</tt> <i>(parentheses obligatory!)</i> to force exact comparison.<p><br>J recognizes FLO <b>only if</b> <tt>f</tt> returns an atom or list.</p></td><td rowspan="2">Avoids computing entire <tt>&nbsp;x f y</tt><p><br><b>Bug warning:</b> if <tt>f</tt> is <tt>e.</tt> it does (<tt>,@e.</tt>) rather than <tt>e.</tt> regardless of ranks of arguments</p></td></tr><tr><td>Find first place where <tt>&nbsp;x f y </tt>is false</td><td><tt>x (f i. 0:) y</tt></td><td><tt>x i.&amp;0@:f y</tt></td><td><tt>= ~: &lt; &lt;: &gt; &gt;: e.</tt></td></tr></tbody></table>

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Find first/last match</td><td></td><td><tt>m&amp;i. y</tt></td><td><tt>i:</tt> <small>in place of</small> <tt>i.</tt> for last match<p><tt>!.0</tt> for exact comparison</p></td><td></td></tr><tr><td>Find index of first/last cell of <tt>y</tt> that does/does not match an <tt>m</tt>-item</td><td></td><td><tt>(e. i. 1:)&amp;m y</tt></td><td><tt>i:</tt> <small>in place of</small> <tt>i.</tt> for last cell<p><tt>0:</tt> for mismatch</p></td><td><b>Bug warning:</b> it does <tt>(,@e.)</tt> rather than <tt>e.</tt></td></tr><tr><td>Translate characters from <tt>q</tt> to <tt>p</tt></td><td>byte</td><td><tt>(p {~ q i. ]) y</tt></td><td>also <tt>((q i.]) { p"_) y</tt> and <tt>(q&amp;i. { p"_) y</tt></td><td></td></tr><tr><td>Find index of first/last occurrence of largest/smallest value</td><td>integer or floating-point list</td><td><tt>(i. &lt;./) y</tt><p><tt>(i. &gt;./) y</tt></p></td><td>or <tt>i:</tt></td><td>it actually does <tt>(i. &gt;.!.0/)</tt> etc.; is faster than <tt>0 ({ /:~) y</tt></td></tr><tr><td rowspan="2">Bitwise operations on bytes</td><td rowspan="2">byte</td><td><tt>u&amp;.(a.&amp;i.) y</tt></td><td><tt>(u y) -: u"0 y</tt></td><td rowspan="2">avoids conversion to integer</td></tr><tr><td><tt>(m b.)/&amp;.(a.&amp;i.) y</tt><p><tt>x (m b.)&amp;.(a.&amp;i.) y</tt></p></td><td><tt>16 ≤ m ≤ 31</tt></td></tr><tr><td><tt>i.</tt> on sorted lists</td><td>integer cells of rank 1</td><td><tt>x i.!.1 y</tt></td><td>supports IRS with <tt>i.!.1"n</tt></td><td>Faster; results unpredictable if atoms of argument-cells are not in nondescending order</td></tr></tbody></table>

---
