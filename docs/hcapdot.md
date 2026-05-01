# Vocabulary/hcapdot - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/idot "Vocabulary/idot") [<<](https://code.jsoftware.com/wiki/Vocabulary/fdot "Vocabulary/fdot")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/dhcapdot.htm "jdic:dhcapdot")

<table class="wikitable"><tbody><tr><td><tt>(m H. n) y</tt></td><td><tt>x (m H. n) y</tt></td><td>Hypergeometric</td><td>Conjunction</td></tr></tbody></table>

[Rank 0 0 0](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank000 "Vocabulary/RankInfo") _\-- operates on individual atoms of \[x and\] y, producing a result of the same shape --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

x (m H. n) y sums x terms of a _[generalized hypergeometric series](https://en.wikipedia.org/wiki/Generalized_hypergeometric_function#Notation "wikipedia:Generalized hypergeometric function")_.

-   [Operands](https://code.jsoftware.com/wiki/Vocabulary/AET#Operand "Vocabulary/AET") m and n describe the series
-   [Argument](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET") y gives the argument values(s) (may be real or complex).

Omitting x gives the limiting case as x tends to infinity.

```
   erf =: {{((2p\_0.5\*y) % ^\*:y) \* 1 H. 1.5 \*:y}}   NB. Error function
   erf 1
0.842701

   bessel1 =: {{    NB. Bessel function of the first kind Jx(y)
(((-:y)^x) % !x) \* '' H. (x+1) \_0.25 \* \*:y
}}
   1 bessel1 3
0.339059

```
---

### Common Uses

Many common mathematical functions can be computed as _instantiations_ of the generalized hypergeometric series by a choice of the [operands](https://code.jsoftware.com/wiki/Vocabulary/AET#Operand "Vocabulary/AET") m and n ([atoms](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") or [lists](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET")).

These are classified into families, designated _<sub>m</sub>F<sub>n</sub>_ according to the numbers of values in m and n. Each family has many members depending on the actual values of m and n.

The error function above is a member of _<sub>1</sub>F<sub>1</sub>_ (the _confluent hypergeometric functions of the first kind_) and the Bessel function a member of _<sub>0</sub>F<sub>1</sub>_ (the _confluent hypergeometric limit functions_).

The most important functions for physics are those of _<sub>2</sub>F<sub>1</sub>_, which are called the _hypergeometric functions_.

Chapter 15 of [Abramowitz & Stegun](http://people.math.sfu.ca/~cbm/aands) represent any given instance of the hypergeometric functions by _F(a,b;c;z)_, where _a_, _b_ and _c_ are constants and _z_ is a point in the object domain, the complex plane:

[![](https://code.jsoftware.com/mediawiki/images/3/39/Hyp.jpg)](https://code.jsoftware.com/wiki/File:Hyp.jpg)

The notation _(a)<sub>n</sub>_ is the _rising Pochhammer symbol_, implemented in J as the [stope function](https://code.jsoftware.com/wiki/Vocabulary/hat#stope "Vocabulary/hat")  (a ^!.1 n)

To convert this _F_\-notation to J syntax:  (m H. n) y

```
   m=: a,b
   n=: c
   y=: z

```

A convenient [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") for this purpose is

```
   F=: {{   NB. Convert F(a;b;c;z) into monadic H. call
'a b c'=. 3{.y
z=. > 3}.y
M=. a,b
N=. c
M H. N z
}}

```
---

### Examples

Abramowitz & Stegun, Chapter 15

[![](https://code.jsoftware.com/mediawiki/images/0/0b/Asx.jpg)](https://code.jsoftware.com/wiki/File:Asx.jpg)

Ancillary [verbs](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") for sample functions

```
ln=: ^.
arcsin=: \_1&o.
arctan=: \_3&o.

```

Sample points in the object domain (the disk of convergence 1>|z)

```
   \] z=: }. 5%~ i.5
0.2 0.4 0.6 0.8

```

Identities 15.1.3 to 15.1.6 with their equivalent functions

```
   F(1; 1; 2; z)                 NB. 15.1.3
1.11572 1.27706 1.52715 2.0118
   -(ln 1-z) % z
1.11572 1.27706 1.52715 2.0118

   F(1r2; 1; 3r2; z^2)           NB. 15.1.4
1.01366 1.05912 1.15525 1.37327
   -:(ln (1+z)%(1-z)) % z
1.01366 1.05912 1.15525 1.37327

   F(1r2; 1; 3r2; -z^2)          NB. 15.1.5
0.986978 0.951266 0.900699 0.843426
   (arctan z) % z
0.986978 0.951266 0.900699 0.843426

   F(1r2; 1r2; 3r2; z^2)         NB. 15.1.6
1.00679 1.02879 1.0725 1.15912
   (arcsin z) % z
1.00679 1.02879 1.0725 1.15912

```
---
