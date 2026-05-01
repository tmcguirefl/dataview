# Vocabulary/plusco - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/star "Vocabulary/star") [<<](https://code.jsoftware.com/wiki/Vocabulary/plusdot "Vocabulary/plusdot")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d102.htm "jdic:d102")

<table class="wikitable"><tbody><tr><td><tt>+: y</tt></td><td>Double</td></tr></tbody></table>

[Rank 0](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank0a "Vocabulary/RankInfo") _\-- operates on individual atoms of y, producing a result of the same shape --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Equivalent to 2 \* y.

```
   +: 7
14

```
---

### Common uses

Can lead to neater tacit expressions

```
   13 : '2\*y'
2 \* \]
   13 : '+:y'
+:

```
---

### More Information

[Double video](https://www.youtube.com/watch?v=TieORa2wir8)

[Halve](https://code.jsoftware.com/wiki/Vocabulary/minusco "Vocabulary/minusco") (\-: y), [Square Root](https://code.jsoftware.com/wiki/Vocabulary/percentco "Vocabulary/percentco") (%: y), [Square](https://code.jsoftware.com/wiki/Vocabulary/starco "Vocabulary/starco") (\*: y)

---

<table class="wikitable"><tbody><tr><td><tt>x +: y</tt></td><td>Not-Or</td></tr></tbody></table>

[Rank 0 0](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank00a "Vocabulary/RankInfo") _\-- operates on individual atoms of x and y, producing a result of the same shape --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

The logical operation _Not-Or_ between two [Boolean](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boolean "Vocabulary/Glossary") [nouns](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Noun "Vocabulary/AbsolutelyEssentialTerms") x and y, which is 0 (false) if x or y is 1 (true).

in other words, the same as \-. x +. y

```
   0 0 1 1 +: 0 1 0 1
1 0 0 0
   (0 1) +:/ (0 1)      NB. Truth-table of: +:
1 0
0 0
   (0 1) +:table (0 1)  NB. Truth-table with borders
+--+---+
|+:|0 1|
+--+---+
|0 |1 0|
|1 |0 0|
+--+---+

```

**Note:** (+:) is restricted to Boolean arguments

```
   1 +: 2
|domain error
|   1    +:2

```
---

### More Information

[NotOr video](https://www.youtube.com/watch?v=_Xb6dF9EyQM)

[Or](https://code.jsoftware.com/wiki/Vocabulary/plusdot#dyadic "Vocabulary/plusdot") (x +. y), [LCM (And)](https://code.jsoftware.com/wiki/Vocabulary/stardot#dyadic "Vocabulary/stardot") (x \*. y), [Not-And](https://code.jsoftware.com/wiki/Vocabulary/starco#dyadic "Vocabulary/starco") (x \*: y), [Not](https://code.jsoftware.com/wiki/Vocabulary/minusdot "Vocabulary/minusdot") (\-. y), [Boolean Functions](https://code.jsoftware.com/wiki/Vocabulary/bdot "Vocabulary/bdot") (m b.)

---
