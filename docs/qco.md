# Vocabulary/qco - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/rdot "Vocabulary/rdot") [<<](https://code.jsoftware.com/wiki/Vocabulary/pco "Vocabulary/pco")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/dqco.htm "jdic:dqco")

<table class="wikitable"><tbody><tr><td><tt>q: y</tt></td><td>Prime Factors</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank "Vocabulary/RankInfo") _\-- operates on x and y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

The prime factorization of [integer](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Integer "Vocabulary/Glossary") y, listed in ascending order.

The same as (3 p: y). See [Primes](https://code.jsoftware.com/wiki/Vocabulary/pco#dyadic "Vocabulary/pco") (p:).

```
   q: 2^31
2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
   q: 1+ 2^31
3 715827883
   q: 2+ 2^31
2 5 5 13 41 61 1321

```
---

### Common uses

Mathematical investigations.

---

[Primes](https://code.jsoftware.com/wiki/Vocabulary/pco "Vocabulary/pco") (p:)

---

[Vocabulary/Foreigns](https://code.jsoftware.com/wiki/Vocabulary/Foreigns "Vocabulary/Foreigns") (9!:32 and 33 view and set the number of factoring attempts.)

---

<table class="wikitable"><tbody><tr><td><tt>x q: y</tt></td><td>Prime Exponents</td></tr></tbody></table>

[Rank 0 0](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank00var "Vocabulary/RankInfo") _\-- operates on individual atoms of x and y, producing a result that may require fill --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Selected primes and their exponents in the factorization of y.

An exponent of 0 means that the corresponding prime is not a factor of y.

```
   p: i.10   NB. the first 10 primes
2 3 5 7 11 13 17 19 23 29
   q: 700    NB. prime factors of 700
2 2 5 5 7
   \_ q: 700   NB. 700 = (2^2) \* (3^0) \* (5^2) \* (7^1)
2 0 2 1
   \_\_ q: 700
2 5 7
2 2 1

```

The [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") of the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary"), and the [values](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary") listed, depend on x.

<table class="wikitable"><tbody><tr><td><b><tt>x</tt></b></td><td><b>Result<br></b><p><b>Rank</b></p></td><td><b>Meaning of Results</b></td><td><b>Number of Primes</b></td><td><b>Zero exponents included?</b></td></tr><tr><td>positive</td><td>1</td><td>The <b>leading</b> exponents of the prime factorization (keeping primes in ascending order)</td><td><tt>x</tt> (<tt>x=_</tt> means "up through the last nonzero exponent")</td><td>yes</td></tr><tr><td rowspan="2">negative</td><td rowspan="2">2</td><td><i>Second</i> row: The <b>trailing</b> exponents of the prime factorization (keeping primes in ascending order)</td><td rowspan="2"><tt>|x</tt> (<tt>x=__</tt> means "all nonzero exponents")</td><td rowspan="2">no</td></tr><tr><td><i>First</i> row: the corresponding primes</td></tr></tbody></table>

---

### Common uses

1\. Calculate the number of divisors of a [number](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Number "Vocabulary/Glossary")

```
   \*/ >: \_ q: 17
2
   \*/ >: \_ q: 60
12

```
---

### More Information

1\. When x is negative:

-   the [table](https://code.jsoftware.com/wiki/Vocabulary/AET#Table "Vocabulary/AET") t =. primes,:exponents is calculated, including primes with 0 exponents, ending with the largest prime with a nonzero exponent;
-   The last (|x)<.({:$t) columns of t are selected (i. e. the last |x columns, but no more columns than exist in t);
-   Columns with 0 exponents are then deleted.

Because the zero exponents are deleted at the last step, the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") of  x q: y is not the same as that of  x {. \_\_ q: y .

```
   \_3 q: 2\*3\*5\*17
17
 1

```

2\.  \_\_ q: y is equivalent to  2 p: y .

---

[Primes](https://code.jsoftware.com/wiki/Vocabulary/pco#dyadic "Vocabulary/pco") (p:)

---

[Vocabulary/Foreigns](https://code.jsoftware.com/wiki/Vocabulary/Foreigns "Vocabulary/Foreigns") (9!:32 and 33 view and set the number of factoring attempts.)

---

### Details

1\. The [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") has [integer](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Integer "Vocabulary/Glossary") or [extended-integer](https://code.jsoftware.com/wiki/Vocabulary/Glossary#ExtendedInteger "Vocabulary/Glossary") [precision](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Precision "Vocabulary/Glossary"), depending on the size of the largest prime factor.

---
