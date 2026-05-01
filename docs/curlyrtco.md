# Vocabulary/curlyrtco - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/quote "Vocabulary/quote") [<<](https://code.jsoftware.com/wiki/Vocabulary/curlyrtdot "Vocabulary/curlyrtdot")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d532.htm "jdic:d532")

<table class="wikitable"><tbody><tr><td><tt>}:</tt></td><td>Curtail</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank_iy "Vocabulary/RankInfo") _\-- operates on x and y as a whole, by items of y --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Drops the last [item](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") from y

```
   }: 'abc'
ab

```
---

### Common Uses

1\. Remove the last [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") from a list.

Drop unwanted final LF from otherwise convenient [noun](https://code.jsoftware.com/wiki/Vocabulary/AET#Noun "Vocabulary/AET") definition

```
   V=: 0 : 0
abc
def
ghi
)
   <V           NB. See the (non-printable) LF at the end of the boxed string
+------------+
|abc def ghi |
+------------+
   <}: V        NB. Delete it
+-----------+
|abc def ghi|
+-----------+

```

2\. Remove the last row from a [table](https://code.jsoftware.com/wiki/Vocabulary/AET#Table "Vocabulary/AET")

```
   \]t =: \_2 \]\\ 'Fred';20;'John';50;'Total';70
+-----+--+
|Fred |20|
+-----+--+
|John |50|
+-----+--+
|Total|70|
+-----+--+
   }: t
+----+--+
|Fred|20|
+----+--+
|John|50|
+----+--+

```

3\. Applied at [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") 1, remove the last [item](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") from each row of a [table](https://code.jsoftware.com/wiki/Vocabulary/AET#Table "Vocabulary/AET")

```
   }:"1 i. 3 3
0 1
3 4
6 7

```
---

[Head](https://code.jsoftware.com/wiki/Vocabulary/curlylfdot "Vocabulary/curlylfdot") ({. y), [Behead](https://code.jsoftware.com/wiki/Vocabulary/curlyrtdot "Vocabulary/curlyrtdot") (}. y), [Tail](https://code.jsoftware.com/wiki/Vocabulary/curlylfco "Vocabulary/curlylfco") ({: y)

---

### More Information

0\. A video lab has been produced for the Curtail monadic verb in both the JHS and jqt formats. The video can be viewed here in its complete form [Curtail monadic verb complete video](https://www.youtube.com/watch?v=p_YsvMMaJW8) or as components [Curtail monadic verb Part 1](https://www.youtube.com/watch?v=Uy2dXBNHJgI) and [Curtail monadic verb Part 2](https://www.youtube.com/watch?v=r_D3Wog34AA)

1\.  }:y is identical to  \_1}.y .

---

### Details

1\. The [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") of  }:y is the same as the rank of y unless y is an [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET"), in which case  }:y is an [empty](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Empty "Vocabulary/Glossary") [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") (with the same [type](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Type "Vocabulary/Glossary") as y).

2\. If y has no [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") then  }:y is the same as y .

---
