# Vocabulary/percentco - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/hat "Vocabulary/hat") [<<](https://code.jsoftware.com/wiki/Vocabulary/percentdot "Vocabulary/percentdot")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d132.htm "jdic:d132")

<table class="wikitable"><tbody><tr><td><tt>%: y</tt></td><td>Square Root</td></tr></tbody></table>

[Rank 0](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank0a "Vocabulary/RankInfo") _\-- operates on individual atoms of y, producing a result of the same shape --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

The _square root_ of y .

```
   %: 49
7

```
---

### Common Uses

Can lead to neater tacit expressions than using (y^0.5).

---

### More Information

[Square Root video](https://www.youtube.com/watch?v=xWfvY7FxRAM)

[Double](https://code.jsoftware.com/wiki/Vocabulary/plusco "Vocabulary/plusco") (+: y), [Square](https://code.jsoftware.com/wiki/Vocabulary/starco "Vocabulary/starco") (\*: y), [Halve](https://code.jsoftware.com/wiki/Vocabulary/minusco "Vocabulary/minusco") (\-: y)

---

<table class="wikitable"><tbody><tr><td><tt>x&nbsp;%: y</tt></td><td>Root</td></tr></tbody></table>

[Rank 0 0](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank00a "Vocabulary/RankInfo") _\-- operates on individual atoms of x and y, producing a result of the same shape --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

The x_\-th root_ of y .

```
   2 %: 49     NB. square-root
7
   3 %: 49     NB. cube-root
3.65931

```
---

### Common Uses

Can lead to neater tacit expressions than using (y^%x).

---

### Details

1\. %: y and x %: y return the _principal value_ of the root, which is defined as  ^ (^. y) % x

The [logarithm](https://code.jsoftware.com/wiki/Vocabulary/hatdot "Vocabulary/hatdot") (^.) is in turn defined to use the angle in the range: (-π, π\]

A consequence of this definition is that all roots of negative numbers are [complex](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Complex "Vocabulary/Glossary"), even cube roots:

```
   3 %: \_1
0.5j0.866025

```

  
2\. Taking an integer root of an extended integer by an integer (extended or not) produces an extended integer if the quotient is an integer, or floating-point otherwise.

---
