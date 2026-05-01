# Vocabulary/hatco - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/dollar "Vocabulary/dollar") [<<](https://code.jsoftware.com/wiki/Vocabulary/hatdot "Vocabulary/hatdot")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d202n.htm "jdic:d202n")

<table class="wikitable"><tbody><tr><td><tt>[x] u^:n y</tt></td><td>Fixed Power</td><td>Conjunction</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank_~ "Vocabulary/RankInfo") _\-- operates on \[x and\] y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

  
**Note:** x u^:n y is equivalent to (x&u)^:n y and will be discussed with the latter construct.

---

Applies [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") u (or x&u, if [dyadic](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Dyadic "Vocabulary/Glossary")) to y, n times. This may be interpreted as **If** or **Inverse** depending on n.

---

### Common Uses

1\. Conditionally execute a [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") (eg. to save writing an if.\-statement):

```
   flag=: 1
   'Mr. ' ,^:flag 'Jones'
Mr. Jones
   flag=: 0
   'Mr. ' ,^:flag 'Jones'
Jones

```

2\. Execute the _[obverse](https://code.jsoftware.com/wiki/Vocabulary/Inverses "Vocabulary/Inverses")_ (which is usually the inverse) of a [verb:](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET")

```
   +: 14          NB. "Double"
28
   (+: ^:\_1) 14    NB. the obverse of "Double" is "Halve"
7

```

**See** [u^:v](#DoWhile) for the **Do-While** construct.

---

### More Information

#### u^:Boolean If

If n is 0 or 1, it has a simple interpretation: if n=1, u is applied to y, while if n=0, y is left unchanged. I.e.  ^:n can be interpreted as **If n**.

```
   NB. Get the number of days in the current month; add 1 if February in leapyear.  \*. = AND
   leapyear =: 1
   month =: 2
   \]dayinmonth =: >:^:(leapyear \*. month = 2) month { 0 31 28 31 30 31 30 31 31 30 31 30 31
29
   month =: 3
   \]dayinmonth =: >:^:(leapyear \*. month = 2) month { 0 31 28 31 30 31 30 31 31 30 31 30 31
31

```

The advantage of u^:n over if.\-do.\-end. is that u^:n is a [phrase](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Phrase "Vocabulary/Glossary") rather than a [sentence](https://code.jsoftware.com/wiki/Vocabulary/AET#Sentence "Vocabulary/AET"), and can thus be made part of a longer phrase or a sentence without requiring multiple sentences.

---

#### u^:\_1 (Inverse, aka Obverse)

If n is \_1, it means "undo the effect of applying u." In J, this means to apply the [obverse](https://code.jsoftware.com/wiki/Vocabulary/Inverses "Vocabulary/Inverses"), which is the inverse of the [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") unless an [obverse](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Obverse "Vocabulary/Glossary") has been explicitly assigned using u :.v.

```
   >: 5   NB. >: means add one
6
   >:^:\_1 (6)   NB. The inverse means subtract one
5

```
---

#### u^:\_ (Converge)

u^:\_ means "apply u until the result stops changing". The comparison of old and new values is [tolerant](https://code.jsoftware.com/wiki/Vocabulary/Glossary#TolerantComp "Vocabulary/Glossary").

```
   +/ i. 4 5  NB. +/ = 'add items together'.  Add rows to produce a list
30 34 38 42 46
   +/ +/ i. 4 5   NB. Doing it twice results in an atom
190
   +/^:\_ i. 4 5   NB. 'keep totaling until you get an atom'
190
   +/^:\_ i. 4 5 6  NB. works for any rank
7140

```

u^:\_ is used for root-polishing in numerical applications. It can be combined with u^:v to allow explicit termination of the convergence test, as described [below](#DoWhile).

---

#### u^:v^:\_. (DoWhile)

Described [below](#DoWhile).

---

#### Other Values of n

Other values of n are rarely used.

• Example: Parsing HTML  
Given: Table Structure and Content.

```
mytable=: 0 : 0
<table ...>
 <tr ...>-1----------row1----------------1-</tr>
 <tr ...>-2----------row2-----------------------------2-</tr>
 <tr ...>-3----------row3---------------------3-</tr>
</table>
)
   datatype mytable
literal

```

Task: Parse the table and pick content of Row2.  
Hint: Script strings.ijs (providing dyadic verbs 
```
taketo
```
 and 
```
takeafter
```
) is part of the J standard library.

```
   y=. mytable

   '<tr' takeafter y                                           NB. aiming at start of 1st row
 ...>-1----------row1----------------1-</tr>
 <tr ...>-2----------row2-----------------------------2-</tr>
 <tr ...>-3----------row3---------------------3-</tr>
</table>

   '<tr' takeafter(^:2) y                                      NB. after two cuts, near Row2
 ...>-2----------row2-----------------------------2-</tr>
 <tr ...>-3----------row3---------------------3-</tr>
</table>

   '>' takeafter '<tr' takeafter(^:2) y                        NB. cut (including) closing bracket
-2----------row2-----------------------------2-</tr>
 <tr ...>------------row3---------------------3-</tr>
</table>

   '</tr' taketo '>' takeafter '<tr' takeafter(^:2) y          NB. Row2's content, as requested
-2----------row2-----------------------------2-

```

### Details

#### Array n

1\. When n is an [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET"), u^:a is executed for each [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") a in n, and the [results](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") are then collected into an array whose [frame](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Frame "Vocabulary/Glossary") is the [shape](https://code.jsoftware.com/wiki/Vocabulary/AET#Shape "Vocabulary/AET") of n

```
   \*:^:(0 1 2 3) 5  NB. 5, 5^2, (5^2)^2, ((5^2)^2)^2
5 25 625 390625

```

2\. n may not be empty.

---

#### Boxed Numeric n -- decoding variable-length records

The main use for [boxed](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boxed "Vocabulary/Glossary") n is [separating variable-length records](https://code.jsoftware.com/wiki/Vocabulary/Idioms#Variable-Length_Records "Vocabulary/Idioms").

When n is boxed, the contents of n must be an [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") or [empty.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Empty "Vocabulary/Glossary") The [results](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") from executing u on y repeatedly are collected into a [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") of results.

If \>n is finite, u^:n executes u ((>n)-1) times, collecting the results from each execution (if \>n is negative, u^:\_1 is executed ((->n)-1) times). The original value of y is collected as the first item of the result. Thus

```
   \*:^:(<4) 5   NB. same as \*:^:0 1 2 3
5 25 625 390625

```

If \>n is \_ or empty, u is repeatedly executed until the result stops changing. All the results (not including the final repeated one) are collected into an array. Since a: is <0$0, it is used for n in this case

```
   (0 >. <:)^:a: 5   NB. Decrement, but not below 0
5 4 3 2 1 0

```
---

#### Gerund n

When n is a [gerund](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Gerund "Vocabulary/Glossary"), it specifies preprocessing for the [arguments](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET"), as well as a [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") for calculating the value of n to use. After these steps have been performed, u^:n is applied as usual.

Gerund n is necessary only in tacit code. Inside the [body](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Body "Vocabulary/Glossary") of an explicit verb you could just write out the equivalent for the gerund.

The gerund form is

```
x u^:(v0\`v1\`v2)y <==> (x v0 y)u^:(x v1 y) (x v2 y)

```

The three verbs are applied to the arguments, producing the [values](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary") to be used for x, n, and y respectively.

```
   'Mr.' ,^:((<@\[)\`(1 = #@\])\`\]) <'Jones'  NB. Prepend boxed x if y has 1 atom
+---+-----+
|Mr.|Jones|
+---+-----+
   'Mr.' ,^:((<@\[)\`(1 = #@\])\`\]) 'Harry';'Jones'
+-----+-----+
|Harry|Jones|
+-----+-----+

```

If v0 is omitted, it is assumed to be (\[) i.e. x is used unchanged.

If the use of u^:gerund is [monadic](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Monad "Vocabulary/Glossary"), v0 must be omitted (since there is no x), and v1 and v2 are invoked monadically.

u^:(v\`\]) is the same as [u^:v](#monadicv).

---

<table class="wikitable"><tbody><tr><td><tt>[x] u^:v y</tt></td><td>Dynamic Power</td><td>Conjunction</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank_~ "Vocabulary/RankInfo") _\-- operates on \[x and\] y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

  
**Note:** x u^:v y is equivalent to (x&u)^:(x v y) y and will be discussed with the latter construct.

---

If x is _present_

-   (x u^:v y) applies [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") x&u to y _n_ times, where _n_ is the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") of (x v y)
-   The number of times _n_ that u is executed therefore depends on the [values](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary") of the [arguments](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET") x and y .

If x is _absent_

-   (u^:v y) applies verb u to y _n_ times, where _n_ is the result of (v y)
-   The number of times _n_ that u is executed therefore depends on the value of the single argument y .

This yields the data-dependent constructs

-   [Dynamic If](#IfDyad)
-   [Do-While](#DoWhile)
---

### Common Uses

1\. Modify y based on the [value(s)](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary") of \[x\] and y (see: [Dynamic If](#IfDyad))

```
   '.' (~: {:) 'Mr'  NB. Returns 1 if y does not end with x (.)
1
   '.' ,~ 'Mr'  NB. append x to the end of y
Mr.
   '.' ,~^:(~: {:) 'Mr'  NB. append IF y does not end with x
Mr.
   '.' ,~^:(~: {:) 'Mrs.'
Mrs.
   '.' ,~^:(~: {:)&.> 'Mr';'Mrs.';'Jack';'Sprat'   NB. Test & modify inside each box separately
+---+----+-----+------+
|Mr.|Mrs.|Jack.|Sprat.|
+---+----+-----+------+

```

2\. Execute a [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") repeatedly, until a condition is reached (see: [Do-While](#DoWhile))

```
   \_2&(+/\\) 3 1 4 1 5 9 2 6  NB. This verb adds adjacent items:  3+1, 4+1, 5+9, 2+6
4 5 14 8
   \_2&(+/\\) 45 30 5 7 22 12 40 55  NB. Applied once
75 12 34 95
   \_2&(+/\\)^:2 (45 30 5 7 22 12 40 55)   NB. Applied twice
87 129
   \_2&(+/\\)^:(100 > >./)^:\_ (45 30 5 7 22 12 40 55)   NB. applied while max of y < 100
87 129
   \_2&(+/\\)^:(50 > >./)^:\_ (45 30 5 7 22 12 40 55)  NB. applied while max of y < 50
45 30 5 7 22 12 40 55

```
---

[Agent](https://code.jsoftware.com/wiki/Vocabulary/atdot "Vocabulary/atdot") (\[x\] u@.v y)

---

### More Information

#### Dynamic If

This is the construct: (u^:v y) or: (x u^:v y)

-   [Verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") v must always produce a [Boolean](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boolean "Vocabulary/Glossary") [result.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary")
-   Verb u is applied **if-and-only-if** v returns 1.

The advantage of u^:v over if.\-do.\-end. is that u^:v can be executed on [cells](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Cell "Vocabulary/Glossary") of an [array](https://code.jsoftware.com/wiki/Vocabulary/AET#Array "Vocabulary/AET") rather than the array as a whole.

Execution on cells will happen if you combine u^:v with _rank_ ("n) or use a member of the @ family (@, &, &., each, every).

If you need [Dynamic If](#IfDyad) on the array as a whole, just use the u^:n form.

The [control word](https://code.jsoftware.com/wiki/Vocabulary/Glossary#ControlWord "Vocabulary/Glossary") if. (which tests a single condition) can't provide cell-by-[cell](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Cell "Vocabulary/Glossary") control.

```
   +: 5                    NB. means: double
10
   +:^:(6&<) 12            NB. means: double IF y>6
24
   +:^:(6&<)"0 (0 3 6 12)  NB. means: double only atoms that are > 6
0 3 6 24

```

In the [dyadic](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Dyad "Vocabulary/Glossary") case, both u and v are invoked dyadically

```
   3!:0 'Smith'   NB. 3!:0 tests the type of y.  2=literal
2
   3!:0 (5)   NB. 4=integer
4
   'Mr. ' ,^:(2 = 3!:0@\]) 'Smith'   NB. Prepend 'Mr.' IF y is a string
Mr. Smith
   'Mr. ' ,^:(2 = 3!:0@\]) 5   NB. Otherwise leave y unchanged
5

```

**Note:** 3!:0@\] was necessary, because 'Mr. ' 3!:0 'Smith' would have been a domain error.

Dyadic execution means that x and y must [agree](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Agree "Vocabulary/Glossary"), which is sometimes problematic

```
   'Mr. ' ,^:(2 = 3!:0@\])&.> 'Smith';5;'Jones';10;'Williams';15
|length error
|   'Mr. '    ,^:(2=3!:0@\])&.>'Smith';5;'Jones';10;'Williams';15

```

The problem is that x has 4 atoms but y has 6 atoms.

**Workaround 1:** Use: x&u^:v&.> rather than: x u^:v&.>. Then the verb as a whole is no longer dyadic.

**Note:** Because of the [long left scope of modifiers](https://code.jsoftware.com/wiki/Vocabulary/Modifiers#ExecutionOrder "Vocabulary/Modifiers"), x&u^:v is the same as: (x&u)^:v .

```
   'Mr. '&,^:(2 = 3!:0@\])&.> 'Smith';5;'Jones';10;'Williams';15
+---------+-+---------+--+------------+--+
|Mr. Smith|5|Mr. Jones|10|Mr. Williams|15|
+---------+-+---------+--+------------+--+

```

**Workaround 2:** Alternatively, use the [semidual](https://code.jsoftware.com/wiki/Vocabulary/ampdot#Semiduals "Vocabulary/ampdot"): u^:v&.(a:\`>) rather than: u^:v&.>. This way, \> is applied only to y. In the general case, unlike Workaround 1, this allows x to be computed/specified independently of the derived verb.

```
   'Mr. ' ,^:(2 = 3!:0@\])&.(a:\`>) 'Smith';5;'Jones';10;'Williams';15
+---------+-+---------+--+------------+--+
|Mr. Smith|5|Mr. Jones|10|Mr. Williams|15|
+---------+-+---------+--+------------+--+

```
---

#### DoWhile

The construct: (u^:v^:\_. y) or: (x u^:v^:\_. y)

Instead of \_., a final power of \_ may be used, which will terminate the iteration when an execution of u^:v leaves its argument tolerantly unchanged.

-   [Verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") v must always produce a [Boolean](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boolean "Vocabulary/Glossary") [result.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary")
-   [Verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") u is executed repeatedly until v returns 0
    
    or u returns its [argument](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET") tolerantly unchanged, if the final power is \_

DoWhile can be executed independently on [cells](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Cell "Vocabulary/Glossary") of the [arguments](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET") if you combine it with [Rank](https://code.jsoftware.com/wiki/Vocabulary/quote "Vocabulary/quote") ("n) or use a member of the @ family (@, &, &., each, every). Despite its name, DoWhile is very rarely used in J. Almost all looping is done using the other [modifiers](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Modifier "Vocabulary/Glossary").

```
   3&\*^:(100 > \])^:\_. (5)            NB. triple y while it is less than 100
135
   3&\*^:(100 > \])^:\_."0 (5 6 7 20)   NB. same, but test each atom independently
135 162 189 180

```

For a broader functional looping mechanism, see [Fold Single (F.)](https://code.jsoftware.com/wiki/Vocabulary/fcap#unlimited "Vocabulary/fcap").

---

### Use These Combinations

Combinations using u^:v that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Find ordinal numbers of <tt>y</tt> (the relative rank of each item of <tt>y</tt> in the sort order</td><td></td><td><tt>/:@/: y</tt></td><td>note <tt>\:</tt> is <b>not</b> special</td><td>better than <tt>/:^:2 y</tt></td></tr><tr><td>Follow a chain of variable-length records</td><td>integer <tt>x</tt> and <tt>y</tt></td><td><tt>{&amp;x^:a: y</tt><p><tt>x {~^:a: y</tt></p></td><td><tt>&lt;_</tt> <small>in place of</small> <tt>a:</tt></td><td>Produces list of starting positions. Limit all values of <tt>x</tt> to at most <tt>#x</tt>, then append <tt>_1</tt> to the end of <tt>x</tt>. Discard the final starting position of <tt>_1</tt>.</td></tr><tr><td>Monadic power whose power depends on <tt>x</tt></td><td></td><td><tt>x f@]^:g y</tt><p><small>(<tt>f</tt> is any verb)</small></p></td><td></td><td>Applies <tt>f</tt> rather than <tt>x&amp;(f@])</tt> (very small improvement)</td></tr></tbody></table>

---
