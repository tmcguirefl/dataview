# Vocabulary/minus - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/minusdot "Vocabulary/minusdot") [<<](https://code.jsoftware.com/wiki/Vocabulary/starco "Vocabulary/starco")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d120.htm "jdic:d120")

<table class="wikitable"><tbody><tr><td><tt>- y</tt></td><td>Negate</td></tr></tbody></table>

[Rank 0](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank0a "Vocabulary/RankInfo") _\-- operates on individual atoms of y, producing a result of the same shape --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Negates [value](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary") of number y

```
   - 0 1 2.2 3j4 4r5 \_66
0 \_1 \_2.2 \_3j\_4 \_0.8 66

```

### Common Uses

[Negate video](https://www.youtube.com/watch?v=SZ7CkiB5KKk)

Inverting the sign of a number.

```
   - !55x          NB. Negate factorial 55 (extended integer)
\_12696403353658275925965100847566516959580321051449436762275840000000000000
   - 1j1 3r4 2p1   NB. Negate complex, rational, two pi
\_1j\_1 \_0.75 \_6.28319

```

[Negative Sign](https://code.jsoftware.com/wiki/Vocabulary/under "Vocabulary/under") (\_)

---

<table class="wikitable"><tbody><tr><td><tt>x - y</tt></td><td>Minus</td></tr></tbody></table>

[Rank 0 0](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank00a "Vocabulary/RankInfo") _\-- operates on individual atoms of x and y, producing a result of the same shape --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Subtracts the [value](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary") of y from x

```
   0 1 2.2 3j4 4r5 66 - 2
\_2 \_1 0.2 1j4 \_1.2 64

```

The [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") [Minus](#dyadic) (\-) differs from the noun decorator [Negative Sign](https://code.jsoftware.com/wiki/Vocabulary/under "Vocabulary/under") (\_) e.g. as in  2 3 \_5 7

The following subtracts the two-element [vector](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Vector "Vocabulary/Glossary") 5 7 from the two-element vector 2 3 , returning a pair of negative values

```
   2 3 -5 7
\_3 \_4

```

### Common Uses

[Minus video](https://www.youtube.com/watch?v=1VzRBmstvHg)

Subtraction per the rules of arithmetic.

```
   \_9 \_1 0 1 5 10 - \_4 4 99 1 2 3
\_5 \_5 \_99 0 3 7

```

Example with [complex](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Complex "Vocabulary/Glossary") numbers: XjY - ZjW is (X-Z)j(Y-W) .

```
   5j5 1j1 1j1 \_2j3 \_4j\_5 - 1j1 1 0j1 0j2 \_10j\_10
4j4 0j1 1 \_2j1 6j5

```
---
