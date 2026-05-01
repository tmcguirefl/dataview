# Vocabulary/tildedot - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/tildeco "Vocabulary/tildeco") [<<](https://code.jsoftware.com/wiki/Vocabulary/tildem "Vocabulary/tildem")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d221.htm "jdic:d221")

<table class="wikitable"><tbody><tr><td><tt>~. y</tt></td><td>Nub</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank_iy "Vocabulary/RankInfo") _\-- operates on x and y as a whole, by items of y --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Removes duplicates from a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET").

More generally, removes any [item](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") of an [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") that matches a preceding item.

```
   ~. 'abracadabra'
abrcd

```
---

### Common Uses

1\. Remove duplicate [values](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary") from a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET")

```
   ~. 1 3 5 3 5 9 5 2 3 5 7 3 5 7 3
1 3 5 9 2 7

```

2\. Remove duplicate rows from a [table](https://code.jsoftware.com/wiki/Vocabulary/AET#Table "Vocabulary/AET")

```
   \]t =. \_3 \]\\ 1 0 1 1 1 0 1 0 1 0 1 0 1 1 0
1 0 1
1 1 0
1 0 1
0 1 0
1 1 0
   ~. t
1 0 1
1 1 0
0 1 0

```

3\. If f is a costly function, it may be quicker to evaluate f y by first evaluating f~. y (which yields all of the distinct results required), and then distributing them to their appropriate positions. For example:

```
   f=: \*:
   y=: 2 7 1 8 2 8 1 8
   f y
4 49 1 64 4 64 1 64

   ,.&.>(~. ; f@~. ; ((i.~ { f@\]) ~.) ; f)y
+-+--+--+--+
|2| 4| 4| 4|
|7|49|49|49|
|1| 1| 1| 1|
|8|64|64|64|
| |  | 4| 4|
| |  |64|64|
| |  | 1| 1|
| |  |64|64|
+-+--+--+--+

   NUB=: 1 : '(i.~ { u@\]) ~.'           NB. Adverb
   \*: NUB y
4 49 1 64 4 64 1 64

```
---

[Nub Sieve](https://code.jsoftware.com/wiki/Vocabulary/tildeco "Vocabulary/tildeco") (~: y)

---

### More Information

1.  ~. y is a member of [the i. family](https://code.jsoftware.com/wiki/Vocabulary/IFamily "Vocabulary/IFamily").
2.  ~. y uses [tolerant comparison](https://code.jsoftware.com/wiki/Vocabulary/Glossary#TolerantComp "Vocabulary/Glossary"). Use ~.!.0 y for intolerant comparison.
    
    Because of tolerant comparison, the number of [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") in ~. y may depend on the order of the items of y.
    
3.  The items of ~. y preserve the order of their first occurrence in y.
4.  The order of items in ~. y is guaranteed to be the same as the order of [partitions](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Partition "Vocabulary/Glossary") in y u/..
5.  ~. y is equivalent to (~: y) # y.
6.  If y is an [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET"), ~. y is a 1-atom list. Otherwise the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") of ~. y has the same [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") as y.
---
