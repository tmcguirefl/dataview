# Vocabulary/at - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/atdot "Vocabulary/atdot") [<<](https://code.jsoftware.com/wiki/Vocabulary/graveco "Vocabulary/graveco")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d620.htm "jdic:d620")

<table class="wikitable"><tbody><tr><td><tt>[x] u@v y</tt></td><td><tt>[x] u@n y</tt></td><td>Atop</td><td>Conjunction</td></tr></tbody></table>

[Rank](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rankv "Vocabulary/RankInfo") _\-- depends on the rank of v --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

u@v is equivalent to (u@:v)"v. That is,

```
  u@v y  <-->      {{u (v y)}}"mv y
x u@v y  <-->  x {{u (x v y)}}"(lv,rv) y

```

where mv, lv, and rv are the monadic, left, and right ranks of v, respectively. You should understand [Rank (")](https://code.jsoftware.com/wiki/Vocabulary/quote "Vocabulary/quote") and [At (@:)](https://code.jsoftware.com/wiki/Vocabulary/atco "Vocabulary/atco") before trying to understand Atop (@) .

Forms the _composition_ of verbs u and v; the resulting verb is applied **independently to each v\-cell of the argument(s)**.

This contrasts with u@:v which applies v to the entire argument(s) and then applies u on the entire [filled and assembled](https://code.jsoftware.com/wiki/Vocabulary/FramingFill "Vocabulary/FramingFill") result of v .

-   Operand u is always executed monadically on the result of **each application** of v
-   Operand v is executed either monadically or dyadically depending whether  u@v has been called monadically or dyadically.
```
   #@> 'Newton';'Einstein'
6 8

   2 3 <@, 4 5
+-------+
|2 3 4 5|
+-------+

```

See: **More Information** for a visual comparison of [At](https://code.jsoftware.com/wiki/Vocabulary/atco "Vocabulary/atco") (@:), Atop (@), [Compose](https://code.jsoftware.com/wiki/Vocabulary/ampv "Vocabulary/ampv") (&) and [Appose](https://code.jsoftware.com/wiki/Vocabulary/ampco "Vocabulary/ampco") (&:).

---

### Noun right operand (u@n)

If the right operand of @ is a noun n, the resulting verb u@n is equivalent to u@(n"\_) , where the constant verb (n"\_) ignores its argument(s) and produces the result n , which in turn becomes the argument to u.

The resulting verb ignores its argument(s) and is customarily called with an empty array argument, e.g. ''.

```
   greet=: echo@'hello'
   greet''
hello

   100 i.@4 'apple'
0 1 2 3

```

".@'name' is a good way to take the value of the noun name at the point of execution rather than the point of parsing.

---

### Common uses

Implement: _f(g(x))_ -- the _mathematical composition_ of the two functions: _f_ and _g_.

```
   mean=: +/ % #
   cat=: ,&1"1
   \]z=: i.2 3       NB. sample noun
0 1 2
3 4 5
   cat z            NB. appends 1 to each row of z
0 1 2 1
3 4 5 1

   mean@cat z       NB. mean of the ROWS of cat z
1 3.25

   mean@cat b.0     NB. rank of (mean@cat)
1 1 1

```

You can also implement: _f(g(x))_ with: [Compose](https://code.jsoftware.com/wiki/Vocabulary/ampv "Vocabulary/ampv") (&) or [Cap](https://code.jsoftware.com/wiki/Vocabulary/squarelfco "Vocabulary/squarelfco") (\[:) or [At](https://code.jsoftware.com/wiki/Vocabulary/atco "Vocabulary/atco") (@:).

But see [Rank in a hurry: an insidious rank problem](https://code.jsoftware.com/wiki/Vocabulary/EZRank#An_insidious_rank_problem "Vocabulary/EZRank") for how and when these different methods give different results.

---

### Should I use @ or @:?

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

Suppose your y is a list of numbers and you want to total of the squares of all the numbers. You want to apply +/ to all the squares, so you use @: to get

```
   +/@:\*: 3 4 5
50

```

If you used @, +/ would be applied on each result item of \*: - and because the rank of \*: is 0, you would be applying +/ on individual atoms:

```
   +/@\* 3 4 5
9 16 25

```
---

[At](https://code.jsoftware.com/wiki/Vocabulary/atco "Vocabulary/atco") (@:), [Compose](https://code.jsoftware.com/wiki/Vocabulary/ampv "Vocabulary/ampv") (&), [Appose](https://code.jsoftware.com/wiki/Vocabulary/ampco "Vocabulary/ampco") (&:), [Hook](https://code.jsoftware.com/wiki/Vocabulary/hook "Vocabulary/hook") ((u v)), [Fork](https://code.jsoftware.com/wiki/Vocabulary/fork "Vocabulary/fork") ((f g h))

---

### More Information

1\. Phrase  (u@:v)"v means "apply v followed by u on each cell of the operand(s) independently". The rank of a cell is given by the rank of the verb v . The results from the cells are collected to produce the overall result of  u@v .

An illustration of this explanation follows, extracted from the series of diagrams referenced below:

[![flow diagram of the atop conjunction](https://code.jsoftware.com/mediawiki/images/thumb/e/ec/AtopFlow.png/900px-AtopFlow.png)](https://code.jsoftware.com/wiki/File:AtopFlow.png "flow diagram of the atop conjunction")

flow diagram of the atop conjunction

**Atop** (u@v) , [At](https://code.jsoftware.com/wiki/Vocabulary/atco "Vocabulary/atco") (u@:v) , [Appose](https://code.jsoftware.com/wiki/Vocabulary/ampco "Vocabulary/ampco") (&:) , and [Compose](https://code.jsoftware.com/wiki/Vocabulary/ampv "Vocabulary/ampv") (&) are also visualized along with verb application and rank here: [a series of flow diagrams](https://code.jsoftware.com/wiki/File:CompositionConjunctions.png "File:CompositionConjunctions.png")

2\. So what's the difference between Atop (@) and [Compose](https://code.jsoftware.com/wiki/Vocabulary/ampv "Vocabulary/ampv") (&) ?

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

### Oddities

The [J Dictionary's definition](https://www.jsoftware.com/help/dictionary/d620.htm "jdic:d620") of \[x\] u@v y as equivalent to  u \[x\] v y has caused much confusion, because the statement must be read in the context of the rank of v .

The precise definition is as above.

---
