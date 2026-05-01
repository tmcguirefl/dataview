# Vocabulary/lcapdot - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/lcapco "Vocabulary/lcapco") [<<](https://code.jsoftware.com/wiki/Vocabulary/jdot "Vocabulary/jdot")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/dlcapdot.htm "jdic:dlcapdot")

<table class="wikitable"><tbody><tr><td><tt>L. y</tt></td><td>Level Of</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank "Vocabulary/RankInfo") _\-- operates on x and y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

The greatest level of nesting of a [boxed](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boxed "Vocabulary/Glossary") [noun](https://code.jsoftware.com/wiki/Vocabulary/AET#Noun "Vocabulary/AET"), or 0 if [unboxed.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Unboxed "Vocabulary/Glossary")

```
   L. 0$a:
0
   L. 1 2 3
0
   L. <,1
1
   L. (<,1),(<<,2)
2
   L. (<,1),(<<,2),(<<<,3)
3

```
---

### Common Uses

Use boxopen to detect whether [argument](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET") y is already [boxed](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boxed "Vocabulary/Glossary")

```
boxopen=: <^:(L. = 0:)   NB. box y-arg if it is open or empty, but not otherwise

```

boxopen is a

-   [Standard Library](http://www.jsoftware.com/help/user/library.htm) word(s) residing in the 'z'-locale
-   Defined in the factory script stdlib.ijs which is located in  ~system/main/stdlib.ijs-   View the definition(s) in a JQt session by entering:  open '~system/main/stdlib.ijs'
---

### Use These Combinations

Combinations using L. y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Check boxing level</td><td></td><td><tt>x (&lt; L.) y</tt></td><td>also <tt>&lt;: &gt; &gt;:</tt></td><td>Stops processing <tt>y</tt> early if possible</td></tr></tbody></table>

[Level At](https://code.jsoftware.com/wiki/Vocabulary/lcapco "Vocabulary/lcapco") (u L: n), [Spread](https://code.jsoftware.com/wiki/Vocabulary/scapco "Vocabulary/scapco") (u S: n)

---
