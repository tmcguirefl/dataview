# Vocabulary/bslashdot - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/squarelf "Vocabulary/squarelf") [<<](https://code.jsoftware.com/wiki/Vocabulary/bslash "Vocabulary/bslash")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d431.htm "jdic:d431")

<table class="wikitable"><tbody><tr><td><tt>u\. y</tt></td><td>Suffix</td><td>Adverb</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank_iy "Vocabulary/RankInfo") _\-- operates on x and y as a whole, by items of y --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

(u\\. y) applies [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") u to successive _[suffixes](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Suffix "Vocabulary/Glossary")_ of [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") y of decreasing length

```
   \]\\. 'banana'
banana
anana
nana
ana
na
a

```

The main use is the form u/\\.

```
   +/\\. 3 1 4 1 5 9   NB. Compute reverse running total
23 20 19 15 14 9

```
---

### Common Uses

u\\. y is magic when u is of the form u/ -- look what happens then:

```
   u =: dyad define   NB. Displays the arguments of u
x , ' u ' , y
)
   u/\\. 'abcdef'
a u b u c u d u e u f
b u c u d u e u f
c u d u e u f
d u e u f
e u f
f

```

This [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") is calculated in reverse order, so that u is applied between larger and larger [suffixes](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Suffixe "Vocabulary/Glossary") of y. The effect is of a loop, when on each iteration one more [item](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of y in operated on.

**Example:** suppose u is: +

```
   plus =: dyad define
x , ' + ' , y
)
      plus/\\. 'abcdef'
a + b + c + d + e + f
b + c + d + e + f
c + d + e + f
d + e + f
e + f
f

```

Get the idea? The [operand](https://code.jsoftware.com/wiki/Vocabulary/AET#Operand "Vocabulary/AET") u is applied between longer and longer [suffixes](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Suffixe "Vocabulary/Glossary") of y. It's a _loop that reports the [results](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") of each iteration_.

With J's right-to-left [execution](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Execution "Vocabulary/Glossary"), u/\\. y is much more efficient than u/\\ y when u is not a [primitive.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Primitive "Vocabulary/Glossary")

```
   u =: dyad define     NB. Displays the arguments of u
'(' , x , ' u ' , y , ')'
)
   u/\\. 'abcdef'
(a u (b u (c u (d u (e u f)))))
(b u (c u (d u (e u f))))
(c u (d u (e u f)))
(d u (e u f))
(e u f)
f

```

Note that each row can be calculated with a single application of u using the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") from the following row.

1\. When y has exactly 2 [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET"), u/\\.y is a good way to replace the first item with a function of y while leaving the second item unchanged.

```
   >./\\. 2 3   NB. Replace first item with max of items
3 3

```

2\. To apply a complicated [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") for each [item](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of y, retaining the [results](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") of each iteration

```
   NB. Replace missing data (represented by \_) with the following valid item.
   \]d =: 3 1 \_ 1 5 \_ \_ 2 3 5 \_ 9 7 \_   NB. Data line
3 1 \_ 1 5 \_ \_ 2 3 5 \_ 9 7 \_
   \[^:(\_ ~: \[)/\\. d                    NB. Use left argument unless it is \_; then use right
3 1 1 1 5 2 2 2 3 5 9 9 7 \_
   \[^:(\_ ~: \[)/\\.&.(,&0) d             NB. append an initial value to handle last item
3 1 1 1 5 2 2 2 3 5 9 9 7 0

```

If you wanted to replace missing data with the _previous_ [item](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET"), you could use u/\\ y, but that would be a mistake. You should continue to use u/\\. y, but reverse the order of y before and after the computation using &.|.

```
   d
3 1 \_ 1 5 \_ \_ 2 3 5 \_ 9 7 \_
   \[^:(\_ ~: \[)/\\.&.(,&0)&.|. d
3 1 1 1 5 5 5 2 3 5 5 9 7 7

```
---

### More Information

1\. The last [item](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of y is not changed by  u/\\. y . (It could be changed by more general u in  u\\. y) .

---

### Details

1\. u can be a [cyclic gerund](https://code.jsoftware.com/wiki/Vocabulary/CyclicGerund "Vocabulary/CyclicGerund").

2\. The [argument](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET") to each invocation of u is a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") of [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of y (this has the same [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") as y unless y is an [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET")).

3\. If y has no [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET"), the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") of  u\\. y will also have no items. However, u will be executed once on a 0-item [cell](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Cell "Vocabulary/Glossary") to establish the [shape](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET") of a result of u, and then the result of u\\. y will be a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") of 0 of that shape:

```
   $ \]\\. ''       NB. u is executed on cell of shape 0
0 0
   $ {.\\. ''      NB. u produces an atomic result
0
   $ {.\\. i. 0 3  NB. u is executed on cell of shape 0 3, returns shape 3
0 3
   $ \]\\. i. 0 3   NB. u is executed on cell of shape 0 3, returns shape 0 3
0 0 3

```
---

### Use These Combinations

Combinations using u\\. y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Create list of integers from <tt>1</tt> to <tt># y</tt>, or the reverse</td><td></td><td><tt>#\ y</tt></td><td>also <tt>#\.</tt> which is the reverse</td><td>faster than <tt>&gt;:@i.@# y</tt></td></tr></tbody></table>

---

<table class="wikitable"><tbody><tr><td><tt>x u\. y</tt></td><td>Outfix</td><td>Adverb</td></tr></tbody></table>

[Rank 0 \_](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank0 "Vocabulary/RankInfo") _\-- operates on atoms of x, and the entirety of y --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

(x u\\. y) applies verb u to successive _[outfixes](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Outfix "Vocabulary/Glossary")_ of y. Each outfix is y with an [infix](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Infix "Vocabulary/Glossary") removed. The infixes depend on x, as described in [Infix](https://code.jsoftware.com/wiki/Vocabulary/bslash#dyadic "Vocabulary/bslash") (\\).

---

### Common uses

1\. Enumerate the faces of a simplex

```
    \]simplex =: \_3 \]\\ 0 0 0  1 0 0  0 1 0  0 0 1  NB. A simplex
0 0 0
1 0 0
0 1 0
0 0 1
   1 \]\\. simplex     NB. The 4 faces
1 0 0
0 1 0
0 0 1

0 0 0
0 1 0
0 0 1

0 0 0
1 0 0
0 0 1

0 0 0
1 0 0
0 1 0

```

2\. Return a vector with each successive single item removed.

```
   \_1\]\\. 1 2 3 4
2 3 4
1 3 4
1 2 4
1 2 3

```
---

### Details

1\. u can be a [cyclic gerund](https://code.jsoftware.com/wiki/Vocabulary/CyclicGerund "Vocabulary/CyclicGerund").

2\. The [argument](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET") to each invocation of u is a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") of [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of y (this has the same [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") as y unless y is an [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET")).

3\. If y has no [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET"), or not enough [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") to create an [outfix](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Outfix "Vocabulary/Glossary"), the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") of x u\\. y will also have no [items.](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") However, u will be executed once on an [empty](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Empty "Vocabulary/Glossary") [cell](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Cell "Vocabulary/Glossary") to establish the [shape](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET") of a [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") of u, and then the result of x u\\. y will be a list of 0 of that shape.

4\. If x is zero, u is executed on the entire y, (1+#y) times.

---

### Use These Combinations

Combinations using x u\\. y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Bitwise reduction and scan</td><td>integer</td><td><tt>x (m b.)/ y</tt><p><tt>m</tt> is 16 to 31</p></td><td><tt>/\</tt> <tt>/\.</tt> <small>in place of</small> <tt>/</tt></td><td>much faster than alternatives</td></tr></tbody></table>

---
