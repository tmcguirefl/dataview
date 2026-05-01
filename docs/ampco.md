# Vocabulary/ampco - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/ampdotco "Vocabulary/ampdotco") [<<](https://code.jsoftware.com/wiki/Vocabulary/ampdot "Vocabulary/ampdot")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d632.htm "jdic:d632")

<table class="wikitable"><tbody><tr><td><tt>[x] u&amp;:v y</tt></td><td>Appose</td><td>Conjunction</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank_~ "Vocabulary/RankInfo") _\-- operates on \[x and\] y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Applies verb v to each argument, and then applies verb u dyadically between the result(s).

```
  u&:v y  <-->        u (v y)
x u&:v y  <-->  (v x) u (v y)

```

Example:

```
   u =: <                 NB. x is smaller than y
   v =: |                 NB. magnitude
   csm =: +/ @:  u &: v   NB. Count how many x's are smaller than y in magnitude
   \_1 2 0 csm 2 \_3 0
2

```
-   Verb v is executed monadically.
-   Verb u is executed either monadically or dyadically depending whether  u&:v has been called monadically or dyadically .

See: **More Information** for a visual comparison of [At](https://code.jsoftware.com/wiki/Vocabulary/atco "Vocabulary/atco") (@:), [Atop](https://code.jsoftware.com/wiki/Vocabulary/at "Vocabulary/at") (@), [Compose](https://code.jsoftware.com/wiki/Vocabulary/ampv "Vocabulary/ampv") (&) and Appose (&:).

---

### Common Uses

1.  **The monadic use of &: is deprecated. Use @: instead.** Some compounds of the form f&:g are not recognized for special code in places where f@:g is recognized, if only the monadic form of the compounds is eligible for special treatment.
2.  u&:v is called for when the rank of v is less than the ranks of an argument, but you want to apply u to the **entire result** of v.

In the csm example above, we needed (&:) not (&)

```
   \_1 2 0  +/@:<&:|  2 \_3 0   NB. "csm" example as an anonymous verb in a 1-liner
2
   \_1 2 0  +/@:<&|   2 \_3 0   NB. different result using (&) in place of (&:)
1 1 0

```

Because  | y has rank 0, the entire compound  +/@:<&| is applied to each _atom_ of x and y, making the +/ useless since it now operates on each atom individually.

---

[Atop](https://code.jsoftware.com/wiki/Vocabulary/at "Vocabulary/at") (@), [At](https://code.jsoftware.com/wiki/Vocabulary/atco "Vocabulary/atco") (@:), [Compose](https://code.jsoftware.com/wiki/Vocabulary/ampv "Vocabulary/ampv") (&), [Hook](https://code.jsoftware.com/wiki/Vocabulary/hook "Vocabulary/hook") ((u v)), [Fork](https://code.jsoftware.com/wiki/Vocabulary/fork "Vocabulary/fork") ((f g h))

---

### More Information

1\. Contrast **Appose** (u&:v) with Compose (u&v) which applies v to **individual cell(s)** and then applies u on the **individual result(s)** of v

An illustration of the process follows, extracted from the series of diagrams referenced below:

[![flow diagram of the appose conjunction](https://code.jsoftware.com/mediawiki/images/thumb/d/db/ApposeFlow.png/900px-ApposeFlow.png)](https://code.jsoftware.com/wiki/File:ApposeFlow.png "flow diagram of the appose conjunction")

flow diagram of the appose conjunction

**Appose** (u&:v) , [Compose](https://code.jsoftware.com/wiki/Vocabulary/ampv "Vocabulary/ampv") (u&v) , [At](https://code.jsoftware.com/wiki/Vocabulary/atco "Vocabulary/atco") (u@:v) , and [Atop](https://code.jsoftware.com/wiki/Vocabulary/at "Vocabulary/at") (u@v) are also visualized along with verb application and rank here: [a series of flow diagrams](https://code.jsoftware.com/wiki/File:CompositionConjunctions.png "File:CompositionConjunctions.png")

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
