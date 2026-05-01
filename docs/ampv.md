# Vocabulary/ampv - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/ampdot "Vocabulary/ampdot") [<<](https://code.jsoftware.com/wiki/Vocabulary/ampm "Vocabulary/ampm")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d630n.htm "jdic:d630n")

<table class="wikitable"><tbody><tr><td><tt>[x] u&amp;v y</tt></td><td>Compose</td><td>Conjunction</td></tr></tbody></table>

[Rank](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rankv "Vocabulary/RankInfo") _\-- depends on the rank of v --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

u&v is equivalent to (u&:v)"mv , where mv is the monadic rank of v. That is,

```
  u&v y  <-->          {{u (v y)}}"mv y
x u&v y  <-->  x {{(v x) u (v y)}}"mv y

```

You should understand [Rank (")](https://code.jsoftware.com/wiki/Vocabulary/quote "Vocabulary/quote") and [Appose (&:)](https://code.jsoftware.com/wiki/Vocabulary/ampco "Vocabulary/ampco") before trying to understand Compose (&) .

Applies v to each **mv\-cell** of each argument, and then applies u to the result(s) of v **for each mv\-cell independently**.

```
   ('Ike';'James') >&#&> ('Newton';'Bond')  NB. Is first name longer than last name?
0 1

```

This contrasts with u&:v which applies v to the entire argument(s) and then applies u on the entire [filled and assembled](https://code.jsoftware.com/wiki/Vocabulary/FramingFill "Vocabulary/FramingFill") result(s) of v .

-   Operand v is executed monadically.
-   Operand u is executed either monadically or dyadically depending whether  u&v has been called monadically or dyadically.

See: **More Information** for a visual comparison of [At](https://code.jsoftware.com/wiki/Vocabulary/atco "Vocabulary/atco") (@:), [Atop](https://code.jsoftware.com/wiki/Vocabulary/at "Vocabulary/at") (@), Compose (&) and [Appose](https://code.jsoftware.com/wiki/Vocabulary/ampco "Vocabulary/ampco") (&:).

---

### Common Uses

Monadic

**The monadic use of & is deprecated. Use @ instead.** Some compounds of the form f&g are not recognized for special code in places where f@g is recognized, if only the monadic form of the compounds is eligible for special treatment.

```
   \*:&+: 3 4 5   NB. double, then square.  Applied to each atom
36 64 100
   \*: +: 3 4 5   NB. Same result if applied to entire list
36 64 100
   +/&+: 3 4 5   NB. Double, then "total".  Applied to each atom.
6 8 10
   +/ +: 3 4 5   NB. Not the same if applied to entire list!
24

```

Dyadic

```
   \]firstname =: 'Dennis';'Richard';'Ken'
+------+-------+---+
|Dennis|Richard|Ken|
+------+-------+---+
   \]lastname =: 'Ritchie';'Stallman';'Iverson'
+-------+--------+-------+
|Ritchie|Stallman|Iverson|
+-------+--------+-------+
   firstname ,&> lastname   NB. Join each first name to last, individually
DennisRitchie
RichardStallman
KenIverson
   (>firstname) , (>lastname)   NB. very different applied to entire array
Dennis
Richard
Ken
Ritchie
Stallman
Iverson
   firstname (>@\[ , >@\])"0 lastname  NB. equivalent form
DennisRitchie
RichardStallman
KenIverson

```
---

[Atop](https://code.jsoftware.com/wiki/Vocabulary/at "Vocabulary/at") (@), [At](https://code.jsoftware.com/wiki/Vocabulary/atco "Vocabulary/atco") (@:), [Appose](https://code.jsoftware.com/wiki/Vocabulary/ampco "Vocabulary/ampco") (&:), [Hook](https://code.jsoftware.com/wiki/Vocabulary/hook "Vocabulary/hook") ((u v)), [Fork](https://code.jsoftware.com/wiki/Vocabulary/fork "Vocabulary/fork") ((f g h))

---

### More Information

1\. (\[x\] u&v y) is the same as (\[x\] u&:v"mv y) (where mv is the monadic rank of v).

The second phrase uses [Appose](https://code.jsoftware.com/wiki/Vocabulary/ampco "Vocabulary/ampco") (&:) instead of **Compose** (&).

An illustration of the process follows, extracted from the series of diagrams referenced below:

[![flow diagram of the compose conjunction](https://code.jsoftware.com/mediawiki/images/thumb/f/f1/ComposeFlow.png/900px-ComposeFlow.png)](https://code.jsoftware.com/wiki/File:ComposeFlow.png "flow diagram of the compose conjunction")

flow diagram of the compose conjunction

**Compose** (u&v) , [Appose](https://code.jsoftware.com/wiki/Vocabulary/ampco "Vocabulary/ampco") (u&:v) , [Atop](https://code.jsoftware.com/wiki/Vocabulary/at "Vocabulary/at") (@) , and [At](https://code.jsoftware.com/wiki/Vocabulary/atco "Vocabulary/atco") (@:) are also visualized along with verb application and rank here: [a series of flow diagrams](https://code.jsoftware.com/wiki/File:CompositionConjunctions.png "File:CompositionConjunctions.png")

2\. So what's the difference between [Atop](https://code.jsoftware.com/wiki/Vocabulary/at "Vocabulary/at") (@) and Compose (&) ?

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

1\. The J Dictionary states that u&v y <==> u v y and x u&v y <==> (v x) u (v y), but these statements assume that u&v is applied at the rank mv as defined above.

The correct equivalences for u&v are given above.

2\. Note also that in u&f&v, f will be applied monadically. If the whole expression is called dyadically, then v is applied to each argument, f applied monadically to each result of v, and then u applied dyadically to the results. Equivalent to fork (f@v@\[ u f@v@\]).

---
