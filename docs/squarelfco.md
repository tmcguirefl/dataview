# Vocabulary/squarelfco - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/squarert "Vocabulary/squarert") [<<](https://code.jsoftware.com/wiki/Vocabulary/squarelfdot "Vocabulary/squarelfdot")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d502.htm "jdic:d502")

<table class="wikitable"><tbody><tr><td><tt>[:</tt></td><td>Cap</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank_~ "Vocabulary/RankInfo") _\-- operates on \[x and\] y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

1\. Raises valence error whenever executed as [monad](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Monad "Vocabulary/Glossary") or [dyad](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Dyad "Vocabulary/Glossary"), whatever the [argument](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET")(s).

2\. In a tacit [phrase](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Phrase "Vocabulary/Glossary") (\[: f g): **caps** the left branch of a _[fork](https://code.jsoftware.com/wiki/Vocabulary/fork "Vocabulary/fork")_.

This is a syntactic trick to employ a [fork](https://code.jsoftware.com/wiki/Vocabulary/fork "Vocabulary/fork") to implement: _f(g(x))_ -- the _composition_ of the two functions: _f_ and _g_.

The primitive: \[: is not actually executed.

```
   13 : 'f(g(y))'
\[: f g

```
---

### Common uses

1\. To force an error when a [tacitly defined verb](https://code.jsoftware.com/wiki/Vocabulary/Glossary#TacitVerb "Vocabulary/Glossary") only meant to be used [monadically](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Monad "Vocabulary/Glossary") is accidentally employed [dyadically](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Dyad "Vocabulary/Glossary"), and vice-versa

Note the use of [Monad-Dyad](https://code.jsoftware.com/wiki/Vocabulary/co "Vocabulary/co") (:) to provide separate [tacit definitions](https://code.jsoftware.com/wiki/Vocabulary/Glossary#TacitVerb "Vocabulary/Glossary") for monadic and dyadic uses of the verb.

```
   star=: \*         NB. Any verb can be executed as monad or dyad
   star \_99 99 0
\_1 1 0
   3 star 5
15

   signum=: \* : \[:  NB. This verb will fail if executed dyadically
   signum \_99 99 0
\_1 1 0
   3 signum 5
|valence error: signum
|   3     signum 5

   times=: \[: : \*   NB. This verb will fail if executed monadically
   3 times 5
15
   times \_99 99 0
|valence error: times
|       times \_99 99 0

```

2\. To implement _f(g(y)_ as above.

---

[Compose](https://code.jsoftware.com/wiki/Vocabulary/ampv "Vocabulary/ampv") (&), [Appose](https://code.jsoftware.com/wiki/Vocabulary/ampco "Vocabulary/ampco") (&:), [At](https://code.jsoftware.com/wiki/Vocabulary/atco "Vocabulary/atco") (@:), [Atop](https://code.jsoftware.com/wiki/Vocabulary/at "Vocabulary/at") (@), [Hook](https://code.jsoftware.com/wiki/Vocabulary/hook "Vocabulary/hook") ((u v)), [Fork](https://code.jsoftware.com/wiki/Vocabulary/fork "Vocabulary/fork") ((f g h))

---

### More Information

1.  Except for its appearance in code, (\[: g h) is exactly equivalent to g@:h .
2.  If you use a synonym for the Cap verb (\[:), the synonym must be defined before it is used to create a capped fork.
---

### Use These Combinations

Combinations using \[: that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include those shown in [Searching and Matching Items: Fast List Operations (FLOs)](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations#FLOs "Vocabulary/SpecialCombinations"), as well as the following:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Applying <tt>f/</tt> after <tt>g</tt><p><small>(<tt>f</tt> and <tt>g</tt> are any <a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#2">atomic verbs</a>)</small></p></td><td></td><td><tt>x f/@:g y</tt><p><tt>x ([: f/ g) y</tt></p></td><td></td><td>avoids recopying arguments</td></tr><tr><td>Extract multiple substrings into a list</td><td>Boolean list, byte list</td><td><tt>x&nbsp;;@:(&lt;;.0) y</tt></td><td>or <tt>[:&nbsp;; &lt;;.0</tt></td><td>avoids boxing, avoids creating subarrays</td></tr><tr><td>Razed selections</td><td></td><td><tt>x (;@{) y</tt></td><td>also <tt>x ([:&nbsp;; {) y</tt></td><td></td></tr><tr><td>Concatenated results on intervals</td><td></td><td><tt>;@:(&lt;@u;.n) y</tt><p><tt>x&nbsp;;@:(&lt;@u;.n) y</tt></p></td><td><tt>n e. _2 _1 1 2</tt>; also <tt>[:&nbsp;; (&lt;@u;.n)</tt>; also <tt>&lt;@:u</tt></td><td><b>Bug Warning:</b> This is computed as <tt>&lt;@:u</tt> even if <tt>&lt;@u</tt> is coded</td></tr><tr><td>Concatenated running totals on intervals (running total, but total is reset at start of each interval)</td><td></td><td><tt>;@:(&lt;@(f/\);.n) y</tt><p><tt>x&nbsp;;@:(&lt;@(f/\);.n) y</tt><br><small>(<tt>f</tt> is any verb)</small></p></td><td><tt>n e. _2 _1 1 2</tt>; also <tt>[:&nbsp;; (f...</tt> also <tt>&lt;@:(f/\)</tt>; also <tt>&lt;@:</tt></td><td></td></tr><tr><td>Arrays of random numbers</td><td></td><td><tt>x&nbsp;?@$ y</tt><p><tt>x([:&nbsp;? $)y</tt></p></td><td><tt>?.</tt> <small>in place of</small> <tt>?</tt><p><tt>@:</tt> <small>in place of</small> <tt>@</tt><br><tt>#</tt> <small>in place of</small> <tt>$</tt></p></td><td>does not create <tt>x $ y</tt></td></tr></tbody></table>

---
