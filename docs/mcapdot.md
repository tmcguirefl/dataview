# Vocabulary/mcapdot - J Wiki

From J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/ncapbcapdot "Vocabulary/ncapbcapdot") [<<](https://code.jsoftware.com/wiki/Vocabulary/lcapco "Vocabulary/lcapco")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/dmcapdot.htm "jdic:dmcapdot")

<table class="wikitable"><tbody><tr><td><tt>[x] u M. y</tt></td><td>Memo</td><td>Adverb</td></tr></tbody></table>

[Rank](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#ranku "Vocabulary/RankInfo") _\-- depends on the rank of u --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

u M. is identical in function to [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") u, except that it might be faster if u is highly recursive.

The [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") created by  u M. **may** keep a record of [arguments](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET") and [results](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary"), and returns the previously-calculated result if called with previously-seen arguments.

This technique is called [memoization](https://en.wikipedia.org/wiki/Memoization "wikipedia:Memoization").

The [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") u must not have side effects, i.e. its actual [execution](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Execution "Vocabulary/Glossary") must not do anything significant, as distinct from the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") it returns.

This is because you can no longer rely on it actually being executed.

---

### Details

1\. u M. records only [atomic](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Atom "Vocabulary/Glossary") [arguments.](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET")

2\. The size of the table used to record arguments and results is not under user control.

---

### Oddities

1\. If an argument to  u M. is an [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET"), it must be [numeric.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Numeric "Vocabulary/Glossary")

---
