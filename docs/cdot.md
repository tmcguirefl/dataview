# Vocabulary/cdot - J Wiki

From J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/ccapdot "Vocabulary/ccapdot") [<<](https://code.jsoftware.com/wiki/Vocabulary/bdot "Vocabulary/bdot")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc")

<table class="wikitable"><tbody><tr><td><tt>x c. y</tt></td><td>Convert to Precision</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank "Vocabulary/RankInfo") _\-- operates on x and y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Convert y to the [precision](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Precision "Vocabulary/Glossary") x.

```
   9!:11 (30)
   o. 1         NB. π to double precision (~14 'safe' digits)
3.14159265358979311599796346854
   o. 11 c. 1   NB. π to double-double precision (~27 'safe' digits)
3.14159265358979323846264338289

```

The x argument specifies the [precision](https://code.jsoftware.com/wiki/Vocabulary/NumericPrecisions "Vocabulary/NumericPrecisions") of the result, i. e. (x -: 3!:0 x c. y).

---

### Common uses

1\. Use a [precision](https://code.jsoftware.com/wiki/Vocabulary/FramingFill#The_Type_And_Precision_Of_The_Overall_Result "Vocabulary/FramingFill") other than the default.

2\. Get Fill Atom of the given type. Converting an empty array to the given type and accessing its first element produces the Fill Atom.

```
   NB. Fill Atom for integers is zero by default.
   {. 4 c. ''
0
   > 1 2 ; 3
1 2
3 0
   NB. For boxed type, it is equivalent to a: (empty box).
   {. 32 c. ''
++
||
++

```
---
