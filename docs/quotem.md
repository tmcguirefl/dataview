# Vocabulary/quotem - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/quotev "Vocabulary/quotev") [<<](https://code.jsoftware.com/wiki/Vocabulary/quote "Vocabulary/quote")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d600n.htm "jdic:d600n")

<table class="wikitable"><tbody><tr><td><tt>m"n</tt></td><td>Constant Verb</td><td>Conjunction</td></tr></tbody></table>

---

Creates a [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") having [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") n, that produces the result m for each n\-[cell](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Cell "Vocabulary/Glossary") of its [argument(s)](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET").

> [![](https://code.jsoftware.com/mediawiki/images/5/54/Information.png)](https://code.jsoftware.com/wiki/File:Information.png) For other uses of (") see:
> 
> -   [Rank](https://code.jsoftware.com/wiki/Vocabulary/quote "Vocabulary/quote") (u"n)
> -   [Copy Rank](https://code.jsoftware.com/wiki/Vocabulary/quotev "Vocabulary/quotev") (u"v) (m"v)

The verb (m"n) has both [dyadic](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Dyad "Vocabulary/Glossary") and [monadic](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Monad "Vocabulary/Glossary") forms. But they all return the [constant](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Constant "Vocabulary/Glossary") [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") m

```
   always100 =: 100"\_
   always100 5 6 7      NB. The argument(s) don't matter with n=:\_
100
   3 always100 i. 5 5
100

```

**Note:** In place of the [operand](https://code.jsoftware.com/wiki/Vocabulary/AET#Operand "Vocabulary/AET") ([noun](https://code.jsoftware.com/wiki/Vocabulary/AET#Noun "Vocabulary/AET")) n, you can use any verb v. This is equivalent to setting n equal to the [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") of ranks of v. See [Copy Rank](https://code.jsoftware.com/wiki/Vocabulary/quotev "Vocabulary/quotev") (m"v).

---

### Common Uses

1\. Construct an [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") of the same [shape](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET") as z, but having 1 for every [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") in z

```
   \]z=: i.2 3
0 1 2
3 4 5
   1"0 z
1 1 1
1 1 1
   z=: 2 3 $ 'abcdef'
   1"0 z
1 1 1
1 1 1

```

2\. Make a "constant" verb out of a given [noun](https://code.jsoftware.com/wiki/Vocabulary/AET#Noun "Vocabulary/AET"), which always returns the noun whatever the value of its y\-argument (and optional x\-argument)

Such a verb can simplify the creation of a tacit phrase which needs the value of a given noun at some point in the calculation.

```
   zero=: 0"\_
   zero 98 99
0
   'abc' zero 98 99
0

```

3\. The standard library verb bind uses Rank (") to attach a constant argument to some other verb, e.g. echo .

bind is a

-   [Standard Library](http://www.jsoftware.com/help/user/library.htm) word(s) residing in the 'z'-locale
-   Defined in the factory script stdlib.ijs which is located in  ~system/main/stdlib.ijs-   View the definition(s) in a JQt session by entering:  open '~system/main/stdlib.ijs'

The resulting verb ignores its argument(s), and is conventionally called with an empty argument, e.g. ''

This example shows a GUI handler which has yet to be implemented, meanwhile displaying a message in the J session.

```
   fm\_cancel\_button=: echo bind '>>> Cancel is not implemented'
   fm\_cancel\_button
echo@('>>> Cancel is not implemented'"\_)

   fm\_cancel\_button ''
>>> Cancel is not implemented

```

**Note:** The conjunction [At (u@n)](https://code.jsoftware.com/wiki/Vocabulary/at#constant "Vocabulary/at") , when called with a noun right operand, is equivalent to the standard library verb bind.

---

[Atop (Constant)](https://code.jsoftware.com/wiki/Vocabulary/at#constant "Vocabulary/at") (u@n), [Infinity](https://code.jsoftware.com/wiki/Vocabulary/underco "Vocabulary/underco") (\_:), [Constant Functions](https://code.jsoftware.com/wiki/Vocabulary/zeroco "Vocabulary/zeroco") (0:), (1:), (\_1:), (2:), (\_2:), ... , (9:), (\_9:).

---

### More Information

1\. m can be a [cyclic gerund](https://code.jsoftware.com/wiki/Vocabulary/CyclicGerund "Vocabulary/CyclicGerund") as described [here](https://code.jsoftware.com/wiki/Vocabulary/quote#Details "Vocabulary/quote"). Since gerunds are nouns, cyclic gerunds are an exception to the usage described on this page.

2\. See [Rank](https://code.jsoftware.com/wiki/Vocabulary/quote "Vocabulary/quote") for details on the interpretation of n.

3\. The [Constant Functions](https://code.jsoftware.com/wiki/Vocabulary/zeroco "Vocabulary/zeroco") 0: ... 9:, \_1: ... \_9: and \_:, are equivalent to the (")-created verbs: 0"\_ ... 9"\_, \_1"\_ ... \_9"\_ and \_"\_

---
