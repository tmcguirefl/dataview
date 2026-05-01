# Vocabulary/starco - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/minus "Vocabulary/minus") [<<](https://code.jsoftware.com/wiki/Vocabulary/stardot "Vocabulary/stardot")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d112.htm "jdic:d112")

<table class="wikitable"><tbody><tr><td><tt>*: y</tt></td><td>Square</td></tr></tbody></table>

[Rank 0](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank0a "Vocabulary/RankInfo") _\-- operates on individual atoms of y, producing a result of the same shape --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Equivalent to y ^ 2, the _square_ of [numeric](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Numeric "Vocabulary/Glossary") [noun](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Noun "Vocabulary/AbsolutelyEssentialTerms") y.

```
   \*: 7
49

```
---

### Common Uses

Can lead to neater [tacit](https://code.jsoftware.com/wiki/Vocabulary/Glossary#TacitVerb "Vocabulary/Glossary") expressions

```
    pythag=: +&.\*:   NB. instead of: ((x^2) + (y^2))^0.5
    3 pythag 4
5

```
---

### More Information

[Square video](https://www.youtube.com/watch?v=5B8eOVDeWK8)

[Double](https://code.jsoftware.com/wiki/Vocabulary/plusco "Vocabulary/plusco") (+: y), [Halve](https://code.jsoftware.com/wiki/Vocabulary/minusco "Vocabulary/minusco") (\-: y), [Square Root](https://code.jsoftware.com/wiki/Vocabulary/percentco "Vocabulary/percentco") (%: y)

---

<table class="wikitable"><tbody><tr><td><tt>x *: y</tt></td><td>Not-And</td></tr></tbody></table>

[Rank 0 0](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank00a "Vocabulary/RankInfo") _\-- operates on individual atoms of x and y, producing a result of the same shape --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

The logical operation _Not-And_ between two [Boolean](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boolean "Vocabulary/Glossary") [nouns](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Noun "Vocabulary/AbsolutelyEssentialTerms") x and y, which is false (0) if x and y are both true (1).

in other words, the same as -. x \*. y

```
   0 0 1 1 \*: 0 1 0 1
1 1 1 0
   (0 1) \*:/ (0 1)      NB. Truth-table of: \*:
1 1
1 0
   (0 1) \*:table (0 1)  NB. Truth-table with borders
+--+---+
|\*:|0 1|
+--+---+
|0 |1 1|
|1 |1 0|
+--+---+

```

**Note:** \*: is restricted to Boolean [arguments](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Argument "Vocabulary/AbsolutelyEssentialTerms"):

```
   1 \*: 2
|domain error
|   1    \*:2

```
---

### More Information

[NotAnd video](https://www.youtube.com/watch?v=kfwHOuhVqDs)

[Or](https://code.jsoftware.com/wiki/Vocabulary/plusdot#dyadic "Vocabulary/plusdot") (x +. y), [Not-Or](https://code.jsoftware.com/wiki/Vocabulary/plusco#dyadic "Vocabulary/plusco") (x +: y), [LCM (And)](https://code.jsoftware.com/wiki/Vocabulary/stardot#dyadic "Vocabulary/stardot") (x \*. y), [Not](https://code.jsoftware.com/wiki/Vocabulary/minusdot "Vocabulary/minusdot") (\-. y), [Boolean Functions](https://code.jsoftware.com/wiki/Vocabulary/bdot "Vocabulary/bdot") (m b.)

---
