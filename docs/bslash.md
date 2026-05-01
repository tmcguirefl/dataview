# Vocabulary/bslash - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/bslashdot "Vocabulary/bslashdot") [<<](https://code.jsoftware.com/wiki/Vocabulary/slashco "Vocabulary/slashco")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d431.htm "jdic:d431")

<table class="wikitable"><tbody><tr><td><tt>u\ y</tt></td><td>Prefix</td><td>Adverb</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank_iy "Vocabulary/RankInfo") _\-- operates on x and y as a whole, by items of y --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

(u\\y) applies [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") u to successive _[prefixes](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Prefix "Vocabulary/Glossary")_ of [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") y of increasing length (1, 2, 3, ...)

```
   \]\\ 'banana'
b
ba
ban
bana
banan
banana

```

The main use is the form u/\\

```
   +/\\ 1 2 3 4 5 6  NB. compute running total
1 3 6 10 15 21

```

If you want to use u/\\ y with a u that is not a [primitive](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Primitive "Vocabulary/Glossary"), consider using [Suffix](https://code.jsoftware.com/wiki/Vocabulary/bslashdot "Vocabulary/bslashdot") (\\.) instead.

---

### Common Uses

u\\ y is magic when u is of the form u/. Look what happens then:

```
   u =: dyad define    NB. This verb shows what the operands of u are
x , ' u ' , y
)
   u/\\ 'abcdef'
a
a u b
a u b u c
a u b u c u d
a u b u c u d u e
a u b u c u d u e u f

```

u gets applied between larger and larger [prefixes](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Prefix "Vocabulary/Glossary") of y. The effect is of a loop, when on each iteration one more [item](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of y in operated on.

Let's look at a concrete example. Suppose u is +

```
   plus =: dyad define
x , ' + ' , y
)
   plus/\\ 'abcdef'
a
a + b
a + b + c
a + b + c + d
a + b + c + d + e
a + b + c + d + e + f

```

Get the idea? The [operand](https://code.jsoftware.com/wiki/Vocabulary/AET#Operand "Vocabulary/AET") u is applied between longer and longer [prefixes](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Prefix "Vocabulary/Glossary") of y. It's a _loop that reports the [results](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") of each iteration_.

1\. To make a _running sum_ of the [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of y

```
   +/\\ 1 2 3 4 5
1 3 6 10 15

```

2\. To create the _running maximum_, i.e. the maximum [value](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary") encountered so far at each point in a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET")

```
   >./\\ 3 1 4 1 5 9 2 6
3 3 4 4 5 9 9 9

```

3\. To count the _parity_ at each point in a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET"), i.e. whether the [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") up to and including each item contain an odd number of 1s

```
   ~:/\\ 1 0 0 1 1 0 1 0 1 1 1 0 0 0
1 1 1 0 1 1 0 0 1 0 1 1 1 1

```

4\. When y has exactly 2 [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET"), u/\\y is a good way to replace the second item with a function of y while leaving the first item unchanged.

**Example:** suppose the [atoms](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") of y represent the starting [index](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Index "Vocabulary/Glossary") of a substring and the ending index plus one. You can then convert easily to (start,length) form

```
   \]startend =: ; ('<td';'</td') I.@:E. each <'This is HTML.<td>It is table cells.</td>Extract one.'
13 35
   \]startlen =: -~/\\ startend
13 22

```
---

### More Information

1\. Normally you will not use u/\\ with [non-primitive](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Primitive "Vocabulary/Glossary") u unless you know that y is short. The reason can be seen by examining the order of evaluation of the successive [prefixes](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Prefix "Vocabulary/Glossary")

```
   u =: dyad define   NB. This verb shows the arguments of u
'(' , x , ' u ' , y , ')'
)
   u/\\ 'abcdef'
a
(a u b)
(a u (b u c))
(a u (b u (c u d)))
(a u (b u (c u (d u e))))
(a u (b u (c u (d u (e u f)))))

```

The ugly fact disclosed here is that each row **does not** use the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") of the previous row. The computation is not incremental at all: each row has to be computed separately, with the computation taking longer and longer as the [prefix](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Prefix "Vocabulary/Glossary") gets longer.

If J knew that u is _associative_, it could reorder the computation to be incremental. J knows it for [primitives](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Primitive "Vocabulary/Glossary"), hence those are fast. But, for more general u , J must assume the worst case.

To avoid this problem you should use [Suffix](https://code.jsoftware.com/wiki/Vocabulary/bslashdot "Vocabulary/bslashdot") (u\\. y).

2\. The first [item](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of y is not changed by  u/\\ y . (It could be changed by general u\\ y) .

---

### Details

1\. u can be a [cyclic gerund](https://code.jsoftware.com/wiki/Vocabulary/CyclicGerund "Vocabulary/CyclicGerund").

2\. The [argument](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET") to each invocation of u is a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") of [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of y (this has the same [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") as y unless y is an [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET")).

3\. If y has no [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET"), the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") of u\\ y will also have no items.

However, u will be executed once on a 0-item [cell](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Cell "Vocabulary/Glossary") to establish the [shape](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET") of a [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") of u, and then the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") of u\\ y will be a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") of 0 of that [shape](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET")

```
   $ \]\\ ''    NB. u is executed on cell of shape 0
0 0
   $ {.\\ ''   NB. u produces an atomic result
0
   $ {.\\ i. 0 3  NB. u is executed on cell of shape 0 3, returns shape 3
0 3
   $ \]\\ i. 0 3   NB. u is executed on cell of shape 0 3, returns shape 0 3
0 0 3

```
---

### Use These Combinations

Combinations using u\\ y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Concatenated running totals on intervals (running total, but total is reset at start of each interval)</td><td></td><td><tt>;@:(&lt;@(f/\);.n) y</tt><p><tt>x&nbsp;;@:(&lt;@(f/\);.n) y</tt><br><small>(<tt>f</tt> is any verb)</small></p></td><td><tt>n e. _2 _1 1 2</tt>; also <tt>[:&nbsp;; (f...</tt> also <tt>&lt;@:(f/\)</tt>; also <tt>&lt;@:</tt></td><td></td></tr><tr><td>Bitwise reduction and scan</td><td>integer</td><td><tt>x (m b.)/ y</tt><p><tt>m</tt> is 16 to 31</p></td><td><tt>/\</tt> <tt>/\.</tt> <small>in place of</small> <tt>/</tt></td><td>much faster than alternatives</td></tr><tr><td>Create list of integers from <tt>1</tt> to <tt># y</tt>, or the reverse</td><td></td><td><tt>#\ y</tt></td><td>also <tt>#\.</tt> which is the reverse</td><td>faster than <tt>&gt;:@i.@# y</tt></td></tr></tbody></table>

---

<table class="wikitable"><tbody><tr><td><tt>x u\ y</tt></td><td>Infix</td><td>Adverb</td></tr></tbody></table>

[Rank 0 \_](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank0 "Vocabulary/RankInfo") _\-- operates on atoms of x, and the entirety of y --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

(x u\\y) applies [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") u to successive parts of [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") y (called _[infixes](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Infix "Vocabulary/Glossary")_).

1\. If x is positive, u is applied to every infix of x [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of y (the [infixes](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Infix "Vocabulary/Glossary") may overlap)

```
   3 <\\ 'abcdefg'
+---+---+---+---+---+
|abc|bcd|cde|def|efg|
+---+---+---+---+---+

```

2\. If x is negative, the first [infix](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Infix "Vocabulary/Glossary") comprises the first  |x [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET"); subsequent [infixes](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Infix "Vocabulary/Glossary") **do not** overlap but **do** include all [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of y, which means that the last infix may be short

```
   \_3 <\\ 'abcdefg'
+---+---+-+
|abc|def|g|
+---+---+-+

```
---

### Common uses

1\. Reshape a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") into a [table](https://code.jsoftware.com/wiki/Vocabulary/AET#Table "Vocabulary/AET") of width 2

More convenient than ($) -- avoids discovering the length of the list.

```
   x=: \_2         NB. width is 2, negate to get non-overlapping rows
   x \]\\ 'abcde'   NB. here it pads with spaces
ab
cd
e
   x \]\\ i.5       NB. here it pads with zeros
0 1
2 3
4 0
   x \]\\ 'Fred';10;'John';20;'Eva';30   NB. can handle boxed list
+----+--+
|Fred|10|
+----+--+
|John|20|
+----+--+
|Eva |30|
+----+--+

```

**Example:** A handy utility to reshape into rows of width x (=2 by default)

```
   listx=: 2&$: :(\] \]\\~ \[: - \[)
   listx i.5   NB. use (:) and ($:) to default x to 2
0 1
2 3
4 0
   10 listx i.30
 0  1  2  3  4  5  6  7  8  9
10 11 12 13 14 15 16 17 18 19
20 21 22 23 24 25 26 27 28 29

```

2\. Chop a list into boxes of pairs of items

(Same principle as 1. above, but replaces (\]) with (<)

```
   x=: \_2
   x <\\ 'abcde'
+--+--+-+
|ab|cd|e|
+--+--+-+

```

3\. Perform an operation on successive pairs of [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET")

```
   x=: 2               NB. NOT negated because you want overlapping pairs
   x +/\\ 3 1 4 1 5 9   NB. Sum successive pairings: (3 1), (1 4), (4 1), etc.
4 5 5 6 14

```

4\. Chop a long [string](https://code.jsoftware.com/wiki/Vocabulary/Glossary#String "Vocabulary/Glossary") into a [table](https://code.jsoftware.com/wiki/Vocabulary/AET#Table "Vocabulary/AET") that fits on the screen

```
   \]s =: 200 $ 'Lorem ipsum dolor sit amet, consectetur adipisicing elit,'
Lorem ipsum dolor sit amet, consectetur adipisicing elit,...
   \_50 \]\\ s
Lorem ipsum dolor sit amet, consectetur adipisicin
g elit,Lorem ipsum dolor sit amet, consectetur adi
pisicing elit,Lorem ipsum dolor sit amet, consecte
tur adipisicing elit,Lorem ipsum dolor sit amet, c

```
---

### Details

1\. u can be a [cyclic gerund](https://code.jsoftware.com/wiki/Vocabulary/CyclicGerund "Vocabulary/CyclicGerund").

2\. The [argument](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET") to each invocation of u is a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") of [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of y (this has the same [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") as y unless y is an [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET")).

3\. If y has no [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET"), or not enough [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") to create a single [infix](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Infix "Vocabulary/Glossary") for a positive x, the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") of  x u\\ y will also have no items. However, u will be executed once on a [cell](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Cell "Vocabulary/Glossary") of [fills](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Fill "Vocabulary/Glossary") to establish the [shape](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET") of a [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") of u, and then the result of  x u\\ y will be a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") of 0 of that [shape.](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET") The shape of the [cell](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Cell "Vocabulary/Glossary") of [fills](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Fill "Vocabulary/Glossary") depends on whether x is positive or negative.

-   If x is positive, u is designed to see cells only with x items, and the cell of fills will have that shape
-   If x is negative, u must be prepared for cells of varying size, and the cell of fills will have 0 items
```
   $ \_3 \]\\ i. 0 3   NB. Negative x, fill cell is shape 0 3
0 0 3
   $ 3 \]\\ i. 0 3   NB. Positive x, fill cell is shape 3 3
0 3 3

```

4\. If x is zero, u is executed on an [empty](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Empty "Vocabulary/Glossary") [cell](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Cell "Vocabulary/Glossary"), (1+#y) times.

---

### Use These Combinations

Combinations using x u\\ y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") are shown in [Special Combinations: Infixes](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations#infixes "Vocabulary/SpecialCombinations").

---
