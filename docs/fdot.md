# Vocabulary/fdot - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/hcapdot "Vocabulary/hcapdot") [<<](https://code.jsoftware.com/wiki/Vocabulary/ecapdot "Vocabulary/ecapdot")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/dfdot.htm "jdic:dfdot")

<table class="wikitable"><tbody><tr><td><tt>u f.</tt></td><td><tt>m f.</tt></td><td>Fix</td><td>Adverb</td></tr></tbody></table>

[Rank](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#ranku "Vocabulary/RankInfo") _\-- depends on the rank of u --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

_Fixes_ [tacit verb](https://code.jsoftware.com/wiki/Vocabulary/Glossary#TacitVerb "Vocabulary/Glossary") u (i.e. gives it a fixed [value](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary") without [name](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Name "Vocabulary/Glossary") dependencies) by replacing each [name](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Name "Vocabulary/Glossary") in u with the fixed [value](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary") of the [name.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Name "Vocabulary/Glossary")  
Similarly, m f. replaces each name in the entity denoted by character array m with the fixed value of the name. See below [for an example](#NounOperand).

So even if names refer to other names, the fixed form contains nothing but **J primitives**.

The name **Fix** is inherited from the APL language, where an analogous system function {quad}FX ("Fix") turns a function definition (expressed as a _character matrix_) into an APL _function_.

```
   sum=: +/
   count=: #
   by=: %

   mean=: sum by count
   mean
sum by count
   mean f.
+/ % #

```

If x is a literal noun containing the name of an entity (rather than a verb as in the example above), the result is similar, with all names encountered in the definition of the item named by x replaced by their fixed values. The result in this case has the same part of speech as the value named by x

---

### Common uses

1\. To reduce the number of public [names](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Name "Vocabulary/Glossary") used in a [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") definition.

Consider the following lines **in a [script](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Script "Vocabulary/Glossary")**:

```
   '\`sum count by log' =: +/ \` # \` % \` ^.  NB. Same verbs as above, assigned quickly
   mean =: sum by count
   gmean =: mean&.:log                     NB. Geometric mean
   gmean
mean&.:log
   mean
sum by count

```

Suppose that gmean is the only definition you really need to be [public.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Public "Vocabulary/Glossary") Unfortunately, the other [names](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Name "Vocabulary/Glossary") must also be public, polluting the common [namespace](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Namespace "Vocabulary/Glossary"), because gmean refers to them.

You can fix this:

```
   '\`sum count by log' =. +/ \` # \` % \` ^.  NB. Use private assignment for temporary names
   mean =. sum by count
   gmean =: mean&.:log f.                  NB. f. makes temporary names go away.  Assign gmean publicly
   gmean                                   NB. All the names are gone
(+/ % #)&.:^.

```

Because these lines are **in a [script](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Script "Vocabulary/Glossary")**, the [names](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Name "Vocabulary/Glossary") assigned [privately](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Private "Vocabulary/Glossary") (using \=.) disappear after the script has loaded, leaving only the name gmean [publicly](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Public "Vocabulary/Glossary") assigned.

2\. To pass a [private](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Private "Vocabulary/Glossary") verb into a [modifier.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Modifier "Vocabulary/Glossary")

```
   a =: adverb define
u y
)
   vb =: verb define
pv =. \*:    NB. private verb
pv a y   NB. pass pv into a, execute (pv a) on y
)
   vb 5
|value error: pv

```

The problem is that pv is defined in the private namespace of vb and is not visible to a. The solution is to replace the [name](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Name "Vocabulary/Glossary") pv by its [value](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary") using (f.)

```
       u y
   vb =: verb define
pv =. \*:    NB. private verb
pv f. a y   NB. create the name-free verb value for pv, pass THAT to a
)
   vb 5
25

```

3\. To create [special code combinations](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations "Vocabulary/SpecialCombinations") unrecognised by J because some J code was assigned to a [name](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Name "Vocabulary/Glossary")

```
   ts =: 6!:2 , 7!:2@\]     NB. Verb to find the time and space used by a sentence

   a =: 1000 1000 ?@$ 0    NB. create 1 million random values
   ts 'plus/@enfile a'     NB. the worst of times
0.322007 8.39059e6
   ts 'plus/@enfile f. a'  NB. the best of times
0.00179939 4736

```

4\. To execute a verb in another [locale](https://code.jsoftware.com/wiki/Vocabulary/AET#Locale "Vocabulary/AET") **without** changing the current locale

This is part of J's standard _Object-Oriented Programming_ (OOP) support

```
   coclass 'parent'
NB. Create object.  y is the name to give the object
   create =: verb define
objname =: y
)

   coclass 'child'    NB. child class
   coinsert 'parent'
NB. Create object.  y is the name to give the object
create =: verb define
create\_parent\_ y
)

   coclass 'base'     NB. Back to main session
   NB. Create two objects
   obj1 =: 'object one' conew 'child'
   obj2 =: 'object two' conew 'child'
   NB. Verify obj names are what we set
   objname\_\_obj1      NB. Unexpected result...
object two
   objname\_\_obj2
object two

```

The error is subtle, in the [line](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Line "Vocabulary/Glossary")

```
create\_parent\_ y

```

Executing a locative **changes the implied locale** before executing the verb. So create\_parent\_ was run in the locale: parent for **both objects**.

The solution is even more subtle. It uses f. to call create\_parent\_

```
   coclass 'child'
NB. Create object.  y is the name to give the object
create =: verb define
create\_parent\_ f. y
)
   coclass 'base'      NB. Back to main session
   obj1 =: 'object one' conew 'child'
   obj2 =: 'object two' conew 'child'
   objname\_\_obj1       NB. Better
object one
   objname\_\_obj2
object two

   create\_parent\_ f.   NB. 'create\_parent\_ f.' is not a locative
3 : 'objname=:y'

```

The key point is that create\_parent\_ f. is **not a locative**. The locative has been replaced by the value of the name, and executing that value does not change the implied locale, so objname is created in the instance locale.

---

### More Information

1\.  u f. does not replace names inside the body of an [explicit definition](https://code.jsoftware.com/wiki/Vocabulary/Glossary#ExplicitEntity "Vocabulary/Glossary").

We can redo the mean example using mostly explicit definitions

```
   sum =: verb define
+/ y
)
   by =: %
   count =: verb define
# y
)
   mean =: sum by count
   gmean =: verb define
mean &.:^. y
)
   gmean f.
3 : 'mean&.:^.y'

```

The name mean in the body of the explicit definition was not altered.

```
   mean
sum by count
   mean f.
3 : '+/y' % 3 : '#y'

```

**Fixing** mean replaces [names](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Name "Vocabulary/Glossary") by their [definitions](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Definition "Vocabulary/Glossary"), but it doesn't go inside the body of an explicit definition.

2\. A [modifier](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Modifier "Vocabulary/Glossary") can be fixed by passing the character array of its name as the m operand to m f.:

```
   Until=. {{u^:(-.@:v)^:\_}}  NB. conjunction; apply u until condition v is true
   adv  =. Until (1&>:)       NB. adverb created by supplying one operand to Until
   adv
Until(1&>:)
   adv f.                     NB. a modifier train; not what we want
adv f.
   'adv' f.                   NB. adv cannot be passed as operand to (f.), but 'adv' can
2 : 'u^:(-.@:v)^:\_'(1&>:)
   adv=: 'adv' f.             NB. adv is now fixed

```

Because it is a modifier, adv cannot itself be passed as an operand to f.; the phrase adv f. creates a modifier train which applies adv to its operand, and then fixes the verb derived by the execution of adv.

If we're exporting adv from the current script, this does not help us, since adv depends on the private name Until, and so will fail with a value error when applied to a verb outside of the current script. But the character array 'adv' can be passed as an operand, yielding the fixed adverb.

3\.  u f. scans u for special code combinations after replacing names.

---

### Details

1\. If a name is referenced recursively, it will remain after fixing

```
   a =: b
   b =: a + c
   c =: %
   a f.
a + %

```

2\. The interpreter may find it necessary to introduce explicit definitions to limit the scope of a recursion ($:):

```
   r=: $:@<^:\*
   r@>: f.
$:@<^:\* (1 : 0)@>:
u y
:
x u y
)

```

See here for [an explanation](https://code.jsoftware.com/wiki/Vocabulary/dollarco#Restrict "Vocabulary/dollarco") of why this adverb has the effect of limiting the scope of $: within its verb operand.

3\. When the names x y u v m n are used during execution of the body of an explicit definition, they are replaced by their value (even if their value is not a noun), because their meaning changes depending on which [private](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Private "Vocabulary/Glossary") [namespace](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Namespace "Vocabulary/Glossary") is in use. This replacement **does not** _fix_ the name (as in  u f. ) but merely replaces it with its value, which may be another name.

---
