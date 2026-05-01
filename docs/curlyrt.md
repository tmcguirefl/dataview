# Vocabulary/curlyrt - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/curlyrtu "Vocabulary/curlyrtu") [<<](https://code.jsoftware.com/wiki/Vocabulary/curlylfcoco "Vocabulary/curlylfcoco")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d530n.htm "jdic:d530n")

<table class="wikitable"><tbody><tr><td><tt>m} y</tt></td><td>Composite Item</td><td>Adverb</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank "Vocabulary/RankInfo") _\-- operates on x and y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Create an [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") having the [shape](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET") of an [item](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of y that's a composite of the items of y.

Each [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") of [operand](https://code.jsoftware.com/wiki/Vocabulary/AET#Operand "Vocabulary/AET") m selects an atom from the corresponding positions of the [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of y

```
   \] y=: 'abcde' ,: 'ABCDE'
abcde
ABCDE
   0 1 0 0 1 } y  NB. for each atom of m, choose an atom from the items of y
aBcdE

```
-   [Operand](https://code.jsoftware.com/wiki/Vocabulary/AET#Operand "Vocabulary/AET") m must have the same [shape](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET") as an [item](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of y.
-   [Argument](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET") y meanwhile is of course a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") of [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of the same [shape](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET") as m.
-   [Phrase](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Phrase "Vocabulary/Glossary")  m}y has the [shape](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET") of m, but it is a composite:  -   The [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") a of m at position p (that is,  a=.(<p){m) selects from the [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET")  (<p) {"\_1 y the atom for position p of the result m}y.

[Phrase](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Phrase "Vocabulary/Glossary")  m} y is equivalent to  m {"(0 1) 0|:y .

---

### Common Uses

The only reason to use  m} y is one of efficiency:

-   either you want to avoid the transposes of m {"(0 1) 0|:y
-   or you want to use one of the [Special Combinations](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations").

1\. Create a composite [item](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") _in place_

```
   a =: 'ABC'
   b =: 'abc'
   a =: 0 1 1} a ,: b
   a
Abc

```

This form, where m} y appears **in an [assignment](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Assignment "Vocabulary/Glossary")**, is handled by special code that modifies a without first making a copy. [Sentences](https://code.jsoftware.com/wiki/Vocabulary/AET#Sentence "Vocabulary/AET") taking advantage of this feature are [very restricted in form](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations#AIP "Vocabulary/SpecialCombinations").

Some other [assignments](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Assignment "Vocabulary/Glossary") using  m} y are not in-place but avoid copying [arguments](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET"). They are likewise [very restricted in form](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations#selections "Vocabulary/SpecialCombinations").

2\. Create a composite item without transposing m and y

```
   \] a =: i. 2 3
0 1 2
3 4 5

   \] b =: 100 + a          NB. Two arrays
100 101 102
103 104 105

   \] c =: 0 1 0 ,: 1 1 0   NB. selector
0 1 0
1 1 0

   c} a ,: b               NB. composite item
  0 101 2
103 104 5

   c {"0 1&.|: a,:b        NB. equivalent
  0 101 2
103 104 5

```

  
3\. Scatter-point replace using a Boolean selector:

```
   \]mat=. \_5\]\\'abcdefghijklmnopqrstuvwxy'
abcde
fghij
klmno
pqrst
uvwxy
   (mat e. 'aeiou') } mat,:'\*'          NB. Replace vowels
\*bcd\*
fgh\*j
klmn\*
pqrst
\*vwxy
   (mat e. 'aeiou') } mat,:toupper mat  NB. Upper-case vowels
AbcdE
fghIj
klmnO
pqrst
Uvwxy

```
---

### Details

1\. [Operand](https://code.jsoftware.com/wiki/Vocabulary/AET#Operand "Vocabulary/AET") m can be a [gerund](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Gerund "Vocabulary/Glossary") (v0\`v1\`v2) or (v1\`v2), in which case m}y is executed as  (v1 y)} (v2 y) . This form is not executed in place.

2\. In-place [assignment](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Assignment "Vocabulary/Glossary") requires that  1 = 3!:0 myphrase , that is, the internal [type](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Type "Vocabulary/Glossary") of myphrase is [Boolean.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boolean "Vocabulary/Glossary")

It does not suffice for the [atoms](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Atom "Vocabulary/Glossary") of myphrase to consist only of 0 or 1 — the actual [type](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Type "Vocabulary/Glossary") must be [Boolean](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boolean "Vocabulary/Glossary")!

3\. An [obsolete form of Composite Items](https://code.jsoftware.com/wiki/Vocabulary/curlyrtu "Vocabulary/curlyrtu"): (u} y) was used in early versions of J.

where [operand](https://code.jsoftware.com/wiki/Vocabulary/AET#Operand "Vocabulary/AET") u is a [verb.](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") Its use is deprecated in favor of  m} y.

---

### Oddities

1\. [Verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET")  m} gives  index error when y has only 1 [item](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET")

```
   (,0)} ,. 5
|index error
|       (,0)},.5
   (,0)} 2 $ ,. 5
5

```
---

### Use These Combinations

Combinations using  m} y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Composite item</td><td>the <tt>x</tt> arrays are the same precision and not boxed, extended integer, or rational</td><td><tt>name =: i} x0,x1,...,xm,:xn</tt></td><td><tt>=.</tt> <small>in place of</small> <tt>=:</tt><p>If there are 2 <tt>x's</tt>, <tt>i</tt> may be Boolean or integer, but if more than 2 <tt>x's</tt>, <tt>i</tt> must be integer.<br><i>No parentheses allowed</i></p></td><td>avoids catenation and lamination</td></tr><tr><td>Composite item in place</td><td><tt>b</tt> is Boolean; <tt>x</tt> and <tt>name</tt> are the same precision and not boxed, extended integer, or rational</td><td><tt>name =: b} x,:name</tt><p><tt>name =: b} name,: x</tt></p></td><td>Must be same <tt>name</tt> either side.<p><i>No parentheses allowed</i></p></td><td>avoids making a new copy of <tt>name</tt></td></tr></tbody></table>

---

<table class="wikitable"><tbody><tr><td><tt>x m} y</tt></td><td>Amend</td><td>Adverb</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank_~ "Vocabulary/RankInfo") _\-- operates on \[x and\] y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

x m} y _amends_ y by creating a new [noun](https://code.jsoftware.com/wiki/Vocabulary/AET#Noun "Vocabulary/AET") that is a copy of y with the _locations_ m replaced by _new values_ x

```
   'gw' 0 3} 'cross'  NB. Replace items 0 and 3 with 'g' and 'w' respectively
grows

```

> [![](https://code.jsoftware.com/mediawiki/images/f/ff/Important.png)](https://code.jsoftware.com/wiki/File:Important.png) Because } is an _[adverb](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Adverb "Vocabulary/Glossary") creating a [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET")_,
> 
> the amendment process uses the [operand](https://code.jsoftware.com/wiki/Vocabulary/AET#Operand "Vocabulary/AET") m and the [arguments](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET") x and y.  
> Thus there are 3 parts to the amendment.

m} is executed to produce an _[anonymous verb](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Anonymous "Vocabulary/Glossary")_ that is executed on the [arguments](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET") x and y.

The anonymous verb has access to the [value](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary") of m.

> [![](https://code.jsoftware.com/mediawiki/images/f/ff/Important.png)](https://code.jsoftware.com/wiki/File:Important.png) It's the [Derived Verb](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Derived "Vocabulary/Glossary")  m} that does the work of updating the [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") y.
> 
> This resembles assignment to an index of an array in other languages. But  x m} y can assign many [indexes](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Index "Vocabulary/Glossary") at once.  
> It also **creates a new copy of the entire [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET")** y.
> 
> If you modify only a small portion of a very large [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET"), use the **in-place form** [given below](#AIP).

x m} y is used in J much less than you would think, considering the importance of in-place array modification in other languages.

[Operand](https://code.jsoftware.com/wiki/Vocabulary/AET#Operand "Vocabulary/AET") m gives the positions to be modified, and [argument](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET") x the [values](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary") to put there. In the simplest case there is only one position

```
   y =: 'abcdefghijklmnop'
   y =: '\*' 2} y            NB. Modify position 2
   y
ab\*defghijklmnop

```

Note, however, that a single atom in m refers to an [item](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of y

```
   \] y =: \_4 \]\\ 'abcdefghijklmnop'
abcd
efgh
ijkl
mnop

   y =: '\*' 2} y    NB. Now position 2 is a list
   y
abcd
efgh
\*\*\*\*
mnop

```

[Operand](https://code.jsoftware.com/wiki/Vocabulary/AET#Operand "Vocabulary/AET") m may specify more than one target [item](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of y

```
   y =: 'abcdefghijklmnop'
   y =: '\*' 0 2 4 6} y
   y
\*b\*d\*f\*hijklmnop

```

Each **atom** of m specifies a selection from y, just as with  x { y . Thus the above m has 4 selections:  0 2 4 6 .

Each selected [item](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") can be assigned a different [value.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary") The values in x must have the same [shape](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET") as a _[cell](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Cell "Vocabulary/Glossary")_ of the selected portion of the [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") y. If x has lower rank than the selected part of y, it is replicated as needed.

Details [below](#multisel). In the previous example x (an [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET")) matched the [shape](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET") of a [0-cell](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Cell "Vocabulary/Glossary") of the selection.

```
   y =: 'abcdefghijklmnop'
   y =: 'ABCD' 0 2 4 6} y
   y
AbBdCfDhijklmnop

```

[Operand](https://code.jsoftware.com/wiki/Vocabulary/AET#Operand "Vocabulary/AET") m can [select from multiple axes](https://code.jsoftware.com/wiki/Vocabulary/curlylf#indexing "Vocabulary/curlylf")

This is like multidimensional indexing in other languages.

```
   \] y =: \_4 \]\\ 'abcdefghijklmnop'
abcd
efgh
ijkl
mnop

   y =: '\*' (<2 1)} y
   y
abcd
efgh
i\*kl
mnop

```

[Operand](https://code.jsoftware.com/wiki/Vocabulary/AET#Operand "Vocabulary/AET") m can make multiple selections from multiple [axes](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Axis "Vocabulary/Glossary") to select a region of the [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") to be modified

```
   y =: \_4 \]\\ 'abcdefghijklmnop'
   y =: '\*' (<0 2;3 1)} y   NB. Modify rows 0 &2, columns 3&1
   y
a\*c\*
efgh
i\*k\*
mnop

```

If [operand](https://code.jsoftware.com/wiki/Vocabulary/AET#Operand "Vocabulary/AET") m is a numeric array of rank > 1, it specifies a _**scatter-modify**_: each 1-cell of m is the [index list](https://code.jsoftware.com/wiki/Vocabulary/Glossary#IndexList "Vocabulary/Glossary") of a cell of y. All the cells addressed by rows of m are replaced by cells of x.

Thus the 1-frame of m gives the frame of the selection.

```
   y =: \_4 \]\\ 'abcdefghijklmnop'
   y =: '\*' (2 2$3 2 1 1)} y   NB. Multidimensional m; each row selects a cell. Selection is 2 0-cells
   y
abcd
e\*gh
ijkl
mn\*p

```

[Argument](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET") x can give the new [value](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary") for atoms independently

```
   y =: \_4 \]\\ 'abcdefghijklmnop'
   y =: 'AB' (<0 2;3 1)} y  NB. Store 'AB' into position 3&1 of each of rows 0&2
   y
aBcA
efgh
iBkA
mnop

   y =: \_4 \]\\ 'abcdefghijklmnop'
   \]x =: 2 2$ 'ABCD'        NB. A different value for each modified atom
AB
CD
   y =: x (<0 2;3 1)} y
   y
aBcA
efgh
iDkC
mnop

```
```
   y =: \_4 \]\\ 'abcdefghijklmnop'
   y =: 'AB' (2 2$3 2 1 1)} y   NB. Multidimensional m; each row selects a cell. Selection is 2 0-cells.  A cell of x goes into each
   y
abcd
eBgh
ijkl
mnAp

```

The examples so far have used _assignment in place_, where the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") of  x m} y is assigned back to the original y. But this is not essential. **The result of (x m} y) is a new modified [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET")**, always having the same [shape](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET") as y, that can be used like any other array

```
   '\*' 2} 'abcdefgh'        NB. Create an array and modify it.  The modified array is the result.
ab\*defgh

```

> [![](https://code.jsoftware.com/mediawiki/images/f/ff/Important.png)](https://code.jsoftware.com/wiki/File:Important.png) x m} y replaces parts of an array. If you want to modify internal portions of a multilevel boxed noun, look at [utilities for amending boxed structures](https://code.jsoftware.com/wiki/Vocabulary/AmendingBoxedStructures "Vocabulary/AmendingBoxedStructures").

---

### Common uses

1\. When converting seconds to hours/minutes/seconds, replace the first [number](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Number "Vocabulary/Glossary") in the base (HMS) with 0 to allow unlimited hours

```
   HMS =: 24 60 60
   HMS #: 96400   NB. this gives hours mod 24
2 46 40
   ((0) 0} HMS) #: 96400  NB. unlimited hours...
26 46 40
   (0) 0} HMS    NB. ...by using modified base
0 60 60

```

2\. Force a 1 into the last position of a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") of [frets](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Fret "Vocabulary/Glossary"), to avoid losing text

```
   text =. 'Mr. Jones and Mr. Smith are here.  Let them in.'
   \] frets =. '.  ' E. text    NB. Find the ends of sentences
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0
   frets <;.2 text             NB. Box the sentences.  Unfortunately the bit at the end is lost.
+---------------------------------+
|Mr. Jones and Mr. Smith are here.|
+---------------------------------+
   ((1) \_1} frets) <;.2 text   NB. Stuff a 1 into the last position
+---------------------------------+--------------+
|Mr. Jones and Mr. Smith are here.|  Let them in.|
+---------------------------------+--------------+
   (1) \_1} frets
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 1

```

3\. Replace a single [box](https://code.jsoftware.com/wiki/Vocabulary/AET#Box "Vocabulary/AET") in a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") of [boxes](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Box "Vocabulary/Glossary")

```
   \]w =: ;:'The quick brown fox rested.'
+---+-----+-----+---+-------+
|The|quick|brown|fox|rested.|
+---+-----+-----+---+-------+
   (,&'ish' each 2 { w) 2} w
+---+-----+--------+---+-------+
|The|quick|brownish|fox|rested.|
+---+-----+--------+---+-------+

```

4\. Replace a subarray with another of the same shape

```
   \]a=. i.6 6
 0  1  2  3  4  5
 6  7  8  9 10 11
12 13 14 15 16 17
18 19 20 21 22 23
24 25 26 27 28 29
30 31 32 33 34 35
   \]b=. 3 3$100 200 300 400 500 600
100 200 300
400 500 600
100 200 300
   b (<2 3 4;1 2 3)}a                NB. specifying the perimeter of b's new location within a
 0   1   2   3  4  5
 6   7   8   9 10 11
12 100 200 300 16 17
18 400 500 600 22 23
24 100 200 300 28 29
30  31  32  33 34 35
   am=. {{ x (<m <@(+i.)"0 $x)} y }} NB. abstracting the logic
   b 2 1 am a                        NB. and specifying only the coordinate of b's lowest corner, yielding the same result
 0   1   2   3  4  5
 6   7   8   9 10 11
12 100 200 300 16 17
18 400 500 600 22 23
24 100 200 300 28 29
30  31  32  33 34 35

```

am works for x and y with any rank.

---

### More Information

1\. You can change portions of a [noun](https://code.jsoftware.com/wiki/Vocabulary/AET#Noun "Vocabulary/AET") _in place_ (that is, without making a new copy of the [noun](https://code.jsoftware.com/wiki/Vocabulary/AET#Noun "Vocabulary/AET")), when no harm can come from doing so. The most common example of this is modification to a name that is about to be reassigned. Our examples have emphasized that form.

In this form of in-place modification you immediately assign the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") of  x m} namedy to the same [name](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Name "Vocabulary/Glossary"), so that the previous [value](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary") of namedy can never again be used. Only in that case is it safe for J to create the new noun in the same location in memory as the old one.

With big [arrays](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET"), _amendment_ without _in-place [assignment](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Assignment "Vocabulary/Glossary")_ can be colossally inefficient

```
   bigarray =: \] 5 (5)} bigarray   NB. same result as above, but 100,000 times slower

```

Other places where in-place modification can be performed are discussed [here](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations#Execution_In_Place_#EIP "Vocabulary/SpecialCombinations").

2\. If m is a numeric array of rank > 1, each row of m gives the [index list](https://code.jsoftware.com/wiki/Vocabulary/Glossary#IndexList "Vocabulary/Glossary") of a cell of y to be modified. In other words, m is interpreted as if it were (<m).

3\. If [operand](https://code.jsoftware.com/wiki/Vocabulary/AET#Operand "Vocabulary/AET") m is boxed, it must be an atom.  
For compatibility, [select other forms](#deprecated) are also recognized.

The locations of y that will be altered are those that would be **selected** by  m { y .

subject to the rule [above](#scatter) that numeric arrays m are boxed first

  
4\. [Argument](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET") x must have the [shape](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET") of a **[cell](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Cell "Vocabulary/Glossary")** of  m{y

...which can have any rank from atom up to the entire  m{y . x is replicated as needed to the shape of  m{y

```
   y =: i. 2 3

   100 (0}) y                     NB. \`x\` (an atom) has the shape of a 0-cell of m{y, and is replicated
100 100 100
  3   4   5

   100 101 (0}) y                 NB. \`x\` is a 2-atom list, but m{y is a 3-atom list
|length error
|   100 101    (0})y

   100 101 102 (0}) y             NB. \`x\` is a 3-atom list, and so is m{y
100 101 102
  3   4   5

   100 101 102 (0 2}) i. 3 3      NB. \`x\` is a 3-atom list, m{y has shape 2 3, so x is replicated
100 101 102
  3   4   5
100 101 102

   100 101 (<(i. 2 2);0)} i. 4 4  NB. m{y has shape 2 2, x is replicated
100  1  2  3
101  5  6  7
100  9 10 11
101 13 14 15

```

5\. If the selections specified by the [atoms](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") of m overlap, the amendments are applied in order, leaving the last one as the survivor

(Don't rely on this behavior in future versions of J!)

```
     (100 200) (<1;2 2)} i. 3 3
0 1   2
3 4 200
6 7   8

```

6\. [Operand](https://code.jsoftware.com/wiki/Vocabulary/AET#Operand "Vocabulary/AET") m may be a [gerund](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Gerund "Vocabulary/Glossary") v0\`v1\[\`v2\], in which case  x v0\`v1\[\`v2\]} y executes as

```
(x v0 y) (x v1 y)} (x v2 y)

```

**Note:** all the verbs  v0 v1 v2 are executed [dyadically](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Dyad "Vocabulary/Glossary"). v2 is usually omitted, in which case \] is used so that the entire y is amended.

**Note:**  v1 must produce selectors, not a gerund.

This form of  x m} y is often useful in [tacit verbs](https://code.jsoftware.com/wiki/Vocabulary/Glossary#TacitVerb "Vocabulary/Glossary"). The modification is performed in-place [if possible](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations#EIP "Vocabulary/SpecialCombinations").  
Apply a "substring;position couple": x (x -: _substring_;_starting-position_) to a given [string](https://code.jsoftware.com/wiki/Vocabulary/Glossary#String "Vocabulary/Glossary") y  
**CASE 1:**

```
   X=: 'CDEFG'
   M=: 2 3 4 5 6
   Y=: 'abcdefghijklmnopqrstuvwxyz'
   X M} Y
abCDEFGhijklmnopqrstuvwxyz

```

**CASE 2:**

```
   x =: 'CDEFG';2                     NB. the "substring;starting-position" couple
   y =: 'abcdefghijklmnopqrstuvwxyz'  NB. the target string
   v0=: 4 : '0 {:: x'                 NB. return the substring from the couple: x
   v1=: 4 : 0                         NB. return the list of indexes in y to amend
'substring startpos' =. x
startpos + i. #substring
)
   v2=: \]                             NB. simply return y from the phrase: x v2 y

   (x v0 y) ; (x v1 y) ; (x v2 y)     NB. <--> X;M;Y in CASE 1 (Just checking for equivalence)
+-----+---------+--------------------------+
|CDEFG|2 3 4 5 6|abcdefghijklmnopqrstuvwxyz|
+-----+---------+--------------------------+
   g =: v0\`v1\`v2                      NB. assign the gerund to a pronoun: 'g'
   type 'g'
+----+
|noun|
+----+
   x g} y                             NB. do the amend
abCDEFGhijklmnopqrstuvwxyz
   x v0\`v1\`v2} y                      NB. --or use gerund phrase itself directly
abCDEFGhijklmnopqrstuvwxyz

```

7\. If [argument](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET") y has rank = 1 and [operand](https://code.jsoftware.com/wiki/Vocabulary/AET#Operand "Vocabulary/AET") m is a numeric array of rank > 1, then to avoid interpreting an amend operation as scatter-modify, box m twice.

```
   x=. 'ABC'
   y =: 25 $ '.'

   m1=. 2 3 4 ,: 8 11 13        NB. rank(m)=2
   x m1} y                      NB. not supported since J903
|length error
|   x     m1}y
   x (<<m1)} y            NB. selects m1 from the first axis
..ABC...A..B.C...........

   \] m2=. \_2 3 {."2 i. 2 3 4    NB. rank(m)=3
 4  5  6
 8  9 10

16 17 18
20 21 22
   x m2} y                      NB. not supported since J903
|length error
|   x     m2}y
   x (<<m2)} y            NB. a workaround
....ABC.ABC.....ABC.ABC..
   <^:2"\_1 m2                   NB. valid location
+--------+----------+
|+------+|+--------+|
||4 5  6|||16 17 18||
||8 9 10|||20 21 22||
|+------+|+--------+|
+--------+----------+

```

8\. For compatibility with earlier versions of J, in two special forms boxed m may be an array. These forms are

-   (x (<"0 _array_)} y) which is treated as (x (<<_array_)} y)
-   (x (<"1 _array_)} y) which is treated as (x (<_array_)} y)

These forms are **deprecated** and are slower than the equivalents.

---

### Details

1\. A [verb form of Amend](https://code.jsoftware.com/wiki/Vocabulary/curlyrtu#dyadic "Vocabulary/curlyrtu"): (x u} y) was used in early versions of J.

where [operand](https://code.jsoftware.com/wiki/Vocabulary/AET#Operand "Vocabulary/AET") u is a [verb.](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET")  x m} y is normally used instead, except in cases where operations on individual atoms are needed.

  
2\. x (<<<m)} y, which specifies complementary indexing, sorts m. Because m is usually short or in order, _insertion sort_ is used. If you have large unordered m, you should sort it first.

3\. To modify a contiguous section of y, use u&.(m&{) y where m selects the portion of y to be modified. The modification is done in place if possible.

---

### Use These Combinations

Combinations using x m} y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Amend in place</td><td>not boxed, extended integer, or rational</td><td><tt>name =. x i} name</tt><p><tt>name =. x (i}) name</tt><br><tt>name =. name i}~ x</tt><br>or if <tt>y</tt> is an unnamed intermediate result</p></td><td><tt>=:</tt> <small>in place of</small> <tt>=.</tt><p>Must be same <tt>name</tt> either side.<br>Parentheses allowed around <tt>x</tt> and <tt>i</tt> <b>only</b></p></td><td>avoids making a new copy of <tt>name</tt></td></tr></tbody></table>

---
