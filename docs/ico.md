# Vocabulary/ico - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/icapdot "Vocabulary/icapdot") [<<](https://code.jsoftware.com/wiki/Vocabulary/idot "Vocabulary/idot")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/dico.htm "jdic:dico")

<table class="wikitable"><tbody><tr><td><tt>i: y</tt></td><td>Steps</td></tr></tbody></table>

[Rank 0](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank0var "Vocabulary/RankInfo") _\-- operates on individual atoms of y, producing a result that may require fill --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Like [Integers](https://code.jsoftware.com/wiki/Vocabulary/idot "Vocabulary/idot") (i.), except that the sequence ranges from (\-y) thru (+y).

```
   i: 4
\_4 \_3 \_2 \_1 0 1 2 3 4

   i: \_4
4 3 2 1 0 \_1 \_2 \_3 \_4

```
---
---

### More Information

1\. i: y operates on each [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") of y independently, and produces a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") for each one.

2\. If y is a [complex](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Complex "Vocabulary/Glossary") number _a+bi_ (_a_j_b_ or a j. b in J notation), its imaginary part _b_ gives the number of **steps** between \-a and a i.e. the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") will contain _b+1_ atoms. In this case _a_ may be any number.

3\. If y has no imaginary part or the imaginary part is 0, the size of each step is 1. In this case y must be an even multiple of 0.5 (using [tolerant comparison](https://code.jsoftware.com/wiki/Vocabulary/Glossary#TolerantComp "Vocabulary/Glossary")).

---

<table class="wikitable"><tbody><tr><td><tt>x i: y</tt></td><td>Index Of Last</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank_ix "Vocabulary/RankInfo") _\-- operates on x and y as a whole, by items of x --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Like [Index Of](https://code.jsoftware.com/wiki/Vocabulary/idot#dyadic "Vocabulary/idot") (i.), except that it finds the _last occurrence_ not the _first_.

```
   'abracadabra' i: 'a'
10

   'abracadabra' i: 'abc'   NB. several search terms at once
10 8 4

```

If the [item](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") is not found, the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") is still #x, same as for x i. y.

---

[Index Of](https://code.jsoftware.com/wiki/Vocabulary/idot "Vocabulary/idot") (x i. y)

---

### More Information

1\. x i: y is a member of the [i.-family](https://code.jsoftware.com/wiki/Vocabulary/IFamily "Vocabulary/IFamily").

2\. The [internal rank](https://code.jsoftware.com/wiki/Vocabulary/IFamily "Vocabulary/IFamily") of  x i: y uses [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") whose [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") is the rank of items of x.

3\. If x and y are of different classes, or if their items couldn't possibly match because of differing [shapes](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET"), no error is signaled: each search simply fails to match.

---

### Use These Combinations

Combinations using x i: y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include:

<table class="wikitable"><tbody><tr><td><b>What It Does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td colspan="2"><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Primitives permitted in place of <tt>f</tt></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Find last place where <tt>&nbsp;x f y </tt>is true</td><td rowspan="2"><i>Permitted:</i> Boolean, integer, floating point, byte, symbol (<b>not</b> unicode).<p><br><tt>x</tt> and <tt>y</tt> need not be the same precision.</p></td><td><tt>x (f i: 1:) y</tt></td><td><tt>x i:&amp;1@:f y</tt></td><td><tt>= ~: &lt; &lt;: &gt; &gt;: e.</tt></td><td rowspan="2"><i>Permitted:</i> <tt>(f!.0)</tt> <i>(parentheses obligatory!)</i> to force exact comparison.<p><br>J recognizes FLO <b>only if</b> <tt>f</tt> returns an atom or list.</p></td><td rowspan="2">Avoids computing entire <tt>&nbsp;x f y</tt><p><br><b>Bug warning:</b> if <tt>f</tt> is <tt>e.</tt> it does (<tt>,@e.</tt>) rather than <tt>e.</tt> regardless of ranks of arguments</p></td></tr><tr><td>Find last place where <tt>&nbsp;x f y </tt>is false</td><td><tt>x (f i: 0:) y</tt></td><td><tt>x i:&amp;0@:f y</tt></td><td><tt>= ~: &lt; &lt;: &gt; &gt;: e.</tt></td></tr></tbody></table>

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Find first/last match</td><td></td><td><tt>m&amp;i. y</tt></td><td><tt>i:</tt> <small>in place of</small> <tt>i.</tt> for last match<p><tt>!.0</tt> for exact comparison</p></td><td></td></tr><tr><td>Find index of first/last cell of <tt>y</tt> that does/does not match an <tt>m</tt>-item</td><td></td><td><tt>(e. i. 1:)&amp;m y</tt></td><td><tt>i:</tt> <small>in place of</small> <tt>i.</tt> for last cell<p><tt>0:</tt> for mismatch</p></td><td><b>Bug warning:</b> it does <tt>(,@e.)</tt> rather than <tt>e.</tt></td></tr><tr><td>Find index of first/last occurrence of largest/smallest value</td><td>integer or floating-point list</td><td><tt>(i. &lt;./) y</tt><p><tt>(i. &gt;./) y</tt></p></td><td>or <tt>i:</tt></td><td>it actually does <tt>(i. &gt;.!.0/)</tt> etc.; is faster than <tt>0 ({ /:~) y</tt></td></tr></tbody></table>

---
