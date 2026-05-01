# Vocabulary/tildem - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/tildedot "Vocabulary/tildedot") [<<](https://code.jsoftware.com/wiki/Vocabulary/tilde "Vocabulary/tilde")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d220v.htm "jdic:d220v")

<table class="wikitable"><tbody><tr><td><tt>m~</tt></td><td>Evoke</td><td>Adverb</td></tr></tbody></table>

---

(m~) is the [value](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary") of the [name](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Name "Vocabulary/Glossary") (m)

m must be a [noun](https://code.jsoftware.com/wiki/Vocabulary/AET#Noun "Vocabulary/AET") or a [phrase](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Phrase "Vocabulary/Glossary") that evaluates to a noun, and the resulting noun must be a [defined](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Defined "Vocabulary/Glossary") [name](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Name "Vocabulary/Glossary")

```
   name =: 'value of name'
   m =: 'name'

   m~
value of name
   ('na','me')~
value of name

```

When m is the name of a noun, m~ is the same as (". m) (which executes the phrase m to produce the noun [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary")). But when m is not a noun, only m~ will work OK

```
   ". m          NB. ".m works OK when value of name is a noun
value of name
   name =: +     NB. name has a value, but it is NOT a noun
   m~            NB. m~ still works
+
   \]z =: ". m    NB. but ".m evaluates to ''

   assert z -: ''

```
---

### Common uses

1\. Effectively pass a [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") (by [name](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Name "Vocabulary/Glossary")) as the x\-[argument](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET") to a 2nd verb: parse

```
   NB. Parse string: y and call the callback verb named (x)
   NB. with the result as its y-argument.

   parse=: 4 : 0
x~ |.y   NB. (sample processing applied to y)
)
   factorial=: !
   'factorial' parse i.5
24 6 2 1 1

```

Names used as callbacks in GUI code are often passed this way.  
Alternatively rewrite parse as an [adverb](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Adverb "Vocabulary/Glossary") (or a [conjunction](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Conjunction "Vocabulary/Glossary")).

Here (m~) serves as an alternative to using [Evoke Gerund](https://code.jsoftware.com/wiki/Vocabulary/graveco "Vocabulary/graveco") (m\`:6) with the [gerund](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Gerund "Vocabulary/Glossary") (m).

2\. Reassign noun terms to their equivalent constant verbs for easier use in tacit code

```
   'fruit six'=: 'apple';6
   fruit
apple
   six
6
   const=: {{0 0$((":y)=:y~"\_) y}}   NB. reassign term to constant verb
   const&> ;:'fruit six'
   six
6"\_
   fruit 0
apple
   six 0
6
   (fruit , \] ":@, six) 4 5          NB. no need for six"\_ here to make this a verb phrase
apple4 5 6

```

This can add convenience when several named nouns are used in various verb phrases within tacit code.

---

### Details

1\. (m~) is peculiar when (m) is one of the special local names (x y u v m n) in an explicit definition. When those names are used normally in a sentence, they are always replaced by their value, and thus the special name never appears on the [execution stack](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Execution_Stack "Vocabulary/Glossary"). When the special name is the (m) in (m~), it is **not** replaced by its value, and thus the special name **does** appear on the execution stack. This usually results in a value error.

---

[Evoke Gerund](https://code.jsoftware.com/wiki/Vocabulary/graveco "Vocabulary/graveco") (\`:6), [Do](https://code.jsoftware.com/wiki/Vocabulary/quotedot "Vocabulary/quotedot") (". y)

---
