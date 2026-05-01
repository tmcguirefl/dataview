# Vocabulary/zeroco - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/assertdot "Vocabulary/assertdot") [<<](https://code.jsoftware.com/wiki/Vocabulary/fork "Vocabulary/fork")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/dconsf.htm "jdic:dconsf")

<table class="wikitable"><tbody><tr><td><tt>[x] [_]<i>digit</i>: y</tt></td><td>Constant Function</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank_~ "Vocabulary/RankInfo") _\-- operates on \[x and\] y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

The [value](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary") \[\_\]_digit_, whatever \[x and\] y happen to be.

The [argument](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Argument "Vocabulary/AbsolutelyEssentialTerms") y can therefore be any [noun.](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Noun "Vocabulary/AbsolutelyEssentialTerms") Ditto x, if present.

```
   x=: ;:'The quick brown fox is ignored by the lazy dog'
   y=: i. 5 3

   0: y
0
   $$ 0: y
0

   x 0: y
0

```
---

### Common uses

1\. Pad the ends of a [numeric](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Numeric "Vocabulary/Glossary") [vector](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Vector "Vocabulary/Glossary") with a given value.

```
   pad=: 0: , \] , \_9:
   pad i.9
0 0 1 2 3 4 5 6 7 8 \_9

```

**Note:** 0 will work in place of the 0: here, but not the \_9:. This is because the [train](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Train "Vocabulary/Glossary") of [verbs](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Verb "Vocabulary/AbsolutelyEssentialTerms") applied to [argument](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Argument "Vocabulary/AbsolutelyEssentialTerms") y

```
   (a b c d e) y

```

is equivalent to the explicit expression:

```
   (a y) b ((c y) d (e y))

```

from which you can see that 0: (standing in for a and e here) is called with an unwanted [argument](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Argument "Vocabulary/AbsolutelyEssentialTerms") y which must be lost.

---

-   [Constant Function](https://code.jsoftware.com/wiki/Vocabulary/underco "Vocabulary/underco") (\_:)
---

### More information

0: is equivalent to (0"\_). Using [Rank](https://code.jsoftware.com/wiki/Vocabulary/quote "Vocabulary/quote") in this way makes a [verb](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Verb "Vocabulary/AbsolutelyEssentialTerms") out of a [noun](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Noun "Vocabulary/AbsolutelyEssentialTerms") (viz. a [string](https://code.jsoftware.com/wiki/Vocabulary/Glossary#String "Vocabulary/Glossary") or [numeric](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Numeric "Vocabulary/Glossary") [constant](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Constant "Vocabulary/Glossary")).

0: has sister-primitives \_: (=infinity), \_\_:, 1:, 2:, 3:, ... 9: and \_1:, \_2:, \_3:, ... \_9:, returning the corresponding [integers.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Integer "Vocabulary/Glossary")

Old J code makes more use of 0: (1: 2: etc.) than up-to-date code. You'll often find in old examples that 0 works just as well. This is because a recent version of J defined the [train](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Train "Vocabulary/Glossary") (NOUN VERB VERB) as meaning (NOUN"\_ VERB VERB).

This family of primitive verbs is more useful than it first appears, especially when defining a verb tacitly. Tacit definitions don't like embedded variables and constants. They behave best when built from [verbs](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Verb "Vocabulary/AbsolutelyEssentialTerms"), [adverbs](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Adverb "Vocabulary/Glossary") and [conjunctions](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Conjunction "Vocabulary/Glossary").

[Trains](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Train "Vocabulary/Glossary") of primitives form [hooks](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Hook "Vocabulary/Glossary") and [forks](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Fork "Vocabulary/Glossary"). These receive data from [arguments](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Argument "Vocabulary/AbsolutelyEssentialTerms") x and y in a complicated way. Use 0: (and family) as a [verb](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Verb "Vocabulary/Glossary"), knowing that it will mop up unwanted [values](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary") presented as [arguments](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Argument "Vocabulary/AbsolutelyEssentialTerms") and reliably return a [scalar](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Scalar "Vocabulary/Glossary") 0.

---

### More uses

1\. Pascal's Triangle.

```
   bc =:  0&(, + ,~)^:(<\`1:)    NB. binary coeff
   bc 6
1 0  0  0 0 0
1 1  0  0 0 0
1 2  1  0 0 0
1 3  3  1 0 0
1 4  6  4 1 0
1 5 10 10 5 1

```

This won't work if [noun:](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Noun "Vocabulary/AbsolutelyEssentialTerms") 1 is used in place of [verb:](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Verb "Vocabulary/AbsolutelyEssentialTerms") 1:

2\. Avoid an accidental [vector](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Vector "Vocabulary/Glossary") [constant](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Constant "Vocabulary/Glossary"), when what you want to do is make a verb out of a [modifier](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Modifier "Vocabulary/Glossary")

```
   (0 1} \*:) i.6      NB. Try to amend 1{\*: i.6 to zero
|rank error
|       0 1}i.6
   (0: 1} \*:) i.6  NB. Avoid adjacent numbers
0 0 2 3 4 5

```
---
