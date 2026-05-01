# Vocabulary/semidot1 - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/semidot3 "Vocabulary/semidot3") [<<](https://code.jsoftware.com/wiki/Vocabulary/semidot0 "Vocabulary/semidot0")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d331.htm "jdic:d331")

<table class="wikitable"><tbody><tr><td><tt>u;.1 y</tt></td><td><tt>u;._1 y</tt></td><td><tt>u;.2 y</tt></td><td><tt>u;._2 y</tt></td><td>SelfIntervals</td><td>Adverb</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank "Vocabulary/RankInfo") _\-- operates on x and y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

A family of related [adverbs](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Adverb "Vocabulary/Glossary"), differing only in small details.

We will consider  u;.1 y and  u;.2 y separately.

[See this note](#negative) for the meanings of related phrases  u;.\_1 y and  u;.\_2 y

**Definition:** In what follows, an **interval of items** is a sequence of consecutive [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of a [noun.](https://code.jsoftware.com/wiki/Vocabulary/AET#Noun "Vocabulary/AET")

---

**Case:  u;.1 y**

This [partitions](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Partition "Vocabulary/Glossary") y into a sequence of [intervals](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Interval "Vocabulary/Glossary") and then applies u individually on each interval. The [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") of  u;.1 y is the [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") of results from individual applications of u.

An [item](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") marking the boundary of an interval is called a **_[fret](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Fret "Vocabulary/Glossary")_**. Each interval runs from one fret to the next (or, for the last fret, to the end of the [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET")).

In  u;.1 y the frets are those [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of y that match the first item of y. In other words, the first item of y is used as a delimiter, and y is split into [intervals](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Interval "Vocabulary/Glossary") by starting a new interval at every item of y that matches the delimiter.

Since the first item of y starts the first interval, every item of y will be in exactly one interval.

u can be any [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET").

The following examples use <, which boxes each interval, and +/, which adds up the numbers in each interval.

```
   <;.1 'a man, a plan, a canal: panama'
+---+----+----+----+---+--+-----+--+--+-+
|a m|an, |a pl|an, |a c|an|al: p|an|am|a|
+---+----+----+----+---+--+-----+--+--+-+

```

The first item is (a), so every (a) starts a new interval.

```
   <;.1 \] 3 1 4 1 5 9 2 6 5 3 5 3 2 3 8
+-----------------+---+---+---+
|3 1 4 1 5 9 2 6 5|3 5|3 2|3 8|
+-----------------+---+---+---+

```

Numbers work too, just as well as [bytes.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Byte "Vocabulary/Glossary")

```
   +/;.1 (3 1 4 1 5 9 2 6 5 3 5 3 2 3 8)  NB. () needed to split numeric list
36 8 5 11

```

Instead of [boxing](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boxed "Vocabulary/Glossary") the intervals using <, we totaled the numbers.

```
   \]a =. \_2 \]\\ 1 1 1 0 0 1 1 1 2 0 1 1 1 1 2 3   NB. An 8x2 table
1 1
1 0
0 1
1 1
2 0
1 1
1 1
2 3
   <;.1 a
+---+---+---+---+
|1 1|1 1|1 1|1 1|
|1 0|2 0|   |2 3|
|0 1|   |   |   |
+---+---+---+---+

```

The [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of a [table](https://code.jsoftware.com/wiki/Vocabulary/AET#Table "Vocabulary/AET") are [lists](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") (i. e. rows). A new [interval](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Interval "Vocabulary/Glossary") starts with each occurrence of a match with the first item, 1 1.

---

**Case  u;.2 y**

This is like  u;.1 y, except that the [frets](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Fret "Vocabulary/Glossary") are those [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") that match the **last** item of y, and they are used to mark the **end** of an [interval:](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Interval "Vocabulary/Glossary")

```
   <;.2 'a man, a plan, a canal: panama'
+-+---+----+----+----+---+--+-----+--+--+
|a| ma|n, a| pla|n, a| ca|na|l: pa|na|ma|
+-+---+----+----+----+---+--+-----+--+--+
   <;.2 (3 1 4 1 5 9 2 6 5 3 5 3 2 3 8)   NB. Only one 8, so all one interval
+-----------------------------+
|3 1 4 1 5 9 2 6 5 3 5 3 2 3 8|
+-----------------------------+

```

**Note:** u;.\_1 and  u;.\_2 are like  u;.1 and  u;.2 respectively, except that the frets are removed from the intervals before u is applied:

```
   <;.\_1 'a man, a plan, a canal: panama'
+--+---+---+---+--+-+----+-+-++
| m|n, | pl|n, | c|n|l: p|n|m||
+--+---+---+---+--+-+----+-+-++
   <;.\_2 'a man, a plan, a canal: panama'
++--+---+---+---+--+-+----+-+-+
|| m|n, | pl|n, | c|n|l: p|n|m|
++--+---+---+---+--+-+----+-+-+

```

Note that when n is negative, u may be applied to an [empty](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Empty "Vocabulary/Glossary") [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET"), if the interval contained only one [item.](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET")

<table class="wikitable"><tbody><tr><td colspan="2"><b>Summary of the meaning of <tt>n</tt> in <tt>u;.n y</tt></b></td></tr><tr><td><b>n</b></td><td><b>Meaning</b></td></tr><tr><td>1 or _1</td><td><b>First</b> item is delimiter, interval <b>starts</b> with fret</td></tr><tr><td>2 or _2</td><td><b>Last</b> item is delimiter, interval <b>ends</b> with fret</td></tr><tr><td>positive</td><td>Fret is <b>included</b> in interval</td></tr><tr><td>negative</td><td>Fret is <b>deleted</b> from interval</td></tr></tbody></table>

---

### Common uses

1\. To _cut_ a [string](https://code.jsoftware.com/wiki/Vocabulary/Glossary#String "Vocabulary/Glossary") y into a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") of [boxed](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boxed "Vocabulary/Glossary") substrings at some chosen delimiter, e.g. Space (' ')

```
   y=: 'alpha bravo charlie'
   (<;.\_1) ' ',y
+-----+-----+-------+
|alpha|bravo|charlie|
+-----+-----+-------+

```

Note that we had to add a space at the beginning to make sure we started with the right delimiter, and that we used the ;.\_1 form to remove the space from the resulting [word.](https://code.jsoftware.com/wiki/Vocabulary/AET#Word "Vocabulary/AET")

Compare this with the action of [Words](https://code.jsoftware.com/wiki/Vocabulary/semico "Vocabulary/semico") (;:) which uses J's rules for recognizing words: much different from looking for spaces:

```
   y=: 'Fine, easy as 1 2 3?'
   ;: y
+----+-+----+--+-----+-+
|Fine|,|easy|as|1 2 3|?|
+----+-+----+--+-----+-+
   (<;.\_1) ' ',y
+-----+----+--+-+-+--+
|Fine,|easy|as|1|2|3?|
+-----+----+--+-+-+--+

```

But for string contents known to contain no punctuation or number sequences, you might find (;:) handier to use.

2\. u;.\_2 is often used to split a text file into lines, where each line is ended by a linefeed (LF)

```
   a =. 1!:1 <'C:\\J\\bin\\profilex.ijs'  NB. Read in a text file
   $a
886
   a            NB. Display it.  It's a list of lines separated by LF
NB. profilex.ijs template
NB. copy template to profilex and edit as required
...
   <;.\_2 a,LF   NB. Use LF as delimiter, and split to lines
+--------------------------+----------------------------------------
|NB. profilex.ijs template |NB. copy template to profilex and edit...
+--------------------------+----------------------------------------

```

3\. The result of  0 : 0 is like a text file: a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") of [characters](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Character "Vocabulary/Glossary"), with lines separated by LF.

```
   n =: 0 : 0   NB. Define a multiline noun
Line 1
Line 2
)
   $n           NB. It's a list...
14
   <;.\_2 n      NB. ...with LF at the end of each line
+------+------+
|Line 1|Line 2|
+------+------+

```

When you need to define a large data array, consider using 0 : 0 to write the lines, and then u;.\_2 to process each line. Common choices of u are < to create a list of lines, or ". to execute each line, or <@;: to convert each line to a boxed list of words.

```
   \]listofnames =: <;.\_2 (0 : 0)  NB. Names read from a file; box each line
Alicia
Alex
Jo
Fran
)
+------+----+--+----+
|Alicia|Alex|Jo|Fran|
+------+----+--+----+

   \]name\_zip =: ".;.\_2 (0 : 0)    NB. name and zipcode; execute each line
'John Bull' ; 'W1'
'John Q. Public' ; 27607
'Tanaka-san' ; 6038134
)
+--------------+-------+
|John Bull     |W1     |
+--------------+-------+
|John Q. Public|27607  |
+--------------+-------+
|Tanaka-san    |6038134|
+--------------+-------+

   \]colors =: <@;:;.\_2 (0 : 0)    NB. box each list of words
red burgundy maroon vermilion
green emerald jade
blue teal cerulean
)
+-------------------------------+--------------------+--------------------+
|+---+--------+------+---------+|+-----+-------+----+|+----+----+--------+|
||red|burgundy|maroon|vermilion|||green|emerald|jade|||blue|teal|cerulean||
|+---+--------+------+---------+|+-----+-------+----+|+----+----+--------+|
+-------------------------------+--------------------+--------------------+

```
---

### Details

1\. Each [interval](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Interval "Vocabulary/Glossary") has the same [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") as y.

2\. If u is applied to an [empty](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Empty "Vocabulary/Glossary") [argument](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET") (because the [interval](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Interval "Vocabulary/Glossary") contained only the [fret](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Fret "Vocabulary/Glossary"), which was deleted before applying u), then u is applied to 0 $ y. This is analogous to [execution](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Execution "Vocabulary/Glossary") on a [fill](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Fill "Vocabulary/Glossary")\-[cell.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Cell "Vocabulary/Glossary")

0 $ y is an [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") with 0 [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") (each of which has the [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") of an item of y).

3\. u may be a [cyclic gerund](https://code.jsoftware.com/wiki/Vocabulary/CyclicGerund "Vocabulary/CyclicGerund").

---

### Use These Combinations

Combinations using ;.1-2 y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") are shown in [Intervals](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations#intervals "Vocabulary/SpecialCombinations").

---

<table class="wikitable"><tbody><tr><td><tt>x u;.1 y</tt></td><td><tt>x u;._1 y</tt></td><td><tt>x u;.2 y</tt></td><td><tt>x u;._2 y</tt></td><td>Intervals</td><td>Adverb</td></tr></tbody></table>

[Rank 1 \_](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank1_r "Vocabulary/RankInfo") _\-- operates on lists of x and the entirety of y, with replication of atomic x --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

A family of related [adverbs](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Adverb "Vocabulary/Glossary"), differing only in small details.

> [![](https://code.jsoftware.com/mediawiki/images/f/ff/Important.png)](https://code.jsoftware.com/wiki/File:Important.png) Before reading about  x u;.n y make sure you understand the operation of [u;.n y](#monadic)
> 
>   
> and the terms [interval](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Interval "Vocabulary/Glossary") and [fret.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Fret "Vocabulary/Glossary")

We will consider  x u;.1 y and  x u;.2 y separately.

[See this note](#negative) for the meanings of related phrases  x u;.\_1 y and  x u;.\_2 y

**Definition:** In what follows, an **interval of items** is a sequence of consecutive [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of a [noun.](https://code.jsoftware.com/wiki/Vocabulary/AET#Noun "Vocabulary/AET")

---

**Case:  x u;.1 y**

This [partitions](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Partition "Vocabulary/Glossary") y into a sequence of [intervals](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Interval "Vocabulary/Glossary") and then applies u individually on each interval. The [frets](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Fret "Vocabulary/Glossary") of y, that is the starting points of intervals, are the [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of y corresponding to 1s in the [Boolean](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boolean "Vocabulary/Glossary") [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") x.

The result of  x u;.1 y is the [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") of [results](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") from individual applications of u

```
   1 0 1 0 0 <;.1 'abcde'
+--+---+
|ab|cde|
+--+---+

```

[Items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of y before the first fret are not part of any interval and are not used:

```
  0 1 0 0 1 <;.1 'abcde'
+---+-+
|bcd|e|
+---+-+

```
---

**Case:  x u;.2 y**

This is like  x u;.1 y , except that the intervals **end** at [frets](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Fret "Vocabulary/Glossary")

```
   1 0 1 0 0 <;.2 'abcde'
+-+--+
|a|bc|
+-+--+
  0 1 0 0 1 <;.2 'abcde'
+--+---+
|ab|cde|
+--+---+

```

**Note:**  u;.\_1 and  u;.\_2 are like  u;.1 and  u;.2 respectively, except that the frets are removed from the intervals before u is applied

```
   1 0 1 0 0 <;.\_1 'abcde'
+-+--+
|b|de|
+-+--+
   1 0 1 0 0 <;.\_2 'abcde'
++-+
||b|
++-+

```
---

<table class="wikitable"><tbody><tr><td colspan="2"><b>Summary of the meaning of <tt>n</tt> in <tt>x u;.n y</tt></b></td></tr><tr><td><b>n</b></td><td><b>Meaning</b></td></tr><tr><td>1 or _1</td><td>Interval <b>starts</b> with fret</td></tr><tr><td>2 or _2</td><td>Interval <b>ends</b> with fret</td></tr><tr><td>positive</td><td>Fret is <b>included</b> in interval</td></tr><tr><td>negative</td><td>Fret is <b>deleted</b> from interval</td></tr></tbody></table>

---

#### Multidimensional Intervals Using Boxed x

If x is a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") of [boxes](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boxe "Vocabulary/Glossary"), the operation is generalized from [intervals](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Interval "Vocabulary/Glossary") of [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") to subarrays. Each [box](https://code.jsoftware.com/wiki/Vocabulary/AET#Box "Vocabulary/AET") of x contains the [frets](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Fret "Vocabulary/Glossary") for a single [axis](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Axis "Vocabulary/Glossary") starting with the first.

Each axis is partitioned using its frets according to the rules of u;.n. u is applied to each subarray, and the [results](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") are collected

```
   \]a =. 4 4 $ 'abcdefghijklmnop'
abcd
efgh
ijkl
mnop
   (1 0 0 1;0 1 0 1) <;.1 a
+--+-+
|bc|d|
|fg|h|
|jk|l|
+--+-+
|no|p|
+--+-+

```

An axis corresponding to an empty box in x, or an axis beyond the length of x, is taken in full and does not produce an axis of the [partitioning.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Partition "Vocabulary/Glossary")  
**Exception:** If the axis of y corresponding to the empty box has length 0, the 0-length axis remains in the partitioning.

```
   \]a =. (1 0 0;1 0 1) <;.1 i. 3 3
+---+-+
|0 1|2|
|3 4|5|
|6 7|8|
+---+-+
   $a
1 2
   \]b =. ('';1 0 1) <;.1 i. 3 3
+---+-+
|0 1|2|
|3 4|5|
|6 7|8|
+---+-+
   $b
2

```

The partitioning to create b does not have an axis corresponding to the empty box.

---

### Common Uses

1\. x u;.n y is a workhorse for acting on [intervals](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Interval "Vocabulary/Glossary") of a [noun.](https://code.jsoftware.com/wiki/Vocabulary/AET#Noun "Vocabulary/AET") To cut text into English sentences (ending with "." and two spaces)

```
   '.  ' E. text   NB. Find ends-of-sentence
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 1 0 0
   ('.  ' E. text) <;.2 text
+----------------+-------------------+------------+
|I saw Mr. Jones.|  Mr. Jones saw me.|  We waited.|
+----------------+-------------------+------------+

```

2\. To add up [intervals](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Interval "Vocabulary/Glossary") of ascending numbers in a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET")

```
   list =. 3 1 4 1 5 9 2 6 5 3 5 8 9 7 9   NB. a list
   \]ascendingstarts =. 1 , 2 >/\\ list      NB. places where the list starts an ascending sequence
1 1 0 1 0 0 1 0 1 1 0 0 0 1 0
   ascendingstarts <;.1 list               NB. The ascending sequences
+-+---+-----+---+-+-------+---+
|3|1 4|1 5 9|2 6|5|3 5 8 9|7 9|
+-+---+-----+---+-+-------+---+
   ascendingstarts +/;.1 list              NB. Totals of the ascending sequences
3 5 15 8 5 25 16

```

3\. To split a matrix into block matrix form

```
   (1 0 0 1;1 0 1 0 0) <;.1 i.4 5
+-----+--------+
| 0  1| 2  3  4|
| 5  6| 7  8  9|
|10 11|12 13 14|
+-----+--------+
|15 16|17 18 19|
+-----+--------+

```
---

### Details

1\. Each [interval](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Interval "Vocabulary/Glossary") has the same [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") as y.

2\. If u is applied to an [empty](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Empty "Vocabulary/Glossary") [argument](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET") (because the interval contained only the [fret](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Fret "Vocabulary/Glossary"), which was deleted before applying u), u is applied to 0 $ y. This is analogous to [execution](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Execution "Vocabulary/Glossary") on a [fill](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Fill "Vocabulary/Glossary")\-[cell.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Cell "Vocabulary/Glossary")

Phrase  0 $ y is an [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") with 0 [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") (each of which has the [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") of an item of y).

3\. If y has no [intervals](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Interval "Vocabulary/Glossary") (because x is all zero), the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") is  0 $ ,: u 0 $ y . This is analogous to [execution](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Execution "Vocabulary/Glossary") on a [fill](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Fill "Vocabulary/Glossary")\-[cell.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Cell "Vocabulary/Glossary")

Phrase  0 $ y is an [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") with 0 [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") (each of which has the [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") of an item of y), and the final  0 $ ,: prepends a leading [axis](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Axis "Vocabulary/Glossary") of 0 length.

4\. u may be a [cyclic gerund](https://code.jsoftware.com/wiki/Vocabulary/CyclicGerund "Vocabulary/CyclicGerund").

5\. If x is a [scalar](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Scalar "Vocabulary/Glossary"), it is replicated and used for each [item](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of y.

---

### Oddities

1\. If x is [empty](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Empty "Vocabulary/Glossary") and y has [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET"), the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") is  u y .

2\. If x is empty and y has no items, the result is 0 $ ,: u y .

3\. If x is [boxed](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boxed "Vocabulary/Glossary"), the same principle applies: an [empty](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Empty "Vocabulary/Glossary") box in x means that the corresponding [axis](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Axis "Vocabulary/Glossary") is taken in full and does not produce an axis in the [result.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary"), except when the axis has length 0.

---

### Use These Combinations

Combinations using x ;.1-2 y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") are shown in [Intervals](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations#intervals "Vocabulary/SpecialCombinations").

---
