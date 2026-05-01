# Vocabulary/rdot - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/sco "Vocabulary/sco") [<<](https://code.jsoftware.com/wiki/Vocabulary/qco "Vocabulary/qco")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/drdot.htm "jdic:drdot")

<table class="wikitable"><tbody><tr><td><tt>r. y</tt></td><td>Angle</td></tr></tbody></table>

[Rank 0](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank0a "Vocabulary/RankInfo") _\-- operates on individual atoms of y, producing a result of the same shape --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

The angle y (in radians), expressed as a unit [vector](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Vector "Vocabulary/Glossary") in the [complex](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Complex "Vocabulary/Glossary") plane

i.e. a pair of coordinates combined into a [complex](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Complex "Vocabulary/Glossary") [number](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Number "Vocabulary/Glossary")

```
   \] a=: 0.25p1   NB. 45-degree angle in radians
0.785398

   r. a           NB. coordinates are equal
0.707107j0.707107
   plot 0, (r. a)

```
```
[![](https://code.jsoftware.com/mediawiki/images/3/3b/Plot1.jpg)](https://code.jsoftware.com/wiki/File:Plot1.jpg)

```
---

### Common uses

1\. Work with 2-D coordinate geometry.

2\. Plot a semicircle

Note that the plot package automatically treats [complex](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Complex "Vocabulary/Glossary") numbers as _(x,y)_\-coordinates.

```
   load 'plot'
   a=: 0.01p1          NB. an angle of one hundredth of a radian
   plot r. a \* i.100   NB. increase angle in 100 steps of +a

```
```
[![](https://code.jsoftware.com/mediawiki/images/5/51/Plot2.jpg)](https://code.jsoftware.com/wiki/File:Plot2.jpg)

```
---

[Real/Imag](https://code.jsoftware.com/wiki/Vocabulary/plusdot "Vocabulary/plusdot") (+. y), [Signum (Unit Circle)](https://code.jsoftware.com/wiki/Vocabulary/star "Vocabulary/star") (\* y), [Length/Angle](https://code.jsoftware.com/wiki/Vocabulary/stardot "Vocabulary/stardot") (\*. y), [Magnitude](https://code.jsoftware.com/wiki/Vocabulary/bar "Vocabulary/bar") (| y), [Imaginary \* Complex](https://code.jsoftware.com/wiki/Vocabulary/jdot "Vocabulary/jdot") (j.), [Circle Functions](https://code.jsoftware.com/wiki/Vocabulary/odot "Vocabulary/odot") (x o. y)

---

<table class="wikitable"><tbody><tr><td><tt>x r. y</tt></td><td>Polar</td></tr></tbody></table>

[Rank 0 0](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank00a "Vocabulary/RankInfo") _\-- operates on individual atoms of x and y, producing a result of the same shape --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Like [monadic](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Monad "Vocabulary/Glossary") (r.), but with a scaling factor x

```
   assert (x r. a) -: x\*(r.a)   NB. true for any 2 numbers: x, a

```
---

### Common uses

Convert polar coordinates (distance x, angle y) into Cartesian coordinates, expressed as a [complex](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Complex "Vocabulary/Glossary") [number.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Number "Vocabulary/Glossary")

---

[Real/Imag](https://code.jsoftware.com/wiki/Vocabulary/plusdot "Vocabulary/plusdot") (+. y), [Signum (Unit Circle)](https://code.jsoftware.com/wiki/Vocabulary/star "Vocabulary/star") (\* y), [Length/Angle](https://code.jsoftware.com/wiki/Vocabulary/stardot "Vocabulary/stardot") (\*. y), [Magnitude](https://code.jsoftware.com/wiki/Vocabulary/bar "Vocabulary/bar") (| y), [Imaginary \* Complex](https://code.jsoftware.com/wiki/Vocabulary/jdot "Vocabulary/jdot") (j.), [Circle Functions](https://code.jsoftware.com/wiki/Vocabulary/odot "Vocabulary/odot") (x o. y)

---
