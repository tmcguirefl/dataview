# Vocabulary/gt - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/gtdot "Vocabulary/gtdot") [<<](https://code.jsoftware.com/wiki/Vocabulary/ltco "Vocabulary/ltco")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d020.htm "jdic:d020")

<table class="wikitable"><tbody><tr><td><tt>&gt; y</tt></td><td>Open</td></tr></tbody></table>

[Rank 0](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank0var "Vocabulary/RankInfo") _\-- operates on individual atoms of y, producing a result that may require fill --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Opens (undoes the [boxing](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Box "Vocabulary/AbsolutelyEssentialTerms")) of a boxed element or [array](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Array "Vocabulary/AbsolutelyEssentialTerms") of boxed elements.

Unboxing a [list](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#List "Vocabulary/AbsolutelyEssentialTerms") of _n_ boxed [strings](https://code.jsoftware.com/wiki/Vocabulary/Glossary#String "Vocabulary/Glossary") converts it to a [matrix](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Matrix "Vocabulary/Glossary") of _n_ rows

```
   \]zub=: ;:'alpha bravo charlie'
+-----+-----+-------+
|alpha|bravo|charlie|
+-----+-----+-------+

   > zub
alpha
bravo
charlie
   $ > zub
3 7

```
---

### Common Uses

To remove boxing that is no longer needed to protect the contents.

1\. When a portion of an array has been selected, and it is safe to remove boxing.

```
   \]db =: \_2 \]\\ 'Jack';67;'Arnold';68;'Byron';65
+------+--+
|Jack  |67|
+------+--+
|Arnold|68|
+------+--+
|Byron |65|
+------+--+
   > 1 {"1 db  NB. Select second column (all \[\[Vocabulary/Glossary#Numeric|numeric\]\]), then unbox
67 68 65

```

2\. When an operation to be performed on the contents will give a result regardless of the contents. This often takes the form  u@>y for some [verb](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Verb "Vocabulary/AbsolutelyEssentialTerms") u . This opens each box **separately** and applies u

```
   #@> db  NB. Get the #items of each box
4 1
6 1
5 1

```

3\. When the [atoms](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Atom "Vocabulary/AbsolutelyEssentialTerms") of an array have been separated because of verb [rank](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Rank "Vocabulary/AbsolutelyEssentialTerms") ( f@>y above is an example of this)

```
   prefix =: 3 : 0"0   NB. "0 makes this verb apply to individual boxes
name =. >y               NB. remove boxing
name =. 'Mr. ' , name   NB. modify contents
<name                   NB. reinstall boxing
)
   prefix 0 {"1 db  NB. Apply to 1st column
+--------+----------+---------+
|Mr. Jack|Mr. Arnold|Mr. Byron|
+--------+----------+---------+

```
---

[Box](https://code.jsoftware.com/wiki/Vocabulary/lt "Vocabulary/lt") (<)

---

### More Information

1\. Unboxing an array will cause the opened contents to be assembled into a new array.

**Unboxing an entire array is usually a blunder. If the boxing is unnecessary the array shouldn't be boxed to begin with.**

```
   \]a =. 0 1 2 ; 3
+-----+-+
|0 1 2|3|
+-----+-+
   >a  NB. Framing-fill item (0) gets supplied
0 1 2
3 0 0

```

2\. Unboxing will fail with domain error if the [items](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Item "Vocabulary/AbsolutelyEssentialTerms") have different types

```
   \] b =. 'Fred';20000
+----+-----+
|Fred|20000|
+----+-----+

   >b
|domain error
|       >b

```

3\. Typical usage: unbox after selecting from an array

```
   \]zub=: ;:'alpha bravo charlie'
+-----+-----+-------+
|alpha|bravo|charlie|
+-----+-----+-------+

   1 { zub
+-----+
|bravo|
+-----+
   > 1 { zub
bravo

```

Or else use (\>) in a [composition](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Composition "Vocabulary/Glossary") with verbs that give compatible results for all the boxes in the array

```
   #@> db   NB. Get # of items in each box
4 1
7 1

```

4\. It's possible for a subarray of an array of incompatible [types](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Type "Vocabulary/Glossary") to open without error.

**Example:**

```
   \]db =. \_2 \]\\ 'Fred';40;'Charlie';35
+-------+--+
|Fred   |40|
+-------+--+
|Charlie|35|
+-------+--+
   >db   NB. incompatible classes
|domain error
|       >db

```

...You can't open the whole of db, because the types can't be mixed in the same list.

But you can open just one of the columns of db

```
   > 1 {"1 db   NB. All hours are numeric
40 35

```

Or apply a [composition](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Composition "Vocabulary/Glossary") with verbs that give compatible results for all the boxes in the array

(in the following case, all the results are numbers)

```
   #@> db       NB. Get # of items in each box
4 1
7 1

```

5\. The fill used to pad smaller contents can be changed with the Fit conjunction !.

```
   i."0 \] 1 2 3
0 0 0
0 1 0
0 1 2
   >!.99 <@i."0 \] 1 2 3
0 99 99
0  1 99
0  1  2
   >!.99 @: (<@i."0) 1 2 3
0 99 99
0  1 99
0  1  2

```
---

### Oddities

1\. Applying \> to the empty boxed list, i.e. (0$a:), leaves the [noun](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Noun "Vocabulary/AbsolutelyEssentialTerms") unchanged. This is inconsistent with the rule that says that when the [operand](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Operand "Vocabulary/AbsolutelyEssentialTerms") of a verb is [empty](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Empty "Vocabulary/Glossary"), the verb is applied to a [cell](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Cell "Vocabulary/Glossary") of [fills.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Fill "Vocabulary/Glossary") \>n is unique among verbs in overriding the fill rules.

```
   NB. These should give identical results, but don't ...
   $ > 0$a:
0
   $ >"> 0$a:
0 0

```
---

### Use These Combinations

Combinations using \>y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b><a title="Vocabulary/Glossary" href="/wiki/Vocabulary/Glossary#Precision">Precisions</a>;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Join contents of boxed items along first <a title="Vocabulary/Glossary" href="/wiki/Vocabulary/Glossary#Axis">axis</a></td><td></td><td><tt>,&amp;.&gt;/ y</tt></td><td></td><td><b>Bug warning:</b> <a title="Vocabulary/Glossary" href="/wiki/Vocabulary/Glossary#AtomicRep">Atomic</a> replication is inaccurate. OK if contents of same rank. Better to use <tt>&lt;@; y</tt></td></tr><tr><td>Join contents of boxed items along last axis</td><td></td><td><tt>,.&amp;.&gt;/ y</tt></td><td></td><td></td></tr></tbody></table>

---

<table class="wikitable"><tbody><tr><td><tt>x &gt; y</tt></td><td>Larger Than</td></tr></tbody></table>

[Rank 0 0](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank00a "Vocabulary/RankInfo") _\-- operates on individual atoms of x and y, producing a result of the same shape --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Compares x and y atom-by-[atom.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Atom "Vocabulary/Glossary") See [Equal](https://code.jsoftware.com/wiki/Vocabulary/eq "Vocabulary/eq") (\=) for the details.

Wherever x is greater than, or equal to, y, returns 1 in that position, else 0.

```
   z=: 7 8 9
   z > 8
0 0 1

```

x and y must both be [numeric](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Numeric "Vocabulary/Glossary"), else you get a domain error

```
   'a' > 9
|domain error
|   'a'    >9

```

This differs from what happens with [Equal](https://code.jsoftware.com/wiki/Vocabulary/eq "Vocabulary/eq") (\=)

```
   'a' = 9
0

```

**Larger Than** (\>) uses [tolerant comparison](https://code.jsoftware.com/wiki/Vocabulary/Glossary#TolerComp "Vocabulary/Glossary") in the same way as [Equal](https://code.jsoftware.com/wiki/Vocabulary/eq "Vocabulary/eq") (\=).

To require exact comparison, use (\>!.0) in place of (\>) to temporarily set the comparison [tolerance](https://code.jsoftware.com/wiki/Vocabulary/Glossary#TolerantComp "Vocabulary/Glossary") to zero

```
   2.00000000000001 > 2
0
   2.00000000000001 >!.0 (2)
1

```
---

### Common uses

1\. Make a conditional [phrase](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Phrase "Vocabulary/Glossary") in a [verb](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Verb "Vocabulary/AbsolutelyEssentialTerms") definition (explicit definition)

```
if. x>y do.  'x y'=. y;x  end.

```

2\. Make a mask of the same [shape](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Shape "Vocabulary/AbsolutelyEssentialTerms") as array, to process array in some chosen way

```
   array=: 3 1 4 1 5 9 2 6
   mask=: array > 5

   array ,: mask
3 1 4 1 5 9 2 6
0 0 0 0 0 1 0 1

   mask # array       NB. keep only the atoms that are > 5
9 6

```

**NOTE:** The [Boolean](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boolean "Vocabulary/Glossary") [atoms](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Atom "Vocabulary/AbsolutelyEssentialTerms") of mask are not only truth values but also valid numbers, 0 or 1. Therefore you can use mask directly to process array like this:

```
   array + 3 \* array > 5
3 1 4 1 5 12 2 9

```
---

[Less Than](https://code.jsoftware.com/wiki/Vocabulary/lt#dyadic "Vocabulary/lt") (x < y), [Equal](https://code.jsoftware.com/wiki/Vocabulary/eq#dyadic "Vocabulary/eq") (x = y), [Not-Equal](https://code.jsoftware.com/wiki/Vocabulary/tildeco#dyadic "Vocabulary/tildeco") (x ~: y), [Larger Or Equal](https://code.jsoftware.com/wiki/Vocabulary/gtco#dyadic "Vocabulary/gtco") (x >: y), [Less Or Equal](https://code.jsoftware.com/wiki/Vocabulary/ltco#dyadic "Vocabulary/ltco") (x <: y)

---

### More Information

1\. If an [argument](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Argument "Vocabulary/AbsolutelyEssentialTerms") to x < y is [complex](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Complex "Vocabulary/Glossary"), its imaginary part must be tolerantly equal to 0, using the default [tolerance](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Tolerance "Vocabulary/Glossary") of 2^\_44 even if the comparison x < y itself uses a different tolerance.

---

### Performance Note

Comparisons are fastest when the precisions are identical. If an atom is compared against an array, it helps to choose the right precision for the atom.

```
   0. > %: i. 10  NB. float list: faster than 0 >
   00 > i. 10  NB.  integer list: faster than 0 >

```
---

### Use These Combinations

Combinations using x > y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include those shown in [Searching and Matching Items: Fast List Operations (FLOs)](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations#FLOs "Vocabulary/SpecialCombinations"), as well as the following:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Boolean reductions along diagonals</td><td>Boolean</td><td><tt>+.//. y</tt></td><td><tt>*. = ~: &lt; &lt;: &gt; &gt;:</tt> <small>in place of</small> <tt>+.</tt></td><td>avoids building argument cells</td></tr></tbody></table>

---
