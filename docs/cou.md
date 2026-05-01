# Vocabulary/cou - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/codot "Vocabulary/codot") [<<](https://code.jsoftware.com/wiki/Vocabulary/coa "Vocabulary/coa")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d310v.htm "jdic:d310v")

<table class="wikitable"><tbody><tr><td><tt>u&nbsp;: v</tt></td><td>Monad-Dyad</td><td>Conjunction</td></tr></tbody></table>

[Rank](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rankuv "Vocabulary/RankInfo") _\-- depends on the ranks of u and v --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Derives a [dual-valence](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Valence "Vocabulary/Glossary") [verb](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Verb "Vocabulary/Glossary"), which executes

-   [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET")  u if called [monadically](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Monad "Vocabulary/Glossary")
-   [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET")  v if called [dyadically](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Dyad "Vocabulary/Glossary").

The ranks of the derived verb (u : v) are as you'd expect:

-   the monadic rank is the monadic rank of u
-   the dyadic rank is the dyadic rank of v.

To create an [adverb](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Adverb "Vocabulary/Glossary") or [conjunction](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Conjunction "Vocabulary/Glossary") which derives a dual-valence verb when passed its operands, see [below](#modifiers).

> [![](https://code.jsoftware.com/mediawiki/images/5/54/Information.png)](https://code.jsoftware.com/wiki/File:Information.png) [Conjunction](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Conjunction "Vocabulary/Glossary") **Def** (:) has several different uses, requiring several pages to document it
> 
> -   [Vocabulary/cor](https://code.jsoftware.com/wiki/Vocabulary/cor "Vocabulary/cor") – A _swatch_ (roadmap) of the different usages of (:) you'll encounter
> -   [Vocabulary/com](https://code.jsoftware.com/wiki/Vocabulary/com "Vocabulary/com") – the complete formal details of [Explicit Definition](https://code.jsoftware.com/wiki/Vocabulary/Glossary#ExplicitDefinition "Vocabulary/Glossary")
> -   [Vocabulary/coa](https://code.jsoftware.com/wiki/Vocabulary/coa "Vocabulary/coa") – anatomy of a sample [explicit definition](https://code.jsoftware.com/wiki/Vocabulary/Glossary#ExplicitDefinition "Vocabulary/Glossary")
> -   Vocabulary/cou **\[THIS PAGE\]** – how to use (:) to combine monad and dyad valences from separate definitions
> -   [Vocabulary/NounExplicitDefinition](https://code.jsoftware.com/wiki/Vocabulary/NounExplicitDefinition "Vocabulary/NounExplicitDefinition") – defining a noun as an explicit entity.

---

### Common uses

1\. Define a single [name](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Name "Vocabulary/Glossary") with different [monadic](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Monad "Vocabulary/Glossary") and [dyadic](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Dyad "Vocabulary/Glossary") forms

```
sort =: /:~ : /:  NB. monadic, sort y; dyadic, sort x in the order given by y

```

2\. Provide a default value for argument x to let you call a given dyad monadically (i.e. with just a y\-argument)

```
NB. Return the date x days in the future (default 0)
getdate =: (0&getdate) : (dyad define)
NB. body of dyadic verb here
)

```

3\. Create a verb that can't be called with the wrong valence

Executes [Cap](https://code.jsoftware.com/wiki/Vocabulary/squarelfco "Vocabulary/squarelfco") (\[:) in place of the bad valence to force  domain error

```
   mp =: +/ . \*          NB. define a name for matrix product
   mtx =: i. 2 2         NB. a matrix
   mp mtx                NB. Oops, we called mp monadically, yielding an unexplainable result
2
   mp =: \[: : (+/ . \*)   NB. This'll fix it
   mp mtx
|domain error: mp
|       mp mtx

```

### More Information

Creation of a [modifier](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Modifier "Vocabulary/Glossary") which derives a dual-valence verb is most directly accomplished by [using ':' within an explicit definition](https://code.jsoftware.com/wiki/Vocabulary/com#ambivalent "Vocabulary/com") (this is a special syntax, and, although similar in function, is different from the Monad/Dyad conjunction :):

```
rank=: 2 : 0
u"(v y) y
:
u"(x v y) y
)
   1 <@\] rank \[ i.3 3
┌─────┬─────┬─────┐
│0 1 2│3 4 5│6 7 8│
└─────┴─────┴─────┘

```

To instead create an ambivalent modifier using Monad/Dyad, simply pass the operand verb(s) u \[and v\] to the given modifier to create the verb of the desired valence, and use Monad-Dyad between the two verbs.

```
   rank=: {{ u{{u"(v y) y}}v : (u{{x u"(x v y) y}}v) }}
   rank   NB. dual-valence conjunction
2 : 'u{{ u"(v y) y }}v  : (u{{ x u"(x v y) y }} v) '

```

Notice that (u{{u"(v y) y}}v) derives a verb, which serves as the u operand to Monad-Dyad above. Use of Monad-Dyad within an explicit modifier definition is needed when creating a dual-valence modifier whose definition involves passing an expression given in terms of x and/or y (in the above example, both (v y) and (x v y) are such expressions) as an operand to a modifier (here, the rank (") conjunction).

---
