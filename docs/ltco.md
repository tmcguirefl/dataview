# Vocabulary/ltco - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/gt "Vocabulary/gt") [<<](https://code.jsoftware.com/wiki/Vocabulary/ltdot "Vocabulary/ltdot")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d012.htm "jdic:d012")

<table class="wikitable"><tbody><tr><td><tt>&lt;: y</tt></td><td>Decrement</td></tr></tbody></table>

[Rank 0](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank0a "Vocabulary/RankInfo") _\-- operates on individual atoms of y, producing a result of the same shape --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Equivalent to y-1

```
   <: \_5 1 0 5
\_6 0 \_1 4

```
---

### Common uses

1\. Simplify a [phrase](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Phrase "Vocabulary/Glossary") which decrements a given value

```
   y=. <:y             NB. decrement y

   z=: '\[a,b\]'
   (<: z i. ',') { z   NB. pick the letter BEFORE the comma
a

```

2\. Simplify an unwieldy phrase

```
   z=: 10
   (100-z)-1
89
   <: 100-z
89

```

3\. Compile a simpler tacit definition from a given [explicit](https://code.jsoftware.com/wiki/Vocabulary/Glossary#ExplicitEntity "Vocabulary/Glossary") (verb) definition

the verb below computes the common mathematical expression: _(y-1)/y_

```
   13 : '(y-1)%y'
\] %~ 1 -~ \]
   13 : '(<:y)%y'
<: % \]

```
---

[Increment](https://code.jsoftware.com/wiki/Vocabulary/gtco "Vocabulary/gtco") \>: y

---

<table class="wikitable"><tbody><tr><td><tt>x &lt;: y</tt></td><td>Less Or Equal</td></tr></tbody></table>

[Rank 0 0](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank00a "Vocabulary/RankInfo") _\-- operates on individual atoms of x and y, producing a result of the same shape --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Compares x and y [atom](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Atom "Vocabulary/AbsolutelyEssentialTerms")\-by-atom. See [Equal](https://code.jsoftware.com/wiki/Vocabulary/eq "Vocabulary/eq") (\=) for the details.

Wherever x is less than, or equal to, y, returns 1 in that position, else 0.

```
   z=: 7 8 9
   z <: 8
1 1 0

```

x and y must both be [numeric](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Numeric "Vocabulary/Glossary"), else you get a domain error

```
   'a' <: 9
|domain error
|   'a'    <:9
|\[-0\]

This differs from what happens with \[\[Vocabulary/eq|Equal\]\] (\`=\`)

{{{   'a' = 9
0

```

**Less Or Equal** (<:) uses [tolerant comparison](https://code.jsoftware.com/wiki/Vocabulary/Glossary#TolerComp "Vocabulary/Glossary") in the same way as [Equal](https://code.jsoftware.com/wiki/Vocabulary/eq "Vocabulary/eq") (\=).

To require exact comparison, use (<:!.0) in place of (<:) to temporarily set the comparison [tolerance](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Tolerance "Vocabulary/Glossary") to zero

```
   2.00000000000001 <: 2
1
   2.00000000000001 (<:!.0) 2
0

```
---

### Common uses

1\. Make a conditional [phrase](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Phrase "Vocabulary/Glossary") in a [verb](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Verb "Vocabulary/AbsolutelyEssentialTerms") definition (explicit definition)

```
if. x<:y do.  'x y'=. y;x  end.

```

2\. Make a mask of the same [shape](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Shape "Vocabulary/AbsolutelyEssentialTerms") as array, to process array in some chosen way

```
   array=: 3 1 4 1 5 9 2 6
   mask=: array <: 5

   array ,: mask

3 1 4 1 5 9 2 6
1 1 1 1 1 0 1 0

   mask # array       NB. keep only the atoms that are <: 5
3 1 4 1 5 2

```

**NOTE:** The Boolean atoms of mask are not only truth values but also valid numbers, 0 or 1. Therefore you can use mask directly to process array like this:

```
   array + 3 \* mask   NB. add 3 to the atoms that are <: 5
6 4 7 4 8 9 5 6

```
---

[Equal](https://code.jsoftware.com/wiki/Vocabulary/eq#dyadic "Vocabulary/eq") (x = y), [Less Than](https://code.jsoftware.com/wiki/Vocabulary/lt#dyadic "Vocabulary/lt") (x < y), [Larger Than](https://code.jsoftware.com/wiki/Vocabulary/gt#dyadic "Vocabulary/gt") (x > y), [Larger Or Equal](https://code.jsoftware.com/wiki/Vocabulary/gtco#dyadic "Vocabulary/gtco") (x >: y), [Not-Equal](https://code.jsoftware.com/wiki/Vocabulary/tildeco#dyadic "Vocabulary/tildeco") (x ~: y)

---

### More Information

1\. If an argument to x <: y is complex, its imaginary part must be tolerantly equal to 0, using the default tolerance of 2^\_44 even if the comparison x <: y itself uses a different tolerance.

---

### Performance Note

Comparisons are fastest when the precisions are identical. If an atom is compared against an array, it helps to choose the right precision for the atom.

```
   0. <: %: i. 10  NB. float list: faster than 0 <:
   00 <: i. 10  NB.  integer list: faster than 0 <:

```
---

### Use These Combinations

Combinations using x <: y that have [exceptionally good performance](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") include those shown in [Searching and Matching Items: Fast List Operations (FLOs)](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations#FLOs "Vocabulary/SpecialCombinations"), as well as the following:

<table class="wikitable"><tbody><tr><td><b>What it does</b></td><td><b>Type;<br></b><p><b>Precisions;<br>Ranks</b></p></td><td><b><a title="Vocabulary/SpecialCombinations" href="/wiki/Vocabulary/SpecialCombinations#1">Syntax</a></b></td><td><b>Variants;<br></b><p><b>Restrictions</b></p></td><td><b>Benefits;<br></b><p><b>Bug Warnings</b></p></td></tr><tr><td>Boolean reductions along diagonals</td><td>Boolean</td><td><tt>+.//. y</tt></td><td><tt>*. = ~: &lt; &lt;: &gt; &gt;:</tt> <small>in place of</small> <tt>+.</tt></td><td>avoids building argument cells</td></tr></tbody></table>

---
