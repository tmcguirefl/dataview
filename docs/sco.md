# Vocabulary/sco - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/scapco "Vocabulary/scapco") [<<](https://code.jsoftware.com/wiki/Vocabulary/rdot "Vocabulary/rdot")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/dsco.htm "jdic:dsco")

<table class="wikitable"><tbody><tr><td><tt>s: y</tt></td><td>Symbol</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank "Vocabulary/RankInfo") _\-- operates on x and y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

A [symbol](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Symbol "Vocabulary/Glossary") is an [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") of a special [type](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Type "Vocabulary/Glossary") that stands for a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") of [characters.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Character "Vocabulary/Glossary") A symbol is an alternative to a [boxed](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boxed "Vocabulary/Glossary") [string.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#String "Vocabulary/Glossary")

Symbols are created by  s: y

```
   s: <'New string'
\`New string
   s: 'XOM';'AAPL'
\`XOM \`AAPL

```

Creating a symbol causes its [character](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Character "Vocabulary/Glossary") [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") to be registered in the _global symbol table_ (GST). The symbol itself is an index into the GST.

A [character](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Character "Vocabulary/Glossary") [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") is stored only once in the GST. Repeated [execution](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Execution "Vocabulary/Glossary") of  s: y will return the [index](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Index "Vocabulary/Glossary") of the previously-created entry in the GST.

---

### Common Uses

[Symbols](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Symbol "Vocabulary/Glossary") are used in place of [boxed](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boxed "Vocabulary/Glossary") [character](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Character "Vocabulary/Glossary") [lists.](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET")

This is not to say that the two are interchangeable (symbols cannot be joined to or meaningfully compared with boxed character lists). But each is an [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") representing a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") of [characters.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Character "Vocabulary/Glossary") The difference is that operations on symbols are faster, especially searches and comparisons.

Symbols can be used in _structural_ [verbs](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") (like x $ y and \# y), _selection_ verbs (like x { y and x # y), and _relational_ verbs (like /:~ y and x < y). They cannot be used in _arithmetic_ verbs (like x + y).

Symbols are best used when a limited number of strings appear repeatedly. Stock ticker symbols are a good example.

1\. Look up a [character](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Character "Vocabulary/Glossary") [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") in a [table](https://code.jsoftware.com/wiki/Vocabulary/AET#Table "Vocabulary/AET") of character lists

```
   table =: s: 'alpha';'bravo';'charlie';'delta';'echo';'foxtrot'
   table i. s: <'bravo'
1
   |. table
\`foxtrot \`echo \`delta \`charlie \`bravo \`alpha
   (|. table)  i. s: <'bravo'
4

```

2\. Find the insertion point for a new symbol

```
   table +/@:< s: <'ff'   NB. comes before 'foxtrot'
5

```
---

### More Information

1\. [Symbols](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Symbol "Vocabulary/Glossary") may be compared (except for equality) only against other symbols. The rules for [sorting order](https://code.jsoftware.com/wiki/Vocabulary/slashco#sortorder "Vocabulary/slashco") apply.

```
   table +/@:< s: <'ff'
5

```

2\. s: y accepts other formats for y than [boxed](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boxed "Vocabulary/Glossary") [character](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Character "Vocabulary/Glossary") [lists.](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET")

[Argument](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET") y can be a character list, in which case the first character is used as a delimiter. The [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") is the same as for s:@<;.\_1 y (see [Intervals](https://code.jsoftware.com/wiki/Vocabulary/semidot1 "Vocabulary/semidot1"))

```
   s: ' a b c'
\`a \`b \`c
   s: 'a b c'   NB. DON'T do this: first char is delimiter
\` b c

```

3\. Or  y can be a [table](https://code.jsoftware.com/wiki/Vocabulary/AET#Table "Vocabulary/AET") of [characters.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Character "Vocabulary/Glossary") Each row is a character list, **but** trailing blanks are removed before entering the list in the GST

```
   \]chartable =: 'one','two',:'three'
one
two
three
   s: chartable   NB. trailing blanks removed
\`one \`two \`three

```

4\. When a [symbol](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Symbol "Vocabulary/Glossary") is put into external form by (": y) or by the display of [results](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary"), it is represented by the \` character followed by the character list represented by the symbol

```
   s: 'one';'three';'two'
\`one \`three \`two

```

5\. It can be more ergonomic to programmatically name each symbol so as to avoid reconstructing it each time that it is used for lookup or comparison:

```
   \]V=: (N)=: s: N=:' Smith Cooper Kline'
\`Smith \`Cooper \`Kline
   V i. Kline
2
   Kline
\`Kline

```

Here each space-delimited name within N is assigned to its own symbol using [indirect assignment](https://code.jsoftware.com/wiki/Vocabulary/Assignment#IndirectAssignment "Vocabulary/Assignment").

---

### Details

1\. The GST is a global resource for J. Any user of  s: y adds to the shared symbol table. There is no way to delete items from the GST once they have been defined.

This suggests that symbols are most useful when the set of symbols is known and unchanging.

2\. Sorting and comparison are defined for symbols, but x I. y is not.

---

<table class="wikitable"><tbody><tr><td><tt>x s: y</tt></td><td>Symbol</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank "Vocabulary/RankInfo") _\-- operates on x and y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

A collection of [verbs](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") for working with symbol sets (see [above](#monadic)). The choice of verb is determined by the values of x and y.

For details, see the [Entry in the J Dictionary](https://www.jsoftware.com/help/dictionary/dsco.htm "jdic:dsco") for s: .

---

### Common uses

Perform housekeeping operations on the global symbol set, including saving and restoring it in a new J [session](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Session "Vocabulary/Glossary").

---
