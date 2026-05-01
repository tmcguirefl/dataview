# Vocabulary/hook - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/fork "Vocabulary/fork") [<<](https://code.jsoftware.com/wiki/Vocabulary/xco "Vocabulary/xco")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d620.htm "jdic:d620")

<table class="wikitable"><tbody><tr><td><tt>[x] (u v) y</tt></td><td>Hook</td><td>Invisible Conjunction</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank_~ "Vocabulary/RankInfo") _\-- operates on \[x and\] y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

  
Makes a single new verb out of the two verbs: u v which equates to the phrase: (x or y) u v y

```
   u=: \*      NB. Dyad: multiply left and right args
   v=: +&1    NB. Monad: add 1 to y
   y=: 7
   v y        NB. action of v alone on y \[7+1\]
8
   y u y      NB. action of u alone on y and y \[7\*7\]
49
   y u (v y)  NB. action of first applying v to right-arg of u \[7\*8\]
56
   y u v y    NB. J works right to left, hence (…) redundant
56
   (u v) y    NB. make Hook out of u and v
56
   nn1=: u v  NB. common math phrase: n(n+1) defined as a Hook
   nn1 y
56
   x=: 10
   x u v y    NB. without hook
80
   x (u v) y  NB. with hook; same result, but (u v) can be used within longer tacit expression
80

```
---

### Details

Two adjacent verbs **when not followed by a noun** (as in \[x\] (u v) y) create a **_hook_** that executes v followed by u:

We are talking here about _after_ modifiers have been applied, so that there are only verbs and nouns. ({.~ 2&{) is a hook made from the two verbs {.~ and 2&{ .

```
x (u v) y ⇔ x u v y        result
(u v) y ⇔ y u v y             |
                              u
                             / \\
                       x or y   v
                                |
                                y

```

There is a huge difference between

```
   i. # 3 1 4 1 5 9
0 1 2 3 4 5

```

and

```
   (i. #) 3 1 4 1 5 9  NB. same as 3 1 4 1 5 9  i.  #  3 1 4 1 5 9
6

```

The first is simply right-to-left execution of \# 3 1 4 1 5 9 followed by i. 6 . The second creates a hook out of the verbs (i. #) and then executes that according to the definition above.

---

#### A Beginner's Error

When you find two verbs that perform a function you like, like i. and # in the first example above which creates a list of ascending numbers the same length as y, you might try to make a single verb out of them, with

```
   numberforeach =: i. #   NB. create a list of numbers with length #y

```

but you will be disappointed when you use it:

```
   numberforeach 3 1 4 1 5 9
6

```

The assignment to the name numberforeach created a _hook_, because the two adjacent verbs were not followed by a noun.

One way to think of this is that when substituting for a name, like numberforeach here, you must put parentheses around the substitution to avoid strange effects. This is akin to ordinary mathematics, where if you know that _y=x+2_ and you want to substitute that into _z=y^2^+2y+5_, you use parentheses to get _z=(x+2)^2^+2(x+2)+5_. In the sentence

```
   numberforeach 3 1 4 1 5 9

```

when you substitute for the name, you end up with

```
   (i. #) 3 1 4 1 5 9

```

which is a hook and not at all what you wanted.

To do what you wanted you should have written numberforeach =: i.@:#

The substitution model described above is **not at all** how J actually executes sentences, but it will get you the right answers.

---

### Common uses

1\. To fetch the letters of y before the first '$'

```
   ({.~ i.&'$') 'abc$defg'
abc
   'abc$defg' {.~ i.&'$' 'abc$defg'  NB. Same thing without the hook
abc

```

2\. To reshape y to exactly the shape of x

```
   2 2 3 ($ ,) i. 2 4
0 1 2
3 4 5

6 7 0
1 2 3
   2 2 3 $ , i. 2 4
0 1 2
3 4 5

6 7 0
1 2 3

```

3\. Combine a noun n with a modified form of itself. Example: n\*(n+1)

```
   nn1=: \* +&1   NB. a Hook formed from (\*) and (+&1)
   nn1 7
56

```
---

### More Information

1\. When a hook appears in a **tacit definition**, where it is creating a verb (and therefore not being executed on a noun), it doesn't have to be enclosed in parentheses:

```
   fetchdollar =: {.~   i.&'$'
   fetchdollar 'first$string'
first

```

2\. In a normal sentence that is executing on noun arguments to produce a noun result, a hook must be enclosed in parentheses

```
   (#: i.@(\*/)) 3 2   NB. hook: odometer function
0 0
0 1
1 0
1 1
2 0
2 1
   #: i.@(\*/) 3 2   NB. no hook, just right-to-left execution
0 0 0
0 0 1
0 1 0
0 1 1
1 0 0
1 0 1

```

3\. When there are an even number of verbs in a row, the leftmost one will be the u side of a hook, with the v side coming from the other verbs, interpreted as forks. See [the discussion of forks](https://code.jsoftware.com/wiki/Vocabulary/fork#longhook "Vocabulary/fork") for details.

```
   ({.~   3 <. #) 1 2 3 4 5  NB. Take up to 3 items of y
1 2 3
   ({.~   3 <. #) 1 2
1 2

```
---

[Fork](https://code.jsoftware.com/wiki/Vocabulary/fork "Vocabulary/fork") (f g h), [Atop](https://code.jsoftware.com/wiki/Vocabulary/at "Vocabulary/at") (u@v), [At](https://code.jsoftware.com/wiki/Vocabulary/atco "Vocabulary/atco") (u@:v), [Compose](https://code.jsoftware.com/wiki/Vocabulary/ampv "Vocabulary/ampv") (u&v), [Appose](https://code.jsoftware.com/wiki/Vocabulary/ampco "Vocabulary/ampco") (u&:v), [Under](https://code.jsoftware.com/wiki/Vocabulary/ampdot "Vocabulary/ampdot") (u&.v), [Under](https://code.jsoftware.com/wiki/Vocabulary/ampdotco "Vocabulary/ampdotco") (u&.:v)

---
