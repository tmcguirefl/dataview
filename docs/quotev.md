# Vocabulary/quotev - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/quotedot "Vocabulary/quotedot") [<<](https://code.jsoftware.com/wiki/Vocabulary/quotem "Vocabulary/quotem")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d600n.htm "jdic:d600n")

<table class="wikitable"><tbody><tr><td><tt>u"v</tt></td><td><tt>m"v</tt></td><td>Copy Rank</td><td>Conjunction</td></tr></tbody></table>

---

u"v and m"v are equivalent to u"n and m"n respectively, where n is the [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") of [ranks](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") of v.

The benefit of being able to use v itself, instead of its list of ranks, n, is: it saves you having to find the actual ranks of v if you want to create a [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") out of verb u (or [noun](https://code.jsoftware.com/wiki/Vocabulary/AET#Noun "Vocabulary/AET") m) having the identical ranks of v .

a not-uncommon requirement.

> [![](https://code.jsoftware.com/mediawiki/images/5/54/Information.png)](https://code.jsoftware.com/wiki/File:Information.png) For other uses of (") see:
> 
> -   [Constant Verb](https://code.jsoftware.com/wiki/Vocabulary/quotem "Vocabulary/quotem") (m"n)
> -   [Rank](https://code.jsoftware.com/wiki/Vocabulary/quote "Vocabulary/quote") (u"n)

Take e.g. these three dual-valence verb definitions which share the same body but differ in name and rank:

```
   v=: (3 : '<:y') : (4 : '>:x,y')
   v010=: v"0 1 0
   v001=: v"0 0 1

```

Showing the list of ranks for each:

```
   v    b. 0
\_ \_ \_
   v010 b. 0
0 1 0
   v001 b. 0
0 0 1

```

Having a look at the behaviour of the verb 
```
x,y
```
 (dyadic case of Amend) which we are going to use with different ranks:

```
   , b. 0
\_ \_ \_
   'abc' , 'DE'
abcDE
   'abc' ,"1 0 'DE'
abcD
abcE
   'abc' ,"0 1 'DE'
aDE
bDE
cDE

```

Copying the ranks from the verbs we just defined results in similar behaviour:

```
   'abc' ,"v 'DE'
abcDE
   'abc' ,"v010 'DE'     NB. left: whole, right: atom
abcD
abcE
   'abc' ,"v001 'DE'     NB. left: atom, right: whole
aDE
bDE
cDE

```

Same goes for the monadic case:

```
   ,"v 'DE'
DE
   ,"v010 'DE'           NB. monadic rank 0 means: atom
D
E

```

**Note:** To see the actual [operand](https://code.jsoftware.com/wiki/Vocabulary/AET#Operand "Vocabulary/AET") m that would be equivalent to using v in this role, use [Verb Information](https://code.jsoftware.com/wiki/Vocabulary/bdotu "Vocabulary/bdotu") (b.) — like this

```
   v=: <      NB. sample v - Box (<)
   v b. 0     NB. the list of ranks of v
\_ 0 0

```
---
