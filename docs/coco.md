# Vocabulary/coco - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/comma "Vocabulary/comma") [<<](https://code.jsoftware.com/wiki/Vocabulary/codot "Vocabulary/codot")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d312.htm "jdic:d312")

---

<table class="wikitable"><tbody><tr><td><tt>u&nbsp;:: v</tt></td><td><tt>u&nbsp;:: n</tt></td><td>Adverse</td><td>Conjunction</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank_~ "Vocabulary/RankInfo") _\-- operates on \[x and\] y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Provides an alternative [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") v to be run if the verb u fails  
If the right operand of :: is a noun n, it is equivalent to the constant verb (n"\_) which ignores its arguments and produces the result n.

```
   (+/ % #) :: 'bad data'   i.8       NB. average the integers 0 to 7 inclusive
3.5

   (+/ % #) :: 'bad data'   'string'  NB. cannot add characters this way.
bad data

```

[Whitespace](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Whitespace "Vocabulary/Glossary") must separate verbA from ::

Otherwise J thinks the :: [inflects](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Inflection "Vocabulary/Glossary") verbA:: .

```
   verbA:: verbB
|spelling error
|   verbA:: verbB
|   ^

   verbA :: verbB
verbA ::verbB

   (+/ % #):: ('bad data'"\_)   i.8
|spelling error
|   (+/ % #):: ('bad data'"\_)   i.8
|          ^

```
---

### Common uses

1\. Adverse can simplify opening a file or database for append access

```
   Open :: Create filename

```

2\. Default ;:y to y in the case that [noun](https://code.jsoftware.com/wiki/Vocabulary/AET#Noun "Vocabulary/AET") y causes an error with (;:).

Used e.g. in: erase (~system/main/stdlib.ijs) and coinsert (~system/main/colib.ijs).-~

erase and coinsert are

-   [Standard Library](http://www.jsoftware.com/help/user/library.htm) word(s) residing in the 'z'-locale
-   Defined in the factory script stdlib.ijs which is located in  ~system/main/stdlib.ijs-   View the definition(s) in a JQt session by entering:  open '~system/main/stdlib.ijs'
```
   ;: '''alpha'
|open quote
|   'alpha
|   ^
|       ;:'''alpha'

   (;: :: \]) '''alpha'
'alpha

```

3\. Close existing form (no longer needed), or continue (without error) if no existing form is present

```
wd :: 0: 'psel fm; pclose'

```

wd (the standard GUI interface) is a cover verb for the [Foreign](https://code.jsoftware.com/wiki/Vocabulary/bangco "Vocabulary/bangco") (11!:0) in J6.02

---

### Details

1\. Debugging is turned off (including stops) during the execution of u.

---
