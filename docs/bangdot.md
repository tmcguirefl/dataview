# Vocabulary/bangdot - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/bangco "Vocabulary/bangco") [<<](https://code.jsoftware.com/wiki/Vocabulary/bang "Vocabulary/bang")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d411.htm "jdic:d411")

<table class="wikitable"><tbody><tr><td><tt>u&nbsp;!. n</tt></td><td>Fit (Customize)</td><td>Conjunction</td></tr></tbody></table>

---

The _customized_ [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") u!.n is a predetermined _variant_ of primitive verb u according to the ([noun](https://code.jsoftware.com/wiki/Vocabulary/AET#Noun "Vocabulary/AET")) [operand](https://code.jsoftware.com/wiki/Vocabulary/AET#Operand "Vocabulary/AET") n.

Only when u is one of these primitives can it be customized with !.

<table class="wikitable"><tbody><tr><td>monadic</td><td><tt>*</tt></td><td>Adjust the Absolute Tolerance to (<tt>n</tt>)</td></tr><tr><td>monadic</td><td><tt>&lt;. &gt;. ~. = ~: #: e. x:</tt></td><td>Adjust the Relative Tolerance to (<tt>n</tt>)</td></tr><tr><td>dyadic</td><td><tt>&lt; &lt;: &gt; &gt;: +. *. -. -: | E. i. i: = ~: #: e. u/. u/..</tt></td><td>Adjust the Tolerance to (<tt>n</tt>)</td></tr><tr><td>dyadic</td><td><tt>^ p.</tt></td><td>Stope Function</td></tr><tr><td>monadic</td><td><tt>&gt;&nbsp;;</tt></td><td>Change the Fill Atom to (<tt>n</tt>)</td></tr><tr><td>dyadic</td><td><tt>$ |. , ,. ,: # {.</tt></td><td>Change the Fill Atom to (<tt>n</tt>)</td></tr><tr><td>monadic</td><td><tt>":</tt></td><td>Set the Print Precision for floating-point values to (<tt>n</tt>)</td></tr><tr><td>monadic</td><td><tt>+/</tt></td><td><tt>+/!.0</tt> uses <a title="Vocabulary/AccurateAccumulation" href="/wiki/Vocabulary/AccurateAccumulation"><i><b>compensated summation</b></i></a> for the summation</td></tr><tr><td>dyadic</td><td><tt>+/@:*"1</tt></td><td><tt>+/@:*"1!.0</tt> uses <a title="Vocabulary/AccurateAccumulation" href="/wiki/Vocabulary/AccurateAccumulation">high precision</a> for the calculation</td></tr><tr><td>dyadic</td><td><tt>i.</tt></td><td><tt>i.!.1</tt> requires the items of the argument cells to be sorted into nondescending order, and is faster if those cells are integer lists.</td></tr></tbody></table>

---

### Common Uses

1\. When v is 0, use _**intolerant comparison**_ for a number primitive, e.g. [Equal](https://code.jsoftware.com/wiki/Vocabulary/eq "Vocabulary/eq") (\=). Comparisons will require exact equality:

```
   1 = 1.00000000000001  NB. close is good enough by default
1
   1 =!.(0) 1.00000000000001  NB. but it's not exact
0

```

In many cases specifying intolerant comparison causes the interpreter to use faster code.

To guarantee using the faster code v must be specified as 0 or (0), **not** as an equivalent numeric value.

2\. Alter the _comparison tolerance_ of a number primitive, e.g. [Equal](https://code.jsoftware.com/wiki/Vocabulary/eq "Vocabulary/eq") (\=).

This is a generalization of the case 1 above.

In J terms this means: make a new customized verb (\=!.n) which treats two numbers as equal if their difference is  n\*z or less, where z is the greater of the _magnitudes_ (absolute values) of x and y.

except for \* y, where a number is treated as equal to 0 if its magnitude is less than n

```
   \] n=: 2^\_34       NB. choose a value for the tolerance
5.82077e\_11
   2 = 2+n           NB. Default tolerance is much smaller: 2^\_44
0
   2 (=!.n) 2+n      NB. But (=!.n) treats 2 and (2+n) as equal
1
   2 (=!.n) 2+n+n    NB. Still equal! (See below)
1
   2 (=!.n) 2+n+n+n
0

```

**_Note:_** J will not accept values of n greater than  2^\_34 . To learn why not, see [Essays/Tolerant Comparison](https://code.jsoftware.com/wiki/Essays/Tolerant_Comparison "Essays/Tolerant Comparison"). This essay also explains why 2 and 2+n+n are _tolerated_ as effectively equal above.

3\. Change the _**fill atom**_ used for filling empty places during \[x\] {. y and x |. y

```
   \_5 {. 'abc'
  abc
   \_5 {.!.'\*' 'abc'
\*\*abc

```

4\. Change the fill atom used for filling empty places when an _array_ is extended by x , y, x ,. y, x ,: y, or ; y to match the shape of the result

```
   'ab' ,: 'abc'
ab
abc
   'ab' ,:!.'\*' 'abc'
ab\*
abc

```

**Note** that these verbs always _replicate_ atoms rather than using fill:

```
   'a' ,: 'abc'
aaa
abc
   'a' ,:!.'\*' 'abc'
aaa
abc

```

5\. +/!.0 y uses Kahan's [_compensated summation_](https://en.wikipedia.org/wiki/Kahan_summation_algorithm) algorithm. This gives more accurate totals for long sums.

6\. When a verb operates on an arguments whose rank is higher than the verb's, the verb is executed on each cell separately, and the results are assembled into a single array. During assembly, the results are brought to a common shape by adding fill as required. There is no way to alter the atom used for this fill. It is always either 0, ' ', a:, or s: '' depending on the type of the value being filled.

---

### More Information

1\. These primitives:  +. \*. | #: have an implied tolerant comparison, such as [Residue](https://code.jsoftware.com/wiki/Vocabulary/bar#dyadic "Vocabulary/bar")  x | y which tolerantly decides whether the quotient  y % x is an integer or not.

---
