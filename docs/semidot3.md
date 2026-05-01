# Vocabulary/semidot3 - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/semico "Vocabulary/semico") [<<](https://code.jsoftware.com/wiki/Vocabulary/semidot1 "Vocabulary/semidot1")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d331.htm "jdic:d331")

<table class="wikitable"><tbody><tr><td><tt>u;.3 y</tt></td><td><tt>u;._3 y</tt></td><td>Max Cubes</td><td>Adverb</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank "Vocabulary/RankInfo") _\-- operates on x and y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

The monad (u;.3)y is a special case of the dyad  x(u;.3)y (see [below](#dyadic)), where x holds the same size for all dimensions, given by  (#$y) $ <./ $y .

This means that y is effectively chopped into squares | cubes | hypercubes of side (<./ $y) –viz. the shortest axis of y– with a displacement by 1 at a time along each axis. (u;.\_3)y works similarly.

Two-dimensional example:

```
   \]y=. 2 5 $ p: i.10             NB. a matrix
 2  3  5  7 11
13 17 19 23 29
   (#$y) $ <./ $y                 NB. dimensions of moving square tile
2 2
   u=. <:                         NB. some verb

```

Case (;.\_3) — concentrating on content:

```
   <"2 \];.\_3 y                    NB. moving one step at a time
+-----+-----+-----+-----+
| 2  3| 3  5| 5  7| 7 11|
|13 17|17 19|19 23|23 29|
+-----+-----+-----+-----+
   <"2 u;.\_3 y                    NB. applying verb after each move
+-----+-----+-----+-----+
| 1  2| 2  4| 4  6| 6 10|
|12 16|16 18|18 22|22 28|
+-----+-----+-----+-----+

```

Case (;.3) — also exploring boundaries:

```
   <"2 \];.3 y                     NB. moving one step at a time
+-----+-----+-----+-----+----+
| 2  3| 3  5| 5  7| 7 11|11 0|
|13 17|17 19|19 23|23 29|29 0|
+-----+-----+-----+-----+----+
|13 17|17 19|19 23|23 29|29 0|
| 0  0| 0  0| 0  0| 0  0| 0 0|
+-----+-----+-----+-----+----+
   <"2 u;.3 y                     NB. verb applied, boundaries left untouched
+-----+-----+-----+-----+----+
| 1  2| 2  4| 4  6| 6 10|10 0|
|12 16|16 18|18 22|22 28|28 0|
+-----+-----+-----+-----+----+
|12 16|16 18|18 22|22 28|28 0|
| 0  0| 0  0| 0  0| 0  0| 0 0|
+-----+-----+-----+-----+----+

```

Monadic (u;.3)y is a special case of dyadic  x(u;.3)y as show these examples, switching from square to rectangular tiles (still moving 1 at a time):

```
   <"2 (2 2) u;.3 y               NB. square tiles give the same result as with the monad
+-----+-----+-----+-----+----+
| 1  2| 2  4| 4  6| 6 10|10 0|
|12 16|16 18|18 22|22 28|28 0|
+-----+-----+-----+-----+----+
|12 16|16 18|18 22|22 28|28 0|
| 0  0| 0  0| 0  0| 0  0| 0 0|
+-----+-----+-----+-----+----+
   <"2 (2 1) u;.3 y               NB. rectangular tiles ('portrait'), displacement 1
+--+--+--+--+--+
| 1| 2| 4| 6|10|
|12|16|18|22|28|
+--+--+--+--+--+
|12|16|18|22|28|
| 0| 0| 0| 0| 0|
+--+--+--+--+--+
   <"2 (1 2) u;.3 y               NB. rectangular tiles ('landscape'), displacement 1
+-----+-----+-----+-----+----+
|1 2  |2 4  |4 6  |6 10 |10 0|
+-----+-----+-----+-----+----+
|12 16|16 18|18 22|22 28|28 0|
+-----+-----+-----+-----+----+

```

The dyad will cater for different forms of the tile as well as displacement (or movement) vectors different from (1 1) implicitly used above.

---

### Common Uses

1\. There are no common uses for (u;.3 y) or (u;.\_3 y) . The verb computed by (u;.3) is invariably used with an actual x-argument. Likewise (u;.\_3).

---

### Use These Combinations

(See [below](#combo), where the corresponding section includes the monadic case.)

---

<table class="wikitable"><tbody><tr><td><tt>x u;.3 y</tt></td><td><tt>x u;._3 y</tt></td><td>Subarrays</td><td>Adverb</td></tr></tbody></table>

[Rank 2 \_](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank2_s "Vocabulary/RankInfo") _\-- operates on tables of x and the entirety of y --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

x(u;.\_3)y applies verb u to each _tile_ of a _regular tiling_ of y specified by x.

**_DEFINITION:_** a _tiling_ of y is a partitioning into smaller arrays, each having the same rank as y.

A _regular_ tiling is one in which all the (completed) tiles have the same shape.

The [results](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") are collected into an [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET").

Uncompleted tiles are discarded, i.e. tiles which spill over the boundary of the array.

(u;.3) is like (u;.\_3), except that the results from uncompleted tiles are **not** discarded.

---

Argument x defines the _tiling_ of y. It needs to specify where each tile starts and finishes.

**_NOTE:_** tiles can overlap. But we can assume:

-   all tiles are the same shape
-   if tiles overlap, they do so regularly
-   the first tile always begins at coordinates (0 0) for a matrix, (0 0 0) for a brick, and so on.

Therefore, as well as the tile shape, all that's needed is to specify the starting-point coordinates of the second tile along the main diagonal of y. This (set of coordinates) is called the _movement vector_, i.e. the displacement needed in each dimension to begin the next tile.

Typically, x has 2 rows:

-   Row 0: the _movement vector_ (explained above)
-   Row 1: the shape of a tile (which is the same for all **completed** tiles)

If x is a list, then it behaves the same as (1,:x)

```
   \]a =. 5 6 $ 'abcdefghijklmnopqrstuvwxyz0123'
abcdef
ghijkl
mnopqr
stuvwx
yz0123

   MovementVector=: 2 2
   TileSize=: 2 4
   \] x=: MovementVector ,: TileSize
2 2
2 4

```

Argument x, as given above, specifies the following manner of tiling the table a

(the _movement vector_ (2 2) specifying the horizontal and vertical displacement necessary to move to the next tile)

[![](https://code.jsoftware.com/mediawiki/images/b/bc/Fig1.jpg)](https://code.jsoftware.com/wiki/File:Fig1.jpg)

Let's use this value of x to Box (<) each tile

```
   u=: <             NB. Box
   tiling\_3=: ;.\_3   NB. discards uncompleted tiles
   tiling3=:  ;.3    NB. includes uncompleted tiles

   x <tiling\_3 a
+----+----+
|abcd|cdef|
|ghij|ijkl|
+----+----+
|mnop|opqr|
|stuv|uvwx|
+----+----+
   x <tiling3 a
+----+----+--+
|abcd|cdef|ef|
|ghij|ijkl|kl|
+----+----+--+
|mnop|opqr|qr|
|stuv|uvwx|wx|
+----+----+--+
|yz01|0123|23|
+----+----+--+

```
---

### Common uses

1\. In image-processing applications, x u;.\_3 y can be used for filtering and convolution:

```
   \]image =. 255 \* 5 5 $ 0 0 1 1 1
0 0 255 255 255
0 0 255 255 255
0 0 255 255 255
0 0 255 255 255
0 0 255 255 255
   \]vsobel =. 3 3 $ \_1 0 1  \_2 0 2  \_1 0 1
\_1 0 1
\_2 0 2
\_1 0 1
   (1 1,:3 3) (+/@:,@:\*)&vsobel;.\_3 image  NB. Convolution with the Sobel operator
1020 1020 0
1020 1020 0
1020 1020 0

```
---

[Infix](https://code.jsoftware.com/wiki/Vocabulary/bslash "Vocabulary/bslash") (\\) — as in: (x u\\ y).

---

### Details

1\. A subarray of y has the same [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") as y.

2\. u **may not** be a [cyclic gerund](https://code.jsoftware.com/wiki/Vocabulary/CyclicGerund "Vocabulary/CyclicGerund").

3\. A negative value in the second row of x causes that [axis](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Axis "Vocabulary/Glossary") to be reversed before u is applied. (The absolute value is used for the length of the axis.)

4\. Values of \_ and \_\_ in the second row of x indicate the full length of the corresponding axis.

5\. If x is a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET"), it gives the shape of the subarrays, and a spacing vector of all 1s is used. If x is an [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET"), it is treated as a 1-atom list.

6\. When the spacing vector is 1, u is applied at each possible starting position.

7\. If there is only one axis of motion, x u;.\_3 y is the same operation as x u\\ y. _Exception:_ if the length x is 0, 0 u\\ y has one more (empty) item in the result than 0 u;.\_3 y.

8\. If an atom in the spacing vector is 0, only position 0 is used for that axis.

9\. Bug: if a length in x exceeds the length of the corresponding axis, the length of that axis in the result of u;.\_3 should be x but in fact is the length of the axis.

---

### Oddities

1\. Even if only one starting position in an [axis](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Axis "Vocabulary/Glossary") is possible (because the spacing vector is 0 or the [shape](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET") is \_ for the axis), the axis still appears in the shape of the result (in the frame of the result-cells). This is different from the treatment of omitted axes in  x u;.1 y.

2\. Trailing omitted axes (i. e. axes of y that are beyond the last column of x) are taken in full and **do not** appear in the frame of the result-cells.

---

### Use These Combinations

Combinations using x ;.3 y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Operations on subarrays</td><td>list or table</td><td><tt>u;.3 y</tt><p><tt>x u;.3 y</tt></p></td><td><tt>;._3</tt> <small>in place of</small> <tt>;.3</tt></td><td>avoids building cell indexes. Apply <tt>;.3 _3</tt> at rank 2 or lower</td></tr></tbody></table>

---
