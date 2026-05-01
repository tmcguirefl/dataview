# Vocabulary/quotedot - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/quoteco "Vocabulary/quoteco") [<<](https://code.jsoftware.com/wiki/Vocabulary/quote "Vocabulary/quote")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d601.htm "jdic:d601")

<table class="wikitable"><tbody><tr><td><tt>". y</tt></td><td>Do</td></tr></tbody></table>

[Rank 1](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank1varany "Vocabulary/RankInfo") _\-- operates on lists of y, producing a result of variable shape for each one --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

[Executes](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Execution "Vocabulary/Glossary") the [sentence](https://code.jsoftware.com/wiki/Vocabulary/AET#Sentence "Vocabulary/AET") y, returning the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") of the sentence as the result of ". y. y is a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") of [characters.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Character "Vocabulary/Glossary")

The [values](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary") in y must represent [ASCII](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Ascii "Vocabulary/Glossary") graphic [characters](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Character "Vocabulary/Glossary") unless they are in quoted [strings.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#String "Vocabulary/Glossary")

```
   ". '6'
6
   ". '6 \* 3'
18
   ". '< i. 3'
+-----+
|0 1 2|
+-----+

```
---

### Common uses

1\. Convert a [number](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Number "Vocabulary/Glossary") in literal form to a [numeric](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Numeric "Vocabulary/Glossary") [type](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Type "Vocabulary/Glossary")

but this is not the best way to do it - see [below](#dyadic)

```
   y=: '-1.386E\_5'
   ". y
\_1.386e\_5

```

In practice  x ". y is better than  ".y for converting [strings](https://code.jsoftware.com/wiki/Vocabulary/Glossary#String "Vocabulary/Glossary") to [numbers](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Number "Vocabulary/Glossary"). But  ".y is usually safe enough for small strings

```
   \]array =: ".;.\_2 (0 : 0)
1 2 3   NB. each line is executed
3 1 4   NB. so comments here are ignored, just as in normal execution
5 2 3
)
1 2 3
3 1 4
5 2 3

```

2\. Assign a [non-noun](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Noun "Vocabulary/Glossary") [value](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary") that you have in [string](https://code.jsoftware.com/wiki/Vocabulary/Glossary#String "Vocabulary/Glossary") form

The problem is, [verbs](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") can produce only [noun](https://code.jsoftware.com/wiki/Vocabulary/AET#Noun "Vocabulary/AET") [results](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary"), so producing a verb value is problematic.

```
   verbdef =: '+&2'        NB. verbdef describes the verb we want: add 2
   ". 'vb =: ' , verbdef   NB. execute the sentence 'vb =: +&2'

   vb                      NB. It did it!  The verb is defined
+&2
   vb 5
7

```

3\. Callbacks from a handler can be handled by passing a callback: sentence to the handler, which executes ".sentence at callback time.

---

[Numbers](#dyadic) (x ". y)

---

### More Information

1\. An error encountered in the [execution](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Execution "Vocabulary/Glossary") of y causes ".y to fail also.

2\. If

-   the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") of the [sentence](https://code.jsoftware.com/wiki/Vocabulary/AET#Sentence "Vocabulary/AET") is not a [noun](https://code.jsoftware.com/wiki/Vocabulary/AET#Noun "Vocabulary/AET"), or
-   there is no executable sentence because y is empty or contains only whitespace or comment,

the result of ".y is 0$0, an [empty](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Empty "Vocabulary/Glossary") [Boolean](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boolean "Vocabulary/Glossary") [list.](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET")

3\. Converting [characters](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Character "Vocabulary/Glossary") to [numerics](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Numeric "Vocabulary/Glossary") is better handled with [dyadic](#dyadic)  x ". y .

4\. The [sentence](https://code.jsoftware.com/wiki/Vocabulary/AET#Sentence "Vocabulary/AET") y is executed in the same J context as that in which ".y appears, with access to the same [namespaces.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Namespace "Vocabulary/Glossary")

---

### Use These Combinations

Combinations using ". y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Convert an integer to a numeric list of digits</td><td>Boolean, integer, extended integer</td><td><tt>"."0@": y</tt></td><td><tt>@:</tt> <tt>&amp;</tt> <tt>&amp;:</tt> <small>in place of</small> <tt>@</tt></td><td>fastest way, especially for extended integers</td></tr></tbody></table>

---

<table class="wikitable"><tbody><tr><td><tt>x ". y</tt></td><td>Numbers</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank "Vocabulary/RankInfo") _\-- operates on x and y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Converts a [byte](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Byte "Vocabulary/Glossary") [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") y into [numbers.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Number "Vocabulary/Glossary")

Ill-formed numbers are replaced by x, which serves as a _default value_

```
   x=: \_\_                    NB. minus-infinity
   x ". '2 -3 4e 5.6 \_ .7'   NB. 4e is ill-formed. -3 and .7 are OK
2 \_3 \_\_ 5.6 \_ 0.7

```
---

### Common uses

1\. Interpret an input stream of [numbers](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Number "Vocabulary/Glossary") given in [character](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Character "Vocabulary/Glossary") form (as above)

substituting 0 or some other [value](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary") e,g, (\_) for any ill-formed numbers

**WARNING:** Using [Indeterminate](https://code.jsoftware.com/wiki/Vocabulary/underdot "Vocabulary/underdot") (\_.) as the default value x is _not recommended_, for reasons given on that page.

2\. Define a [number](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Number "Vocabulary/Glossary") [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") inside a [script](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Script "Vocabulary/Glossary") in conveniently editable form

```
   \]array =: 0&".;.\_2 (0 : 0)
1 2 3
3 1 4
5 2 3
)
1 2 3
3 1 4
5 2 3

   \]array =: 0&".;.\_2 (0 : 0)
1 2 3  NB. better not try comments!
3 1 4  NB. everything is a number
5 2 3
)
1 2 3 0 0 0 0 0
3 1 4 0 0 0 0 0
5 2 3 0 0 0 0 0

```
---

### More Information

1\. x ". y does not execute y as a J [sentence](https://code.jsoftware.com/wiki/Vocabulary/AET#Sentence "Vocabulary/AET"), but instead interprets it as describing [numbers](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Number "Vocabulary/Glossary") only.

2\. [Numbers](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Number "Vocabulary/Glossary") in y are delimited by [whitespace.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Whitespace "Vocabulary/Glossary")

3\. The rules for valid J numbers are relaxed as follows, to allow more conventional numerals:

-   a negative sign preceding a number, or the exponent of a number, can be either \- or \_
-   commas within numbers are ignored
-   fractions need not have a digit 0 before the decimal point
-   a number may be preceded by a + sign
-   the exponent of a number in exponential format may be preceded by a + sign.
---

### Details

1\. y may have any [shape.](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET") Each 1-[cell](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Cell "Vocabulary/Glossary") (that is, each row) of y is converted separately, but the [results](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") from the row are **not** collected in the usual way (this is why the right [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") is infinite rather than 1). Instead:

-   Each row of y is converted into a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") of [numbers](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Number "Vocabulary/Glossary"),

with x replacing any invalid numerals. A row containing no non-whitespace is converted into an empty list of numbers

-   Each [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") is extended to the length of the longest result list, by appending [values](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary") of x
-   If the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") lists are now 1 [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") long, they are all converted to atoms
-   The results (atoms or lists) are [collected](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Collection "Vocabulary/Glossary") into the final result using the [frame](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Frame "Vocabulary/Glossary") of y with respect to 1-[cells](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Cell "Vocabulary/Glossary")
```
   99 ". ''            NB. empty list, empty result

   99 ". '56'          NB. A single number is converted to an atom
56
   $ 99 ". '56'        NB. see? It's an atom

   99 ". '2 3',:'5.0'  NB. Second row is short and is extended
2  3
5 99
   \]a =. '2.0',:'5.0'  NB. A 2x1 table
2.0
5.0
   99 ". '2.0',:'5.0'  NB. special case: each row has 1 number, they are treated as atoms
2 5
   \]b =. ,. '123'      NB. Another way to do the same thing
1
2
3
   99 ". b
1 2 3
   99 ". '',:'5.0'     NB. first (empty) row is extended to length 1, then treated as atoms
99 5

```
---
