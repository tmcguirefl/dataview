# Vocabulary/query - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/querydot "Vocabulary/querydot") [<<](https://code.jsoftware.com/wiki/Vocabulary/ampdotco "Vocabulary/ampdotco")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d640.htm "jdic:d640")

<table class="wikitable"><tbody><tr><td><tt>? y</tt></td><td>Roll</td></tr></tbody></table>

[Rank 0](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank0a "Vocabulary/RankInfo") _\-- operates on individual atoms of y, producing a result of the same shape --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Generates a random number uniformly distributed in a range determined by integer y.

<table class="wikitable"><tbody><tr><td><tt>y</tt></td><td><b>range of random number</b></td></tr><tr><td><tt>0</tt></td><td><a title="Vocabulary/Glossary" href="/wiki/Vocabulary/Glossary#FloatingPoint">floating-point</a> value in interval <tt>(0,1)</tt></td></tr><tr><td><tt>1</tt></td><td><tt>0</tt> (always)</td></tr><tr><td><tt>2</tt></td><td><a title="Vocabulary/Glossary" href="/wiki/Vocabulary/Glossary#Boolean">Boolean</a></td></tr><tr><td><tt>&gt;1</tt></td><td><a title="Vocabulary/Glossary" href="/wiki/Vocabulary/Glossary#Integer">integer</a> or <a title="Vocabulary/Glossary" href="/wiki/Vocabulary/Glossary#ExtendedInteger">extended integer</a> from <a title="Vocabulary/AET" href="/wiki/Vocabulary/AET#List">list</a> <tt>i.y</tt></td></tr></tbody></table>

```
   ? 0     NB. result will be 0 to 1
0.242499
   ? 0
0.80461
   ? 100   NB. result will be 0 to 99
30
   ? 100
86
   ? 10 # 100
91 93 17 97 58 51 16 75 42 40

```
---

### Common uses

1\. Make a random [boolean](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boolean "Vocabulary/Glossary") [matrix](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Matrix "Vocabulary/Glossary")

```
   ? 5 5 $ 2
1 0 1 0 0
0 1 1 0 1
0 1 0 0 1
1 0 1 1 1
0 1 1 1 0

```

2\. Toss a biased coin 10 times (1=Heads / 10% chance, 0=Tails / 90% chance)

```
   0.1 > ?20#0
1 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0

```

3\. Pick a letter at random

```
(?26) { 'abcdefghijklmnopqrstuvwxyz'
f

```
---

[Roll (Fixed seed)](https://code.jsoftware.com/wiki/Vocabulary/querydot "Vocabulary/querydot") (?. y)

---

### Details

1\. J offers a choice of random-number generator (RNG):

<table class="wikitable"><tbody><tr><td><b>Code</b></td><td><b>RNG Name</b></td><td><b>Time</b></td></tr><tr><td>1</td><td>GB_Flip</td><td>1</td></tr><tr><td>2</td><td>Mersenne Twister (default)</td><td>1</td></tr><tr><td>3</td><td>DX-1597-4d</td><td>3</td></tr><tr><td>4</td><td>MRG32k3a</td><td>8</td></tr><tr><td>0</td><td>combination of all<p>the above RNGs</p></td><td>12</td></tr></tbody></table>

The _Time_ column above specifies a relative time penalty for each RNG: higher is slower.

Select the RNG with 9!:43 n where n comes from the table above, or use 9!:42 '' to see which RNG is selected.

2\. The sequence of random numbers depends on the _state_ of the RNGs. This state, which includes the choice of RNG to use, can be read by

```
RNGstate =: 9!:44 ''

```

and restored by 9!:45 RNGstate. The state is a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") of [boxes](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boxe "Vocabulary/Glossary") whose format should not be disturbed.

3\. The state of the RNG can be _reset_ by

```
9!:1 initvalue

```

where initvalue is an [integer](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Integer "Vocabulary/Glossary") [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") (or, for the Mersenne Twister generator only, an [integer](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Integer "Vocabulary/Glossary") [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET")) that selects a starting state. Resetting to a given initvalue always returns the RNG to the same initial state. [Phrase](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Phrase "Vocabulary/Glossary") 9!:0 '' will return the most recently used initvalue.

For RNGs 3 and 4, initvalue must not be 0.

---

### Use These Combinations

Combinations using  ? y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Arrays of random numbers</td><td></td><td><tt>x&nbsp;?@$ y</tt><p><tt>x([:&nbsp;? $)y</tt></p></td><td><tt>?.</tt> <small>in place of</small> <tt>?</tt><p><tt>@:</tt> <small>in place of</small> <tt>@</tt><br><tt>#</tt> <small>in place of</small> <tt>$</tt></p></td><td>does not create <tt>x $ y</tt></td></tr></tbody></table>

---

<table class="wikitable"><tbody><tr><td><tt>x&nbsp;? y</tt></td><td>Deal</td></tr></tbody></table>

[Rank 0 0](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank00var "Vocabulary/RankInfo") _\-- operates on individual atoms of x and y, producing a result that may require fill --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Selects x [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") at random (without repetition) from the [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET")  i.y

```
   3?10
4 8 9
   3?10
2 4 7

```

It follows that  y?y permutes the [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of (i.e. is a _permutation_ of)  i.y

```
   10?10
7 2 6 0 5 1 3 8 4 9

```
---

### Common uses

1\. A random permutation (_scrambling_) of the integers 0 to 9

```
   10?10
7 2 6 0 5 1 3 8 4 9
   ?~10   NB. -can also be written this way.
3 8 9 2 0 6 1 7 5 4

```

2\. Deal 3 cards from a pack of 52 cards

```
   \] s=: u: 16b2660 + i.4  NB. suits
♠♡♢♣
   d=: 'A23456789TJQK'     NB. denominations
   pack=: , d <@,"0/ s
   > (3?52) { pack         NB. deal 3 cards from 52
5♢
9♢
7♣

```
---

[Deal (Fixed seed)](https://code.jsoftware.com/wiki/Vocabulary/querydot "Vocabulary/querydot") (x ?. y)

---

### More Information

1\. x may not be greater than y (after each [argument](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET") has been rounded to an integer using [tolerant comparison](https://code.jsoftware.com/wiki/Vocabulary/Glossary#TolerantComp "Vocabulary/Glossary")).

---

### Caution

? produces unpredictable results - that's its job. The explicit-to-tacit translator doesn't know about this unpredictability, and may create a second execution of ?, unmindful of that fact that two executions of the same verb produce different results:

```
   r=. 3 : 'T - T=. ? y'           NB. regular monad containing call to Roll (?y)
   r 10 # 20                       NB. behaves as expected/intended
0 0 0 0 0 0 0 0 0 0
   rc=. 13 : 'T - T=. ? y'         NB. using (13 :) will give you wrong results
   rc 10 # 20
\_4 \_11 4 \_2 \_5 \_3 3 5 \_9 1

   d=. 3 : 'T - T=. y ? 20'        NB. regular monad containing call to Deal (x?y)
   d 10                            NB. behaves as expected/intended
0 0 0 0 0 0 0 0 0 0
   dc=. 13 : 'T - T=. y ? 20'      NB. using (13 :) will give you wrong results
   dc 10
0 \_11 12 4 3 13 1 1 0 2

```

Reason is, the explicit-to-tacit translator produces two \*separate\* function calls to Roll or Deal, as can be seen from the suggestions for tacit definitions:

```
   rc
+-+-+-+
|?|-|?|
+-+-+-+
? - ?

   dc
+------------+-+------------+
|+--+-----+-+|-|+--+-----+-+|
||20|+-+-+|\]|| ||20|+-+-+|\]||
||  ||?|~|| || ||  ||?|~|| ||
||  |+-+-+| || ||  |+-+-+| ||
|+--+-----+-+| |+--+-----+-+|
+------------+-+------------+
(20 ?~ \]) - 20 ?~ \]

```
---
