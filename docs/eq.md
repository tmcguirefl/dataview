# Vocabulary/eq - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/eqdot "Vocabulary/eqdot") [<<](https://code.jsoftware.com/wiki/Vocabulary/zeroco "Vocabulary/zeroco")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d000.htm "jdic:d000")

<table class="wikitable"><tbody><tr><td><tt>= y</tt></td><td>Self-Classify</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank "Vocabulary/RankInfo") _\-- operates on x and y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

> [![](https://code.jsoftware.com/mediawiki/images/5/54/Information.png)](https://code.jsoftware.com/wiki/File:Information.png) The use of \=y is **deprecated** because its result is too large.
> 
> The essential action, i.e. assigning the items of y to classes of identical items, can be performed by (i.~ y).  
> This gives a result of length (#y), compared with (\=y) whose result has size proportional to (\*:#y).

---

A [Boolean](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boolean "Vocabulary/Glossary") [table](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Table "Vocabulary/AbsolutelyEssentialTerms") relating a given [vector](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Vector "Vocabulary/Glossary") to its [Nub](https://code.jsoftware.com/wiki/Vocabulary/tildedot "Vocabulary/tildedot") (
```
~.
```
).

```
   z\=: 'abracadabra'
   ~.z	NB. Nub z
abrcd
   \=z
1 0 0 1 0 1 0 1 0 0 1
0 1 0 0 0 0 0 0 1 0 0
0 0 1 0 0 0 0 0 0 1 0
0 0 0 0 1 0 0 0 0 0 0
0 0 0 0 0 0 1 0 0 0 0

```

The [table](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Table "Vocabulary/AbsolutelyEssentialTerms") compares unique [items](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Item "Vocabulary/AbsolutelyEssentialTerms") of 
```
y
```
 against **all** items of 
```
y
```
. Each row of the table has the comparisons for a single unique item; each column has the comparisons for a single item. The unique items are calculated by 
```
~. y
```
 and appear in order of their first appearance in 
```
y
```
.

Tabulated, we see the equalities clearer:

```
   (~. 'abracadabra') (('=' ; \[: }: 1j1 # \]) ,: ,.@\[ ; ":@(\=/)) 'abracadabra'
┌─┬─────────────────────┐
│\=│a b r a c a d a b r a│
├─┼─────────────────────┤
│a│1 0 0 1 0 1 0 1 0 0 1│
│b│0 1 0 0 0 0 0 0 1 0 0│
│r│0 0 1 0 0 0 0 0 0 1 0│
│c│0 0 0 0 1 0 0 0 0 0 0│
│d│0 0 0 0 0 0 1 0 0 0 0│
└─┴─────────────────────┘

```

---

### Common uses

Count the occurrences of each distinct letter in a [string](https://code.jsoftware.com/wiki/Vocabulary/Glossary#String "Vocabulary/Glossary").

```
   +/"1 \=z   NB. sum the rows of: =z
5 2 2 1 1

```

---

### More Information

1\. 
```
= y
```
 uses [tolerant comparison](https://code.jsoftware.com/wiki/Vocabulary/Glossary#TolerantComp "Vocabulary/Glossary"). Use 
```
=!.0
```
 for exact comparison.

2\. Comparing **Self-Classify** with [Table](https://code.jsoftware.com/wiki/Vocabulary/slash#dyadic "Vocabulary/slash") (
```
/
```
) we see that 
```
=z
```
 is the "equal-table" of z with repeated rows deleted (i.e. the Nub).

The equivalence is imperfect, because 
```
= y
```
 compares [items](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Item "Vocabulary/AbsolutelyEssentialTerms") of 
```
y
```
, while 
```
x = y
```
 works on [atoms](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Atom "Vocabulary/AbsolutelyEssentialTerms").

```
   ~. z\=/z   NB. Nub of: z =/ z.   Also equal to (~.z) =/ z
1 0 0 1 0 1 0 1 0 0 1
0 1 0 0 0 0 0 0 1 0 0
0 0 1 0 0 0 0 0 0 1 0
0 0 0 0 1 0 0 0 0 0 0
0 0 0 0 0 0 1 0 0 0 0

```

---

<table class="wikitable"><tbody><tr><td><tt>x = y</tt></td><td>Equal</td></tr></tbody></table>

[Rank 0 0](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank00a "Vocabulary/RankInfo") _\-- operates on individual atoms of x and y, producing a result of the same shape --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

The [Boolean](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boolean "Vocabulary/Glossary") result of comparing 
```
x
```
 and 
```
y
```
 [atom](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Atom "Vocabulary/AbsolutelyEssentialTerms") by atom.

```
   \]z\=: i.5
0 1 2 3 4
   3 \= z
0 0 0 1 0
   z \= z
1 1 1 1 1
   z \= |.z
0 0 1 0 0

```

**Equal** works for [boxed](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Boxed "Vocabulary/Glossary") atoms too:

```
   z\=: 'alpha' ; 'bravo' ; 'charlie'
   z \= |.z
0 1 0
   z \= <'bravo'
0 1 0

```

**Equal** (
```
x=y
```
) has [rank](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#VerbRank "Vocabulary/AbsolutelyEssentialTerms") 0. It compares corresponding atoms and gives a result 
```
0
```
 (not-equal) or 
```
1
```
 (equal) for each pair of atoms.

If 
```
y
```
 is an atom, not a [list](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#List "Vocabulary/AbsolutelyEssentialTerms"), it behaves like a list having the same shape as 
```
x
```
. And vice-versa. 
```
x
```
 and 
```
y
```
 may have different rank only if they [agree](https://code.jsoftware.com/wiki/Vocabulary/Agreement "Vocabulary/Agreement").

If you want to compare two **entire nouns** for equality, use [Match](https://code.jsoftware.com/wiki/Vocabulary/minusco#dyadic "Vocabulary/minusco") (
```
-:
```
), as in 
```
x-:y
```
. Because, unlike 
```
=
```
, no error results if the shapes of 
```
x
```
 and 
```
y
```
 differ.

> [![](https://code.jsoftware.com/mediawiki/images/c/cb/Warning.png)](https://code.jsoftware.com/wiki/File:Warning.png) WARNING:
> 
> ```
> if. b do.
> ```
>  …  
> only tests the first atom in the (Boolean list) condition 
> ```
> b
> ```
> .  
> Thus
> 
> ```
>    if. 'chalk' \= 'cheez' do. ...
> 
> ```
> 
> will test **true** because the first atom of the result of the [T-block](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Tblock "Vocabulary/Glossary") is 1 even if some subsequent atoms are 0
> 
> ```
>    'chalk' \= 'cheez'
> 1 1 0 0 0
> 
> ```

---

### Common uses

1\. Make a conditional [phrase](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Phrase "Vocabulary/Glossary") in a verb definition ([explicit](https://code.jsoftware.com/wiki/Vocabulary/Glossary#ExplicitEntity "Vocabulary/Glossary") definition)

```
 if. LF\={:z  do. }:z end.   NB. drop trailing LF if it's there

```

2\. Make a Boolean list 
```
b
```
 to work with a given [string](https://code.jsoftware.com/wiki/Vocabulary/Glossary#String "Vocabulary/Glossary") 
```
z
```

```
   z \=: 'alpha bravo charlie'
   \] b \=: z\=' '
0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0
   \-.b   NB. not-b
1 1 1 1 1 0 1 1 1 1 1 0 1 1 1 1 1 1 1

   (\-.b) # z
alphabravocharlie

   \] i \=: I.b
5 11
   \] good\_name \=: '\_' i } z
alpha\_bravo\_charlie

```

---

[Larger Than](https://code.jsoftware.com/wiki/Vocabulary/gt#dyadic "Vocabulary/gt") (x > y), [Larger Or Equal](https://code.jsoftware.com/wiki/Vocabulary/gtco#dyadic "Vocabulary/gtco") (x >: y), [Less Than](https://code.jsoftware.com/wiki/Vocabulary/lt#dyadic "Vocabulary/lt") (x < y), [Less Or Equal](https://code.jsoftware.com/wiki/Vocabulary/ltco#dyadic "Vocabulary/ltco") (x <: y), [Not-Equal](https://code.jsoftware.com/wiki/Vocabulary/tildeco#dyadic "Vocabulary/tildeco") (x ~: y), [Match](https://code.jsoftware.com/wiki/Vocabulary/minusco#dyadic "Vocabulary/minusco") (x -: y)

---

### More Information

1\. (
```
=
```
) uses [tolerant comparison](https://code.jsoftware.com/wiki/Vocabulary/Glossary#TolerComp "Vocabulary/Glossary"), which means that inexact numeric [types](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Type "Vocabulary/Glossary") (floating-point and complex) are considered equal if they are "close enough". By default the [comparison tolerance](https://code.jsoftware.com/wiki/Vocabulary/Glossary#CompTol "Vocabulary/Glossary") is 
```
2^_44
```
, which means that two numbers are considered equal if the magnitude of the difference is no more than 
```
2^_44
```
 times the larger [argument](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Argument "Vocabulary/AbsolutelyEssentialTerms") magnitude. To require exact comparison, use 
```
=!.0
```
 to temporarily set the comparison [tolerance](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Tolerance "Vocabulary/Glossary") to 
```
0
```
.

See also: [Essays/Absolute and Relative Tolerance](https://code.jsoftware.com/wiki/Essays/Absolute_and_Relative_Tolerance "Essays/Absolute and Relative Tolerance").

2\. The arguments 
```
x
```
 and 
```
y
```
 can be of any [type](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Type "Vocabulary/Glossary"). No error results if the types are different. Atoms of different types always give 
```
0
```
 (not-equal). Atoms of the same type give 
```
1
```
 if equal, 
```
0
```
 otherwise.

3\. Boxed atoms are compared by opening (unboxing) them and comparing their contents. Two boxed atoms are equal only if the shapes of the contents are the same and their corresponding elements are equal. If the corresponding elements are themselves boxed, these are compared in exactly the same way. And so on, down to any level of boxing. [Numeric](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Numeric "Vocabulary/Glossary") comparisons are [tolerant](https://code.jsoftware.com/wiki/Vocabulary/Glossary#TolerantComp "Vocabulary/Glossary") whatever the level of boxing.

```
   \]a \=: ;: 'a'  NB. One word, one letter
┌─┐
│a│
└─┘
   \]b \=: <'a'    NB. one word, one letter
┌─┐
│a│
└─┘
   a \= b         NB. But not the same!  Why not?  a voyage of discovery...
0
   $a            NB. a is a LIST of boxed words
1
   $b            NB. b is an atom

   $,b           NB. We could make b into a list
1
   a \= ,b        NB. but it's still not the same!
0
   $>a           NB. opened a is a TABLE!! Why?
1 1
   {. a          NB. Take just one atom (the only atom) of a
┌─┐
│a│
└─┘
   $ {. a        NB. OK, that's an atom.  Its shape is empty

   $ \> {. a      NB. The contents are a list (of length 1).  That's why when we opened a
                 NB. it had 2 axes: one from a itself and one from the contents
1
   $>b           NB. b is an atom containing an atom, so opened it's still an atom

   a \= <,'a'     NB. a is equal to a boxed list
1
   $ a \= ,'a'    NB. but note: the result of the comparison is a LIST
1

```

---

### Performance Note

Comparisons are fastest when the precisions are identical. If an atom is compared against an array, it helps to choose the right precision for the atom.

```
   0. \= %: i. 10  NB. float list: faster than 0 =
   00 \= i. 10     NB. integer list: faster than 0 =

```

---

### Use These Combinations

Combinations using 
```
x = y
```
 that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include those shown in [Searching and Matching Items: Fast List Operations (FLOs)](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations#FLOs "Vocabulary/SpecialCombinations"), as well as the following:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Boolean reductions on infixes</td><td>Boolean</td><td><tt>x +./\ y</tt></td><td><tt>x</tt> positive<p><tt>*. = ~:</tt> <small>in place of</small> <tt>+.</tt></p></td><td><b>much</b> faster than alternatives</td></tr><tr><td>Mean on infixes</td><td>integer and floating-point</td><td><tt>x (+/%#)\ y</tt></td><td><tt>x</tt> positive<p><tt>*. = ~:</tt> <small>in place of</small> <tt>+</tt></p></td><td><b>much</b> faster than alternatives</td></tr><tr><td>Boolean reductions on partitions</td><td>Boolean</td><td><tt>x +//. y</tt></td><td><tt>= &lt;. &gt;. +. * *. ~:</tt> <small>in place of</small> <tt>+</tt></td><td>avoids building argument cells</td></tr><tr><td>Boolean reductions along diagonals</td><td>Boolean</td><td><tt>+.//. y</tt></td><td><tt>*. = ~: &lt; &lt;: &gt; &gt;:</tt> <small>in place of</small> <tt>+.</tt></td><td>avoids building argument cells</td></tr></tbody></table>

---
