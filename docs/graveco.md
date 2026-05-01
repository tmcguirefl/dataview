# Vocabulary/graveco - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/at "Vocabulary/at") [<<](https://code.jsoftware.com/wiki/Vocabulary/grave "Vocabulary/grave")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d612.htm "jdic:d612")

<table class="wikitable"><tbody><tr><td><tt>[x] m`:n y</tt></td><td>Evoke Gerund</td><td>Conjunction</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank "Vocabulary/RankInfo") _\-- operates on x and y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

If m is a [gerund](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Gerund "Vocabulary/Glossary"),  m\`:n creates a [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") based on m.

[Operand](https://code.jsoftware.com/wiki/Vocabulary/AET#Operand "Vocabulary/AET") n is an [integer](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Integer "Vocabulary/Glossary") (0, 3 or 6) specifying what the verb should do

See below: **More Information**

```
   gerund =: +&2\`''   NB. create a gerund
   gerund             NB. Display it.  (It is a deeply boxed noun)
+-------------+
|+-+---------+|
||&|+-+-----+||
|| ||+|+-+-+|||
|| || ||0|2||||
|| || |+-+-+|||
|| |+-+-----+||
|+-+---------+|
+-------------+
   gerund \`:6         NB. Turn the gerund into a verb
+&2
   (gerund \`:6) 8     NB. The verb will actually run
10

```
---

### Common Uses

1\. To turn a [gerund](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Gerund "Vocabulary/Glossary") representing a single [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") into the actual verb, as above.

---

### More Information

1\. n must have the value 0, 3, or 6.

2\.  \[x\] m\`:0 y applies the [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") described by each [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") of m separately, and [collects](https://code.jsoftware.com/wiki/Vocabulary/FramingFill#Collection "Vocabulary/FramingFill") the [results](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary"), using the [shape](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET") of m as the [frame](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Frame "Vocabulary/Glossary"), into an [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") which becomes the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") of  m\`:n .

The [verbs](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") are executed [monadically](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Monad "Vocabulary/Glossary") or [dyadically](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Dyad "Vocabulary/Glossary") depending on the invocation of  m\`:n

```
   ((+:\`\*:) \`:0) i. 3
0 2 4
0 1 4
   $ (({. +:\`\*:) \`:0) i. 3   NB. m here is an atom, so the result has no leading axis
3

```

3\.  m\`:3 y is equivalent to  m/ y .

Verb  m\`:3 cannot be used [dyadically](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Dyad "Vocabulary/Glossary").

4\.  \[x\] m\`:6 y converts the individual [atoms](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") of gerund m to [verbs](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET"), and applies a [verb train](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Train "Vocabulary/Glossary") of the resulting verbs.

### Details

1\. m\`:6 more generally produces the [entity](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Entity "Vocabulary/Glossary") that results from evaluation of the single word or word sequence described by atom or list m of [atomic representations](https://code.jsoftware.com/wiki/Vocabulary/Glossary#AtomicRep "Vocabulary/Glossary").

```
   \[i10=: i.\`('0'<@,&<10)   NB. (AR of i.)\`(AR of 10)
┌──┬──────┐
│i.│┌─┬──┐│
│  ││0│10││
│  │└─┴──┘│
└──┴──────┘
   i10\`:6                      NB. evaluate (AR of i.)\`(AR of 10).  Equivalent to i. 10 or ". 'i. 10'
0 1 2 3 4 5 6 7 8 9
   i.\`(<'&')\`:6                NB. evaluate (AR of i.)\`(AR of &)
i.&

```

2\. m\`: gives a domain error if m is boxed and is not a valid atomic representation.

---
