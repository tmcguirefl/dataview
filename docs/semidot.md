# Vocabulary/semidot - J Wiki

From J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/semidot0 "Vocabulary/semidot0") [<<](https://code.jsoftware.com/wiki/Vocabulary/semi "Vocabulary/semi")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d331.htm "jdic:d331")

<table class="wikitable"><tbody><tr><td><tt>;.n</tt></td><td>Cut</td><td>Conjunction</td></tr></tbody></table>

---

A collection of 3 adverbs, collectively known as **Cut**, with different syntax and semantics.

which means they look different inside J code, and do different things.

The 3 adverbs are distinguished from each other by having different values of n in the [phrase](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Phrase "Vocabulary/Glossary") (;.n).

-   (;.0) ([Reversed](https://code.jsoftware.com/wiki/Vocabulary/semidot0#monadic "Vocabulary/semidot0") \* [Subarray](https://code.jsoftware.com/wiki/Vocabulary/semidot0#dyadic "Vocabulary/semidot0"))
-   (;.1), (;.\_1), (;.2), (;.\_2) ([SelfIntervals](https://code.jsoftware.com/wiki/Vocabulary/semidot1#monadic "Vocabulary/semidot1") \* [Intervals](https://code.jsoftware.com/wiki/Vocabulary/semidot1#dyadic "Vocabulary/semidot1"))
-   (;.3), (;.\_3) ([MaxCubes](https://code.jsoftware.com/wiki/Vocabulary/semidot3 "Vocabulary/semidot3") \* [Subarrays](https://code.jsoftware.com/wiki/Vocabulary/semidot3#dyadic "Vocabulary/semidot3"))
---

**_NOTE:_** Strictly speaking, **Cut** is a [conjunction](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Conjunction "Vocabulary/Glossary"), not an [adverb](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Adverb "Vocabulary/Glossary"). But as soon as we supply a right-hand [operand](https://code.jsoftware.com/wiki/Vocabulary/AET#Operand "Vocabulary/AET") n, as in (;.0) say, the result is an [adverb](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Adverb "Vocabulary/Glossary"), i.e. a [modifier](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Modifier "Vocabulary/Glossary") accepting only one operand.

---
