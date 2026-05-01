# Vocabulary/dotdot - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/cor "Vocabulary/cor") [<<](https://code.jsoftware.com/wiki/Vocabulary/dot "Vocabulary/dot")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d301.htm "jdic:d301")

<table class="wikitable"><tbody><tr><td><tt>u .. v</tt></td><td>Even</td><td>Conjunction</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank "Vocabulary/RankInfo") _\-- operates on x and y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

<table class="wikitable"><tbody><tr><td><tt>u .: v</tt></td><td>Odd</td><td>Conjunction</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank "Vocabulary/RankInfo") _\-- operates on x and y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

(u .. v) is the same as (u + u&v) % 2:

(u .: v) is the same as (u - u&v) % 2:

> [![](https://code.jsoftware.com/mediawiki/images/f/ff/Important.png)](https://code.jsoftware.com/wiki/File:Important.png) u .. v and u .: v are **deprecated**.
> 
>   
> Replace the functions (seldom used) by their equivalent phrases above.  
> Future releases of J may reassign the words .. and .:

---

### Common uses

1\. Make a function out of u which is symmetrical about zero on the X-[axis](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Axis "Vocabulary/Glossary"), using \- for v

**Even** (..-) gives a symmetrical function, **Odd** (.:-) gives an antisymmetrical function.

```
   u=: ^   NB. exponential growth: sample unsymmetrical function

   \] X=: 5 %~ i:5
\_1 \_0.8 \_0.6 \_0.4 \_0.2 0 0.2 0.4 0.6 0.8 1
   require 'plot'
   plot X; u X

```
```
[![](https://code.jsoftware.com/mediawiki/images/5/5a/Ux.jpg)](https://code.jsoftware.com/wiki/File:Ux.jpg)

```
```
   plot X; u ..- X

```
```
[![](https://code.jsoftware.com/mediawiki/images/c/c8/Uex.jpg)](https://code.jsoftware.com/wiki/File:Uex.jpg)

```
```
   plot X; u .:- X

```
```
[![](https://code.jsoftware.com/mediawiki/images/c/c1/Uox.jpg)](https://code.jsoftware.com/wiki/File:Uox.jpg)

```

2\. Decompose a [matrix](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Matrix "Vocabulary/Glossary") into symmetric and antisymmetric parts, or Hermitian and antiHermitian parts, using |: for v

```
   \]a =. i. 3 3
0 1 2
3 4 5
6 7 8
   \]asymm =: \] .. |: a
0 2 4
2 4 6
4 6 8
   \]aantisymm =: \] .: |: a
0 \_1 \_2
1  0 \_1
2  1  0
   asymm + aantisymm
0 1 2
3 4 5
6 7 8

```

For [complex](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Complex "Vocabulary/Glossary") matrices let v be +@:|:, to take the adjoint.

---

### Details

1.  . Any mathematical function can be uniquely decomposed as the sum of an even and an odd function.
2.  . Any [matrix](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Matrix "Vocabulary/Glossary") can be uniquely decomposed as the sum of a symmetric and an antisymmetric matrix.
3.  . Any matrix can be uniquely decomposed as the sum of a Hermitian and an antiHermitian matrix.
---
