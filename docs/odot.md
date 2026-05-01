# Vocabulary/odot - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/pdot "Vocabulary/pdot") [<<](https://code.jsoftware.com/wiki/Vocabulary/ncapbcapdot "Vocabulary/ncapbcapdot")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/dodot.htm "jdic:dodot")

<table class="wikitable"><tbody><tr><td><tt>o. y</tt></td><td>Pi Times</td></tr></tbody></table>

[Rank 0](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank0a "Vocabulary/RankInfo") _\-- operates on individual atoms of y, producing a result of the same shape --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Returns (π times y) given any [number](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Number "Vocabulary/Glossary") y .

```
   o. 1
3.14159
   o. 1r3    NB. π/3 (slightly above 1 rad)
1.0472
   o. i.5
0 3.14159 6.28319 9.42478 12.5664

```
---

### Common uses

1\. Represent, in J, common physics expressions involving π

```
   sin=: 1&o.   NB. see below: dyadic (o.)
   pi=: o. : (\[ \* \[: o. \])
   r=: 10

   pi 0 1 2
0 3.14159 6.28319
   2 pi r
62.8319

```

You can also use J's 'p'-notation to accurately represent expressions involving π

```
   1p1          NB. pi
3.14159
   3p2          NB. 3 times pi-squared
29.6088
   3\* (1p1)^2   NB. (equiv)
29.6088

```

2\. Convert radians <--> degrees

```
   rfd=: 180 %~ o.   NB. radians from degrees
   dfr=: rfd^:\_1     NB. degrees from radians

   rfd 180
3.14159
   dfr 1p1
180
   dfr 0.5p1
90

```
---

### Use These Combinations

Combinations using o. y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td><i>e^ π y^</i></td><td></td><td><tt>^@o. y</tt></td><td></td><td>handles large values of <tt>y</tt></td></tr></tbody></table>

---

<table class="wikitable"><tbody><tr><td><tt>x o. y</tt></td><td>Circle Function</td></tr></tbody></table>

[Rank 0 0](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank00a "Vocabulary/RankInfo") _\-- operates on individual atoms of x and y, producing a result of the same shape --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Combines the common trigonometric and hyperbolic functions, and their inverses, without the need for _reserved words_ like _sin_, _cos_, etc.

```
   cop=:       0&o.   NB. sqrt (1-(y^2))
   sin=:       1&o.   NB. sine of y
   cos=:       2&o.   NB. cosine of y
   tan=:       3&o.   NB. tangent of y
   coh=:       4&o.   NB. sqrt (1+(y^2))
   sinh=:      5&o.   NB. hyperbolic sine of y
   cosh=:      6&o.   NB. hyperbolic cosine of y
   tanh=:      7&o.   NB. hyperbolic tangent of y
   conh=:      8&o.   NB. sqrt -(1+(y^2))
   real=:      9&o.   NB. Real part of y
   magn=:     10&o.   NB. Magnitude of y
   imag=:     11&o.   NB. Imaginary part of y
   angle=:    12&o.   NB. Angle of y

   arcsin=:   \_1&o.   NB. inverse sine
   arccos=:   \_2&o.   NB. inverse cosine
   arctan=:   \_3&o.   NB. inverse tangent
   cohn=:     \_4&o.   NB. sqrt (\_1+(y^2))
   arcsinh=:  \_5&o.   NB. inverse hyperbolic sine
   arccosh=:  \_6&o.   NB. inverse hyperbolic cosine
   arctanh=:  \_7&o.   NB. inverse hyperbolic tangent
   nconh=:    \_8&o.   NB. -sqrt -(1+(y^2))
   same=:     \_9&o.   NB. y
   conj=:    \_10&o.   NB. complex conjugate of y
   jdot=:    \_11&o.   NB. j. y
   expj=:    \_12&o.   NB. ^ j. y

```
---

### Common uses

1\. To work with trigonometric functions.

2\. 9 o. y (real) and 11 o. y (imag) are the best ways to extract the real and imaginary parts of y.

3\. To manipulate screen graphics.

4\. cop offers occasional convenience in modifying circle functions to work with complementary y

5\. atan2 =: 12 o. j. gives the angle in the correct quadrant.

likewise coh for hyperbolic functions

cop leverages the identity: assert 1 -: (\*: sin y) + (\*: cos y) for all y

```
   sin rfd 30
0.5
   cop@sin rfd 60
0.5

```

5\. Euler's Identity 0 = 1 + _e^ i π^_

```
   1 + expj 1p1
0

```
---

[Real/Imag](https://code.jsoftware.com/wiki/Vocabulary/plusdot "Vocabulary/plusdot") (+. y), [Signum (Unit Circle)](https://code.jsoftware.com/wiki/Vocabulary/star "Vocabulary/star") (\* y), [Length/Angle](https://code.jsoftware.com/wiki/Vocabulary/stardot "Vocabulary/stardot") (\*. y), [Magnitude](https://code.jsoftware.com/wiki/Vocabulary/bar "Vocabulary/bar") (| y), [Imaginary \* Complex](https://code.jsoftware.com/wiki/Vocabulary/jdot "Vocabulary/jdot") (j.), [Angle \* Polar](https://code.jsoftware.com/wiki/Vocabulary/rdot "Vocabulary/rdot") (r.)

---

### More Information

1\. The [inverse](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Inverse "Vocabulary/Glossary") of  x o. y is  (-x) o. y for \_7 ≤ x ≤ 7.

2\. As a mnemonic, the odd values of x correspond to _odd functions_ and the even values of x to _even functions_.

3\. If the argument is too large, limit error is raised because the precision of the result is compromised. If you want to get the compromised result, reduce the argument to the principal domain before applying the circle function. For example, apply (2p1&|) for the _sin_ or _cos_ function.

---
