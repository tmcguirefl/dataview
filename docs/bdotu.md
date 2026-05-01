# Vocabulary/bdotu - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/ccapdot "Vocabulary/ccapdot") [<<](https://code.jsoftware.com/wiki/Vocabulary/bdot "Vocabulary/bdot")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/dbdotn.htm "jdic:dbdotn")

<table class="wikitable"><tbody><tr><td><tt>(u b.) y</tt></td><td>Verb Information</td><td>Adverb</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank "Vocabulary/RankInfo") _\-- operates on x and y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Generates one of 3 diagnostic verbs associated with [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") u according to the value of flag y

<table class="wikitable"><tbody><tr><td><b>y</b></td><td><b><i>resulting verb</i></b></td></tr><tr><td><tt>_1</tt></td><td>the linear representation of the <a title="Vocabulary/Inverses" href="/wiki/Vocabulary/Inverses">obverse</a> of <tt>u</tt></td></tr><tr><td><tt>0</tt></td><td>the (<a title="Vocabulary/Glossary" href="/wiki/Vocabulary/Glossary#Monad">monad</a>,<a title="Vocabulary/Glossary" href="/wiki/Vocabulary/Glossary#Dyad">dyad</a>) <i><a title="Vocabulary/AET" href="/wiki/Vocabulary/AET#Rank">ranks</a></i> of <tt>u</tt></td></tr><tr><td><tt>1</tt></td><td>the linear representation of the <a title="Vocabulary/slash" href="/wiki/Vocabulary/slash#Identity_Elements_(Neutrals)">identity function</a> of <tt>u</tt></td></tr></tbody></table>

```
   u=: ^     NB. antilogarithm
   u b. \_1   NB. what is the obverse of u? --the logarithm.
^.

   u=: <
   u b. 0    NB. what are the ranks of u?
\_ 0 0

```
---

### Common uses

1\. Discover the basic characteristics of a given [verb.](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET")

2\. Find the [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET")(s) of a given verb.

---

### More Information

1\. The [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") of  u b.y is a [numeric](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Numeric "Vocabulary/Glossary") [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") if y is 0, or a [character](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Character "Vocabulary/Glossary") [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") if y is \_1 or 1.

---
