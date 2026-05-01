# Vocabulary/pco - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/qco "Vocabulary/qco") [<<](https://code.jsoftware.com/wiki/Vocabulary/pdotdot "Vocabulary/pdotdot")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/dpco.htm "jdic:dpco")

<table class="wikitable"><tbody><tr><td><tt>p: y</tt></td><td>Primes</td></tr></tbody></table>

[Rank 0](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank0a "Vocabulary/RankInfo") _\-- operates on individual atoms of y, producing a result of the same shape --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

The y\-th prime (starting with 2 as the 0\-th prime).

```
   p: i.9
2 3 5 7 11 13 17 19 23
   p: 2000
17393

```

The [inverse](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Inverse "Vocabulary/Glossary")  p:^:\_1 y tells the number of primes less than y

```
   p:^:\_1 (17 19 23 24 25)
6 7 8 9 9

```
---

### Common uses

Mathematical investigations.

---

[Prime Factors \* Prime Exponents](https://code.jsoftware.com/wiki/Vocabulary/qco "Vocabulary/qco") (q:)

---

<table class="wikitable"><tbody><tr><td><tt>x p: y</tt></td><td>Primes</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank "Vocabulary/RankInfo") _\-- operates on x and y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

A collection of prime-related functions of integer y, with x selecting the function.

<table class="wikitable"><tbody><tr><td colspan="2"><b>The Prime Functions <tt>x p: y</tt></b></td></tr><tr><td><b><tt>x</tt></b></td><td><b>Function</b></td></tr><tr><td><tt>_4</tt></td><td>The largest prime smaller than <tt>y</tt></td></tr><tr><td><tt>_1</tt></td><td>π(<i>y</i>), the number of primes less than <tt>y</tt> (same as <tt>p:^:_1</tt>)</td></tr><tr><td><tt>0</tt></td><td><tt>1</tt> if <tt>y</tt> is <b>not</b> prime</td></tr><tr><td><tt>1</tt></td><td><tt>1</tt> if <tt>y</tt> is prime</td></tr><tr><td><tt>2</tt></td><td>a 2-row table of the prime factors and exponents in the factorization of <tt>y</tt> (same as <tt>__ q: y</tt>)</td></tr><tr><td><tt>3</tt></td><td>the list of primes whose product is equal to <tt>y</tt> (same as <tt>q: y</tt>)</td></tr><tr><td><tt>4</tt></td><td>The smallest prime larger than <tt>y</tt></td></tr><tr><td><tt>5</tt></td><td>The number of integers less than or equal to <tt>y</tt> that are relatively prime to <tt>y</tt> (<i>Euler's totient function</i> φ(<i>y</i>))</td></tr></tbody></table>

```
   \]y=: p: 2001   NB. The 2001st prime
17401

   \_4 p: y        NB. Next prime down from y
17393
   4 p: 17393     NB. Next prime up from 17393
17401
   \_1 p: y        NB. Number of primes <y
2001
   1 p: y         NB. Boolean: y is prime
1
   0 p: y         NB. Boolean: y is non-prime
0

   1 p: i.25      NB. flags the primes in i.25
0 0 1 1 0 1 0 1 0 0 0 1 0 1 0 0 0 1 0 1 0 0 0 1 0
   I. (1 p: i.25) NB. Primes in (i.25)
2 3 5 7 11 13 17 19 23
                  NB. Euler's Prime-Generating Polynomial n^2 + n + 41 is
                  NB. known to generate (distinct) primes for n = 0..39
   1 p: 41 1 1 p. i. 40
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
                  NB. and has less than 100% success for n > 39
   v=. 41 1 1 p. 39 + i. 12
   (\] ,:1&p:) v
1601 1681 1763 1847 1933 2021 2111 2203 2297 2393 2491 2591
   1    0    0    1    1    0    1    1    1    1    0    1

   3 p: 2+ 2^31   NB. prime factorization of 2+(2^31)
2 5 5 13 41 61 1321
   2 p: 2+ 2^31   NB. table of prime factors of 2+(2^31) with their exponents
2 5 13 41 61 1321
1 2  1  1  1    1
   3 p: !23x      NB. same for a factorial (note the use of extended precision integer)
2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 3 3 3 3 3 3 3 3 3 5 5 5 5 7 7 7 11 11 13 17 19 23
   2 p: !23x
 2 3 5 7 11 13 17 19 23
19 9 4 3  2  1  1  1  1

   NB. Totient function φ(y) = Number of co-prime integers less than or equal to y
   NB. φ(y) = y-1 (if y is prime) and less of course if y is composite

   5 p: y         NB. y (17401) is prime
17400
   3 p: y-1       NB. y-1 (17400) is composite (non-prime)
2 2 2 3 5 5 29
   2 p: y-1       NB. showing distinct prime factors
2 3 5 29
3 1 2  1
                  NB. using Product over the distinct prime factors
   (y-1)\*(1-1r2)\*(1-1r3)\*(1-1r5)\*(1-1r29)
4480
                  NB. using Product (more elegant version from the 'Voc/Primes' section)
   \*/ (p-1)\*p^e-1 \[ 'p e'=. 2 p: y-1
4480
                  NB. using Product (Andrew Nikitin's version of above expression)
   (- ~:) &. q: y-1
4480
   5 p: y-1       NB. using Totient function shortcut
4480

```
---

### Common uses

Mathematical investigations.

---

[Prime Factors \* Prime Exponents](https://code.jsoftware.com/wiki/Vocabulary/qco "Vocabulary/qco") (q:)

---

[Vocabulary/Foreigns](https://code.jsoftware.com/wiki/Vocabulary/Foreigns "Vocabulary/Foreigns") (9!:32 and 33 view and set the number of factoring attempts.)

---

### Details

1\. Primality testing on [numbers](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Number "Vocabulary/Glossary") larger than (2^31) uses the probabilistic [Miller-Rabin algorithm](https://en.wikipedia.org/wiki/Miller-Rabin_primality_test "wikipedia:Miller-Rabin primality test").

---
