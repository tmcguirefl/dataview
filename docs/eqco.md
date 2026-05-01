# Vocabulary/eqco - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/lt "Vocabulary/lt") [<<](https://code.jsoftware.com/wiki/Vocabulary/eqdot "Vocabulary/eqdot")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d001.htm "jdic:d001")

<table class="wikitable"><tbody><tr><td><tt>=:</tt></td><td>Is (Global)</td><td>Other</td></tr></tbody></table>

---

Attaches a [value](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary") to a [name](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Name "Vocabulary/Glossary") to yield a [definition](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Defined "Vocabulary/Glossary").

This is called [assignment](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Assignment "Vocabulary/Glossary").

```
   myname =: 99     NB. defines: myname to be a noun: 99

   myname
99
   myname + 1
100

```

Unlike [Is (Local)](https://code.jsoftware.com/wiki/Vocabulary/eqdot "Vocabulary/eqdot") (\=.), the definition will not go away when the "process" executing the [assignment](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Assignment "Vocabulary/Glossary") terminates.

This is called [public assignment](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Public "Vocabulary/Glossary").

"Process" here means either executing an [explicitly defined](https://code.jsoftware.com/wiki/Vocabulary/Glossary#ExplicitEntity "Vocabulary/Glossary") verb, or loading a J [script](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Script "Vocabulary/Glossary").

The value assigned need not be a noun. It can also be a verb

```
   sum =: +/

   type 'sum'
+----+
|verb|
+----+

   sum 1 10 20.1
31.1

```

Or it can be a [modifier](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Modifier "Vocabulary/Glossary") (i.e. an [adverb](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Adverb "Vocabulary/Glossary") or a [conjunction](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Conjunction "Vocabulary/Glossary"))

```
   tabulated =: /
   atop =: @

   type 'tabulated' ; 'atop'
+------+-----------+
|adverb|conjunction|
+------+-----------+

   MultiplicationTable =: \* tabulated

   \] z =: 1 + i.6
1 2 3 4 5 6

   z MultiplicationTable z
1  2  3  4  5  6
2  4  6  8 10 12
3  6  9 12 15 18
4  8 12 16 20 24
5 10 15 20 25 30
6 12 18 24 30 36

```

You can place other constructs besides a bare [name](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Name "Vocabulary/Glossary") to the left of \=:

```
   'a b c' =: 1 10 20.1
   a ; b ; c
+-+--+----+
|1|10|20.1|
+-+--+----+

   z =: 'd e f'
   (z) =: 1 10 20.1
   d ; e ; f
+-+--+----+
|1|10|20.1|
+-+--+----+

```
---

### Common uses

Used to create [nouns](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Noun "Vocabulary/Glossary"), [adverbs](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Adverb "Vocabulary/Glossary"), [conjunctions](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Conjunction "Vocabulary/Glossary") and [verbs](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Verb "Vocabulary/Glossary") which persist until you deliberately erase them.

Nouns, adverbs, conjunctions and verbs are the building-blocks of an application.

---

### More Information

See [Private and Public Assignment](https://code.jsoftware.com/wiki/Vocabulary/Assignment "Vocabulary/Assignment")

> [![](https://code.jsoftware.com/mediawiki/images/f/ff/Important.png)](https://code.jsoftware.com/wiki/File:Important.png) Find time to study [Private and Public Assignment](https://code.jsoftware.com/wiki/Vocabulary/Assignment "Vocabulary/Assignment") carefully. (It describes and explains all uses of \=. and \=:)

---

CategoryVoc CategoryVocAssign CategoryVocValue CategoryVocVariable
