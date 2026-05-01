# J Primer (Flattened)

**Roger K.W. Hui**  
**Kenneth E. Iverson**  
Copyright © 1991-2011 Jsoftware Inc. All Rights Reserved.  
Last updated: 2001-5-3

---

# Introduction

**J** is a general-purpose programming language available on a wide variety of computers. Although it has a simple structure and is readily learned by anyone familiar with mathematical notions and notation, its distinctive features may make it difficult for anyone familiar with more conventional programming languages.

This introduction is designed to present **J** in a manner that makes it easily accessible to programmers, by emphasizing those aspects that distinguish it from other languages. These include:

1. A mnemonic one- or two-character spelling for primitives.
2. No order-of-execution hierarchy among functions.
3. The systematic use of *ambivalent* functions that, like the minus sign in arithmetic, can denote one function when used with two arguments (*subtraction* in the case of ` - `), and another when used with one argument (*negation* in the case of `-`).
4. The adoption of terms from English grammar that better fit the grammar of **J** than do the terms commonly used in mathematics and in programming languages. Thus, a function such as addition is also called a *verb* (because it performs an action), and an entity that modifies a verb (not available in most programming languages) is accordingly called an *adverb*.
5. The systematic use of adverbs and conjunctions to modify verbs, so as to provide a rich set of operations based upon a rather small set of verbs. For example, `+/a` denotes the sum over a list `a`, `*/a` denotes the product over `a`, `a */ b` is the multiplication table of `a` and `b`.
6. The treatment of vectors, matrices, and other arrays as single entities.
7. The use of *functional* or *tacit* programming that requires no explicit mention of the arguments of a function (program) being defined, and the use of assignment to assign names to functions (as in `sum=:+/` and `mean=:sum % #`).

The following sections are records of actual **J** sessions, accompanied by commentary that should be read only after studying the corresponding session (and perhaps experimenting with variations on the computer). The sections should be studied with the **J** system and dictionary at hand, and the exercises should be attempted. The reckless reader may go directly to the sample topics.

---

# 1. Mnemonics

The left side of the page shows an actual computer session with the result of each sentence shown at the left margin. First cover the comments at the right, and then attempt to state in English the meaning of each primitive so as to make clear the relations between related symbols. For example, "`<` is *less than*" and "`<.` is *lesser of* (that is, minimum)". Then uncover the comments and compare with your own.

```
   7<5                        Less than
0                             A zero is interpreted as false.

   7<.5                       Lesser of
5

   7>5                        Greater than
1                             A one is true (à la George Boole)

   7>.5                       Greater of
7

   10^3                       Power (à la Augustus De Morgan)
1000

   10^.1000                   Logarithm
3

   7=5                        Equals
0

   b=: 5                      Is (assignment or copula)
   7<.b
5

   Min=: <.                   Min is <.
   power=: ^                  power is ^
   gt=: >                     gt is >

   10 power (5 Min 3)
1000
```

**Exercises**

1.1 Enter the following sentences on the computer, observe the results, give suitable names to any new primitives (such as `*` and `+.` and `*.`), and comment on their behavior.

```
   a=:0 1 2 3
   b=:3 2 1 0   
   a+b
   a*b
   a-b
   a%b
   a^b 
   a^.b
   a<b
   a>b 
   (a<b)+(a>b)
   (a<b)+.(a>b)
```

Compare your comments with the following:

*   a) Negative `3` is denoted by `_3`. The underbar `_` is part of the representation of a negative number in the same sense that the decimal point is part of the representation of one-half when written in the form `0.5`, and the negative sign `_` must not be confused with the symbol used to denote subtraction (i.e., `-`).
*   b) Division (`%`) by zero yields infinity, denoted by the underbar alone.
*   c) Log of `2` to the base `1` is infinite, and log of `0` to the base `3` is negative infinity (`__`).
*   d) Since the relation `5<7` is true, and the result of `5<7` is `1`, it may be said that true and false are represented by the ordinary integers `1` and `0`. George Boole used this same convention, together with the symbol `+` to represent the *boolean* function *or*. We use the distinct representation `+.` to avoid conflict with the analogous (but different) *addition* (denoted by `+`).

1.2 Following the example `Min=: <.`, invent, assign, and use names for each of the primitives encountered thus far.

---

# 2. Ambivalence

Cover the comments on the right and provide your own.

```
   7-5                        The function in the sentence 7-5 applies to two
2                             arguments to perform subtraction, but in the
   -5                         sentence -5 it applies to a single argument to
_5                            perform negation.

                              Adopting from chemistry the term valence, we
                              say that the symbol - is ambivalent, its effective
   7%5                        binding power being determined by context.
1.4

   %5                         The ambivalence of - is familiar in arithmetic;
0.2                           it is here extended to other functions.

   3^2
9

   ^2                         Exponential (that is, 2.71828^2)
7.38906

            
   a=: i. 5                   The function integer or integer list
   a
0 1 2 3 4                     List or vector

   a i. 3 1                   The function index or index of
3 1
  
   b=: 'Canada'               Enclosing quotes denote literal characters
   b i. 'da'
4 1
  
   $ a                        Shape function
5

   3 4 $ a                    Reshape function
0 1 2 3                       Table or matrix
4 0 1 2
3 4 0 1
  
   3 4 $ b
Cana
daCa
nada

   %a                         Functions apply to lists
_ 1 0.5 0.333333 0.25         The symbol _ alone denotes infinity
```

**Exercises**

2.1 Enter the following sentences (and perhaps related sentences using different arguments), observe the results, and state what the two cases (*monadic* and *dyadic*) of each function do:

```
   a=: 3 1 4 1 5 9
   b=: 'Canada'
   #a
   1 0 1 0 1 3 # a
   1 0 1 0 1 3 # b
   /: a
   /: b
   a /: a
   a /: b
   b /: a
   b /: b
   c=: 'can''t'
   c
   #c
   c /: c
```

2.2 Make a summary table of the functions used thus far. Then compare it with the following table (in which a bullet separates the monadic case from the dyadic, as in Negate • Subtract):

| Symbol | Monadic ( . ) | Dyadic ( : ) |
| :--- | :--- | :--- |
| `+` | • Add | • Or |
| `-` | Negate • Subtract | |
| `*` | • Times | • And |
| `%` | Reciprocal • Divide | |
| `^` | Exponential • Power | • Log |
| `<` | • Less Than | • Lessor Of |
| `>` | • Greater Than | • Greater Of |
| `=` | • Equals | Is (Copula) |
| `i` | Integers • Index Of | |
| `$` | Shape • Reshape | |
| `/` | | Grade • Sort |
| `#` | Number Of Items • Replicate | |

2.3 Try to fill some of the gaps in the table of Exercise 2.2 by experimenting on the computer with appropriate expressions. For example, enter `^.10` and `^. 2.71828` to determine the missing (monadic) case of `^.` and enter `%: 4` and `%: -4` and `+%: -4` to determine the case of `%` followed by a colon.

However, do not waste time on matters (such as, perhaps, complex numbers or the *boxed* results produced by the monad `<`) that are still beyond your grasp; it may be better to return to them after working through later sections. Note that the effects of certain functions become evident only when applied to arguments other than positive integers: try `<.1 2 3 4` and `<.3.4 5.2 3.6` to determine the effect of the monad `<.`.

2.4 If `b=: 3.4 5.2 3.6`, then `<.b` yields the argument `b` rounded *down* to the nearest integer. Write and test a sentence that rounds the argument `b` to the *nearest* integer.

Answer: `<.(b+0.5)` or `<.b+0.5` or `<.b+1r2`

2.5 Enter `2 4 3 $ i. 5` to see an example of a *rank* `3` *array* or *report* (for two years of four quarters of three months each).

2.6 Enter `?9` repeatedly and state what the function `?` does. Then enter `t=: ?3 5 $ 9` to make a table for use in further experiments.

Answer: `?` is a (pseudo-) random number generator; `?n` produces an element from the population `i.n`.

---

# 3. Verbs and Adverbs

In the sentence `%a` of Section 2, the `%` "acts upon" `a` to produce a result, and `%a` is therefore analogous to the notion in English of a *verb* acting upon a noun or pronoun. We will hereafter adopt the term *verb* instead of (or in addition to) the mathematical term *function* used thus far.

The sentence `+/ 1 2 3 4` is equivalent to `1+2+3+4`; the adverb `/` applies to *its* verb argument `+` to produce a new verb whose argument is `1 2 3 4`, and which is defined by inserting the verb `+` between the items of its argument. Other arguments of the insert adverb are treated similarly:

```
   */b=:2 7 1 8 2 8
1792

   <./b
1

   >./b
8
```

The verb resulting from the application of an adverb may (like a primitive verb) have both monadic and dyadic cases; due to its two uses, the adverb `/` is called either *insert* or *table*. In the present instance of `/` the dyadic case produces a *table*. For example:

```
   2 3 5 +/ 0 1 2 3 
2 3 4 5
3 4 5 6
5 6 7 8
```

The verbs `over=:({.;}.)@":@,` and `by=:' '&;@,.@[,.]` can be entered as utilities (for use rather than for immediate study), and can clarify the interpretation of *function tables* such as the addition table produced above. For example:

```
   a=: 2 3 5
   b=: 0 1 2 3

   a by b over a +/ b
+-+-------+
| |0 1 2 3|
+-+-------+
|2|2 3 4 5|
|3|3 4 5 6|
|5|5 6 7 8|
+-+-------+
   b by b over b </ b
+-+-------+
| |0 1 2 3|
+-+-------+
|0|0 1 1 1|
|1|0 0 1 1|
|2|0 0 0 1|
|3|0 0 0 0|
+-+-------+
```

**Exercises**

3.1 Enter `d=: i.5` and the sentences `st=: d-/d` and `pt=: d^/d` to produce function tables for subtraction and power.

3.2 Make tables for further functions from previous sections, including the relations `<` and `=` and `>` and *lesser-of* and *greater-of*.

3.3 Apply the verbs `|.` and `|:` to various tables, and try to state what they do.

3.4 The *transpose* function `|:` changes the subtraction table, but appears to have no effect on the multiplication table. State the property of those functions whose tables remain unchanged when transposed.

Answer: They are commutative.

3.5 Enter `d by d over d!/d` and state the definition of the dyad `!`.

Answer: `!` is the binomial coefficient or *outof* function; `3!5` is the number of ways that three things can be chosen from five.

---

# 4. Punctuation

English employs various symbols to *punctuate* a sentence, to indicate the order in which its phrases are to be interpreted. Thus:

    The teacher said he was stupid.
    The teacher, said he, was stupid.

Math also employs various devices (primarily parentheses) to specify order of interpretation or, as it is usually called, *order of execution*. It also employs a set of rules for an unparenthesized phrase, including a hierarchy amongst functions. For example, *power* is executed before *times*, which is executed before *addition*.

**J** uses parentheses for punctuation, together with the following rules for unparenthesized phrases:

*   The right argument of a verb is the value of the entire phrase to its right.
*   Adverbs are applied first. Thus, the phrase `a */ b` is equivalent to `a (*/) b`, not to `a(*/b)`.

For example:

```
   a=:5
   b=:3
   (a*a)+(b*b)
34

   a*a+b*b
70
  
   a*(a+(b*b))
70
  
   (a+b)*(a-b)
16

   a (+*-) b
16
```

The last sentence above includes the *isolated* phrase `+*-` which has thus far not been assigned a meaning. It is called a *fork*, and is equivalent to the sentence that precedes it.

A fork also has a monadic meaning, as illustrated for the *mean* below:

```
   c=:2 3 4 5 6
   (+/ % #) c                 The verb # yields the number of items in its argument
4

   (+/c)%(#c)
4
```

**Exercises**

4.1 In math, the expression $3x^4+4x^3+5x^2$ is called a *polynomial*. Enter:

```
   x=: 2
   (3*x^4)+(4*x^3)+(5*x^2)
```

to evaluate the polynomial for the case where `x` is `2`.

4.2 Note that the hierarchy among functions used in math is such that no parentheses are necessary in writing a polynomial. Write an equivalent sentence using no parentheses.

Answer: `+/3 4 5 * x ^ 4 3 2`

or (first assigning names to the *coefficients* `3 4 5` and the *exponents* `4 3 2`), as: `+/c*x^e`

---

# 5. Forks

As illustrated above, an isolated sequence of three verbs is called a *fork*; its monadic and dyadic cases are defined by:

**Monadic Fork:**

```
    g
   / \
  f   h
  |   |
  y   y
```

**Dyadic Fork:**

```
    g
   / \
  f   h
 / \ / \
x  y x  y
```

Before reading the notes at the right (and by using the facts that `%:` denotes the *root* function and `]` denotes the *identity* function), try to state in English the significance of each of the following sentences:

```
   a=: 8 7 6 5 4 3
   b=: 4 5 6 7 8 9
   2 %: b                     Square root of b
2 2.23607 2.44949 2.64575 2.82843 3
                
   3 %: b                     Cube root of b
1.5874 1.70998 1.81712 1.91293 2 2.08008
                
   (+/ % #) b                 Arithmetic mean or average
6.5
           
   (# %: */) b                Geometric mean
6.26521

   (] - (+/ % #)) b           Centre on mean (two forks)
_2.5 _1.5 _0.5 0.5 1.5 2.5

   (] - +/ % #) b             Two forks (fewer parentheses)
_2.5 _1.5 _0.5 0.5 1.5 2.5

  
   a (+ * -) b                Dyadic case of fork
48 24 0 _24 _48 _72

   (a^2)-(b^2)
48 24 0 _24 _48 _72
                
   a (< +. =) b               Less than or equal
0 0 1 1 1 1
  
   a<b
0 0 0 1 1 1

   a=b
0 0 1 0 0 0

   a (<: = < +. =) b          A tautology (<: is less than or equal)
1 1 1 1 1 1
  
   2 ([: ^ -) 0 1 2           Cap yields monadic case
7.38906 2.71828 1 

   evens=: [: +: i.           +: is double
   evens 7
0 2 4 6 8 10 12

   odds=: [: >: evens         >: is increment
   odds 7
1 3 5 7 9 11 13
```

**Exercises**

5.1 Enter `5#3` and similar expressions to determine the definition of the dyad `#` and then state the meaning of the following sentence:

```
(# # >./) b=: 2 7 1 8 2
```

Answer: `#b` repetitions of the maximum over `b`

5.2 Cover the comments on the right, write your own interpretation of each sentence, and then compare your statements with those on the right:

```
(+/ % #) b                    Mean of b
(# # +/ % #) b                (n=:#b) repetitions of mean
+/(##+/%#) b                  Sum of n means
(+/b)=+/(##+/%#) b            Tautology
(*/b)= */(###%:*/) b          The product over b is the product over n
                              repetitions of the geometric mean of b
```

---

# 6. Programs

A *program* handed out at a musical evening describes the sequence of musical pieces to be performed. As suggested by its roots *gram* and *pro*, a program is something written in advance of the events it prescribes.

Similarly, the fork `+/ % #` of the preceding section is a program that prescribes the computation of the mean of its argument when it is applied, as in the sentence `(+/%#)b`. However, we would not normally call the procedure a program until we assign a name to it, as illustrated below:

```
   mean=: +/ % #
   mean 2 3 4 5 6
4

   (geomean=: # %: */) 2 3 4 5 6
3.72792
```

Since the program `mean` is a new *verb*, we also refer to a sentence such as `mean=: +/ % #` as *verb definition* (or *definition*), and to the resulting verb as a *defined* verb or function.

Defined verbs can be used in the definition of further verbs in a manner sometimes referred to as *structured programming*. For example:

```
   MEAN=: sum % #
   sum=: +/
   MEAN 2 3 4 5 6
4
```

Entry of a verb alone (without an argument) displays its definition, and the foreign conjunction (`!:`) can be used to specify the form of the display: boxed, tree, linear, or parens. (The session can also be configured to specify the form of verb display, under the menu item Edit|Configure...|View.) Thus:

```
   mean
+/ % #

   9!:3 (2 4 5)
   mean
+-----+-+-+
|+-+-+|%|#|
||+|/|| | |
|+-+-+| | |
+-----+-+-+
  +- / --- +
--+- %      
  +- #    
+/ % #
```

**Exercises**

6.1 Enter `AT=: i. +/ i.` and use expressions such as `AT 5` to determine the behavior of the program `AT`.

6.2 Define and use similar function tables for other dyadic functions.

6.3 Define the programs:

```
   tab=: +/
   ft=: i. tab i.
   test1=: ft = AT
```

Then apply `test1` to various integer arguments to test the proposition that `ft` is equivalent to `AT` of Exercise 6.1, and enter `ft` and `AT` alone to display their definitions.

6.4 Define `aft=: ft f.` and use `test2=: aft = ft` to test their equivalence. Then display their definitions and state the effect of the adverb `f.`.

Answer: The adverb `f.` *fixes* the verb to which it applies, replacing each name used by its definition.

6.5 Redefine `tab` of Exercise 6.3 by entering `tab=: */` and observe the effects on `ft` and its *fixed* alternative `aft`.

6.6 Define `mean=: +/ % #` and state its behavior when applied to a *table*, as in `mean t=: (i. !/ i.) 5`.

Answer: The result is the average *of*, not *over*, the rows of a table argument.

6.7 Write an expression for the mean of the *columns* of `t`.

Answer: `mean |: t` or `mean"1 t`

---

# 7. Bond Conjunction

A dyad such as `^` can be used to provide a family of monadic functions:

```
   ]b=: i.7
0 1 2 3 4 5 6

   b^2                        Squares
0 1 4 9 16 25 36

   b^3                        Cubes
0 1 8 27 64 125 216

   b^0.5                      Square roots
0 1 1.41421 1.73205 2 2.23607 2.44949
```

The *bond* conjunction `&` can be used to bind an argument to a dyad in order to produce a corresponding defined verb. For example:

```
   square=: ^&2               Square (power and 2)
   square b
0 1 4 9 16 25 36
  
   (sqrt=: ^&0.5) b           Square root function
0 1 1.41421 1.73205 2 2.23607 2.44949
```

A left argument can be similarly bound:

```
   Log=: 10&^.                Base-10 logarithm
   Log 2 4 6 8 10 100 1000
0.30103 0.60206 0.778151 0.90309 1 2 3
```

Such defined verbs can of course be used in forks. For example:

```
   in29=: 2&< *. <&9          Interval test
   in29 0 1 2 5 8 13 21
0 0 0 1 1 0 0

   IN29=: in29 # ]            Interval selection
   IN29 0 1 2 5 8 13 21
5 8

   LOE=: <+.=
   5 LOE 3 4 5 6 7
0 0 1 1 1

   integertest=: <. = ]       The monad <. is floor
   integertest 0 0.5 1 1.5 2 2.5 3
1 0 1 0 1 0 1
  
   int=: integertest
   int (i.13)%3
1 0 0 1 0 0 1 0 0 1 0 0 1
```

**Exercises**

7.1 The verb `#` is used dyadically in the program `IN29`. Enter expressions such as `(j=: 3 0 4 0 1) # i.5` to determine the behavior of `#`, and state the result of `#j#i.5`. (Also try `1j1#i.5`.)

Answer: `+/j`

7.2 Cover the answers on the right and apply the following programs to lists to determine (and state in English) the purpose of each:

```
   test1=: >&10 *. <&100      Test if in 10 to 100
   int=: ] = <.               Test if integer
   test2=: int *. test1       Test if integer and in 10 to 100
   test3=: int +. test1       Test if integer or in 10 to 100
   sel=: test2 # ]            Select integers in 10 to 100
```

7.3 Cover the program definitions on the left of the preceding exercise, and make new programs for the stated effects.

7.4 Review the use of the *fix* adverb in Exercises 6.4-5, and experiment with its use on the programs of Exercise 7.2.

---

# 8. Atop Conjunction

The conjunction `@` applies to two verbs to produce a verb that is equivalent to applying the first *atop* the second. For example:

```
   TriplePowersOf2=: (3&*)@(2&^)
   TriplePowersOf2 0 1 2 3 4
3 6 12 24 48

   CubeOfDiff=: (^&3)@-
   3 4 5 6 CubeOfDiff 6 5 4 3
_27 _1 1 27

   f=: ^@-                    The rightmost function is first applied dyadically
                              if possible; the second is applied monadically.
   5 f 3
7.38906

   f 3
0.0497871

   g=: -@^
   5 g 3
_125

   g 3
_20.0855
```

A conjunction, like an adverb, is executed before verbs; the *left* argument of either is the entire verb phrase that precedes it. Consequently, some (but not all) of the parentheses in the foregoing definitions can be omitted. For example:

```
   COD=: ^&3@-
   3 4 5 6 COD 6 5 4 3
_27 _1 1 27

   TPO2=: 3&*(2&^)

   TPO2 0 1 2 3 4
3 6 12 24 48

   tpo2=: 3&*@2&^             An error because the conjunction @ is defined
|domain error                 only for a verb right argument
|   tpo2=:    3&*@2&^
```

**Exercises**

8.1 Cover the comments on the right, and state the effects of the programs. Then cover the programs and rewrite them from the English statements:

```
mc=: (+/%#)@|:                Means of columns of table
f=: +/@(^&2)                  Sum of squares of list
g=: %:@f                      Geometric length of list
h=:{&' *'@(</)                Map of comparison (dyad)
k=: i. h i.                   Map (monad)
map=: {&'+-* %#$'             7-character map
MAP=: map@(6&<.)              Extended domain of map
add=: MAP@ (i.+/i.)           Addition table map
```

---

# 9. Vocabulary

Memorizing lists of words is a tedious and ineffectual way to learn a language. Better techniques include conversation, reading, using references, writing, and analyzing word structure.

In **J**:
*   Texts use the language in a variety of topics.
*   The appended dictionary provides a complete grammar.
*   Words possess structure, such as `+:`, `-:`, `*:`, and `%:` for *double*, *halve*, *square*, and *square root*.
*   Beginners can assign mnemonic names (e.g., `sqrt=:%:`).

For precise oral communication, use the names of symbols:

| Symbol | Name | Symbol | Name |
| :--- | :--- | :--- | :--- |
| `<` | Left a (ngle) | `/` | Slash |
| `&` | Amp (ersand) | `%` | Per (cent) |
| `[` | Left b (racket) | `\` | Back (slash) |
| `@` | At | `;` | Semi (colon) |
| `{` | Left c (urly bracket) | `\|` | Stile |
| `^` | Caret | `~` | Tilde |
| `(` | Left p (arenthesis) | `_` | (Under) Bar |
| `` ` `` | Grave | `*` | Star |

**Exercises**

9.1 Experiment with a revised version of the program `MAP` of Exercise 7.1, using the *remainder* or *residue* dyad (`|`) instead of the *minimum* (`<.`), as in `M=:map@(6&|)` and compare its results with those of `MAP`.

9.2 Experiment with the programs `sin` and `SIN` defined in this section.

9.3 Write programs using various new primitives found in the vocabulary at the end of the book.

9.4 Update the table of notation prepared in Exercise 2.2.

---

# 10. Housekeeping

In an extended session it may be difficult to remember the names assigned to verbs and nouns; the *foreign* conjunction `!:` provides facilities for displaying and erasing them. For example:

```
   b=: 3* a=: i. 6
   sum=: +/
   tri=: sum\ a
   names=: 4!:1

   names 0
+-+-+---+
|a|b|tri|
+-+-+---+

   names 3
+-----+---+
|names|sum|
+-----+---+

   erase=: 4!:55
   erase <'tri'
1

   names 0 3
+-+-+-----+-----+---+
|a|b|erase|names|sum|
+-+-+-----+-----+---+

   erase names 0
1 1

   names 0 3
+-----+-----+---+
|erase|names|sum|
+-----+-----+---+
```

The Windows drop-down menus can be used to save, retrieve, and print sessions. They can also be used to open *script windows*, in which any number of sentences may be entered and edited, and from which they can be *executed* so as to appear in the normal execution window. See `profile.ijs` for more housekeeping facilities.

**Exercises**

10.1 Enter and experiment with the programs defined in this section.

10.2 Type in the sentence `+/ 2 3 5 * i. 3` and press the Enter key to execute it.

10.3 Use the Up-arrow cursor key to move the cursor back up the line entered in Exercise 10.2, then modify it to `-` and execute.

10.4 Use cursor keys to move the cursor to the immediate left of the `i` in the sentence executed in Exercise 10.3. Then hold down the Control key and press the F1 key to display Dictionary definition of the primitive `i.`.

10.5 Press the Escape key to close the display invoked in Exercise 10.4. Then move the cursor to the left so that it is separated from the line by one or more spaces, and again perform Ctrl F1 to display the individually boxed words in the sentence.

---

# 11. Power and Inverse

The power conjunction (`^:`) is analogous to the power function (`^`). For example:

```
   ]a=: 10^ b=: i.5
1 10 100 1000 10000

   b
0 1 2 3 4

   %:a
1 3.16228 10 31.6228 100

   %: %: a
1 1.77828 3.16228 5.62341 10

   %: ^: 2 a
1 1.77828 3.16228 5.62341 10

   %: ^: 3 a
1 1.33352 1.77828 2.37137 3.16228

   %: ^: b a
1      10     100    1000   10000
1 3.16228      10 31.6228     100
1 1.77828 3.16228 5.62341      10
1 1.33352 1.77828 2.37137 3.16228
1 1.15478 1.33352 1.53993 1.77828

   (cos=: 2&o.) ^: b d=:1
1 0.540302 0.857553 0.65429 0.79348

   ] y=: cos ^: _ d
0.739085

   y=cos y
1
```

Successive applications of `cos` appear to be converging to a limiting value; the infinite power (`cos ^: _`) yields this limit.

A right argument of `_1` produces the *inverse* function. Thus:

```
   %: ^: _1 b
0 1 4 9 16

   *: b
0 1 4 9 16

   %: ^: (-b) b
0 1     2         3         4
0 1     4         9        16
0 1    16        81       256
0 1   256      6561     65536
0 1 65536 4.30467e7 4.29497e9
```

**Exercises**

11.1 The square function `*:` is the inverse of the square root function `%:` and `%:^:_1` is therefore equivalent to `*:`. Look for, and experiment with, other inverse pairs among the primitive functions in the Vocabulary.

---

# 12. Reading and Writing

Translating to and from a known language provides useful beginning exercises in learning a new one. The following provides examples. **Cover** the **right** side of the page and make a serious attempt to translate the sentences on the **left** to English.

| Code | Translation |
| :--- | :--- |
| `f1=: <:` | Decrement (monad); Less or equal |
| `f2=: f1&9` | Less or equal 9 |
| `f3=: f2 *. >:&2` | Interval test 2 to 9 (inclusive) |
| `f4=: f3 *. <. = ]` | In 2 to 9 and integer |
| `f5=: f3 +. <. = ]` | In 2 to 9 or integer |
| | |
| `g1=: %&1.8` | Divide by 1.8 |
| `g2=: g1^:_1` | Multiply by 1.8 |
| `g3=: -&32` | Subtract 32 |
| `g4=: g3^:_1` | Add 32 |
| `g5=: g1@g3` | Celsius from Fahrenheit |
| `g6=: g5^:_1` | Fahrenheit from Celsius |
| | |
| `h1=: >./` | Maximum over list (monad) |
| `h2=: h1-<./` | Spread. Try `h2 b` with the parabola: `b=:(-&2 * -&3) -:i.12` |
| `h3=: h1@]-i.@[*h2@]%<:@[` | Grid. Try `10 h3 b` |
| `h4=: h3 <:/ ]` | Barchart. Try `10 h4 b` |
| `h5=: {&' *' @ h4` | Barchart. Try `10 h5 b` |

**Exercises**

12.1 These exercises are grouped by topic and organized like the section, with programs that are first to be read and then to be rewritten.

**A. Properties of numbers**

| Code | Description |
| :--- | :--- |
| `pn=: >:@i.` | Positive numbers (e.g. `pn 9`) |
| `rt=: pn |/ pn` | Remainder table |
| `dt=: 0&amp;=@rt` | Divisibility table |
| `nd=: +/@dt` | Number of divisors |
| `prt=: 2&amp;=@nd` | Prime test |
| `prsel=: prt # pn` | Prime select |
| `N=: >:@pn` | Numbers greater than 1 |
| `rtt=: ,@(N */ N)` | Ravelled times table |
| `aprt=: -.@(N e. rtt)` | Alternative test and selection (primes do not occur in the times table for `N`) |
| `apsel=: aprt # N` | |
| `pfac=: q:` | Prime factors |
| `first=: p:@i.` | First primes |

**B. Coordinate Geometry**

Do experiments on the vector (or *point*) `p=: 3 4` and the triangle represented by the table `tri=: 3 2$ 3 4 6 5 7 2`.

| Code | Description |
| :--- | :--- |
| `L=: %:@:(+/)@:*:"1` | Length of vector (See *rank* in the dictionary or in of the Introduction) |
| `LR=:L"1` | Length of rows in table |
| `disp=: ] - 1&amp;|.` | Displacement between rows |
| `LS=: LR@disp` | Lengths of sides of figure |
| `sp=: -:@(+/)@LS` | Semiperimeter (try `sp tri`) |
| `H=: %:@(*/)@(sp,sp-LS)` | Heron's formula for area |
| `det=: -/ . *` | Determinant (See dictionary) |
| `SA=: det@(,.&amp;0.5)` | Signed area. Try `SA@|.` |
| `sa=:det@(],.%@!@<:@#)` | General signed volume; try on the tetrahedron |
| `tet=:?4 3$9` | as well as on the triangle `tri`. |

---

# 13. Format

A numeric table can be rendered more readable by *formatting* it to appear with a specified width for each column, and with a specified number of digits following the decimal point.

```
   ]t=:(i.4 5)%3
      0 0.333333 0.666667       1 1.33333
1.66667        2  2.33333 2.66667       3
3.33333  3.66667        4 4.33333 4.66667
      5  5.33333  5.66667       6 6.33333

   ]f=: 6j2 ": t
  0.00  0.33  0.67  1.00  1.33
  1.67  2.00  2.33  2.67  3.00
  3.33  3.67  4.00  4.33  4.67
  5.00  5.33  5.67  6.00  6.33
```

The result `f` is a table of *characters*, not numbers. However, the verb *do* or *execute* (`".`) applied to such a character table yields a corresponding numeric table.

**Exercises**

13.1 Using the programs defined in Section 12, experiment with the following expressions:

```
5j2 ": d=: %: i.12
5j2 ":,.d
fc=: 5j2&":@,. 
fc d
20 (fc@h3 ,. h5) d
20 (fc@h3 ,. '|'&,.@h5) d
plot=: fc@h3,.'|'&,.@h5
20 plot d
```

---

# 14. Partitions

The function `sum=: +/` applies to an entire list argument; to compute *partial sums* or *subtotals*, it is necessary to apply it to each prefix of the argument. The symbol `\` denotes the *prefix* adverb.

```
   sum=: +/ 
   a=: 1 2 3 4 5 6
   (sum a) ; (sum\ a)
+--+--------------+
|21|1 3 6 10 15 21|
+--+--------------+
```

The adverb `\.` applies similarly to suffixes:

```
   sum\. a
21 20 18 15 11 6
```

The monad `<` simply *boxes* its arguments, and the verbs `<\` and `<\.` therefore show the effects of partitions with great clarity.

The oblique adverb `/.` partitions a *table* along diagonal lines.

```
   </. t=: 1 2 1 */ 1 3 3 1
+-+---+-----+-----+---+-+
|1|3 2|3 6 1|1 6 3|2 3|1|
+-+---+-----+-----+---+-+
```

**Exercises**

14.1 Define programs analogous to `sum=:+/\` for progressive products, progressive maxima, and progressive minima.

14.2 Treat the following programs and comments like those of Section 12.

| Code | Description |
| :--- | :--- |
| `pol=: +/@([*]^i.@#@[)"1 0` | Polynomial |
| `pp=: +//.@(*/)` | Polynomial product |
| `pp11=: 1 1&pp` | Polynomial product by `1 1` |
| `pp11 d` | |
| `pp11^:5 (1)` | |
| `ps=: +/@,:` | Polynomial sum |

---

# 15. Defined Adverbs

Names may be assigned to adverbs, as they are to nouns and verbs:

```
   a=:1 2 3 4 5
   prefix=: \
   < prefix 'abcdefg'
+-+--+---+----+-----+------+-------+
|a|ab|abc|abcd|abcde|abcdef|abcdefg|
+-+--+---+----+-----+------+-------+

   +/ prefix a
1 3 6 10 15
```

Moreover, new adverbs result from a string of adverbs (such as `/\`) and from a conjunction together with one of its arguments. Such adverbs can be *defined* by assigning names.

```
   IP=: /\                     NB. Insert Prefix
   + IP a
1 3 6 10 15

   with3=: &3
   % with3 a
0.333333 0.666667 1 1.33333 1.66667
```

**Exercises**

15.1 Experiment with, and explain the behavior of, the adverbs `pow=: ^&` and `log=: &^.`.

15.2 State the significance of the following expressions, and test your conclusions by entering them:

| Code | Description |
| :--- | :--- |
| `+/~ i=: i. 6` | Addition table |
| `ft=: /~` | Function table adverb |
| `+ ft i` | Addition table |
| `! ft i` | Binomial coefficients |
| `inv=: ^:_1` | Inverse adverb |
| `sub3=: 3&+ inv` | Subtract-three function |
| `sub3 i` | |

---

# 16. Word Formation

The interpretation of a written English sentence begins with word formation. The process is based on spaces to separate the sentence into units, but is complicated by matters such as apostrophes and punctuation marks.

The following lists of characters represent sentences in **J**, and can be executed by applying the *do* or *execute* function `".`:

```
   m=: '3 %: y'
   d=: 'x %: y'
   x=: 4
   y=: 27 4096

   ". m
3 16

   do=: ". 
   do d
2.27951 8
```

The word formation rules of **J** are prescribed in Part I of the dictionary. Moreover, the word-formation function `;:` can be applied to the string representing a sentence to produce a boxed list of its words.

**Exercises**

16.1 Choose sentences such as `pp=:+//.@(*/)` from earlier exercises, enclose them in quotes, and observe the effects of word-formation (`;:`) on them.

16.2 Move the cursor to the left of a line so that it is separated from the line by one or more spaces, and press Ctrl F1 to display the individually boxed words in the sentence.

---

# 17. Names and Displays

In addition to the normal names used thus far, there are three further classes:

1. `$: ` is used for self-reference, allowing a verb to be defined recursively without necessarily assigning a name to it.
2. The names `x` and `y` are used in explicit definition, denoting the arguments.
3. A name (such as `ab_cd_`) that has two underbars of which one is the final character, is a *locative*. Names used in a *locale* `F` can be referred to in another locale `G` by using the suffix `F` in a locative name of the form `pqr_F_`.

The form of the display invoked by entering a name alone is established by `9!:3`.

**Exercises**

17.1 Experiment with the use of locatives.

---

# 18. Explicit Definition

The sentences in the example `m=: '3 %: y'` and `d=: 'x %: y'` can be used with the *explicit definition* conjunction `:` to produce a verb:

```
   script=: 0 : 0
3 %: y
:
x %: y
)

   roots=: 3 : script
   roots 27 4096
3 16

   4 roots 27 4096
2.27951 8
```

Adverbs and conjunctions may also be defined explicitly. Control structures may also be used.

```
f=: 3 : 0              
if. y<0            
  do. *:y             
  else. %:y           
end.            
)
```

**Exercises**

18.1 Experiment with and display the functions `roots=: 3 : script` and `13 : script` (which are equivalent).

18.2 See the discussion of control structures in the dictionary, and use them in defining further verbs.

18.3 Experiment with expressions such as `! d b=: i.7`, after defining the adverb `d`: `d=: 1 : 0` then `+:@x` then `)`.

18.4 Using the program `pol` from Exercise 14.2, perform the following experiments and comment on their results:

```
g=: 11 7 5 3 2 & pol
e=: 11 0 5 0 2 & pol
o=:  0 7 0 3 0 & pol
(g = e + o) b=: i.6
(e = e@-) b
(o = -@o@-) b
```

Answer: The function `g` is the sum of the functions `e` and `o`. Moreover, `e` is an even function, and `o` is an odd function.

18.5-18.8 Review Section H of Part II and use scripts to make further explicit definitions, including adverbs (`1 : 0`) and complex number experiments.

---

# 19. Tacit Equivalents

Verbs may be defined either explicitly or tacitly. In the case of a one-sentence explicit definition, the corresponding tacit definition may be obtained by using the adverb `13 :`.

```
   s=: 0 : 0
(+/y) % (#y)
)
   MEAN=: 13 : s
```

**Exercises**

19.1 Use the display of the tacit definition of `MEAN` to define an equivalent function called `M`.

Answer: `M=: +/ % #`

---

# 20. Rank

The shape (`$`), tally (`#`), and rank (`#@$`) of a noun are illustrated by the noun `report`. The last $k$ axes determine a $k$-cell of a noun.

The rank conjunction `"` is used in the phrase `f"k` to apply a function `f` to each of the $k$-cells of its argument.

```
   ,report
0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23

   ,"2 report
 0  1  2  3  4  5  6  7  8  9 10 11
12 13 14 15 16 17 18 19 20 21 22 23
```

**Exercises**

20.1 Observe the results of the following uses of the monads produced by the rank conjunction, and comment on them: `<"0 a`, `<"1 a`, `<"2 a`, etc.

20.2 Use the results of experiments to state the relation between the conjunctions `@` (Atop) and `@:` (At).

Answer: The rank of the function `|. @: g` is itself infinite and `|.` therefore applies to the entire list result of `g a`. The function `f @ g` *inherits* the rank of `g`.

---

# 21. Gerund and Agenda

In English, a *gerund* is a noun that carries the force of a verb. The *tie* conjunction `` ` `` applies to two verbs to form a gerund, from which elements can be chosen for execution. If the agenda conjunction `@.` is applied to a gerund, its verb right argument provides the results that choose the elements.

```
   g=: +`^
   a=: <
   2 g@.a 3
8
```

The *insert* adverb `/` applies to a gerund in a manner analogous to its application to a verb.

**Exercises**

21.1 Define a function `f` such that `(x=: 4) f c=: 1 3 3 1` yields the result used as the argument to `+` ` ` ` */ ` in Horner's method.

Answer: `f=: }.@,@,.`

---

# 22. Recursion

A definition is called *recursive* if the function being defined recurs in its definition. A case statement can be used to make a recursive definition. The word `$:` provides *self-reference* that permits anonymous recursive definition.

```
   factorial=: 1:`(]*$:@<:) @. * "0
```

**Exercises**

22.1 Use the following as exercises in reading and writing:

```
   f=:1:`(+//.@(,:~)@($:@<:))@.*         Binomial Coeffs
   <@f"0 i.6                             Boxed binomials
   g=:1:`((],+/@(_2&{.))@$:@<:)@.*       Fibonacci
```

---

# 23. Iteration

The repetition of a process is called *iteration*. Explicit iteration is provided by the power conjunction (`^:`), by agenda (`@.`) with self-reference, and by control structures.

*Controlled* iteration of a process `p` is provided by `p^:q`, where the result of `q` determines the number of applications of `p` performed.

**Exercises**

23.1 Use the function `root` (defined in the text) to find the roots of various functions.

23.2 Experiment with the function `fn=: +/\` (which produces the figurate numbers when applied repeatedly to `i.n`), and explain the behavior of the function `fn^:(?@3:)`.

---

# 24. Permutations

Anagrams are familiar examples of the important notion of *permutations*.

```
   w=: 'STOP'
   3 2 0 1 { w
POST
```

If `p` is a permutation vector, the phrase `p&C.` also represents the permutation `p&{`. However, `C. p` yields the *cycle representation* of the permutation `p`. A permutation can be identified by its index in the table of all `!n` permutations of order `n` listed in increasing order (anagram index).

**Exercises**

24.1 Use `f=: 1&A.` (Interchange last two items), `g=: 3&A.` (Rotate last three items), `h=: 5&A.` (Reverse last three items), etc., as exercises.

24.2 Experiment with abbreviated arguments to `C.`.

24.3 Make a program `ac` that produces a table of the cycle representations of all permutations of the order of its argument. Answer: `ac=: C.@(i.@! A. i.)`

---

# 25. Linear Functions

A function `f` is said to be *linear* if `f(x+y)` equals `(f x)+(f y)` for all arguments `x` and `y`. If `f` is a linear function, then `f y` can be expressed as the *matrix product* `mp&M y`, where `mp=: +/ . *`.

**Exercises**

25.1 For each of the following functions, determine the matrix `M` such that `M (mp=: +/ . *) N` is equivalent to the result of the function applied to the matrix `N`.

```
|.
-
+:
(4&*-2&*@|.)
2&A.
```

---

# 26. Obverse and Under

The result of `f^:_1` is called the *obverse* of the function `f`; if `f=: g :. h`, this obverse is `h`, and it is otherwise an inverse of `f`. The result of the phrase `f &. g` is the verb `(g^:_1)@(f & g)`.

**Exercises**

26.1 Use the following as exercises in reading and writing:

```
f=: +&.^.                      Multiplication by addition of natural logs
g=: +&.(10&^.)                 Multiplication using base-10 logs
h=: *&.^                       Addition from multiplication
i=: |.&.>                      Reverse each box
j=: +/&.>                      Sum each box
k=: +/&>                       Sum each box and leave open
```

---

# 27. Identity Functions and Neutrals

The monads `0&+` and `1&*` are *identity* functions, and `0` and `1` are said to be *identity elements* or *neutrals* of the dyads `+` and `*` respectively. Insertion on an empty list yields the neutral of the dyad inserted.

**Exercises**

27.1 Predict and test the results of expressions like `*/''`, `<./''`, etc.

27.2 Experiment with the dyad `{@;` and give the term used to describe it in mathematics. Answer: Cartesian product.

27.3 Test the assertion that the monads `(%:@~. +/ . * =)` and `%:` are equivalent.

27.4 Comment on expressions like `a (f=: *:@+) b` (Square of sum).

27.5 Use tautologies involving `t1` through `t15` and sine, cosine, determinant, permanent, and hyperbolic functions as reading and writing exercises.

27.6 Comment on logical implications such as `theorem=: f <: g`.

---

# 28. Secondaries

It is convenient to supplement the *primitives* or *primaries* provided in a language by *secondaries* whose names belong to an easily recognized class.

| Name | Definition | Description |
| :--- | :--- | :--- |
| `Ad=:` | `[ 0:}-@>:@$@]{.]` | Append diagonal scalar |
| `Ai=:` | `>:@i.` | Augmented integers |
| `Area=:` | `[: Det ] ,. %@!@#"1` | Area (Vol) try `Area tet=:0,=i.3` |
| `Bc=:` | `i. !/ i.` | Binomial coefficients |
| `Bca=:` | `%.@Bc` | Binomial coefficients (alternating) |
| `Det=:` | `-/. *` | Determinant |
| `Inv=:` | `^:_1` | Inverse |

**Exercises**

28.1 Enter the definitions of the secondaries and experiment with expressions like `(Ai 2 3)` and `(S1;S2) 7`.

---

# Sample Topics

This part provides examples of the use of **J** in various topics; it is designed to be used in conjunction with the dictionary and at the keyboard of a **J** system.

## 1. Spelling
Demonstrates parsing and execution using `;:`.

## 2. Alphabet and Numbers
Demonstrates `a.` (the major alphabet), complex numbers, roots of unity, and extended precision integers (`x`).

## 3. Grammar
Demonstrates parts of speech: Nouns/Pronouns (`50`), Verbs/Proverbs (`+`), Adverbs (`/`), Conjunctions (`&`), Copula (`=:`), Punctuation (`()`).

## 4. Function Tables
Shows how to make function tables using `+/~`, `*/~`, etc.

## 5. Bordering a Table
Utility functions `over` and `by` to create labelled tables.

## 6. Tables (Letter Frequency)
Analysis of text character frequency.

## 7. Tables
Divisibility, primes, comparison tables.

## 8. Classification
Barcharts and classifications.

## 9. Disjoint Classification (Graphs)
Using `</\` for disjoint classification.

## 10-11. Classification (Inner Product / Sets)
Using inner products for classification and set definitions.

## 12. Sorting
Using `/:` to sort lists and characters.

## 13-14. Compositions
Compositions based on Conjunctions (`&`, `@`, etc.) and on Hooks and Forks.

## 15. Junctions
Using `;`, `,`, `,.`, `,:` to join arguments.

## 16-17. Partitions
Using adverbs `\`, `\.`, `/.` and cut conjunction `;`.

## 18. Geometry
Coordinate geometry, Heron's formula, area/volume of polyhedra.

## 19. Symbolic Functions
Functions that display expressions rather than evaluating them.

## 20-21. Directed Graphs & Closure
Using connection matrices and transitive closure.

## 22. Distance
"Street" distance calculations.

## 23-28. Polynomials & Roots
Extensive coverage of polynomials, coefficients, roots, Newton's method, Kerner's method, and Stopes.

---

# Dictionary

**J** is a dialect of APL, a formal imperative language. The dictionary section details:

*   **I. Alphabet and Words:** ASCII characters, names, locatives, numbers (extended integer `x`, rational `r`, complex `j`, exponential `e`, etc.).
*   **II. Grammar:** Parts of speech (Noun, Verb, Adverb, Conjunction), Ranks, Parsing rules, Trains, Scripting, Locales, Errors.
*   **III. Definitions:** Detailed definitions of primitives.

## Appendix A. Foreign Conjunction `!:` (Not fully detailed in HTML)
## Appendix B. Special Code
Optimized cases for primitives (e.g., boolean operations, special combinations like `+/ .*`).
## Appendix C. System Conventions and Limits
Error numbers, print precision, tolerance, recursion limits.
## Appendix D. Errors
List of specific error messages (e.g., domain error, length error, rank error).

## Control Structures
Details `if.`, `while.`, `select.`, `for.`, `try.`, etc.

