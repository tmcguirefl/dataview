# Vocabulary/bdot - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/bdotu "Vocabulary/bdotu") [<<](https://code.jsoftware.com/wiki/Vocabulary/acapdot "Vocabulary/acapdot")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/dbdotn.htm "jdic:dbdotn")

<table class="wikitable"><tbody><tr><td><tt>(m b.) y</tt></td><td><tt>x (m b.) y</tt></td><td>Boolean/Bitwise/Bitwise Shift</td><td>Adverb</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank_~ "Vocabulary/RankInfo") _\-- operates on \[x and\] y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Creates a [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") to perform logic on the bit(s) of y (and x, if present).

The [operand](https://code.jsoftware.com/wiki/Vocabulary/AET#Operand "Vocabulary/AET") m (an [integer](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Integer "Vocabulary/Glossary")) selects the appropriate logic to apply, according to this table:

<table class="wikitable"><tbody><tr><td><b>For <tt>m</tt> ...</b></td><td><b>The value of <tt>x</tt> must fit in:</b></td><td><b>The value of <tt>y</tt> must fit in:</b></td><td><b>Action</b></td></tr><tr><td>_16 to _1</td><td>boolean</td><td>boolean</td><td>(same as <tt>m+16</tt>)</td></tr><tr><td>0 to 15</td><td>boolean</td><td>boolean</td><td>logical function: <tt>x F y</tt></td></tr><tr><td>16 to 31</td><td>integer</td><td>integer</td><td>bitwise logical function: <tt>x L y</tt></td></tr><tr><td>32</td><td>integer</td><td>integer</td><td>left-rotate bits of <tt>y</tt> by <tt>x</tt> positions</td></tr><tr><td>33</td><td>integer</td><td>integer</td><td>(unsigned) left-shift bits of <tt>y</tt> by <tt>x</tt> positions</td></tr><tr><td>34</td><td>integer</td><td>integer</td><td>(signed) left-shift bits of <tt>y</tt> by <tt>x</tt> positions</td></tr></tbody></table>

**Notes on the above table:**

-     -   ([monad](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Monad "Vocabulary/Glossary"), allowed when 0≤m<32) (m b.) y is the same as ([dyad](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Dyad "Vocabulary/Glossary")) 0 (m b.) y with x=0
      -   To shift (or rotate) _right_ instead of _left_, use a negative value for x
      -   Left shift [fills](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Fill "Vocabulary/Glossary") the vacated positions with 0
      -   (Unsigned) right shift [fills](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Fill "Vocabulary/Glossary") the vacated positions with 0
      -   (Signed) right shift [fills](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Fill "Vocabulary/Glossary") the vacated positions by the value (0|1) of the sign bit.
```
The following table lists all the possible boolean functions:
                         m 	    	Ravelled Table  	    	Function
0 		\_16 		16 		0 0 0 0 		0
1 		\_15 		17 		0 0 0 1 		x \*. y
2 		\_14 		18 		0 0 1 0 		x > y
3 		\_13 		19 		0 0 1 1 		x
4 		\_12 		20 		0 1 0 0 		x < y
5 		\_11 		21 		0 1 0 1 		y
6 		\_10 		22 		0 1 1 0 		x ~: y
7 		\_9 		23 		0 1 1 1 		x +. y
8 		\_8 		24 		1 0 0 0 		x +: y
9 		\_7 		25 		1 0 0 1 		x = y
10 		\_6 		26 		1 0 1 0 		-. y
11 		\_5 		27 		1 0 1 1 		x >: y
12 		\_4 		28 		1 1 0 0 		-. x
13 		\_3 		29 		1 1 0 1 		x <: y
14 		\_2 		30 		1 1 1 0 		x \*: y
15 		\_1 		31 		1 1 1 1 		1
  	                        32 				        rotate
  	                        33 				        shift
  	                        34 				        signed shift

```

**Examples:**

1\. Create the _logical function_ of x and y which has its _truth table_ encoded by the number m=2

```
   xandnoty =: 2 b.         NB. m=2 gives logical function: (x and not-y)
   0 1 0 1 xandnoty 0 0 1 1
0 1 0 0

```

**Note\[1\]:** To encode the _truth table_ t into an [integer](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Integer "Vocabulary/Glossary") m, ravel t and treat it as a binary [numeral](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Numeric "Vocabulary/Glossary")

```
   \] t=: 2 2 $ 0 0 1 0      NB. sample truth table: (x and not-y)
0 0
1 0

   \] m=: #. , t             NB. encode truth table t into an integer m
2

   \] m=: 2b0010             NB. or write m directly in base 2
2

   \] m=: 2b10010            NB. add 16 for the bitwise verbs
18

```

**Note\[2\]:** To verify the _truth table_ corresponding to a given choice of [integer](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Integer "Vocabulary/Glossary") m, use table to show truth table of the created logical function

```
   \] m =: 2b0010            NB. ravel of desired truth table: 0 0 ,: 1 0
2
   xandnoty =: m b.         NB. create corresponding logical fn

   0 1 xandnoty table 0 1
+--------+---+
|xandnoty|0 1|
+--------+---+
|0       |0 0|
|1       |1 0|
+--------+---+

```

table is a

-   [Standard Library](http://www.jsoftware.com/help/user/library.htm) word(s) residing in the 'z'-locale
-   Defined in the factory script stdlib.ijs which is located in  ~system/main/stdlib.ijs-   View the definition(s) in a JQt session by entering:  open '~system/main/stdlib.ijs'

2 Create a _bitwise logical function_ (here, **x and not-y**) that independently combines corresponding bits of x and y

```
   xandnotybw =: 18 b.              NB. (m=16+2) same as (m=2) but combines integers x and y bitwise
   showbin =: '01' {~ (32#2)&#:     NB. verb to display (list of) integers as (table of) bits

   showbin 12 5 , (12 xandnotybw 5)
00000000000000000000000000001100
00000000000000000000000000000101
00000000000000000000000000001000

```

3\. Create a [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") to perform _rotate left_ or _shift left_ on the bits of [integer](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Integer "Vocabulary/Glossary") y

```
   y=: \_12345                       NB. non-trivial bit pattern with sign-bit set to 1
   showbin y , 4 (32 b.) y          NB. (m=32) - rotate left 4 places
11111111111111111100111111000111
11111111111111001111110001111111
   showbin y , \_4 (33 b.) y         NB. (m=33) unsigned shift-right 4 places
11111111111111111100111111000111
00001111111111111111110011111100
   showbin y , \_4 (34 b.) y         NB. signed shift-right 4 places
11111111111111111100111111000111
11111111111111111111110011111100

```

**Note:** shift-right 4 places is: shift-left \_4 places.

---

### Common Uses

1\. Construct a logical verb (e.g. **xor**) from its truth table

but **xor** already has a J primitive: ~: . See below: More Information \[1\])

```
   \] m =: 2b0110            NB. from ravel of desired truth table: 0 1 ,: 1 0
6
   xor =: m b.              NB. create corresponding logical fn

   0 1 xor table 0 1        NB. verify truth table of xor
+---+---+
|xor|0 1|
+---+---+
|0  |0 1|
|1  |1 0|
+---+---+

```

2\. Find the largest power of 2 that divides a given number, e.g. 448

```
   (17 b. -) 448                    NB. y BITWISE\_AND (-y) gives the required result
64

```

3\. Implement CRC polynomials using bit-shifting.

---

### More Information

1\. Every logical function has an equivalent J [primitive.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Primitive "Vocabulary/Glossary")

<table class="wikitable"><tbody><tr><td><b><tt>m</tt></b></td><td><b>Equivalent</b></td><td><b><tt>m</tt></b></td><td><b>Equivalent</b></td><td><b><tt>m</tt></b></td><td><b>Equivalent</b></td><td><b><tt>m</tt></b></td><td><b>Equivalent</b></td></tr><tr><td>0</td><td><tt>0"0</tt></td><td>4</td><td><tt>x &lt; y</tt></td><td>8</td><td><tt>x +: y</tt> (NOR)</td><td>12</td><td><tt>-. x</tt></td></tr><tr><td>1</td><td><tt>x *. y</tt> (AND)</td><td>5</td><td><tt>y</tt></td><td>9</td><td><tt>x = y</tt> (XNOR)</td><td>13</td><td><tt>x &lt;: y</tt></td></tr><tr><td>2</td><td><tt>x &gt; y</tt></td><td>6</td><td><tt>x ~: y</tt> (XOR)</td><td>10</td><td><tt>-. y</tt></td><td>14</td><td><tt>x *: y</tt> (NAND)</td></tr><tr><td>3</td><td><tt>x</tt></td><td>7</td><td><tt>x +. y</tt> (OR)</td><td>11</td><td><tt>x &gt;: y</tt></td><td>15</td><td>1"0</td></tr></tbody></table>

**Note:** the primitive equivalents are faster than (m b.)

2\. [Operand](https://code.jsoftware.com/wiki/Vocabulary/AET#Operand "Vocabulary/AET") m may be an [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET"), in which case each [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") [cell](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Cell "Vocabulary/Glossary") will be the array of the results of the logical functions specified by m.

---

### Use These Combinations

Combinations using  b. y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Integer reductions on infixes</td><td>integer</td><td><tt>x (17 b.)/\ y</tt></td><td>also <tt>(22 b.) (23 b.) (25 b.)</tt> <small>in place of</small> (17 b.)</td><td><b>much</b> faster than alternatives</td></tr><tr><td>Integer reductions on partitions</td><td>integer</td><td><tt>x (17 b.)//. y</tt></td><td><tt>(22 b.) (23 b.) (25 b.)</tt> <small>in place of</small> <tt>(17 b.)</tt></td><td>avoids building argument cells</td></tr><tr><td>Polynomial Multiplication (bitwise)</td><td>integer</td><td><tt>x (22 b.)//.@(17 b./) y</tt></td><td></td><td>avoids building argument cells</td></tr><tr><td>Bitwise reductions along diagonals</td><td>integer</td><td><tt>(17 b.)//. y</tt></td><td><tt>(22 b.) (23 b.)</tt> <small>in place of</small> <tt>(17 b.)</tt></td><td>avoids building argument cells</td></tr><tr><td>Integer [quotient/]remainder of power of 2</td><td>integer</td><td><tt>x | y</tt></td><td>with <tt>x</tt> a power of 2</td><td>If x is positive, <tt>(-x) 17 b. y</tt> is better to get remainder</td></tr><tr><td>Bitwise reduction and scan</td><td>integer</td><td><tt>x (m b.)/ y</tt><p><tt>m</tt> is 16 to 31</p></td><td><tt>/\</tt> <tt>/\.</tt> <small>in place of</small> <tt>/</tt></td><td>much faster than alternatives</td></tr><tr><td rowspan="2">Bitwise operations on bytes</td><td rowspan="2">byte</td><td><tt>u&amp;.(a.&amp;i.) y</tt></td><td><tt>(u y) -: u"0 y</tt></td><td rowspan="2">avoids conversion to integer</td></tr><tr><td><tt>(m b.)/&amp;.(a.&amp;i.) y</tt><p><tt>x (m b.)&amp;.(a.&amp;i.) y</tt></p></td><td><tt>m</tt> is 16 to 31</td></tr></tbody></table>

---
