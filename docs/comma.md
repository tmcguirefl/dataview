# Vocabulary/comma - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/commadot "Vocabulary/commadot") [<<](https://code.jsoftware.com/wiki/Vocabulary/coco "Vocabulary/coco")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d320.htm "jdic:d320")

<table class="wikitable"><tbody><tr><td><tt>, y</tt></td><td>Ravel</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank "Vocabulary/RankInfo") _\-- operates on x and y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Produces a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") containing all the [atoms](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") in y, in the order in which they appear in the display of y.

The result is ordered by [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET"), each of which is ordered by its own items, etc.

An [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") is converted to a 1-atom [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET"), a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") is left unchanged, and any [noun](https://code.jsoftware.com/wiki/Vocabulary/AET#Noun "Vocabulary/AET") of higher [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") is flattened into a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET")

```
   \]z=: 0 20 10 +/ i.4  NB. sample noun
 0  1  2  3
20 21 22 23
10 11 12 13

   ,z
0 1 2 3 20 21 22 23 10 11 12 13

   $ 'a'                NB. Shape of an atom is empty

   # $ 'a'              NB. Rank is 0
0

   $ ,'a'               NB. Converted to a list, it has shape 1
1
   # $ , 'a'            NB.  ...and rank 1
1

```
---

### Common uses

1\. Convert [atoms](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") to singleton [lists](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET"), for example in [boxed](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boxed "Vocabulary/Glossary") [strings](https://code.jsoftware.com/wiki/Vocabulary/Glossary#String "Vocabulary/Glossary").

```
   \]a =: ;: 'this is a list of strings'
+----+--+-+----+--+-------+
|this|is|a|list|of|strings|
+----+--+-+----+--+-------+
   \]z=: 'this' ; 'is' ; 'a' ; 'list' ; 'of' ; 'strings'
+----+--+-+----+--+-------+
|this|is|a|list|of|strings|
+----+--+-+----+--+-------+

   a -: z          NB. unexpectedly, a and z don't match!
0
   $ each a        NB. inspect the string-lengths inside each box of a
+-+-+-+-+-+-+
|4|2|1|4|2|7|
+-+-+-+-+-+-+
   $ each z        NB. The third word in z was an atom, not a list
+-+-++-+-+-+
|4|2||4|2|7|
+-+-++-+-+-+
   z =: , each z   NB. Make all items of z into boxed lists
   a -: z          NB. Now a and z do match
1

```

2\. Remove the structure of an [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET"), to view it better as a set of [atoms](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET")

```
   \]a =: 4 4 ?@$ 100
90 47 58 29
22 32 55  5
55 73 58 50
40  5 69 46

   +/ 50 < , a     NB. How many numbers are greater than 50?
7

```
---

### Use These Combinations

Combinations using , y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Operations on a flattened array</td><td></td><td><tt>x ({ ,) y</tt><p><tt>x ({. ,) y</tt><br><tt>x (}. ,) y</tt><br><tt>x (e. ,) y</tt><br><tt>f/@, y</tt><br><small>(<tt>f</tt> is any verb)</small></p></td><td>or <tt>@:</tt> <tt>&amp;</tt> <tt>&amp;:</tt> <small>in place of</small> <tt>@</tt></td><td>Avoids copying the array to compute (<tt>,y</tt>)</td></tr><tr><td>Reshape to exactly <tt>x</tt></td><td></td><td><tt>x ($ ,) y</tt></td><td></td><td>Supported as a primitive by <tt>($ ,)"n</tt></td></tr></tbody></table>

---

<table class="wikitable"><tbody><tr><td><tt>x , y</tt></td><td>Append</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank_s "Vocabulary/RankInfo") _\-- operates on x and y as a whole, after adjusting the smaller operand --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Creates an [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") containing the [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of x followed by the items of y .

If x and y are [atoms](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") or [lists](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET"), x,y is simply a list made up of x followed by y

```
   z=: i.6

   z,99
0 1 2 3 4 5 99
   99,z
99 0 1 2 3 4 5
   z , 99 100
0 1 2 3 4 5 99 100

```
---

[Append Items](https://code.jsoftware.com/wiki/Vocabulary/commadot#dyadic "Vocabulary/commadot") (x ,. y), [Laminate](https://code.jsoftware.com/wiki/Vocabulary/commaco#dyadic "Vocabulary/commaco") (x ,: y), [Raze](https://code.jsoftware.com/wiki/Vocabulary/semi "Vocabulary/semi") (; y)

---

### More Information

1\. If the [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of x and y have the same [shape](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET"),  x,y is an [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") which is the [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") of those items in the sequence they appear in first x then y .

```
   \]a =: i. 2 3
0 1 2
3 4 5
   \]b =: i. 3 3
0 1 2
3 4 5
6 7 8
   a , b   NB. All items are 3-atom lists
0 1 2
3 4 5
0 1 2
3 4 5
6 7 8

```

2\. (x,y) is the same as  ;(<x),(<y) . If the [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of x and y have different [shapes](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET"), see the [detailed description](https://code.jsoftware.com/wiki/Vocabulary/semi#RazeDetails "Vocabulary/semi") in [Raze](https://code.jsoftware.com/wiki/Vocabulary/semi "Vocabulary/semi") (;).

where the "contents" referred to are the [values](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary") of x and y

```
   2 , i. 3 3   NB. all is explained in the detailed description
2 2 2
0 1 2
3 4 5
6 7 8

```

3\. Use (,!.f) to specify the _[fill](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Fill "Vocabulary/Glossary") atom_. See the [detailed description](https://code.jsoftware.com/wiki/Vocabulary/semi#RazeDetails "Vocabulary/semi") in [Raze](https://code.jsoftware.com/wiki/Vocabulary/semi "Vocabulary/semi") (;).

---

### Use These Combinations

Combinations using x , y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Combine first 2 axes (axes 0 and 1)</td><td></td><td><tt>,/ y</tt></td><td></td><td>linear time</td></tr><tr><td>Join contents of boxed items along first axis</td><td></td><td><tt>,&amp;.&gt;/ y</tt></td><td></td><td><b>Bug warning:</b> Atomic replication is inaccurate. OK if contents of same rank. Better to use <tt>&lt;@; y</tt></td></tr><tr><td>Reshape infixes</td><td></td><td><tt>x ]\ y</tt></td><td><tt>[ ,</tt> <small>in place of</small> <tt>]</tt></td><td></td></tr><tr><td>Append in place</td><td>not boxed, extended integer, or rational</td><td><tt>name =. name,expression</tt></td><td><tt>=:</tt> <small>in place of</small> <tt>=.</tt><p>the append must not increase the size of an item<br>Must be same <tt>name</tt> either side.</p></td><td>appends to the existing <tt>name</tt> usually</td></tr></tbody></table>

---
