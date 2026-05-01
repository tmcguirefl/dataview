# Vocabulary/fork - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/zeroco "Vocabulary/zeroco") [<<](https://code.jsoftware.com/wiki/Vocabulary/hook "Vocabulary/hook")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/intro05.htm "jdic:intro05")

<table class="wikitable"><tbody><tr><td><tt>[x] (f g h) y</tt></td><td>Fork</td><td>Invisible Conjunction</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank_~ "Vocabulary/RankInfo") _\-- operates on \[x and\] y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

  
(f g h) makes a single new verb out of the three verbs: f g h. This verb can then be applied to arguments. The form (f g h) y) creates a new verb and immediately executes it:

-   Monad: f gets applied to noun: y
-   Monad: h gets applied to noun: y
-   Dyad: g combines the two results
```
   y=: 3 3 3 4 3  NB. noun: a time-series
   f=: +/         NB. verb: sum its arg: y
   h=: #          NB. verb: count its arg: y
   g=: %          NB. verb: divide the two results
   (f g h) y      NB. the mean value of series: y
3.2
   mean=: f g h   NB. assign the fork (f g h) to a name
   mean y         NB. does it work? Yes...
3.2

```
---

### Details

Three adjacent verbs, or a noun followed by two verbs, **when not followed by a noun** (as in \[x\] (f g h) y), create a **_fork_** that separately executes f and h on the argument(s) of the fork, and then executes g dyadically on those results:

If f is a noun, its "execution" simply produces its value, as discussed [below](#NVV).

We are talking here about _after_ modifiers have been applied, so that there are only verbs and nouns. (%&2 + 2&\*) is a fork made from the three verbs %&2, +, and 2&\* .

```
x (f g h) y ⇔ (x f y) g (x h y)       result
(f g h) y ⇔ (f y) g (h y)                |
                                         g
                                        / \\
                                       /   \\
                                      /     \\
                                     f       h
                                   \[/\]\\    \[/\]\\
                                  \[x\]  y  \[x\]  y

```
```
   (+/ % #) 1 2 3 4 5   NB. A fork
3
   (+/ 1 2 3 4 5) % (# 1 2 3 4 5)   NB. equivalent computation
3

```

There is a huge difference between

```
   %: +/ \*: 3 4  NB. Pythagorean theorem: square, then total, then square root
5

```

and

```
   (%: +/ \*:) 3 4  NB. ???
10.7321 17.7321
     11      18

```

The first is simply right-to-left execution of \*: 3 4 followed by +/ 9 16 followed by %: 25 . The second creates a fork out of the verbs (%: +/ \*:) and then executes that according to the definition above, producing who-knows-what.

---

#### A Beginner's Error

J beginners often code a **fork** by mistake.

The beginner might spot an attractive sequence of three verbs in sample code, e.g.  %: +/ \*: (viz. the Pythagorean calculation above) and copy this sequence to make a named verb

```
   length=: %: +/ \*:   NB. the length of vector y

```

But the result may be unexpected:

```
   length 3 4
10.7321 17.7321
     11      18

```

The assignment to the name length created a **fork** because the three verbs were not followed by a noun.

One way to think of this is that when substituting for a name, like length here, you'd put parentheses around the substituted phrase to avoid strange effects – which is typical math practice.

For example, let _y=x+2_

Substituting for _y_ in _z=y^2^+2y+5_ yields _z=(x+2)^2^+2(x+2)+5_

However, in the sentence

```
   length 3 4

```

substituting for the name length in this manner yields

```
   (%: +/ \*:) 3 4

```

You have accidentally created a **fork**. To do what you intend, insert: @: between the three verbs

```
   length=: %: @: (+/) @: \*:

```

Here is an equivalent construct using two forks instead of @:

```
   length=: \[: %: \[: +/ \*:
   length=: \[: %: (\[: +/ \*:)   NB. redundant parens to hilite the 2 forks

```

ASIDE:  
The substitution model described above is **not at all** how J actually executes sentences. But it gives the right answers.

---

### Common uses

1\. Compute the mean value of time-series y by dividing the sum over y

```
   +/y

```

by the tally of y

```
   #y

```
```
   mean=: +/ % #
   mean 3 3 3 4 3
3.2

```
---

### More Information

1\. If the fork itself is executed dyadically, i. e. there is a left argument (x (f g h) y), verbs f and h are executed dyadically as x f y and x h y. If there is no x argument to the fork ((f g h) y), f and h are executed as f y and h y.

2\. When a fork appears in a **tacit definition**, where it is creating a verb (and therefore not being executed on a noun), it doesn't have to be enclosed in parentheses:

```
   mean =: +/ % #
   mean 1 2 3
2

```

3\. In a normal sentence that is executing on noun arguments to produce a noun result, a fork must be enclosed in parentheses, as discussed above.

4\. The sequence noun-verb-verb, **not followed by a noun**, produces a **_NVV fork_** which is like a regular fork except that the noun simply produces its value regardless of the arguments to the fork.

```
 result of \[x\] (N g h) y
    |
    g
   / \\
  N   h
    \[/\]\\
   \[x\]  y

   5 (3 + \*) 6
33

```

5\. A sequence of more than 3 verbs in a row (**not followed by a noun**) is processed from right to left and becomes a sequence of forks. If the sequence has an even number of verbs, the last one on the left is part of a final [hook](https://code.jsoftware.com/wiki/Vocabulary/hook "Vocabulary/hook").  

Odd-numbered positions (numbering from the **right** starting at 1), except the rightmost, may be filled by nouns, as in NVV forks.

  
**Odd number of verbs:** numbering the verbs from the **right**, _odd_\-numbered verbs are **all** executed on the original arguments of the overall fork (monadically if the overall fork has no x argument, dyadically if it does), and _even_\-numbered verbs are all executed dyadically on results of adjacent odd-numbered verbs.

```
result<----v12<----v10<----v8<-----v6<-----v4<-----v2
           /       /       /       /       /       / \\
          /       /       /       /       /       /   \\
         /       /       /       /       /       /     \\
       v13     v11      v9      v7      v5      v3      v1
      \[/\]\\    \[/\]\\    \[/\]\\    \[/\]\\    \[/\]\\    \[/\]\\    \[/\]\\
     \[x\]  y  \[x\]  y  \[x\]  y  \[x\]  y  \[x\]  y  \[x\]  y  \[x\]  y

   2 (3 \* \[ + >. - <.) 5
15

result<---- \* <---- + <---  -
           /       /       / \\
          /       /       /   \\
         /       /       /     \\
        3       \[       >.      <.
               / \\     / \\     / \\
              2   5   2   5   2   5

```

**Even number of verbs:** numbering the verbs from the **right**, _odd_\-numbered verbs are **all** executed **monadically** on the original y; _even_\-numbered verbs except the leftmost are executed dyadically on the results of odd-numbered verbs; the leftmost verb (which is part of a hook) is executed dyadically, with a left argument of x or y.

```
result<---v14<---v12<-v10<-v8<-v6<-v4<-v2
          /      /    /   /   /   /   / \\
      x or y    v13  v11 v9  v7  v5  v3  v1
                |    |   |   |   |   |   |
                y    y   y   y   y   y   y

   2 1 3 (+   4 <. >./ - <./) 3 1 4 1 5 9
6 5 7

result<--- + <-- <. <- -
          /     /     / \\
       2 1 3   4    >./ <./
                     |   |
                     |   3 1 4 1 5 9
                     3 1 4 1 5 9

```

6\. Any **odd**\-numbered verb (counting from the **right**) except the rightmost may be replaced by \[: (**_Cap_**) to produce a **_capped fork_**. The \[: is not a verb. Its presence in (\[: g h) indicates that its tine of the fork is _nonexistent_: it is not executed, and moreover g is **executed as a monad**.

```
      result              result
        |                   |
normal  g           capped  g
fork   / \\          fork     \\
      /   \\                   \\
     /     \\             /     \\
    f       h          \[:       h
  \[/\]\\    \[/\]\\        \[/\]\\    \[/\]\\
 \[x\]  y  \[x\]  y      \[x\]  y  \[x\]  y

   (3 \* {. + \[: i. \[: >: {: - {.) 4 8  NB. integers between 4 and 8, tripled
12 15 18 21 24

result <------ \* <- + <- i. <- >: <- -
              /    /                / \\
             /    /    /     /     /   \\
            3    {.   \[:    \[:    {:    {.
                 |    |     |     |     |
                4 8  4 8   4 8   4 8   4 8

```

7\. In the fork (f g h), h is executed before f (as is appropriate given J's general right-to-left execution model), but this behavior is not guaranteed, so don't rely on it.

---

[Hook](https://code.jsoftware.com/wiki/Vocabulary/hook "Vocabulary/hook") (u v), [Atop](https://code.jsoftware.com/wiki/Vocabulary/at "Vocabulary/at") (u@v), [At](https://code.jsoftware.com/wiki/Vocabulary/atco "Vocabulary/atco") (u@:v), [Compose](https://code.jsoftware.com/wiki/Vocabulary/ampv "Vocabulary/ampv") (u&v), [Appose](https://code.jsoftware.com/wiki/Vocabulary/ampco "Vocabulary/ampco") (u&:v), [Under](https://code.jsoftware.com/wiki/Vocabulary/ampdot "Vocabulary/ampdot") (u&.v), [Under](https://code.jsoftware.com/wiki/Vocabulary/ampdotco "Vocabulary/ampdotco") (u&.:v)

---

<table class="wikitable"><tbody><tr><td><tt>u (p q [r]) [v]</tt></td><td>Modifier train</td><td>Invisible Modifier</td></tr></tbody></table>

Use the valid sequences consisting of words p and q \[and r\] in the table below \[and combinations thereof\] to define a modifier (adverb or conjunction) tacitly, that is, without reference to operand(s) u \[and v\].

It is never necessary to use a phrase of this form; explicit modifier definitions perform the same function. But "invisible" modifiers offer a sophisticated language of function composition.

---

### Details

The table below lists all valid fundamental sequences that create adverbs or conjunctions.

Each sequence yields a _[derived entity](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Derived "Vocabulary/Glossary")_ that subsequently acts on the operand(s) u \[and v\].

These fundamental sequences can be nested to create more complex trains.

 Sequence | Part of speech | Interpretation | Quick Search |
| --- | --- | --- | --- |
 V0 V1 C2 | conj | V0 V1 (u C2 v) | [VVC](#VVC) |
 N0 V1 C2 | conj | N0 V1 (u C2 v) | [NVC](#VVC) |
 N0 C1 A2 | adv | N0 C1 (u A2) | [NCA](#NCA) |
 N0 C1 C2 | conj | N0 C1 (u C2 v) | [NCC](#NCC) |
 V0 C1 A2 | adv | V0 C1 (u A2) | [VCA](#VCA) |
 C0 V1 C2 | conj | (u C0 v) V1 (u C2 v) | [CVC](#CVC) |
 V0 C1 C2 | conj | V0 C1 (u C2 v) | [VCC](#VCC) |
 A0 C1 A2 | conj | (u A0) C1 (v A2) | [ACA](#ACA) |
 A0 C1 C2 | conj | (u A0) C1 (u C2 v) | [ACC](#ACC) |
 C0 C1 A2 | conj | (u C0 v) C1 (v A2) | [CCA](#CCA) |
 C0 C1 C2 | conj | (u C0 v) C1 (u C2 v) | [CCC](#CCC) |
 V0 N1 C2 | adv | (... V0 N1) C2 | [VNC](#VNC) |
 A0 V1 V2 | adv | (u A0) V1 V2 | [AVV](#AVV) |
 C0 V1 V2 | conj | (u C0 v) V1 V2 | [CVV](#CVV) |
 A0 A1 V2 | conj | (u A0) (v A1) V2 | [AAV](#AAV) |
 A0 A1 A2 | adv | ((u A0) A1) A2 | [AAA](#AAA) |
 C0 A1 A2 | conj | ((u C0 v) A1) A2 | [CAA](#CAA) |
 A0 C1 N2 | adv | (u A0) C1 N2 | [ACN](#ACN) |
 A0 C1 V2 | adv | (u A0) C1 V2 | [ACV](#ACV) |
 C0 C1 N2 | conj | (u C0 v) C1 N2 | [CCN](#CCN) |
 C0 C1 V2 | conj | (u C0 v) C1 V2 | [CCV](#CCV) |
 N0 C1 | adv | N0 C1 u | [NC](#NC) |
 V0 C1 | adv | V0 C1 u | [VC](#VC) |
 A0 V1 | adv | (u A0) V1 | [AV](#AV) |
 A0 A1 | adv | (u A0) A1 | [AA](#AA) |
 A0 C1 | adv | (u A0) C1 u (adverbial hook) | [AC](#AC) |
 C0 N1 | adv | u C0 N1 | [CN](#CN) |
 C0 V1 | adv | u C0 V1 | [CV](#CV) |
 C0 A1 | conj | (u C0 v) A1 | [CA](#CA) |
 C0 C1 | conj | (u C0 v) (u C1 v) | [CC](#CC) |

---

### Common uses

```
   While=: ^:^:\_   NB. tacit equivalent to {{u^:v^:\_}}

   >:While(<&7) 0  NB. increment while less than 7
7

```
---

### More Information

See: [More discussion and examples of Modifier Trains.](https://code.jsoftware.com/wiki/Vocabulary/ModifierTrains "Vocabulary/ModifierTrains")

---
