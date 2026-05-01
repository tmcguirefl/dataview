# Vocabulary/pdotdot - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/pco "Vocabulary/pco") [<<](https://code.jsoftware.com/wiki/Vocabulary/pdot "Vocabulary/pdot")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/dpdotdot.htm "jdic:dpdotdot")

<table class="wikitable"><tbody><tr><td><tt>p.. y</tt></td><td>Polynomial Derivative</td></tr></tbody></table>

[Rank 1](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank1l "Vocabulary/RankInfo") _\-- operates on lists of y, producing a list for each one --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

The first derivative of a given polynomial y.

got from differentiating the individual terms of the polynomial

Polynomial y can be provided in [coefficient form](https://code.jsoftware.com/wiki/Vocabulary/pdot#coefficient "Vocabulary/pdot") ([list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") of ascending powers), [multiplier-and-roots form](https://code.jsoftware.com/wiki/Vocabulary/pdot#coefficient "Vocabulary/pdot") (m;r), or [exponent form](https://code.jsoftware.com/wiki/Vocabulary/pdot#exponent "Vocabulary/pdot") ([boxed](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boxed "Vocabulary/Glossary") [table](https://code.jsoftware.com/wiki/Vocabulary/AET#Table "Vocabulary/AET") form). The [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") is always expressed in coefficient form.

**Examples:**

<table class="wikitable"><tbody><tr><td>Series</td><td><i>1</i></td><td><i>y</i></td><td><i>y²</i></td><td><i>y³</i></td><td><i>y⁴</i></td></tr><tr><td>1st derivative</td><td></td><td><i>1</i></td><td><i>2y</i></td><td><i>3y²</i></td><td><i>4y³</i></td></tr></tbody></table>

```
   p.. 1 1 1 1 1
1 2 3 4

```

<table class="wikitable"><tbody><tr><td>Series</td><td><i>1</i></td><td><i>2y</i></td><td><i>3y²</i></td><td><i>4y³</i></td><td><i>5y⁴</i></td></tr><tr><td>1st derivative</td><td></td><td><i>2</i></td><td><i>6y</i></td><td><i>12y²</i></td><td><i>20y³</i></td></tr></tbody></table>

```
   p.. 1 2 3 4 5
2 6 12 20

```
---

### Common uses

Work with finite approximations of infinite series.

---

[Ordinary Derivative](https://code.jsoftware.com/wiki/Vocabulary/ddot "Vocabulary/ddot") (u d. n), [Polynomial](https://code.jsoftware.com/wiki/Vocabulary/pdot#dyadic "Vocabulary/pdot") (x p. y)

---

<table class="wikitable"><tbody><tr><td><tt>x p.. y</tt></td><td>Polynomial Integral</td></tr></tbody></table>

[Rank 0 1](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank01 "Vocabulary/RankInfo") _\-- operates on individual atoms of x, and lists of y --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

The integral of a given polynomial y.

got from integrating the individual terms of the series

The x\-argument is the constant of integration that will be added to the result.

Polynomial y can be provided in [coefficient form](https://code.jsoftware.com/wiki/Vocabulary/pdot#coefficient "Vocabulary/pdot") ([list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") of ascending powers), [multiplier-and-roots form](https://code.jsoftware.com/wiki/Vocabulary/pdot#coefficient "Vocabulary/pdot") (m;r), or [exponent form](https://code.jsoftware.com/wiki/Vocabulary/pdot#exponent "Vocabulary/pdot") ([boxed](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boxed "Vocabulary/Glossary") [table](https://code.jsoftware.com/wiki/Vocabulary/AET#Table "Vocabulary/AET") form). The [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") is always expressed in coefficient form.

**Examples:** (invert the examples in monadic p.. above)

<table class="wikitable"><tbody><tr><td>Series</td><td></td><td><i>1</i></td><td><i>2y</i></td><td><i>3y²</i></td><td><i>4y³</i></td></tr><tr><td>Integral</td><td><i>x</i></td><td><i>y</i></td><td><i>y²</i></td><td><i>y³</i></td><td><i>y⁴</i></td></tr></tbody></table>

```
   99 p.. 1 2 3 4
99 1 1 1 1

```

<table class="wikitable"><tbody><tr><td>Series</td><td></td><td><i>2</i></td><td><i>6y</i></td><td><i>12y²</i></td><td><i>20y³</i></td></tr><tr><td>Integral</td><td><i>x</i></td><td><i>2y</i></td><td><i>3y²</i></td><td><i>4y³</i></td><td><i>5y⁴</i></td></tr></tbody></table>

```
   1 p.. 2 6 12 20
1 2 3 4 5

```
---

### Common uses

Work with finite approximations of infinite series.

### More Information

1\. Boolean x and y are always promoted to floating-point.

---

[Ordinary Derivative](https://code.jsoftware.com/wiki/Vocabulary/ddot "Vocabulary/ddot") (u d. n), [Polynomial](https://code.jsoftware.com/wiki/Vocabulary/pdot#dyadic "Vocabulary/pdot") (x p. y)

---
