# Vocabulary/atco - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/ampm "Vocabulary/ampm") [<<](https://code.jsoftware.com/wiki/Vocabulary/atdot "Vocabulary/atdot")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d622.htm "jdic:d622")

<table class="wikitable"><tbody><tr><td><tt>[x] u@:v y</tt></td><td>At</td><td>Conjunction</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank_~ "Vocabulary/RankInfo") _\-- operates on \[x and\] y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Forms the _composition_ of two verbs u and v .

```
  u@:v y  <-->  u (v y)
x u@:v y  <-->  u (x v y)

```

The result is a tacit verb equivalent to  u \[x\] v y (where \[x\] represents an optional x\-argument)

```
   y =: i. 6        NB. a sample list (the contents don't matter)
   <: # y           NB. count the items in y and subtract 1
5
   compo =: <:@:#   NB. Make a new verb: the "composition" of (<:) and (#)
   compo y
5

```

You can safely chain verbs using (@:) with minimal need for parentheses

```
   1 2 3 +/@:\*:@:- 2 2 2   NB. sum of squared differences
2
   +/ \*: 1 2 3 - 2 2 2     NB. same thing, without using (@:)
2

```

See: **More Information** for a visual comparison of At (@:), [Atop](https://code.jsoftware.com/wiki/Vocabulary/at "Vocabulary/at") (@), [Compose](https://code.jsoftware.com/wiki/Vocabulary/ampv "Vocabulary/ampv") (&) and [Appose](https://code.jsoftware.com/wiki/Vocabulary/ampco "Vocabulary/ampco") (&:).

---

### Common uses

1\. Implement: _f(g(x))_ -- the _mathematical composition_ of the two functions: _f_ and _g_.

```
   mean=: +/ % #
   cat=: ,&1"1
   \]z=: i.2 3       NB. sample noun
0 1 2
3 4 5
   cat z            NB. appends 1 to each row of z
0 1 2 1
3 4 5 1

   mean@:cat z      NB. mean of the COLUMNS of cat z
1.5 2.5 3.5 1

   mean@:cat b.0    NB. rank of (mean@:cat)
\_ \_ \_

```

But see [Rank in a hurry: an insidious rank problem](https://code.jsoftware.com/wiki/Vocabulary/EZRank#An_insidious_rank_problem "Vocabulary/EZRank") for how and when these different methods give different results.

---

### Should I use @ or @:?

Suppose your y is a list of numbers and you want the total of the squares of all the numbers. You want to apply +/ to all the squares, so you use @: to get

```
   +/@:\*: 3 4 5
50

```

If you used @, +/ would be applied on each result item of \*: - and because the rank of \*: is 0, you would be applying +/ on individual atoms:

```
   +/@\* 3 4 5
9 16 25

```

Suppose your y is a list of boxes and you want to create a list of the number of items in the contents of each box. You want to apply # individually on the contents of each box, so you use @ to get

```
   #@> 4 5 6 7;1 2;3
4 2 1

```

If you used @:, the interpreter would open all the boxes and join them together, then applying # just once on the assembled result:

```
   #@:> 4 5 6 7;1 2;3
3

```
---

[Atop](https://code.jsoftware.com/wiki/Vocabulary/at "Vocabulary/at") (@), [Compose](https://code.jsoftware.com/wiki/Vocabulary/ampv "Vocabulary/ampv") (&), [Appose](https://code.jsoftware.com/wiki/Vocabulary/ampco "Vocabulary/ampco") (&:), [Hook](https://code.jsoftware.com/wiki/Vocabulary/hook "Vocabulary/hook") ((u v)), [Fork](https://code.jsoftware.com/wiki/Vocabulary/fork "Vocabulary/fork") ((f g h))

---

### More Information

1\. Unlike [Atop](https://code.jsoftware.com/wiki/Vocabulary/at "Vocabulary/at") (@), the _rank_ of (u@:v) is infinite, irrespective of the ranks of v. This means that u will be executed on the entire result of v, after individual results of v have been [collected and filled](https://code.jsoftware.com/wiki/Vocabulary/FramingFill#Collection "Vocabulary/FramingFill").

An illustration of this explanation follows, extracted from the series of diagrams referenced below:

[![flow diagram of the at conjunction](https://code.jsoftware.com/mediawiki/images/thumb/4/44/AtFlow.png/900px-AtFlow.png)](https://code.jsoftware.com/wiki/File:AtFlow.png "flow diagram of the at conjunction")

flow diagram of the at conjunction

**At** (u@:v) , [Atop](https://code.jsoftware.com/wiki/Vocabulary/at "Vocabulary/at") (u@v) , [Appose](https://code.jsoftware.com/wiki/Vocabulary/ampco "Vocabulary/ampco") (&:) , and [Compose](https://code.jsoftware.com/wiki/Vocabulary/ampv "Vocabulary/ampv") (&) are also visualized along with verb application and rank here: [a series of flow diagrams](https://code.jsoftware.com/wiki/File:CompositionConjunctions.png "File:CompositionConjunctions.png")

2\. u@:v is called for when the rank of v is less than the ranks of an argument, but you want to apply u to the **entire result** of v.

Thus, in the "sum of squared-differences" example in the introduction, we needed (@:) not (@)

```
   1 2 3 +/@:\*:@:- 2 2 2
2
   1 2 3 +/@\*:@-   2 2 2   NB. different result using (@) in place of (@:)
1 0 1

```

Because x - y has rank 0, the entire verb  +/@\*:@- was applied to each atom of x and y individually, making +/ useless because it is now applied to each number independently.

2\. So what's the difference between [Atop](https://code.jsoftware.com/wiki/Vocabulary/at "Vocabulary/at") (@) and [Compose](https://code.jsoftware.com/wiki/Vocabulary/ampv "Vocabulary/ampv") (&) ?

None at all, for the _monads_ (u@v) and (u&v)

```
  u&v y ↔ u v y
  u@v y ↔ u v y

```

But the _dyads_ are different:

```
  x u&v y ↔ (v x) u (v y)
  x u@v y ↔ u x v y

```

According to the [J Dictionary](https://www.jsoftware.com/help/dictionary/d632.htm "jdic:d632") -- &: _is equivalent to_ & _except that the ranks of the resulting function are infinite; the relation is similar to that between_ @: _and_ @

---
