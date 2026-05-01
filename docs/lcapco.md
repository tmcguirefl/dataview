# Vocabulary/lcapco - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/mcapdot "Vocabulary/mcapdot") [<<](https://code.jsoftware.com/wiki/Vocabulary/lcapdot "Vocabulary/lcapdot")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/dlcapco.htm "jdic:dlcapco")

<table class="wikitable"><tbody><tr><td><tt>[x] u L: n y</tt></td><td>Level At</td><td>Conjunction</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank_~ "Vocabulary/RankInfo") _\-- operates on \[x and\] y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

(u L:0 y) creates a copy of y in which each [leaf](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Leaf "Vocabulary/Glossary") has been replaced by the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") of applying u to the leaf.

A [leaf](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Leaf "Vocabulary/Glossary") of y is a [noun](https://code.jsoftware.com/wiki/Vocabulary/AET#Noun "Vocabulary/AET") inside y that itself has no nested [contents.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Content "Vocabulary/Glossary")

A leaf is either [empty](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Empty "Vocabulary/Glossary") or [unboxed.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Unboxed "Vocabulary/Glossary")

```
   NB. The leaves are 'abc', 'de', 4 5, and i. 6
   \]a =. (<<'abc'),(<(<'de'),(<4 5)),(<<<i. 6)
+-----+--------+---------------+
|+---+|+--+---+|+-------------+|
||abc|||de|4 5|||+-----------+||
|+---+|+--+---+|||0 1 2 3 4 5|||
|     |        ||+-----------+||
|     |        |+-------------+|
+-----+--------+---------------+
   $L:0 a       NB. Replace each leaf by its shape
+---+-----+-----+
|+-+|+-+-+|+---+|
||3|||2|2|||+-+||
|+-+|+-+-+|||6|||
|   |     ||+-+||
|   |     |+---+|
+---+-----+-----+
   |.L:0 a v    NB. Reverse each leaf
+-----+--------+---------------+
|+---+|+--+---+|+-------------+|
||cba|||ed|5 4|||+-----------+||
|+---+|+--+---+|||5 4 3 2 1 0|||
|     |        ||+-----------+||
|     |        |+-------------+|
+-----+--------+---------------+

```

More generally...

Every [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") of a [boxed](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boxed "Vocabulary/Glossary") [noun](https://code.jsoftware.com/wiki/Vocabulary/AET#Noun "Vocabulary/AET") can contain another boxed noun, each atom of which can contain another, and so on, creating a _hierarchy of boxing_ in which each [box](https://code.jsoftware.com/wiki/Vocabulary/AET#Box "Vocabulary/AET") has a _position_ with respect to higher levels of boxing, and a [boxing level](https://code.jsoftware.com/wiki/Vocabulary/Glossary#BoxingLevel "Vocabulary/Glossary") of the contents telling how many levels of boxing hierarchy are within the box.

The boxing level of [unboxed](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Unboxed "Vocabulary/Glossary") [contents](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Content "Vocabulary/Glossary") is 0.

(u L: n) forms a new [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") which applies verb u to the contents of each box whose contents have boxing level n.

The result of u replaces the [contents](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Content "Vocabulary/Glossary") it was applied to, **but keeping the same position** in the boxing hierarchy.

This definition is accurate only when each box in y has contents with the same boxing level. See below for the [general case](#Details).

```
   \] y=: (<0 1),(<(<'ab'),(<2 3)),(<(<0),(<1),<<4 5)
+---+--------+-----------+
|0 1|+--+---+|+-+-+-----+|
|   ||ab|2 3|||0|1|+---+||
|   |+--+---+|| | ||4 5|||
|   |        || | |+---+||
|   |        |+-+-+-----+|
+---+--------+-----------+
   |.L:0 y
+---+--------+-----------+
|1 0|+--+---+|+-+-+-----+|
|   ||ba|3 2|||0|1|+---+||
|   |+--+---+|| | ||5 4|||
|   |        || | |+---+||
|   |        |+-+-+-----+|
+---+--------+-----------+
   |.L:1 y
+---+--------+-----------+
|1 0|+---+--+|+-+-+-----+|
|   ||2 3|ab|||0|1|+---+||
|   |+---+--+|| | ||4 5|||
|   |        || | |+---+||
|   |        |+-+-+-----+|
+---+--------+-----------+

```

Contrast this with [Spread](https://code.jsoftware.com/wiki/Vocabulary/scapco "Vocabulary/scapco") (S:), which returns an [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") whose [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") are the [results](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") of applying u to the various [contents.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Content "Vocabulary/Glossary")

---

### Common uses

1\. Apply [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") u to the [leaves](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Leaf "Vocabulary/Glossary") (innermost [unboxed](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Unboxed "Vocabulary/Glossary") [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET")) of a [boxed](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boxed "Vocabulary/Glossary") [noun](https://code.jsoftware.com/wiki/Vocabulary/AET#Noun "Vocabulary/AET") y

```
   \] y=: 'alpha' ; 'bravo' ;'charlie'
+-----+-----+-------+
|alpha|bravo|charlie|
+-----+-----+-------+
   toupper L:0 y
+-----+-----+-------+
|ALPHA|BRAVO|CHARLIE|
+-----+-----+-------+

```

**Tip:** Use leaf as a mnemonic for  L:0

```
   leaf
L:0
   toupper leaf y
+-----+-----+-------+
|ALPHA|BRAVO|CHARLIE|
+-----+-----+-------+

```

leaf is a

-   [Standard Library](http://www.jsoftware.com/help/user/library.htm) word(s) residing in the 'z'-locale
-   Defined in the factory script stdlib.ijs which is located in  ~system/main/stdlib.ijs-   View the definition(s) in a JQt session by entering:  open '~system/main/stdlib.ijs'
---

[Level Of](https://code.jsoftware.com/wiki/Vocabulary/lcapdot "Vocabulary/lcapdot") (L. y), [Spread](https://code.jsoftware.com/wiki/Vocabulary/scapco "Vocabulary/scapco") (u S: n)

---

### More Information

1\. The [boxing level](https://code.jsoftware.com/wiki/Vocabulary/Glossary#BoxingLevel "Vocabulary/Glossary") is specified with 3 numbers representing [monadic](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Monad "Vocabulary/Glossary") and [dyadic](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Dyad "Vocabulary/Glossary") [values](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary"), just as for [rank](https://code.jsoftware.com/wiki/Vocabulary/quote#ranktable "Vocabulary/quote").

2\. The [number](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Number "Vocabulary/Glossary") (n) may be negative, in which case the [value](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary") used for n is the given value plus the [boxing level](https://code.jsoftware.com/wiki/Vocabulary/Glossary#BoxingLevel "Vocabulary/Glossary") of the [argument](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET"), but never less than 0.

```
   \]a =: <,<2$<,'abc'  NB. A noun
+-----------+
|+---------+|
||+---+---+||
|||abc|abc|||
||+---+---+||
|+---------+|
+-----------+
   L. a                NB. Boxing level 3
3
   $L:0 a
+-------+
|+-----+|
||+-+-+||
|||3|3|||
||+-+-+||
|+-----+|
+-------+
   $L:\_3 a             NB. same as L:0
+-------+
|+-----+|
||+-+-+||
|||3|3|||
||+-+-+||
|+-----+|
+-------+
   $L:1 a
+---+
|+-+|
||2||
|+-+|
+---+
   $L:\_2 a             NB. same as L:1
+---+
|+-+|
||2||
|+-+|
+---+

```

3\. A positive value of n means "apply u on [contents](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Content "Vocabulary/Glossary") that are n levels above the leaves".

But a negative value of n **does not** mean "apply u at levels \-n down from the top". Even for negative n, the operation is based on distance from the leaves

```
   \]a =: (<<'abc')
+-----+
|+---+|
||abc||
|+---+|
+-----+
   |.L:\_2 a  NB. L:\_2 same as L:0
+-----+
|+---+|
||cba||
|+---+|
+-----+
   \]b =: (<<'abc'),(<<<0 1 2)
+-----+---------+
|+---+|+-------+|
||abc|||+-----+||
|+---+|||0 1 2|||
|     ||+-----+||
|     |+-------+|
+-----+---------+
   |.L:\_2 b  NB. Now L:\_2 same as L:1.  abc is at level 0
+-----+---------+
|+---+|+-------+|
||abc|||+-----+||
|+---+|||0 1 2|||
|     ||+-----+||
|     |+-------+|
+-----+---------+

```
---

### Details

Executing  u L: n involves examining each [box](https://code.jsoftware.com/wiki/Vocabulary/AET#Box "Vocabulary/AET") and (provided the [contents](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Content "Vocabulary/Glossary") of the box have the right [boxing level](https://code.jsoftware.com/wiki/Vocabulary/Glossary#BoxingLevel "Vocabulary/Glossary")) executing u&.> on the box. This guarantees that the boxing hierarchy stays unchanged above the level at which u is applied.

If n is greater than or equal to the [boxing level](https://code.jsoftware.com/wiki/Vocabulary/Glossary#BoxingLevel "Vocabulary/Glossary") of the [argument](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET")(s), u is applied on the entire argument(s); otherwise the boxes are opened one by one and recursively processed. This is described in detail below.

We start with the [monadic](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Monad "Vocabulary/Glossary") case; the [dyadic](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Dyad "Vocabulary/Glossary") is slightly more elaborate.

---

#### Monadic L:

1\. The _absolute level an_ is calculated. It is simple n unless n is negative, in which case it is  0 <. n + L. y (i.e. n plus the [boxing level](https://code.jsoftware.com/wiki/Vocabulary/Glossary#BoxingLevel "Vocabulary/Glossary") of y, but never less than 0). _an_ never changes during the remainder of the processing.

2\. Level y is executed, performing the function.

The recursive [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") Level is defined as follows. It takes one [argument](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET"), y.

1\. If the [boxing level](https://code.jsoftware.com/wiki/Vocabulary/Glossary#BoxingLevel "Vocabulary/Glossary") of y is less than or equal to _an_, the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") of Level y is  u y .

2\. Otherwise, recursion is performed by [opening](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Open "Vocabulary/Glossary") each [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") of y and executing Level on the [contents.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Content "Vocabulary/Glossary")

I.e. the result of Level y is  Level&.> y .

Every time a [box](https://code.jsoftware.com/wiki/Vocabulary/AET#Box "Vocabulary/AET") of y is [opened](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Open "Vocabulary/Glossary") for recursion, the [boxing level](https://code.jsoftware.com/wiki/Vocabulary/Glossary#BoxingLevel "Vocabulary/Glossary") of the [contents](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Content "Vocabulary/Glossary") drops by at least 1.

This guarantees the recursion will terminate. But an atom of y may have a boxing level less that that of the entire y. This means that [opening](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Open "Vocabulary/Glossary") a box may reduce the boxing level by more than 1

```
   \]c =: (<'abc';1 2 3),(<(<'def'),(<0 1 2;4 5))
+-----------+-----------------+
|+---+-----+|+---+-----------+|
||abc|1 2 3|||def|+-----+---+||
|+---+-----+||   ||0 1 2|4 5|||
|           ||   |+-----+---+||
|           |+---+-----------+|
+-----------+-----------------+
   |.L:1 c
+-----------+-----------------+
|+-----+---+|+---+-----------+|
||1 2 3|abc|||fed|+---+-----+||
|+-----+---+||   ||4 5|0 1 2|||
|           ||   |+---+-----+||
|           |+---+-----------+|
+-----------+-----------------+

```

The question to ponder is: _Why did applying |. at level 1 reverse def, which is obviously a [leaf](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Leaf "Vocabulary/Glossary") at level 0?_

The answer is that the larger sub-argument, of which def was a part, was this:

```
+---+-----------+
|def|+-----+---+|
|   ||0 1 2|4 5||
|   |+-----+---+|
+---+-----------+

```

This [noun](https://code.jsoftware.com/wiki/Vocabulary/AET#Noun "Vocabulary/AET") has level 2, so u cannot be applied to it. Each box is opened and processed, and the boxing level of the first atom skips from 2 to 0, at which point u is applied.

Similarly:

```
   |.L:2 c
+-----------+-----------------+
|+-----+---+|+-----------+---+|
||1 2 3|abc|||+-----+---+|def||
|+-----+---+|||0 1 2|4 5||   ||
|           ||+-----+---+|   ||
|           |+-----------+---+|
+-----------+-----------------+

```

The first box, whose contents are at level 1, is reversed because |. is applied as soon as the box is opened.

The rule to remember is that **the boxes of y are opened from the top down, and u is applied when an opened contents is within _an_ levels of the leaves.**

---

#### Dyadic L:

The processing of  x u L: n y is like  u L: n y with these added features

-   n can give different levels for x and y
-   u is executed only when **both** level requirements are met  -   the result is [boxed](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boxed "Vocabulary/Glossary") to match the deeper-boxed [argument](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET")
    
-   if the [arguments](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET") for recursion do not have the same [shape](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET"), they follow the rules for [cell replication](https://code.jsoftware.com/wiki/Vocabulary/Agreement "Vocabulary/Agreement") with verb rank 0 0

1\. The _absolute levels anx_ and _any_ are calculated, as for the [monadic case](#absolutelevel). _anx_ and _any_ never change during the remainder of the processing.

2\. x Level y is executed, performing the function.

The recursive verb Level is defined as follows. It takes two arguments, x and y.

1\. If each [argument](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET") is less than or equal to its absolute level, the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") of x Level y is  x u y .

2\. Otherwise, recursion is performed. a. If only one [argument](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET") is less than or equal to its absolute level, that argument is [boxed.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boxed "Vocabulary/Glossary")

This adds one to its boxing level, which has the effect of 'marking time' as it waits for the other operand to reach its absolute boxing level.

b. Whether or not step (a) was executed, the atoms of x and y are [matched](https://code.jsoftware.com/wiki/Vocabulary/Agreement "Vocabulary/Agreement") and Level is executed on the opened contents.

I.e. the result of  x Level y is  x Level&.> y .

```
   \]x =: <'abc';'def'
+---------+
|+---+---+|
||abc|def||
|+---+---+|
+---------+
   \]y =: 'AB';('CD';'EFG');<(<2 2$'HIJ';'K')
+--+--------+---------+
|AB|+--+---+|+-------+|
|  ||CD|EFG|||+---+-+||
|  |+--+---+|||HIJ|K|||
|  |        ||+---+-+||
|  |        |||HIJ|K|||
|  |        ||+---+-+||
|  |        |+-------+|
+--+--------+---------+
   x ,L:0 y
+-------------+--------------+-----------------------------+
|+-----+-----+|+-----+------+|+-------------+-------------+|
||abcAB|defAB|||abcCD|defEFG|||+------+----+|+------+----+||
|+-----+-----+|+-----+------+|||abcHIJ|abcK|||defHIJ|defK|||
|             |              ||+------+----+|+------+----+||
|             |              |||abcHIJ|abcK|||defHIJ|defK|||
|             |              ||+------+----+|+------+----+||
|             |              |+-------------+-------------+|
+-------------+--------------+-----------------------------+

```

This follows the rules given above.

---
