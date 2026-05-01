# Vocabulary/tco - J Wiki

From J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/tcapdot "Vocabulary/tcapdot") [<<](https://code.jsoftware.com/wiki/Vocabulary/tdot "Vocabulary/tdot")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/dtco.htm "jdic:dtco")

<table class="wikitable"><tbody><tr><td><tt>u t: y</tt></td><td>Weighted Taylor</td><td>Adverb</td></tr></tbody></table>

[Rank 0](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank0a "Vocabulary/RankInfo") _\-- operates on individual atoms of y, producing a result of the same shape --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

> [![](https://code.jsoftware.com/mediawiki/images/c/cb/Warning.png)](https://code.jsoftware.com/wiki/File:Warning.png) **This primitive has been removed from J Version 9.01 and later**

---

The y\-th coefficient(s) in the [Taylor series](https://en.wikipedia.org/wiki/Taylor_series "wikipedia:Taylor series") that approximates the function (u), multiplied by (!y).

(u t: y) differs from (u t. y) by being _weighted_ by the _factorial term(s)_ (!y)

```
   i=: i.8
   u=: ^         NB. sample u: the exponential function

   u t: i
1 1 1 1 1 1 1 1

```
---

### Common Uses

Use t: in place of t. to simplify the appearance of the resulting series of coefficients and reveal a hidden pattern. This works because many common Taylor expansions have coefficients with factorial terms in the denominator.

```
   u t: i
1 1 1 1 1 1 1 1
   u t. i        NB. compare t. with t:
1 1 0.5 0.166667 0.0416667 0.00833333 0.00138889 0.000198413

```

See [Taylor Coefficient](https://code.jsoftware.com/wiki/Vocabulary/tdot "Vocabulary/tdot") (t.) where this same example is discussed in greater depth.

---

[Taylor Coefficient](https://code.jsoftware.com/wiki/Vocabulary/tdot "Vocabulary/tdot") (t.), [Taylor Approximation](https://code.jsoftware.com/wiki/Vocabulary/tcapdot "Vocabulary/tcapdot") (T.)

---
