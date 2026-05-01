# Vocabulary/hat - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/hatdot "Vocabulary/hatdot") [<<](https://code.jsoftware.com/wiki/Vocabulary/percentco "Vocabulary/percentco")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d200.htm "jdic:d200")

<table class="wikitable"><tbody><tr><td><tt>^ y</tt></td><td>Exponential</td></tr></tbody></table>

[Rank 0](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank0a "Vocabulary/RankInfo") _\-- operates on individual atoms of y, producing a result of the same shape --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

_e<sup>y</sup>_, the y_\-th power_ of the mathematical constant: _e_ .

The _antilogarithm_ of a natural logarithm.

```
   ^1
2.71828
   ^2
7.38906
   ^ ^. 123.45
123.45

```
---

[Logarithm](https://code.jsoftware.com/wiki/Vocabulary/hatdot "Vocabulary/hatdot") (^. y)

---

### Use These Combinations

Combinations using ^ y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td><i>e<sup>πy</sup></i></td><td></td><td><tt>^@o. y</tt></td><td></td><td>handles large values of <tt>y</tt></td></tr></tbody></table>

---

<table class="wikitable"><tbody><tr><td><tt>x ^ y</tt></td><td>Power</td></tr></tbody></table>

[Rank 0 0](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank00a "Vocabulary/RankInfo") _\-- operates on individual atoms of x and y, producing a result of the same shape --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

_x<sup>y</sup>_, the y_\-th power_ of [numeric](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Numeric "Vocabulary/Glossary") [noun:](https://code.jsoftware.com/wiki/Vocabulary/AET#Noun "Vocabulary/AET") x .

```
   2^8
256

```
---

[Logarithm](https://code.jsoftware.com/wiki/Vocabulary/hatdot#dyadic "Vocabulary/hatdot") (x ^. y)

---

### Details

1\. Some results are defined in J that are often left undefined:

-   0 ^ 0 = 1
-   \_ ^ 0 = 1
-   1 ^ \_ = 1

2\. Taking a rational power of an extended integer produces a floating-point result whenever the denominator of the power is not 1.

---

### Use These Combinations

Combinations using x ^ y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Integer powers</td><td>non-complex <tt>x</tt>, integer <tt>y</tt></td><td><tt>x ^ y</tt></td><td></td><td>Uses repeated multiplication (avoids log)</td></tr><tr><td>Powers mod(m)</td><td>integer, extended integer</td><td><tt>x m&amp;|@^ y</tt><p><tt>m&amp;|@(n&amp;^) y</tt></p></td><td></td><td>Avoids the large result of exponentiation</td></tr></tbody></table>

---

<table class="wikitable"><tbody><tr><td><tt>x ^!.p y</tt></td><td>Stope Function</td></tr></tbody></table>

[Rank 0 0](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank00a "Vocabulary/RankInfo") _\-- operates on individual atoms of x and y, producing a result of the same shape --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

x ^!.p y is x\*(x+p)\*(x+2\*p)\*... for y terms.

```
   5 ^!.1 (3)   NB. 5 \* 6 \* 7
210

```
---

### Common Uses

1\. Calculate the number of permutations of x things taken y at a time, _<sub>x</sub>P<sub>y</sub>_

```
   5 ^!.\_1 (3)   NB. 5 \* 4 \* 3
60

```

2\. Calculate the _rising Pochhammer symbol (x)<sub>y</sub>_ as used in the [hypergeometric function](https://en.wikipedia.org/wiki/Hypergeometric_function "wikipedia:Hypergeometric function")

```
   5.1 ^!.1 (3)  NB. 5.1 \* 6.1 \* 7.1
220.881

```
---

### More Information

1\. y must be nonnegative and tolerantly equal to an [integer.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Integer "Vocabulary/Glossary")

2\. x ^!.p y is the same as \*/x + p\*i. y .

---
