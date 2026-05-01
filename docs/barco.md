# Vocabulary/barco - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/dot "Vocabulary/dot") [<<](https://code.jsoftware.com/wiki/Vocabulary/bardot "Vocabulary/bardot")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d232.htm "jdic:d232")

<table class="wikitable"><tbody><tr><td><tt>|: y</tt></td><td>Transpose</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank "Vocabulary/RankInfo") _\-- operates on x and y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Reverses the [axes](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Axis "Vocabulary/Glossary") of an [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") y

```
   ii=: \] {. \[: i. 10 #~ #   NB. utility verb: make self-indexing array
   \]y=: ii 2 3 4             NB. sample value of shape: 2 3 4
  0   1   2   3
 10  11  12  13
 20  21  22  23

100 101 102 103
110 111 112 113
120 121 122 123
   $ y
2 3 4
   $ |:y
4 3 2

   |:y
 0 100
10 110
20 120

 1 101
11 111
21 121

 2 102
12 112
22 122

 3 103
13 113
23 123

```
---

### Common uses

Transpose a 2D [matrix](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Matrix "Vocabulary/Glossary")

```
   \]z=: 2 3 $ 'abcdef'   NB. sample mx of shape: 2 3
abc
def
   |:z
ad
be
cf

```
---

<table class="wikitable"><tbody><tr><td><tt>x |: y</tt></td><td>Rearrange Axes</td></tr></tbody></table>

[Rank 1 \_](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank1_s "Vocabulary/RankInfo") _\-- operates on lists of x and the entirety of y --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Rearranges the [axes](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Axis "Vocabulary/Glossary") of an [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") y.

-   (x is an atom) — the axis having index x becomes the new last axis
-   (x is a list) — the axes having indices x become the new last axes.
```
   ii=: \] {. \[: i. 10 #~ #   NB. utility verb: make self-indexing array
   \]y =: ii 2 3 4
  0   1   2   3
 10  11  12  13
 20  21  22  23

100 101 102 103
110 111 112 113
120 121 122 123

   0 |: y          NB. Move axis 0 to end. Old axes 1 and 2 become new axes 0 and 1
 0 100
 1 101
 2 102
 3 103

10 110
11 111
12 112
13 113

20 120
21 121
22 122
23 123

   $y
2 3 4
   $ 0 |: y        NB. New shape shows original axis 0 (size=2) is now the last axis
3 4 2

```

Repeat with a higher-rank y

```
   $ y=: ii 2 3 4 5 6
2 3 4 5 6

   x =: 2 1        NB. axes with sizes 4 and 3 respectively become the last axes
   $ x |: y
2 5 6 4 3

```
---

### More Information

1.  Use [a special form](https://code.jsoftware.com/wiki/Vocabulary/Idioms#Extract_The_Diagonal_Of_A_Table "Vocabulary/Idioms") of x in  x |: y to _extract the diagonal_ of [matrix](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Matrix "Vocabulary/Glossary") y
```
   \] y =: 4 4 $ 'abcdefghijklmnop'
abcd
efgh
ijkl
mnop
   x =: < 0 1
   x |: y
afkp

```
---

### More Uses

1.  To cause the [cells](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Cell "Vocabulary/Glossary") of a [noun](https://code.jsoftware.com/wiki/Vocabulary/AET#Noun "Vocabulary/AET") to correspond to a desired computation.

Reordering the [axes](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Axis "Vocabulary/Glossary") of an [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") has two effects:

-   The [index](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Index "Vocabulary/Glossary") [lists](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") used to refer to [atoms](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") and [cells](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Cell "Vocabulary/Glossary") are correspondingly reordered;
-   The axes that make up the cells are changed.

The best way to understand reordering is to assign a meaning to each [axis.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Axis "Vocabulary/Glossary") For example we could have an array data of information for a school district. The axes could have the following meanings:

axis 0 - the school  
axis 1 - grade level  
axis 2 - sex of students  
axis 3 - core subject  
axis 4 - a list of information for a given combination of school/grade/sex/subject

Each axis has associated with it an interpretation of the [index](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Index "Vocabulary/Glossary") of that axis, which might look like

```
SCHOOLS =: 'Ridgemont High';'Valley High';'Eastgate High'
GRADES =: 9;10;11;12
SEX =: 'M';'F'
SUBJECT =: 'Math';'Science';'English';'History';'Language'
INFO =: 'Number of students';'25th pctile grade';'50th pctile grade';'75th pctile grade'
NB. Create a data table where each atom shows its index list
data =: }:@;@:((,&'\_') each) each { {.@;:@": every each SCHOOLS;GRADES;SEX;SUBJECT;<INFO

```

With this setup, (<1 1 0 2 3) { data would be the 75th-pctile English grade for 10th-grade boys at Valley High.

```
   (<1 1 0 2 3) { data
+------------------------+
|Valley\_10\_M\_English\_75th|
+------------------------+

```

Each arrangement of axes makes some computations easier than others. It is easy to compute results that correspond to **[cells](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Cell "Vocabulary/Glossary")** of a noun. Here, the 1-cell is the information line. It would be easy to compute a statistic on each combination of school/grade/sex/subject.

It would also be easy to calculate a [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") for each combination of school/grade/sex, using all the subject data for that combination, because the subject information makes up the 2-cells of data.

```
   (<1 1 0) { data   NB. A single 2-cell
+---------------------------+-------------------------+-------------------------+-------------------------+
|Valley\_10\_M\_Math\_Number    |Valley\_10\_M\_Math\_25th    |Valley\_10\_M\_Math\_50th    |Valley\_10\_M\_Math\_75th    |
+---------------------------+-------------------------+-------------------------+-------------------------+
|Valley\_10\_M\_Science\_Number |Valley\_10\_M\_Science\_25th |Valley\_10\_M\_Science\_50th |Valley\_10\_M\_Science\_75th |
+---------------------------+-------------------------+-------------------------+-------------------------+
|Valley\_10\_M\_English\_Number |Valley\_10\_M\_English\_25th |Valley\_10\_M\_English\_50th |Valley\_10\_M\_English\_75th |
+---------------------------+-------------------------+-------------------------+-------------------------+
|Valley\_10\_M\_History\_Number |Valley\_10\_M\_History\_25th |Valley\_10\_M\_History\_50th |Valley\_10\_M\_History\_75th |
+---------------------------+-------------------------+-------------------------+-------------------------+
|Valley\_10\_M\_Language\_Number|Valley\_10\_M\_Language\_25th|Valley\_10\_M\_Language\_50th|Valley\_10\_M\_Language\_75th|
+---------------------------+-------------------------+-------------------------+-------------------------+

```

To operate on such a [cell](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Cell "Vocabulary/Glossary") you would have

```
   subjinfoverb =: verb define
NB. y is a 5x4 table of info for each subject
...
)
   school\_grade\_sex =: subjinfoverb"2 data   NB. Compute for each combination of school/grade/sex

```

But it would **not** be easy to compute something for every combination of school/grade/subject. That information is spread across cells.

This is where reordering the axes comes in. To do a computation for each school/grade/subject, make those axes the leading axes of the array, leaving sex/info as the last 2 axes. Then each 2-cell will have all the information for a single combination of school/grade/subject.

```
   $data   NB. Data array, school/grade/sex/subject/info
3 4 2 5 4
   $ 0 1 3 2 4 |: data  NB. school/grade/subject/sex/info
3 4 5 2 4
   $ 2 4 |: data  NB. alternate form
3 4 5 2 4
   (<1 1 0) { 2 4 |: data   NB. A single 2-cell of the reshaped data
+-----------------------+---------------------+---------------------+---------------------+
|Valley\_10\_M\_Math\_Number|Valley\_10\_M\_Math\_25th|Valley\_10\_M\_Math\_50th|Valley\_10\_M\_Math\_75th|
+-----------------------+---------------------+---------------------+---------------------+
|Valley\_10\_F\_Math\_Number|Valley\_10\_F\_Math\_25th|Valley\_10\_F\_Math\_50th|Valley\_10\_F\_Math\_75th|
+-----------------------+---------------------+---------------------+---------------------+

```

As illustrated in the last example, you don't have to give the entire list of axes. The axes you specify are moved to be the last axes of the result.

```
   sexinfoverb =: verb define
NB. y is a 2x4 table of info for each sex
...
)
   school\_grade\_subject =: sexinfoverb"2 (0 1 3 2 4) |: data   NB. Compute for each combination of school/grade/sex

```

Any index list into the transposed array must be transposed accordingly. If you needed to get to that 75th-pctile English grade for 10th-grade boys at Valley High, the index list into the transposed array would be (<1 1 2 0 3)

```
   (<1 1 2 0 3) { 2 4 |: data
+------------------------+
|Valley\_10\_M\_English\_75th|
+------------------------+

```
---
