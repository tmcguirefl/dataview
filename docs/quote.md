# Vocabulary/quote - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/quotem "Vocabulary/quotem") [<<](https://code.jsoftware.com/wiki/Vocabulary/curlyrtco "Vocabulary/curlyrtco")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d600n.htm "jdic:d600n")

<table class="wikitable"><tbody><tr><td><tt>u"n</tt></td><td>Rank</td><td>Conjunction</td></tr></tbody></table>

---

Applies the [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") u to each [cell](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Cell "Vocabulary/Glossary") in turn of an [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") y, or to corresponding cells of x and y . The "parts" are called [n-cells](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Cell "Vocabulary/Glossary"), the [operand](https://code.jsoftware.com/wiki/Vocabulary/AET#Operand "Vocabulary/AET") n determining the size of the n-cell.

> [![](https://code.jsoftware.com/mediawiki/images/5/54/Information.png)](https://code.jsoftware.com/wiki/File:Information.png) For other uses of (") see:
> 
> -   [Constant Verb](https://code.jsoftware.com/wiki/Vocabulary/quotem "Vocabulary/quotem") (m"n)
> -   [Apply a Different Verb on Each Cell](#cyclic) (_gerund_"n)
> -   [Copy Rank](https://code.jsoftware.com/wiki/Vocabulary/quotev "Vocabulary/quotev") (u"v) (m"v)

(") is the most-often-used [modifier](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Modifier "Vocabulary/Glossary") in J. It corresponds to the simplest form of [looping](https://code.jsoftware.com/wiki/Vocabulary/Loopless "Vocabulary/Loopless") in other languages.

u"n creates a **new verb** whose [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") is n. This new verb applies u to the n-cells (for the given operand n) of its argument y, and [collects the results from each cell](https://code.jsoftware.com/wiki/Vocabulary/FramingFill#Collection "Vocabulary/FramingFill") into a single [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary").

```
   \] y=: i. 2 3
0 1 2
3 4 5

   u=: <        NB. u is the primitive verb: Box

   u y          NB. Apply Box (<) to the whole of y
+-----+
|0 1 2|
|3 4 5|
+-----+
   u"1 y        NB. Apply Box (<) to each 1-cell (i.e. each row (=list)) of y
+-----+-----+
|0 1 2|3 4 5|
+-----+-----+
   u"0 y        NB. Apply Box (<) to each 0-cell (i.e. each atom) of y
+-+-+-+
|0|1|2|
+-+-+-+
|3|4|5|
+-+-+-+

```

#### Applying a Different Verb on Each Cell

If u is a [gerund](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Gerund "Vocabulary/Glossary"), it specifies a _sequence_ of verbs. The first verb is applied to the first cell, the second verb to the second cell, and so on, wrapping around if there are more cells than verbs in the gerund.

```
   +:\`\*:\`%:"0 (2 3 4)  NB. double the first, square the second, square-root the third
4 9 2

```

The rank of the compound _gerund_"n is infinite, because if it is executed at rank n it always executes the first gerund.

---

### Common uses

1\. Sum a [matrix](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Matrix "Vocabulary/Glossary") (an [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") of [rank](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") 2) across rather than down.

```
   \] y=: i.2 2
0 1
2 3

   +/ y         NB. sum down
2 4
   +/"1 y       NB. sum across
1 5

```

Verb: +/"1 applies the verb +/ to the _1-cells_ (i.e. the lists) of y (a [list of](https://code.jsoftware.com/wiki/Vocabulary/Glossary#ListOf "Vocabulary/Glossary") lists). This sums each list.

2\. Select [items](https://code.jsoftware.com/wiki/Vocabulary/AET#Item "Vocabulary/AET") 1 and 2 from each row of a [table](https://code.jsoftware.com/wiki/Vocabulary/AET#Table "Vocabulary/AET") y

```
   \] y =: i. 3 4
0 1  2  3
4 5  6  7
8 9 10 11

   1 2 { y       NB. Select items 1 and 2 - not what we want (treated as rows 1 and 2)
4 5  6  7
8 9 10 11
   1 2 {"1 1 y   NB. Select items 1 and 2 from each row; i.e. the entire columns 1 and 2
1  2
5  6
9 10

```

Note: n can be a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") as well as an [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET").  {"1 1 specifies 1-cells for x and y in turn.

3\. Rotate each row of an [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") y by a different amount

```
   \]y =: 4 $ ,: 'a b c d '
a b c d
a b c d
a b c d
a b c d

   1 0 \_1 0 |."0 1 y
 b c d a
a b c d
 a b c d
a b c d

```

The verb |. is applied between [0-cells](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Cell "Vocabulary/Glossary") of x and [1-cells](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Cell "Vocabulary/Glossary") of y . In other words, each [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") of x tells how much to rotate the corresponding _row_ of y.

Note: n can be a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") as well as an [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET"). The [phrase](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Phrase "Vocabulary/Glossary")  {"0 1 specifies 0-cells for x and 1-cells for y in turn.

4\. Guide execution of a verb to desired [cells](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Cell "Vocabulary/Glossary")

```
   Cards =. '6789TJQKA' ,"0"1 0 (ucp '♠♡♢♣')   NB. Join (atoms of) (lists of x with atoms of y)
   <"2 Cards                                   NB. Box by suit
┌──┬──┬──┬──┐
│6♠│6♡│6♢│6♣│
│7♠│7♡│7♢│7♣│
│8♠│8♡│8♢│8♣│
│9♠│9♡│9♢│9♣│
│T♠│T♡│T♢│T♣│
│J♠│J♡│J♢│J♣│
│Q♠│Q♡│Q♢│Q♣│
│K♠│K♡│K♢│K♣│
│A♠│A♡│A♢│A♣│
└──┴──┴──┴──┘

```

Note: x v"0 y is equivalent to x v"0 0 y

Note: (,) [append](https://code.jsoftware.com/wiki/Vocabulary/comma#dyadic "Vocabulary/comma") has a rank of \_ \_

---

### More Information

1\. **Important point:** _u"n does not change the rank of u._

Every verb has a rank of its own that can never be changed at call-time. u"n creates a **new verb** that is executed on each _n\-cell_ of the operands. But the actual rank of u doesn't get suppressed. It comes into play when u is executed on these n-cell(s).

2\. Because u"n causes u to be executed multiple times, it resembles [looping](https://code.jsoftware.com/wiki/Vocabulary/Loopless "Vocabulary/Loopless") in other languages.

Multiple application of u"n correspond to **nested loops**, as shown by "More Examples" 1 below.

3\. Every verb has both **_monadic rank_** and **_dyadic rank_**, with the appropriate rank being selected depending on whether the verb is executed as a monad or as a dyad.

The monadic rank is a single number; the dyadic rank is two numbers, one for x and one for y.

You may _think_ of your verb as just a monad or just a dyad, but nothing prevents someone from trying to execute it with either valence.  
(But sometimes J may signal an execution error.)

u"n always specifies both the monadic and dyadic ranks. n itself may be an atom or a list of up to 3 numbers; the ranks will be set as follows:

<table class="wikitable"><tbody><tr><td colspan="4"><b>The ranks specified by <tt>n</tt></b></td></tr><tr><td rowspan="2"><b><tt>n</tt></b></td><td rowspan="2"><b>Monadic rank</b></td><td colspan="2"><b>Dyadic rank</b></td></tr><tr><td><i>left</i></td><td><i>right</i></td></tr><tr><td><tt>n</tt></td><td><tt>n</tt></td><td><tt>n</tt></td><td><tt>n</tt></td></tr><tr><td><tt>n0 n1</tt></td><td><tt>n1</tt></td><td><tt>n0</tt></td><td><tt>n1</tt></td></tr><tr><td><tt>n0 n1 n2</tt></td><td><tt>n0</tt></td><td><tt>n1</tt></td><td><tt>n2</tt></td></tr></tbody></table>

4\. u"n may specify a negative value in n. u is still executed on _n-cells_, but with n negative the rank of the cell [depends on the rank of the argument](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Cell "Vocabulary/Glossary").

```
   <"\_1 i. 3  NB. Operand rank 1; \_1-cells are atoms
+-+-+-+
|0|1|2|
+-+-+-+
   <"\_1 i. 2 3  NB. Operand rank 2; \_1-cells are lists
+-----+-----+
|0 1 2|3 4 5|
+-----+-----+

```

5\. To see what the rank of a verb u is, execute u b. 0

```
   + b. 0
0 0 0
   +"0 1 b. 0
1 0 1

```

6\. For a more relaxed explanation of _Rank_, see [Rank in a hurry](https://code.jsoftware.com/wiki/Vocabulary/EZRank "Vocabulary/EZRank"), which contains links to more authoritative treatments of the concept of _Rank_ and its uses.

---

### More Examples

1\. Create a Punnett square representing a dihybrid cross.

```
   NB. First, a verb to create the result of a single breeding
   NB. x and y are alleles (R, r and A, a)
   cross =: dyad define
alleles =. (>x) , (>y)   NB. join the genotypes
< alleles /: 'RrAa' i. alleles   NB. sort into canonical order
)

   NB. Example: a single cross
   (<'Ra') cross (<'rA')
+----+
|RrAa|
+----+

   NB. Define all the possible genotypes
   genotypes =: ;: 'RA Ra rA ra'

   NB. Create the Punnett square of all possible crosses
   genotypes cross"0 0"0 1 genotypes
+----+----+----+----+
|RRAA|RRAa|RrAA|RrAa|
+----+----+----+----+
|RRAa|RRaa|RrAa|Rraa|
+----+----+----+----+
|RrAA|RrAa|rrAA|rrAa|
+----+----+----+----+
|RrAa|Rraa|rrAa|rraa|
+----+----+----+----+

```

Explanation of the verb cross"0 0"0 1 :

-   The "0 1 means, Apply the verb cross"0 0 on each _atom_ of x and each _list_ of y. Since x and y are both lists, this means, Apply cross"0 0 4 times, with y each time equal to genotypes and x set to each atom of genotypes in turn.
-   A single application of cross"0 0 will then have an atom for x and the list genotypes for y. The "0 0 means, Apply cross 4 times, with x each time equal to the atom, and y set to each atom of genotypes in turn.
-   The result of each application of cross is a single box. Each use of "0 0 [collects](https://code.jsoftware.com/wiki/Vocabulary/FramingFill#Collection "Vocabulary/FramingFill") these into a list, which is its result.
-   "0 1 [collects](https://code.jsoftware.com/wiki/Vocabulary/FramingFill#Collection "Vocabulary/FramingFill") these lists into a table, which is the final result.
---

### Details

1\. u can be a [cyclic gerund](https://code.jsoftware.com/wiki/Vocabulary/CyclicGerund "Vocabulary/CyclicGerund") as in the example given [above](#cyclic). Because gerunds are nouns, and non-gerund noun values of u produce [constant verbs](https://code.jsoftware.com/wiki/Vocabulary/quotem "Vocabulary/quotem"), a cyclic gerund is recognized only when:

-   the rank n is not all infinite
-   u is a list of boxes (**not** an atom)
-   u is a well-formed gerund.

Otherwise m"n is construed as a constant verb.  
If your m might be mistaken for a gerund (i. e. it is boxed and contains character strings) and your n is finite, write m"\_"n to ensure it is not recognized as a gerund.

2\. The rank of a verb cannot actually be negative. If n is negative in u"n, the actual rank of u"n will be infinite, but u"n will apply u to _n\-cells_ of the argument.

```
   <"\_1 0 0 b. 0   NB. Actual rank \_, but applied on \_1-cells
\_ 0 0

```

3\. In place of the operand (noun) n, you can use any verb v. This is equivalent to setting n equal to the list of [ranks](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Rank "Vocabulary/Glossary") of verb v. See [Copy Rank](https://code.jsoftware.com/wiki/Vocabulary/quotev "Vocabulary/quotev").

4\. Coding u"n corresponds to writing a loop in other languages. The verb u will be executed multiple times, once for each cell of the arguments. This may be very inefficient. Consider the example:

```
   10 #."0 1 i. 10000 6

```

The "0 1 instructs the interpreter to find the 0-cells of x (there is only one) and the 1-cells of y (there are 10000), and execute #. for each pair (the cell of x is repeated for each execution). The execution of #. requires converting x into an array of weights, which takes more time than applying the weights; this overhead is incurred 10000 times. Much better is

```
   10 #. i. 10000 6

```

Because x #. y is defined with intrinsic rank 1 1, it knows to break y into 1-cells, and it knows to replicate an atomic x. There is minimal overhead.

If you time both sentences, however, you will see that they run at the same speed, because the interpreter cynically assumes you didn't mean what you wrote. The interpreter follows this rule: _if u"n operates on the same cells of the argument(s) that u itself would, the rank conjunction is ignored_. (read on to see the exception)

5\. The suppression of a rank conjunction (described in the previous note) can rarely produce an incorrect result. Fill has to be involved:

```
   \]r =. 2 2 $ 1 2;3;4;5
+---+-+
|1 2|3|
+---+-+
|4  |5|
+---+-+
   >"1 r
1 2
3 0

4 0
5 0

```

Even though \> y was executed on the 4 boxes individually, this result is not right! If the bottom two boxes had been opened as a 1-cell of boxes, as the rank conjunction specified, they would have been joined together with no fill. To tell the interpreter than a rank conjunction must not be suppressed, specify the rank in floating-point:

```
   >"1. r
1 2
3 0

4 5
0 0

```

This is the correct result.

6\. All arithmetic primitives, and a few compounds, have _**Integrated Rank Support**_ (IRS). Verbs with IRS have the rank loops built into the verb. For these verbs the cost of of using u"n is negligible.

---
