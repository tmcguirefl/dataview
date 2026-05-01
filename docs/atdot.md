# Vocabulary/atdot - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/atco "Vocabulary/atco") [<<](https://code.jsoftware.com/wiki/Vocabulary/at "Vocabulary/at")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d621.htm "jdic:d621")

<table class="wikitable"><tbody><tr><td><tt>m@.n</tt></td><td>Select From Agenda</td><td>Conjunction</td></tr></tbody></table>

No rank - the result is a verb

---

(m@.n) creates the entity defined by the n\-th atom from the _**agenda**_ m, which is a list of [atomic representations](https://code.jsoftware.com/wiki/Vocabulary/Glossary#AtomicRep "Vocabulary/Glossary") (ARs). Usually the entities are verbs, whose ARs are called gerunds, which can be created using the [Tie](https://code.jsoftware.com/wiki/Vocabulary/grave "Vocabulary/grave") conjunction \`

```
   m=: 0: \` 1: \` 2:   NB. a gerund of recognizable sample verbs
   n=: 1
   m@.n    NB. m@.n produces a verb
1:
   (m@.n) ''   NB. The verb can be executed
1

```
---

### More Information

1\. n may be negative to count back from the end of m.

2\. If n is a list, a train of entities is created from the selected items of m.

```
   m=: 0: \` 1: \` 2: \` 3:
   m@.0 1
0: 1:

```

3\. If n is boxed, each level of boxing indicates a level of parentheses in the verb train

```
   m@.(0;<1;<2 3)
0: (1: (2: 3:))

```

4\. If only one atom of m is selected, the result of m@.n has the rank of the verb created from that atom. If more than one atom of m is selected, the rank of the created train is infinite.

5\. The agenda may contain ARs of any part of speech.

---

<table class="wikitable"><tbody><tr><td><tt>[x] m@.v y</tt></td><td>Agent</td><td>Conjunction</td></tr></tbody></table>

[Rank](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rankv "Vocabulary/RankInfo") _\-- depends on the rank of v --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

For each cell, \[x\] m@.v y uses the result of executing \[x-cell\] v y-cell to select an atom of the _**agenda**_ m, which it then converts to a verb w and executes as \[x-cell\] w y-cell to produce a cell of the result.

```
   NB. 3 different verbs
   soso =: {{
echo 'Your score was ', ": y
}}
   good =: {{
echo 'Your score was ', ": y
echo 'Keep it up!'
}}
   great =: {{
echo 'Your score was ', ": y
echo 'That''s fantastic!'
echo 'Would you like to try again?'
}}
   NB. Choose them according to score: 7 or less, 8-9, 10
   rate =: soso\`good\`great@.(7 9&I.)
   rate 4
Your score was 4
   rate 10
Your score was 10
That's fantastic!
Would you like to try again?

```
---

### Common Uses

1\. To get the effect of an if./else. statement, but with the ability to make the decision for each cell of the arguments. Give v the appropriate rank.

```
   (%&2)\`(1+3&\*)@.(2&|)"0\] 1 2 3 4  NB. Divide by 2 if even, triple and add one if odd - checking each atom separately
4 1 10 2

```

2\. To select and apply a verb according to the first test that the argument passes, akin to a series of if./else. statements.

```
   test0=: 0 = 5&|   NB. y is divisible by 5
   test1=: >&100     NB. y > 100
   test2=: 0 = 2&|   NB. y is even
   %:\`-:\`+:\`('default'"\_)@.{{1 i.~ (test0 y),(test1 y),(test2 y)}}&.> 51 8 100 101
┌───────┬──┬──┬────┐
│default│16│10│50.5│
└───────┴──┴──┴────┘

```

For example, the result of the phrase  (test0 51),(test1 51),(test2 51)  is 0 0 0. Next,  1 i.~ 0 0 0  returns 3, which results in the constant verb  'default'"\_  being applied to 51.

Notice that although the argument 100 passes both test0 and test2, the verb %: is applied to it because test0, which positionally is associated with %:, is to the left of test2.

3\. To select and apply a verb according to the argument's value, akin to the select./case. control words.

```
   'b' (1+\])\`(3$\])\`(2\*\])\`('default'"\_)@.('abc' i. \[) 10
10 10 10

```

4\. To select and apply a verb according to the interval which contains the argument.

```
   %:\`-:\`+:\`%@.(10 50 90&I.)"0\] 51 2 100 20
102 1.41421 0.01 10

```

5\. To apply different verbs for zero/positive/negative.

```
   ('nil'"\_)\`(":)\`('neg ' , ":@|)@.\*"0  (\_5 0 5)
neg 5
nil
5

```
---

### m@.v on Arrays

Because execution of verbs at low rank is inefficient, u@.v executes at infinite rank but there is an underlying rank implied by m and v.

The **implied rank** of m@.v y is the rank of the cells of y, each of which produces a result cell. The verbs in m are **not necessarily** applied to these cells directly. The interpreter may choose to assemble implied cells of y with identical results _i_ from v into a list of such cells, and apply the gerund _i { m_ to that list of cells. This single application of the gerund must produce one result for each implied cell. The results are assembled, using the original order of the implied cells, into the final result.

The implied rank is \-#$ \[x\] v y, in other words the rank of \[x\]/y minus the rank of v y. Each gerund of m needs to be able to operate on a single cell of the implied rank, or a list of such cells, giving a result for each cell.

```
   +:\`\*:\`-:@.(3&|) i. 10
0 1 1 6 16 2.5 12 49 4 18

```

v y produces a list of 10 numbers, making the implied rank 0. The verbs in m were applied on atoms or lists, and the results were assembled.

```
   +:\`\*:\`-:@.((3&|)@:(+/)"1) i. 5 10
   0    2    4    6    8   10   12   14   16   18
 100  121  144  169  196  225  256  289  324  361
  10 10.5   11 11.5   12 12.5   13 13.5   14 14.5
  60   62   64   66   68   70   72   74   76   78
1600 1681 1764 1849 1936 2025 2116 2209 2304 2401

```

v y produces a list of 5 numbers, making the implied rank 1. The verbs in m were applied on lists or tables, and the results were assembled.

```
   (+/"1)\`(<./"1)\`(>./"1)@.((3&|)@:(+/)"1) i. 10 10
45 10 29 345 40 59 645 70 89 945
   ((3&|)@:(+/)"1) i. 10 10
0 1 2 0 1 2 0 1 2 0

```

The gerunds were applied to lists or tables. The "1 is necessary in each gerund to ensure that the gerund produces a result for each cell rather than a single result for the entire array it is applied to.

[Power](https://code.jsoftware.com/wiki/Vocabulary/hatco "Vocabulary/hatco") (\[x\] u^:v y)

---

### More Information

1\. All of the ARs in the agenda must define verbs.

2\. Verb trains cannot be created when v is a verb.

3\. Negative selections count back from the end of m.

4\. If (\[x\] v y) has few atoms, the interpreter may choose to execute the gerunds of m on individual cells of the arguments instead of on lists of those cells.

---

### Use These Combinations

Combinations using \[x\] u@.v y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Fast agenda</td><td></td><td><tt>f0</tt>`...`<tt>fn@.v"0 y</tt></td><td>All <tt>f's</tt> must be <a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#2">atomic</a>.<p>If <tt>v</tt> has rank <tt>0</tt> then <tt>"0</tt> can be omitted</p></td><td></td></tr></tbody></table>

---
