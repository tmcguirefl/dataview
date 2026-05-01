# Vocabulary/ampm - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/ampv "Vocabulary/ampv") [<<](https://code.jsoftware.com/wiki/Vocabulary/atco "Vocabulary/atco")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d630n.htm "jdic:d630n")

<table class="wikitable"><tbody><tr><td><tt>m&amp;v y</tt></td><td><tt>u&amp;n y</tt></td><td>Bond</td><td>Conjunction</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank "Vocabulary/RankInfo") _\-- operates on x and y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

(m&v) makes a monad out of a dyad v by supplying the (noun) value m as the _left_ argument of v

(m&v y) is the same as (m v y)

```
   triple =: 3&\*
   i: 3
\_3 \_2 \_1 0 1 2 3

   triple i: 3  NB. Same as 3 \* i: 3
\_9 \_6 \_3 0 3 6 9

```

Conversely...

(u&n) makes a monad out of a dyad u by supplying the (noun) value n as the _right_ argument of u

(u&n y) is the same as (y u n)

```
   i:3
\_3 \_2 \_1 0 1 2 3

   gt0=: >&0
   gt0 i:3  NB. Same as (i:3) > 0
0 0 0 0 1 1 1

```
---

### Common Uses

1\. Weld a noun to a verb, creating a unit that bypasses processing by other modifiers. To prefix 'Mr. ' to each boxed string:

```
   'Mr. '&, each 'Jones';'Smith';'Williams'
+---------+---------+------------+
|Mr. Jones|Mr. Smith|Mr. Williams|
+---------+---------+------------+

```

2\. Create a monad out of a dyad when one is required.

---

<table class="wikitable"><tbody><tr><td><tt>x m&amp;v y</tt></td><td><tt>x u&amp;n y</tt></td><td>Bond</td><td>Conjunction</td></tr></tbody></table>

[Rank 0 \_](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank0 "Vocabulary/RankInfo") _\-- operates on atoms of x, and the entirety of y --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

> [![](https://code.jsoftware.com/mediawiki/images/c/cb/Warning.png)](https://code.jsoftware.com/wiki/File:Warning.png) **This form has been removed from J Version 9.6 and later**

The dyad form applies the monad form to y repeatedly x times...

-   Phrase:  x m&v y applies m&v to y repeatedly x times, and is equivalent to:  x (m&v @ \] ^: \[) y
-   Phrase:  x u&n y applies u&n to y repeatedly x times, and is equivalent to:  x (u&n @ \] ^: \[) y

See above for a description of the [monadic](#monadic) form.

Note that we bind to the value (which will be constant) rather than to the name. We might use 
```
".&name
```
 if we wanted the value to be a name of a noun.
