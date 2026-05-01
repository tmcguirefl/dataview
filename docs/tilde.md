# Vocabulary/tilde - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/tildem "Vocabulary/tildem") [<<](https://code.jsoftware.com/wiki/Vocabulary/dollarco "Vocabulary/dollarco")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d220v.htm "jdic:d220v")

<table class="wikitable"><tbody><tr><td><tt>u~ y</tt></td><td>Reflex</td><td>Adverb</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank "Vocabulary/RankInfo") _\-- operates on x and y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

(u~ y) is the same as (y u y)

u is executed as a [dyad](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Dyad "Vocabulary/Glossary") with x=y

```
   +~ 1 2 3
2 4 6

   y=. 6 3 2
   y +/ .\* y         NB. computing the dot product of y and itself
49
   %: y +/ .\* y      NB. taking the square root to get the vector length
7
   %: +/ .\*~ y       NB. omitting left argument by using Reflex on verb (+/ .\*)
7

                     NB. Source of this gem: \[Jchat\] 'One day ...', Raul Miller, 2017-12-11
   \*/^~1+i.5x        NB. using (^~) instead of (\]^\])
86400000
   24\*60\*60\*1000     NB. one day (in millisecs)
86400000

```
---

### Common uses

1\. Produce an operator [table](https://code.jsoftware.com/wiki/Vocabulary/AET#Table "Vocabulary/AET")

avoids having to specify the same [noun](https://code.jsoftware.com/wiki/Vocabulary/AET#Noun "Vocabulary/AET") as both left and right [arguments](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET")

```
   \*/~ i.10   NB. instead of: (i.10) \*/ (i.10)
0 0  0  0  0  0  0  0  0  0
0 1  2  3  4  5  6  7  8  9
0 2  4  6  8 10 12 14 16 18
0 3  6  9 12 15 18 21 24 27
0 4  8 12 16 20 24 28 32 36
0 5 10 15 20 25 30 35 40 45
0 6 12 18 24 30 36 42 48 54
0 7 14 21 28 35 42 49 56 63
0 8 16 24 32 40 48 56 64 72
0 9 18 27 36 45 54 63 72 81

```

2\. Sort an [array.](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET")

Sort x /: y is defined as sorting x into the order specified by y. To sort an array into ascending (or descending) order, x and y must be the same, so use /:~ or \\:~

```
   /:~ 3 1 4 1 5 9 2 6 5 3 5
1 1 2 3 3 4 5 5 5 6 9
   \\:~ 2 7 1 8 2 8 1 8 2 8 4
8 8 8 8 7 4 2 2 2 1 1

```

3\. Self-classify.

To find the sets of identical [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET"), use i.~ y which looks for each item of y within y itself. The [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") will split y into classes of identical [values:](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary")

```
   pi =: 3 1 4 1 5 9 2 6 5 3 5   NB. A list

   \]classes =: i.~ pi  NB. a class for each item
0 1 2 1 4 5 6 7 4 0 4
   pi ,: classes    NB. classes shown beneath items
3 1 4 1 5 9 2 6 5 3 5
0 1 2 1 4 5 6 7 4 0 4

```

4\. Apply u on sets of identical items of y. Use u/.~ y which applies u to each set of identical items. One thing you could do is count them:

```
   pi =: 3 1 4 1 5 9 2 6 5 3 5
   (~. pi) ,: #/.~ pi  NB. Show counts beneath the unique values
3 1 4 5 9 2 6
2 2 1 3 1 1 1

```
---

<table class="wikitable"><tbody><tr><td><tt>x u~ y</tt></td><td>Passive</td><td>Adverb</td></tr></tbody></table>

[Rank](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#ranku "Vocabulary/RankInfo") _\-- depends on the rank of u --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Swaps the [arguments](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET") of a [dyad.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Dyad "Vocabulary/Glossary") Thus, x u~ y is the same as y u x .

```
   3 - 4
\_1
   3 -~ 4        NB. arguments are swapped
1
   3 -~~ 4       NB. reverting to previous state of affairs with (u~)~
\_1

   7 |~ 2        NB. 7 modulo 2
1

```

x u~ y is never necessary, since you can achieve the same effect with parentheses, but it can make code shorter or easier to read

```
   \] digits=. (48 + i. 10) { a.     NB. calling From
0123456789
   \] digits=. a. {~ 48 + i. 10      NB. same, using Passive
0123456789

   i. 11
0 1 2 3 4 5 6 7 8 9 10
   (i. 11) % 10              NB. defining 10 equally spaced sections in interval \[0;1\],
0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1
   10 %~ i. 11               NB. getting rid of parentheses using Passive,
0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1
   10 %~ i. >: 10            NB. reducing to same argument,
0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1
   (%~ \[: i. >:) 10          NB. argument "factored out"
0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1

```
---

### Common uses

1\. x u~ y will save parentheses if you would need parentheses around y in y u x.

```
   boxedline =: <'A line of text'
   (> boxedline) , CRLF  NB. Unbox text and append CRLF
A line of text

   CRLF ,~ > boxedline   NB. Same effect without parentheses
A line of text


```

2\. u~ can avoid the use of \[ and \] in tacit forms:

```
   5 (+:@\[ + \]) 10   NB. Double x and add to y
20
   5 (+~ +:)~ 10   NB. Same without \[\]
20

```

3\. J style is for dyads to accept "data" as y, with "control information" as x. x u~ y can be used if a [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") is mis-specified, or if you want the other order. Examples of J primitives that are backwards for historical reasons are %, e., \-, and \-.

```
   'abcde' i. 'ef'   NB. Find index of y in x
4 5
   'abcde' e.~ 'ef'  NB. is y in x?
1 0

```

Another exception from the rule is Sort (x /: y) which expects the "data" as x and the sort order ("control information") as y; where that seems inconvenient one may use (x /:~ y) to sort y into the order specified by x.

4\. /:~~ is a cute trick:

-   the [monad](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Monad "Vocabulary/Glossary") /:~~y is equivalent to y /: y, i.e. it sorts y
-   the [dyad](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Dyad "Vocabulary/Glossary") x /:~~ y is equivalent to x /: y, i.e. it sorts x into the order specified by y .
---
