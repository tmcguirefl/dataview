# Vocabulary/number - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/numberdot "Vocabulary/numberdot") [<<](https://code.jsoftware.com/wiki/Vocabulary/semico "Vocabulary/semico")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d400.htm "jdic:d400")

<table class="wikitable"><tbody><tr><td><tt># y</tt></td><td>Tally</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank "Vocabulary/RankInfo") _\-- operates on x and y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Counts the [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") in y

```
   # 'abc'
3

```

The [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of an [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") are the [cells](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Cell "Vocabulary/Glossary") whose [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") is 1 lower than the rank of the array. Thus, the items of a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") are [atoms](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET"), and the items of a [table](https://code.jsoftware.com/wiki/Vocabulary/AET#Table "Vocabulary/AET") are lists.

An atom has one item, i.e. itself

Be aware that a list of 1 atom, e.g. (,'a'), is **not the same** as the atom on its own: 'a'

```
   # 'a'
1

   z=: < 'able' ; 99 100
   $$z   NB. z is an atom of type: boxed
0
   #z
1

```

Note that the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") of # is an atom (a [scalar](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Scalar "Vocabulary/Glossary") [value](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary")), whereas the result of using $ in place of # is a [list of](https://code.jsoftware.com/wiki/Vocabulary/AET#ListOf "Vocabulary/AET") 0 or more [items.](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET")

```
   $ (# 'abc')

   $ (# 'a')

   $ ($ 'abc')
1
   $ ($ 'a')
0

```
---

### Common uses

1\. Count the rows of a 2-dimensional [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET")

```
   i.3 4
0 1  2  3
4 5  6  7
8 9 10 11
   # i.3 4
3

```

Relies on the fact that a 2-dimensional array in J is a [list of](https://code.jsoftware.com/wiki/Vocabulary/AET#ListOf "Vocabulary/AET") [lists](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET")

2\. Count the (hyper)planes of a 3-dimensional array, or higher [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET")

```
   # i.3 4 5
3
   # i.3 4 5 6
3

```

(#) is neater than extracting the [Head](https://code.jsoftware.com/wiki/Vocabulary/curlylfdot "Vocabulary/curlylfdot") ({.) of the [Shape Of](https://code.jsoftware.com/wiki/Vocabulary/dollar "Vocabulary/dollar") ($) the given array. (#) also returns 1 for an [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET")

```
   mx=: i.3 4 5 6
   $mx
3 4 5 6
   {.$mx
3

```
---

### More Information

A video lab has been created for Tally in the JHS and jqt formats. It can be viewed in its complete form [Tally monadic verb complete video](https://www.youtube.com/watch?v=RhiIU15sO7o) or as components [Tally monadic verb Part 1](https://www.youtube.com/watch?v=s4Y5fHof6Ss) and [Tally monadic verb Part 2](https://www.youtube.com/watch?v=mzzVHQyVeB8) and [Tally monadic verb Part 3](https://www.youtube.com/watch?v=nAcuL9KWOPI)

[Shape Of](https://code.jsoftware.com/wiki/Vocabulary/dollar "Vocabulary/dollar") ($ y)

---

### Details

1\.  #y is 0 for an [empty](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Empty "Vocabulary/Glossary") [list.](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") For empty [arrays](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") of higher [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET"),  #y might not be 0. The array might have [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET"), but each item might be [empty](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Empty "Vocabulary/Glossary")

```
   # ''       NB. An empty list
   # i. 0 3   NB. An empty array
0
   # i. 2 0   NB. An empty array with items
2

```

2\. If y is extended or rational, \# y is an extended integer.

---

### Use These Combinations

Combinations using  #y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Calculate rank of a noun</td><td></td><td><tt>#@$ y</tt><br><tt>([: # $) y</tt></td><td><tt>@:</tt> in place of <tt>@</tt></td><td></td></tr><tr><td>Calculate number of atoms in a noun</td><td></td><td><tt>#@, y</tt><br><tt>*/@$ y</tt><br><tt>([: # ,) y</tt><br><tt>([: */ $) y</tt></td><td><tt>@:</tt> in place of <tt>@</tt></td><td></td></tr><tr><td>Is the noun nonempty?</td><td></td><td><tt>*@#@, y</tt></td><td></td><td></td></tr><tr><td>Does the noun have items?</td><td></td><td><tt>*@# y</tt></td><td></td><td></td></tr><tr><td>Mean on infixes</td><td>integer and floating-point</td><td><tt>x (+/%#)\ y</tt></td><td><tt>x</tt> positive<p><tt>*. = ~:</tt> <small>in place of</small> <tt>+</tt></p></td><td><b>much</b> faster than alternatives</td></tr><tr><td>Count number of equal items per partition</td><td></td><td><tt>x #/. y</tt></td><td></td><td>avoids building argument cells of <tt>y</tt></td></tr><tr><td>Count number of equal items per partition, and one copy of the item</td><td>list</td><td><tt>x (#,{.)/. y</tt></td><td>also <tt>({.,#)</tt></td><td>avoids building argument cells of <tt>y</tt></td></tr><tr><td>Find mean of each partition</td><td></td><td><tt>x (+/&nbsp;% #)/. y</tt></td><td></td><td>avoids building argument cells</td></tr><tr><td>Mean with rank</td><td></td><td><tt>(+/&nbsp;% #) y</tt></td><td></td><td>Supported as a primitive by <tt>(+/&nbsp;% #)"n</tt></td></tr><tr><td>Arrays of random numbers</td><td></td><td><tt>x&nbsp;?@$ y</tt><p><tt>x([:&nbsp;? $)y</tt></p></td><td><tt>?.</tt> <small>in place of</small> <tt>?</tt><p><tt>@:</tt> <small>in place of</small> <tt>@</tt><br><tt>#</tt> <small>in place of</small> <tt>$</tt></p></td><td>does not create <tt>x $ y</tt></td></tr><tr><td>Box the indexes of identical items</td><td></td><td><tt>(&lt;/. i.@#) y</tt><p><tt>y &lt;/. i. # y</tt></p></td><td><tt>(&lt;/. i.@#) y</tt> uses less space</td><td></td></tr><tr><td>Create list of integers from <tt>1</tt> to <tt># y</tt>, or the reverse</td><td></td><td><tt>#\ y</tt></td><td>also <tt>#\.</tt> which is the reverse</td><td>faster than <tt>&gt;:@i.@# y</tt></td></tr></tbody></table>

---

<table class="wikitable"><tbody><tr><td><tt>x # y</tt></td><td>Copy</td></tr></tbody></table>

[Rank 1 \_](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank1_r "Vocabulary/RankInfo") _\-- operates on lists of x and the entirety of y, with replication of atomic x --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Creates a new [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") in which each [integer](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Integer "Vocabulary/Glossary") in x controls how many times the corresponding [item](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of y appears

```
   1 2 3 # 'abc'
abbccc

```

If x is an [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") (a [scalar](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Scalar "Vocabulary/Glossary") [value](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary")) then it controls every [item](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of y

```
   3 # 'abc'
aaabbbccc

```
---

### Common uses

1\. Delete selected [item](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET")(s) of [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") y

Mask x has 1 for each item to be kept, and 0 for each item to be deleted.

```
   1 0 1 # 'abc'
ac

```

2\. Duplicate a given [character](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Character "Vocabulary/Glossary") in a [string](https://code.jsoftware.com/wiki/Vocabulary/Glossary#String "Vocabulary/Glossary"), e.g. Quote (')

```
   \]z=: 'it''s'
it's
   z=''''
0 0 1 0
   1+z=''''
1 1 2 1
   (1+z='''') # z
it''s

```

Note: the library verb quote\_z\_ uses (#) to duplicate all quotes inside the given string

quote is a

-   [Standard Library](http://www.jsoftware.com/help/user/library.htm) word(s) residing in the 'z'-locale
-   Defined in the factory script stdlib.ijs which is located in  ~system/main/stdlib.ijs-   View the definition(s) in a JQt session by entering:  open '~system/main/stdlib.ijs'
```
   \]z=: 'it''s'
it's
   quote z
'it''s'

```

3\. Optionally clear an [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") to [empty](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Empty "Vocabulary/Glossary")

The [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") of the array stays the same but it has no [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET")

```
   0 # 1 2 3

   1 # 1 2 3
1 2 3
   $ 0 # i. 2 3
0 3

```
---

### Details

1\. The [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") of the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") of  x # y is the same as the rank of y , except that if y is an [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET"), the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") is a [list.](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET")

```
   $ $'a'
0
   $ $ (1#'a')
1

```

2\. If an [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") of x is [complex](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Complex "Vocabulary/Glossary") (e.g.  a j. b), it calls for (a) copies of the [item](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of y followed by (b) items of [fill.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Fill "Vocabulary/Glossary")

Specify the fill atom (f) by using  #!.f in place of  #

```
   1 3j2 2 # 5 6 7
5 6 6 6 0 0 7 7
   1 3j2 2 (#!.\_) 5 6 7
5 6 6 6 \_ \_ 7 7

```

3\. If either argument is an atom it is replicated as needed to match the number of items of the other.

4\. If either argument is empty, the other argument must be either empty or an atom. In either case the result is a list of 0 items of y.

```
   $ 5 # ''   NB. items of y are atoms
0
   $ '' # 5   NB. items of y are atoms
0
   $ '' # i. 0 5   NB. items of y are lists
0 5
   $ 3 # i. 0 5   NB. items of y are lists
0 5

```
---
