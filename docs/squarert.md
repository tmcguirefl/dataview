# Vocabulary/squarert - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/squarertdot "Vocabulary/squarertdot") [<<](https://code.jsoftware.com/wiki/Vocabulary/squarelfco "Vocabulary/squarelfco")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d500.htm "jdic:d500")

<table class="wikitable"><tbody><tr><td><tt>] y</tt></td><td>Same</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank "Vocabulary/RankInfo") _\-- operates on x and y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Returns [noun](https://code.jsoftware.com/wiki/Vocabulary/AET#Noun "Vocabulary/AET") y unchanged, i.e. (\]y) is equivalent to y.

```
   z=: i.6           NB. try any noun here
   assert z -: \]z

```

**NOTE:** Same (\[ y) is equivalent to (\] y).

---

### Common uses

1\. Use in the J session to both display a [noun](https://code.jsoftware.com/wiki/Vocabulary/AET#Noun "Vocabulary/AET") and assign it to a [name](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Name "Vocabulary/Glossary") with a single [sentence](https://code.jsoftware.com/wiki/Vocabulary/AET#Sentence "Vocabulary/AET")

```
   \] z=: i:2
\_2 \_1 0 1 2

```

2\. In a train of verbs, refer to the argument of the train

```
   (2 { \]) 3 1 4 1 5 9
4

```

When \] is executed, it is replaced by the value of its argument, which is the argument of the train (2 { \])

---

[Same](https://code.jsoftware.com/wiki/Vocabulary/squarelf "Vocabulary/squarelf") (\[ y)

---

### Use These Combinations

Combinations using \] y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Extract substring/subarray</td><td>table or list</td><td><tt>x ];.0 y</tt></td><td>or <tt>[;.0</tt></td><td>avoids creating indexes</td></tr><tr><td>Translate characters from <tt>q</tt> to <tt>p</tt></td><td>byte</td><td><tt>(p {~ q i. ]) y</tt></td><td>also <tt>((q i.]) { p"_) y</tt> and <tt>(q&amp;i. { p"_) y</tt></td><td></td></tr><tr><td>Reshape infixes</td><td></td><td><tt>x ]\ y</tt></td><td><tt>[ ,</tt> <small>in place of</small> <tt>]</tt></td><td></td></tr></tbody></table>

---

<table class="wikitable"><tbody><tr><td><tt>x ] y</tt></td><td>Right</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank "Vocabulary/RankInfo") _\-- operates on x and y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Returns the ([noun](https://code.jsoftware.com/wiki/Vocabulary/AET#Noun "Vocabulary/AET")) value of y -- ignoring x

```
   x=: 3
   y=: 5
   x \] y
5
   assert y -: x \] y   NB. try with any 2 nouns as x and y

```
---

### Common uses

1\. Separate two ([numeric](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Numeric "Vocabulary/Glossary")) atoms to prevent J treating them as a single [noun](https://code.jsoftware.com/wiki/Vocabulary/AET#Noun "Vocabulary/AET") ([list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET"))

```
   i."0   3 4 5
|length error
   i."0  \] 3 4 5       NB. need to separate the 0 3 4 5
0 1 2 0 0
0 1 2 3 0
0 1 2 3 4
   ;: 'i."0   3 4 5'   NB. see, they were treated as one word
+--+-+---------+
|i.|"|0   3 4 5|
+--+-+---------+

```

2\. Use with a [conjunction](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Conjunction "Vocabulary/Glossary") or [adverb](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Adverb "Vocabulary/Glossary") where the identity verb suffices to yield the behavior required

```
   \_3 \]\\ 1 0 0   0 1 0    0 0 1
1 0 0
0 1 0
0 0 1

```

3\. In a [tacit verb](https://code.jsoftware.com/wiki/Vocabulary/Glossary#TacitVerb "Vocabulary/Glossary") ([monad](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Monad "Vocabulary/Glossary") or [dyad](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Dyad "Vocabulary/Glossary")): use  \] (and  \[) to bring in the [value](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary")(s) of [argument](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET")(s) y (and x)

```
   13 : 'x+(x-y)\*y'    NB. converts code string to a tacit verb
\[ + - \* \]

```

4\. In a dyadic [tacit verb](https://code.jsoftware.com/wiki/Vocabulary/Glossary#TacitVerb "Vocabulary/Glossary"): use u@\] to execute u on the y\-[argument](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET") of the [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET")

```
   3 (< , <) 'a'       NB. No good: the < are executed as dyads
|domain error
   3 (<@\[ , <@\]) 'a'   NB. Execute as monads on the appropriate argument
+-+-+
|3|a|
+-+-+

```
---

[Left](https://code.jsoftware.com/wiki/Vocabulary/squarelf "Vocabulary/squarelf") (x \[ y)

---

### Use These Combinations

Combinations using x \] y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Fetch from multiple index lists (each row of <tt>x</tt> is one index list into <tt>y</tt>)</td><td></td><td><tt>x (&lt;"1@[ { ]) y</tt></td><td></td><td>avoids boxing <tt>x</tt></td></tr><tr><td>Monadic power whose power depends on <tt>x</tt></td><td></td><td><tt>x f@]^:g y</tt><p><small>(<tt>f</tt> is any verb)</small></p></td><td></td><td>Applies <tt>f</tt> rather than <tt>x&amp;(f@])</tt> (very small improvement)</td></tr></tbody></table>

---
