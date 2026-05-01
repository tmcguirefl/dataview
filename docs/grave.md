# Vocabulary/grave - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/graveco "Vocabulary/graveco") [<<](https://code.jsoftware.com/wiki/Vocabulary/quoteco "Vocabulary/quoteco")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d610.htm "jdic:d610")

<table class="wikitable"><tbody><tr><td><tt>u`v</tt></td><td><tt>u`n</tt></td><td><tt>m`v</tt></td><td><tt>m`n</tt></td><td>Tie or Gerund</td><td>Conjunction</td></tr></tbody></table>

---

u\`v creates a list of [gerunds](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Gerund "Vocabulary/Glossary") for u and v — [nouns](https://code.jsoftware.com/wiki/Vocabulary/AET#Noun "Vocabulary/AET") that encode the [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") [values](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary").

A gerund is an [atomic box](https://code.jsoftware.com/wiki/Vocabulary/Glossary#AtomicRep "Vocabulary/Glossary") that can be used like any other box and eventually turned back into a [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") to be executed.

Grammatically, a _gerund_ is a [noun](https://code.jsoftware.com/wiki/Vocabulary/AET#Noun "Vocabulary/AET") that names the action of a [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET"), e.g. "_Programming_ is fun".

```
   calcvolume =: {{               NB. calculate volume, pass to callback given in 4th argument
'l w h callback' =. y
callback\`:6 l\*w\*h                 NB. Turn the gerund into a verb and execute it
}}
   cbverb =: {{echo 'Volume is ' , ": y}}
   calcvolume 1;2;3;<(cbverb\`'')  NB. Pass callback verb as a gerund
Volume is 6

```
---

### Common Uses

1\. Combine several [verbs](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") into a single [value](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary") that can be used as an [operand](https://code.jsoftware.com/wiki/Vocabulary/AET#Operand "Vocabulary/AET") to a [modifier](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Modifier "Vocabulary/Glossary"), which will separate the verbs and use them.

```
   NB. x v0\`v1\`v2} y   executes as (x v0 y) (x v1 y)} (x v2 y)
   NB. Here, the first item of x gives the indexes to copy from
   NB. the second item gives the indexes to copy to
   NB. y is an array; the specified portions are copied within the array
   NB. (\] {~ 0 { \[) selects from y using the first element of x
   NB. (1 { \[) says that the second element of x has the index(es) to modify
   NB. \] says to make the change on y
   copywithin =: (\] {~ 0 { \[) \` (1 { \[) \` \] }
   1 3 copywithin i. 5 5
 0  1  2  3  4
 5  6  7  8  9
10 11 12 13 14
 5  6  7  8  9
20 21 22 23 24

```

Using the [gerund](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Gerund "Vocabulary/Glossary") allows three different [verbs](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") to inhabit a single [value.](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary")

2\. Create a [noun](https://code.jsoftware.com/wiki/Vocabulary/AET#Noun "Vocabulary/AET") form of a [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") so you can use it as an [argument](https://code.jsoftware.com/wiki/Vocabulary/AET#Argument "Vocabulary/AET") to a [verb.](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") [Evoke Gerund](https://code.jsoftware.com/wiki/Vocabulary/graveco "Vocabulary/graveco") (\`:) turns a gerund back into a verb

```
   NB. x is 3 gerunds; execute one on y, depending on the sign of y
   NB. order of x is 0,+,-
   signexe =: dyad define
((\*y) { x) \`: 6 y
)
   0:\`\]\`(\[: smoutput 'negative ' , ":@|) signexe \_5
negative 5

```

3\. [Select From Agenda](https://code.jsoftware.com/wiki/Vocabulary/atdot "Vocabulary/atdot") (m@.n) and [Agent](https://code.jsoftware.com/wiki/Vocabulary/atdot#agent "Vocabulary/atdot") (m@.v) select from the gerund m to pick the verb to be executed.

```
   (%&2)\`(\*&3)@.(2&|) 6  NB. Divide by 2 if even, multiply by 3 if odd
3

```

4\. Assign multiple verbs with a single [assignment](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Assignment "Vocabulary/Glossary")

```
   '\`plus minus div times' =. +\`-\`%\`\*   NB. '\` names ' =. values
   plus
+
   times
\*

```

5\. Most of J's [partitioning](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Partition "Vocabulary/Glossary") [modifiers](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Modifier "Vocabulary/Glossary") support the use of [cyclic gerunds](https://code.jsoftware.com/wiki/Vocabulary/CyclicGerund "Vocabulary/CyclicGerund").

---

### More Information

1\. If an [operand](https://code.jsoftware.com/wiki/Vocabulary/AET#Operand "Vocabulary/AET") is a [noun](https://code.jsoftware.com/wiki/Vocabulary/AET#Noun "Vocabulary/AET"), it is left unchanged. If it is a [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET"), it is replaced by its [gerund](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Gerund "Vocabulary/Glossary") form, which is an [atomic box](https://code.jsoftware.com/wiki/Vocabulary/Glossary#AtomicRep "Vocabulary/Glossary"). Then the two [noun](https://code.jsoftware.com/wiki/Vocabulary/AET#Noun "Vocabulary/AET") [operands](https://code.jsoftware.com/wiki/Vocabulary/AET#Operand "Vocabulary/AET") are joined as if by [Append](https://code.jsoftware.com/wiki/Vocabulary/comma#dyadic "Vocabulary/comma") (,) to create the [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary") of u\`v.

It follows that  v0\`v1\`v2\`v3 , which is interpreted **left-to-right** as ((v0\`v1)\`v2)\`v3 , creates two [gerunds](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Gerund "Vocabulary/Glossary") for v0 and v1 and then leaves those [values](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary") unchanged as it first appends the gerund form of v2 and then of v3 .

2\. A gerund can be created from a single verb u by tying it with the empty list: u\`''.

3\. You can "abuse" gerund notation as a neat way of writing a list of boxed strings

```
   g =: Su\`Mo\`Tu\`We\`Th\`Fr\`Sa
   assert g -: 'Su';'Mo';'Tu';'We';'Th';'Fr';'Sa'

```

The strings inside the boxes of the list must be valid [names](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Name "Vocabulary/Glossary"), else J signals  domain error . But they need not be the names of actual verbs.

Be aware that when J evaluates a phrase containing an unused name, it assumes for syntax purposes that the name is a verb. This is called "forward declaration".

---

### Details

1\. The [gerund](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Gerund "Vocabulary/Glossary") form of a [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") is a special case of [atomic representation](https://code.jsoftware.com/wiki/Vocabulary/Glossary#AtomicRep "Vocabulary/Glossary") of [values](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary"); more generally m and n may be atomic representations of any [entities](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Entity "Vocabulary/Glossary").

2\. The forms \`n and m\` sometimes give a domain error if m/n is boxed and is not a valid gerund.

---
