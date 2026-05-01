# Vocabulary/bangco - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/slash "Vocabulary/slash") [<<](https://code.jsoftware.com/wiki/Vocabulary/bangdot "Vocabulary/bangdot")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d412.htm "jdic:d412")

<table class="wikitable"><tbody><tr><td><tt>m&nbsp;!: n</tt></td><td>Foreign</td><td>Conjunction</td></tr></tbody></table>

---

Generates [entities](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Entity "Vocabulary/Glossary") (the so-called **Foreigns**). Almost all of these entities are [verbs](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") which perform such tasks as:

-   interfacing with platform-dependent operating system services outside J's area of responsibility

e.g. system clock, file read/write and user interfaces

-   reading and setting global options for J's responses

e.g. for outputting [boxes](https://code.jsoftware.com/wiki/Vocabulary/AET#Box "Vocabulary/AET") or displaying the definitions of verbs and [modifiers](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Modifier "Vocabulary/Glossary")

-   managing [locales](https://code.jsoftware.com/wiki/Vocabulary/AET#Locale "Vocabulary/AET") and reporting on their status

[Operands](https://code.jsoftware.com/wiki/Vocabulary/AET#Operand "Vocabulary/AET") m (section number) and n (function within section m) are always integers from a set of of pre-determined values.

> [![](https://code.jsoftware.com/mediawiki/images/f/ff/Important.png)](https://code.jsoftware.com/wiki/File:Important.png) **For a detailed catalog of m and n in table form, see [Vocabulary/Foreigns](https://code.jsoftware.com/wiki/Vocabulary/Foreigns "Vocabulary/Foreigns").**

To execute any [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") at all in J, you need to call it with a y\-[argument](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET") (and an x\-[argument](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET") too, if it is [dyad](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Dyad "Vocabulary/Glossary")\-only). **Foreigns** are no different in this respect.

-   By convention choose y to be '' unless a given function needs actual data

e.g. [item](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") [names](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Name "Vocabulary/Glossary"), file names, [noun](https://code.jsoftware.com/wiki/Vocabulary/AET#Noun "Vocabulary/AET") [phrases](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Phrase "Vocabulary/Glossary") to be analysed, etc.

-   Some **Foreigns** need an x\-[argument](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET") too (but rarely). Otherwise call the Foreign [monadically](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Monad "Vocabulary/Glossary"), i.e. omit x.
---

### Common uses

1\. Return the time-of-day (optionally in a specified format)

See: [6!: Time](https://code.jsoftware.com/wiki/Vocabulary/Foreigns#m6 "Vocabulary/Foreigns")

```
   6!:0 ''
2007 10 30 13 10 45.312

   6!:0 'hh:mm:ss MM/DD/YY'
13:10:48 10/30/07

```

2\. Execute a named J [script](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Script "Vocabulary/Glossary") (silently)

See: [0!: Scripts](https://code.jsoftware.com/wiki/Vocabulary/Foreigns#m0 "Vocabulary/Foreigns")

```
   0!:0 <jpath '~temp/949.ijs'

```

3\. Signal your own invented error message with any choice of error number (1 to 255)

See: [13!: Debug](https://code.jsoftware.com/wiki/Vocabulary/Foreigns#m13 "Vocabulary/Foreigns")

```
   'my error message' (13!:8) 255
|my error message
|   'my error message'    (13!:8)255

```
---

### Use These Combinations

Combinations using x !: y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>CRC calculation</td><td></td><td><tt>x&amp;(128!:3)</tt></td><td></td><td>Calculates the CRC lookup table when verb is created<p>whereas <tt>&nbsp;x 128!:3 y </tt>computes it every time phrase is executed</p></td></tr></tbody></table>

---
