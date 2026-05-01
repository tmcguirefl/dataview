# Vocabulary/numberdot - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/numberco "Vocabulary/numberco") [<<](https://code.jsoftware.com/wiki/Vocabulary/number "Vocabulary/number")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d401.htm "jdic:d401")

<table class="wikitable"><tbody><tr><td><tt>#. y</tt></td><td>Base 2</td></tr></tbody></table>

[Rank 1](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank1a "Vocabulary/RankInfo") _\-- operates on lists of y, producing an atom for each one --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

The corresponding number of a binary numeral, given as a [Boolean](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boolean "Vocabulary/Glossary") [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET")

```
   #. 1 0 1 0 1
21
   #. 1 0 1 0
10
   #. 1 1 1 1 1
31
   #. 1 1 1
7

```

Generalizes to a Boolean [table](https://code.jsoftware.com/wiki/Vocabulary/AET#Table "Vocabulary/AET"), which gets treated as a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") of binary numerals

```
   \] z=: > 1 0 1 0 1 ; 0 1 0 1 0 ; 1 1 1 1 1 ; 0 0 1 1 1
1 0 1 0 1
0 1 0 1 0
1 1 1 1 1
0 0 1 1 1
   #. z
21 10 31 7

```
---

### Common uses

1\. Binary to decimal conversion

```
   z=: '.....X.X'   NB. sample binary form
   'X'=z
0 0 0 0 0 1 0 1
   #. 'X'=z
5

```

[Antibase 2](https://code.jsoftware.com/wiki/Vocabulary/numberco "Vocabulary/numberco") (#: y)

---

<table class="wikitable"><tbody><tr><td><tt>x #. y</tt></td><td>Base</td></tr></tbody></table>

[Rank 1 1](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank11 "Vocabulary/RankInfo") _\-- operates on lists of x and y --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Generalizes  #.y to bases other than 2 (including mixed bases)

```
     #. 1 0 1 0 1   NB. base-2 numeral --> number
21
   2 #. 1 0 1 0 1   NB. ditto, but base (=2) is explicitly specified
21
   10 #. 1 0 1 0 1  NB. base-10 numeral --> number
10101

```

If x is an [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET"), it is reshaped to the [shape](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET") of y.

Each atom of x gives the _place value_ of the corresponding position of y.

---

### Common uses

1\. Convert [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") of decimal digits to number

```
   numberOf=: 10 & #.
   numberOf 9 0 8 0 1
90801

```

2\. Convert time-interval in (hours,minutes,seconds) to seconds

```
   seconds=: 24 60 60 & #.   NB. use of mixed bases, viz. 24 and 60
   seconds 23 59 59
86399
   \*/24 60 60
86400

```

3\. Evaluate a polynomial, specified by its coefficients in y, at the value of the variable given by x. The coefficients are ordered in _descending_ powers of the variable.

x must be an atom.

**Example:** sum the exponential series to 10 terms, to approximate the value of  exp y

```
   exp=: ^
   \] a=: % !i.10   NB. The first 10 coefficients of the exponential series, in ascending-power order
1 1 0.5 0.166667 0.0416667 0.00833333 0.00138889 0.000198413 2.48016e\_5 2.75573e\_6
   1 #. |. a       NB. Use |. to put into descending-power order
2.71828
   exp 1
2.71828
   2 #. |. a
7.38871
   exp 2
7.38906

```

Can also use (p.) to evaluate the polynomial

```
   a p. 1          NB. coefficients of p. are in ascending-power order
2.71828
   a p. 2
7.38871

```
---

[Polynomial](https://code.jsoftware.com/wiki/Vocabulary/pdot#dyadic "Vocabulary/pdot") (x p. y), [Antibase](https://code.jsoftware.com/wiki/Vocabulary/numberco#dyadic "Vocabulary/numberco") (x #: y)

---

### More Information

1\. To remember which is which, note that #. (whose [inflection](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Inflection "Vocabulary/Glossary") is a single dot) produces an [atom.](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") Whereas #: (multiple dots) produces a [list.](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET")

---

### Details

1\. x is converted to a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") of weights w =. \*/\\.}.x,1; then x #. y is +/w\*y. It can be seen from this definition that the first [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") of x is immaterial

```
   24 60 60 #. 4 0 0
14400
   0 60 60 #. 4 0 0
14400

```

2\. y must be numeric, even if it is empty.

---
