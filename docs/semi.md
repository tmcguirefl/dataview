# Vocabulary/semi - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/semidot "Vocabulary/semidot") [<<](https://code.jsoftware.com/wiki/Vocabulary/commaco "Vocabulary/commaco")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d330.htm "jdic:d330")

<table class="wikitable"><tbody><tr><td><tt>; y</tt></td><td>Raze</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank "Vocabulary/RankInfo") _\-- operates on x and y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Removes one level of [boxing](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boxed "Vocabulary/Glossary") from a [noun.](https://code.jsoftware.com/wiki/Vocabulary/AET#Noun "Vocabulary/AET") [Cells](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Cell "Vocabulary/Glossary") of the contents of each [box](https://code.jsoftware.com/wiki/Vocabulary/AET#Box "Vocabulary/AET") then become the [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of the [result.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary")

The [shape](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET") of y is immaterial. If the contents of the boxes in y are [atoms](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") or [lists](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET"), the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") is to run the contents together into one list.

```
   \]y=: 'alpha' ; 'bravo' ; 'charlie'
+-----+-----+-------+
|alpha|bravo|charlie|
+-----+-----+-------+

   ;y
alphabravocharlie

```
---

### Common uses

1\. To remove a level of [boxing](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boxed "Vocabulary/Glossary") that was added to produce a ragged [array.](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET")

In this use (;y) does for a ragged array what (,y) does for a rectangular array.

**Example:** you want to give each member of each team a jersey. The first player on each team gets number 0, the next 1, etc. (The teams have different-colored jerseys so it's OK to duplicate numbers). Teams have different numbers of players, given by the list n. What numbers will be assigned?

This is a job for a ragged array: a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") for each team, but different lengths.

In J, you have to do this with a list of [boxed](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boxed "Vocabulary/Glossary") [lists](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET")

```
   n =. 5 4 5 2
   \]jerseys =: <@i."0 n
+---------+-------+---------+---+
|0 1 2 3 4|0 1 2 3|0 1 2 3 4|0 1|
+---------+-------+---------+---+

```

Suppose you want the list of all jersey numbers. That's what ;y gives you:

```
   ;jerseys
0 1 2 3 4 0 1 2 3 0 1 2 3 4 0 1

```

If you simply opened the array, you would get a [table](https://code.jsoftware.com/wiki/Vocabulary/AET#Table "Vocabulary/AET") with [fill](https://code.jsoftware.com/wiki/Vocabulary/FramingFill "Vocabulary/FramingFill"):

```
   >jerseys
0 1 2 3 4
0 1 2 3 0
0 1 2 3 4
0 1 0 0 0

```
---

[Append](https://code.jsoftware.com/wiki/Vocabulary/comma#dyadic "Vocabulary/comma") (,), [Append Items](https://code.jsoftware.com/wiki/Vocabulary/commadot#dyadic "Vocabulary/commadot") (,.), [Laminate](https://code.jsoftware.com/wiki/Vocabulary/commaco#dyadic "Vocabulary/commaco") (,:)

---

### Details

; y collects the contents of y into a single [array.](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") The operation of ; y resembles [collecting](https://code.jsoftware.com/wiki/Vocabulary/FramingFill "Vocabulary/FramingFill") [cell](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Cell "Vocabulary/Glossary") [results](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") into the result of a [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET"), but with important differences:

<table class="wikitable"><tbody><tr><td colspan="2"><b>Differences between collection and <tt>; y</tt></b></td></tr><tr><td><b>Collection</b></td><td><b><tt>; y</tt></b></td></tr><tr><td>The frame of the arguments becomes part of the shape of the result</td><td>The shape of <tt>y</tt> is immaterial; cells of the contents of <tt>y</tt> are assembled along a single axis</td></tr><tr><td>The full results of the verb executions are organized into an array</td><td><b>Cells</b> of the contents are put into an array</td></tr><tr><td>All results smaller than the largest are padded with framing fill, which cannot be changed</td><td>Array cells smaller than the result cell-size are padded with verb fill, which can be specified by <tt>!.f</tt></td></tr><tr><td>Atomic results are padded just like arrays</td><td>Atomic contents are <b>replicated</b> to the shape of the result cell</td></tr></tbody></table>

The steps are:

#### Find The Type And Precision Of The Result

Any [values](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary") to be joined must have the same [type.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Type "Vocabulary/Glossary") The [precision](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Precision "Vocabulary/Glossary") of the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") is determined in the same way as for [collection](https://code.jsoftware.com/wiki/Vocabulary/FramingFill#The_Type_Of_The_Overall_Result "Vocabulary/FramingFill").

---

#### Find The Rank Of An Item Of The Result

The **rank of an item of the result** is the maximum of the item ranks of the contents.

Thus, if all the contents are atoms or lists, the items of the result will be atoms; but if any contents has higher rank, the rank of an item of the result is one less than the maximum rank of the contents.

---

#### Bring Array Contents To A Common Rank

Once the [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") of the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") is known, each **[array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET")** contents is brought up to one more than the result rank, by adding as many leading axes of length 1 as needed.

After this step, all the array contents can be thought of as a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") of [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") with the result-item [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") (but not necessarily the correct [shape](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET")).

**Atomic** contents have not been modified and are still [atoms.](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET")

The contents after this step are called the _extended contents_.

---

#### Find The Shape Of An Item Of The Result

The _[shape](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET") of an [item](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary")_ is the maximum of the shapes of the items of the extended contents, where the maximum is taken over each [axis](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Axis "Vocabulary/Glossary") separately.

**Note:** the result items may be nonempty, even though each contents is empty.

---

#### Bring Items To A Common Shape: Fill And Atomic Extension

Each item of each of the extended contents is brought up to the shape of an item of the result. An **Atomic** contents is **replicated** to the shape of an item of the result and then has one additional leading axis of length 1 added, to bring the contents to the common rank. Each item of **Array** contents is **filled** by extending each axis as needed, adding **verb fill atoms** which are the value specified by !.f if that was supplied, or otherwise the framing fill appropriate for the result type.

Atomic contents are always replicated, never [filled.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Filled "Vocabulary/Glossary")

The contents after this step are called the _filled contents_.

---

#### Assembly Into The Final Result

The filled contents are all arrays of the same rank, with items of the same shape. These items are arranged along a single axis to produce the final result, which is always an array.

---

#### Illustrative Examples

```
   $ ; <'a'                   NB. The result is always an array
1

   $ ; 'ab';'c'               NB. Items are atoms
3

   $ ; (2$0);''               NB. Items are atoms; 0-atom operand does not contribute to result
2

   $ ; (2$0);(0 2$' ')        NB. Items are lists (because of 0 2$0), so 2$0 is extended to 1 2$0
1 2

   ; (2$0);(0 2$' ')          NB. The 0 2$' ' affected the shape, but contributed no items
0 0

   ; (i. 2 2 2);(0 2$' ')     NB. Items are 2x2 tables; 0 2$' ' was filled to become 1 2 2$0
0 1
2 3

4 5
6 7

0 0
0 0
   ; (i. 3 3 3);(' ')         NB.  The character cannot be replicated to match the integer
|domain error

   ; (0$0);(0 2$0)            NB. Empties join to make nonempty! (0$0)=>(1 0$0); items are 2-element lists; so (1 0$0) is filled.
0 0
   $ ; (0$0);(0 2$0)          NB. (0 2$0) does not need fill, so it is 0 lists and does not contribute to the result
1 2

   ; (i. 2 3);4               NB. Atomic replication
0 1 2
3 4 5
4 4 4

   ; (i. 3 2);(i. 3);9        NB. Items are 3-atom lists.  The items of (i. 3 2) are filled; 9 is replicated
0 1 0
2 3 0
4 5 0
0 1 2
9 9 9

   ;!.100 (i. 3 2);(i. 3);9   NB. Fill can be changed, but not replication
0 1 100
2 3 100
4 5 100
0 1   2
9 9   9

```

If all contents are empty, but the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") is nonempty, and a [fill](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Fill "Vocabulary/Glossary") is specified of a different type from the contents, the latter is used to fill result.

```
   ;!.'a' (0 2$4);''
aa
   ;!.2 (0 2$a:);''
2 2

```
---

### Use These Combinations

Combinations using ; y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Extract multiple substrings into a list</td><td>Boolean list, byte list</td><td><tt>x&nbsp;;@:(&lt;;.0) y</tt></td><td>or <tt>[:&nbsp;; &lt;;.0</tt></td><td>avoids boxing, avoids creating subarrays</td></tr><tr><td rowspan="2">Concatenated results on intervals</td><td></td><td><tt>;@:(&lt;@u;.n) y</tt></td><td rowspan="2"><tt>n e. _2 _1 1 2</tt>;<p>also <tt>[:&nbsp;; (&lt;@:u;.n)</tt>;<br>also <tt>&lt;@u;.n</tt></p></td><td rowspan="2"><b>Bug Warning:</b> This is computed as <tt>&lt;@:u</tt> even if <tt>&lt;@u</tt> is coded</td></tr><tr><td><tt>x</tt> is a <b>Boolean list</b> (<b>not</b> an atom or an integer list with values <tt>0</tt> or <tt>1</tt>)</td><td><tt>x&nbsp;;@:(&lt;@u;.n) y</tt></td></tr><tr><td>Concatenated running totals on intervals (running total, but total is reset at start of each interval)</td><td></td><td><tt>;@:(&lt;@(f/\);.n) y</tt><p><tt>x&nbsp;;@:(&lt;@(f/\);.n) y</tt><br><small>(<tt>f</tt> is any verb)</small></p></td><td><tt>n e. _2 _1 1 2</tt>; also <tt>[:&nbsp;; (f...</tt> also <tt>&lt;@:(f/\)</tt>; also <tt>&lt;@:</tt></td><td></td></tr></tbody></table>

---

<table class="wikitable"><tbody><tr><td><tt>x&nbsp;; y</tt></td><td>Link</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank "Vocabulary/RankInfo") _\-- operates on x and y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

_Links_ x and y to build up a [list of](https://code.jsoftware.com/wiki/Vocabulary/AET#ListOf "Vocabulary/AET") [boxed](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boxed "Vocabulary/Glossary") [items.](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET")

If y is already boxed and not [empty](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Empty "Vocabulary/Glossary"), does not box it again.

This makes it less clumsy to build a list of more than 2 boxed items.

```
   \]z=: 'alpha' ; 'bravo' ; 'charlie'
+-----+-----+-------+
|alpha|bravo|charlie|
+-----+-----+-------+

```
---

### Common uses

1\. Combine [nouns](https://code.jsoftware.com/wiki/Vocabulary/AET#Noun "Vocabulary/AET") of different [types](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Type "Vocabulary/Glossary") into a single noun.

```
   \]score =: 'Gauss',100   NB. Can't join dissimilar types
|domain error
   \]score =: 'Gauss';100   NB. but boxing them makes it OK
+-----+---+
|Gauss|100|
+-----+---+

```

2\. Use [boxing](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boxed "Vocabulary/Glossary") to create a ragged two-dimensional [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") where rows have different lengths:

```
   0 2 ,: 4 2 5 7   NB. Joining unequal lengths produces fill
0 2 0 0
4 2 5 7
   0 2 ; 4 2 5 7    NB. Boxing preserves individual lengths
+---+-------+
|0 2|4 2 5 7|
+---+-------+

```

3\. Collect the arguments to a [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") into a single noun that can be passed as a single [argument.](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET") The linked argument is typically broken apart at the beginning of the verb using a [multiple assignment](https://code.jsoftware.com/wiki/Vocabulary/Assignment#Multiple_Assignment "Vocabulary/Assignment").

```
   NB. Verb to compute payroll.  y is a list of (name;hourly rate;hours worked)
   payroll =: verb define"1
'name rate hours' =. y   NB. Multiple assignment breaks up boxed list
'Pay for ' , name , ' = ' , ": rate \* hours
)
   payroll 'Fred';30;40   NB. Join the 3 arguments into 1 noun
Pay for Fred = 1200

```
---

[Append](https://code.jsoftware.com/wiki/Vocabulary/comma#dyadic "Vocabulary/comma") (,)

---

### More Information

1\. x ; y boxes y only if it is [empty](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Empty "Vocabulary/Glossary") or not [boxed.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boxed "Vocabulary/Glossary") This makes it easier to create long [lists](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") of boxes:

```
   1;2;3;4
+-+-+-+-+
|1|2|3|4|
+-+-+-+-+
   1;(2;3);4
+-+-----+-+
|1|+-+-+|4|
| ||2|3|| |
| |+-+-+| |
+-+-----+-+

```

Usually you want to box the rightmost value in a sequence of ;s, even if it is boxed already. For example

```
   (<1);(<2);(<3)   NB. Probably NOT what was intended
+---+---+-+
|+-+|+-+|3|
||1|||2|| |
|+-+|+-+| |
+---+---+-+

```

It is a good habit to follow the rightmost ; in a sequence with < to solve this problem

```
   (<1);(<2);<(<3)
+---+---+---+
|+-+|+-+|+-+|
||1|||2|||3||
|+-+|+-+|+-+|
+---+---+---+

```

Another solution, if you are joining only 2 [arguments](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET"), is to use ,&< instead

```
   (<1);(<2)
+---+-+
|+-+|2|
||1|| |
|+-+| |
+---+-+
   (<1) ,&< (<2)
+---+---+
|+-+|+-+|
||1|||2||
|+-+|+-+|
+---+---+

```
---

### Use These Combinations

Combinations using x ; y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Box items of list</td><td></td><td><tt>;/ y</tt></td><td></td><td>linear time (like <tt>&lt;"_1 y</tt>)</td></tr></tbody></table>

---
