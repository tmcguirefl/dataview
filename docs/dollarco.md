# Vocabulary/dollarco - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/tilde "Vocabulary/tilde") [<<](https://code.jsoftware.com/wiki/Vocabulary/dollardot "Vocabulary/dollardot")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d212.htm "jdic:d212")

---

<table class="wikitable"><tbody><tr><td><tt>[x] $: y</tt></td><td>Self-Reference</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank_~ "Vocabulary/RankInfo") _\-- operates on \[x and\] y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Stands for the [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") currently being executed. If $: occurs directly within:

-   a single-phrase verb [definition](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Definition "Vocabulary/Glossary"): $: stands for the verb being defined.
-   a J sentence: $: stands for the outermost [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") [phrase](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Phrase "Vocabulary/Glossary") containing $: within the given sentence.
-   the body of an [explicit definition](https://code.jsoftware.com/wiki/Vocabulary/Glossary#ExplicitDefinition "Vocabulary/Glossary"): $: applies only to the [sentence](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Sentence "Vocabulary/Glossary") in which it occurs.
```
   forever =: $:
   forever ''
|stack error: forever
|       forever''

   forever2 =: 3 : '$: y'
   forever2 ''
|stack error: forever2
|       $:y

```

In both cases, $: stands for the verb defined by the [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") [phrase](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Phrase "Vocabulary/Glossary"): ($:) – i.e. itself.  
The result is an infinite recursion causing a stack error when space in the function stack is exhausted.

  
**Notes**

-   This feature allows an [anonymous](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Anonymou "Vocabulary/Glossary") [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") to call itself.
-   This feature enables any sort of verb to call itself [recursively](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Recursive "Vocabulary/Glossary"), but you must take care how $: is used.
-   See below for how to [widen](#Widen) or [restrict](#Restrict) the scope of a given instance of $: within a sentence or definition.
---

### Common Uses

1\. To alter the behavior of the [monad](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Monad "Vocabulary/Glossary") of an [ambivalent](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Ambivalent "Vocabulary/Glossary") verb.

[Larger Of (Max)](https://code.jsoftware.com/wiki/Vocabulary/gtdot#dyadic "Vocabulary/gtdot") (x >. y) is [ambivalent](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Ambivalent "Vocabulary/Glossary"), but its [monad](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Monad "Vocabulary/Glossary") may not behave as we want

```
   >. 1 5 4  NB. does not give us the largest integer
1 5 4

   max =: $:/ : >.
   max 1 5 4
5
   1 max 5   NB. but the dyad of max still behaves like dyadic >.
5

```

  
2\. To convert a [dyad](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Dyad "Vocabulary/Glossary") into an [ambivalent](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Ambivalent "Vocabulary/Glossary") verb.

A tacit verb, like cut below, is always [ambivalent](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Ambivalent "Vocabulary/Glossary"). But in this case cut only works correctly as a [dyad](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Dyad "Vocabulary/Glossary")

```
   ' ' cut 'alpha bravo charlie'
┌─────┬─────┬───────┐
│alpha│bravo│charlie│
└─────┴─────┴───────┘
   cut 'alpha bravo charlie'
┌──────────────────┬──────────────────┐
│alpha bravo charli│alpha bravo charli│
└──────────────────┴──────────────────┘

```

We want a monadic form of cut that behaves the same as: ' ' cut y.

Rewrite cut on the pattern: cut2=: (monad) : (dyad)

-   where dyad is the old version of cut
-   and monad is (' '&$:)
```
   cut =: (' '&$:) : (\[: -.&a: <;.\_2@,~)
   cut 'alpha bravo charlie'
┌─────┬─────┬───────┐
│alpha│bravo│charlie│
└─────┴─────┴───────┘
   'a' cut 'alpha bravo charlie'    NB. cut y at the letter 'a'
┌───┬───┬─────┬────┐
│lph│ br│vo ch│rlie│
└───┴───┴─────┴────┘

```

  
3\. To convert an [explicit](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Explicit "Vocabulary/Glossary") [dyad](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Dyad "Vocabulary/Glossary") into an [ambivalent](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Ambivalent "Vocabulary/Glossary") verb.

Adapt the construct used in example 2, namely the pattern: plus=: (monad):(dyad)

-   where monad is (0&$:)
-   and dyad is (4 : 0) …which expects the [body](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Body "Vocabulary/Glossary") to follow immediately after the assignment sentence
```
   plus =: (0&$:) : (4 : 0)
x + y
)
   plus 4
4

```

Note how the act of defining a verb eliminates redundant code, such as (some) parentheses. But it can also conceal the structure or make it harder to read

```
   plus
0&$: :(4 : 'x + y')

```

  
4\. Another way to convert an [explicit](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Explicit "Vocabulary/Glossary") [dyad](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Dyad "Vocabulary/Glossary") into an [ambivalent](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Ambivalent "Vocabulary/Glossary") verb.

Use this simple utility in place of 4 : 0 in the assignment sentence

```
   ddefine =: 1 : 'm&$: : (4 : 0)'

   plus =: 0 ddefine
x + y
)

```

It makes an ambivalent verb out of a dyad-only definition by providing a default value for the x argument.

We get the same end-result as 3. above

```
   plus
0&$: :(4 : 'x + y')

```

  
5\. To create a tacit recursive verb.

Define the verb: factorial as

-   y=0 returns 1
-   y=1 returns 1
-   y>1 returns y\*factorial y-1
```
   factorial =: 1: \` (\* $:@<:) @. \*
   factorial 6
720

```

See here for [an explanation of this verb.](https://www.jsoftware.com/help/dictionary/d212.htm "jdic:d212")

---

[Fix](https://code.jsoftware.com/wiki/Vocabulary/fdot "Vocabulary/fdot") (u f.)

---

### More Information

1\. In order to define the monad of a verb in terms of its dyad, the following construct is common in published code

```
   plus =: 3 : 0
0 plus y
:
x + y
)

```

For example, see the factory verb: load

But such an explicit verb is not safe to adapt, because the name of the verb has been hard-wired into its [body](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Body "Vocabulary/Glossary").

An unwary coder might end up with:

```
   minus =: 3 : 0
0 plus y
:
x - y
)

```

It would be good to use $: to make the body independent of the verb name. But if you simply replace plus with $: the monad fails

```
   plus =: 3 : 0
0 $: y
:
x + y
)
   3 plus 4
7
   plus 4
|stack error: plus
|   0    $:y

```

  
2\. Why does the failure in 1. happen?

As explained in the introduction, $: doesn't stand here for the whole of the explicit verb plus, but only the surrounding **verb phrase** inside the code defining the monad of plus

```
...
0 $: y
...

```

In this case the **verb phrase** is just the primitive verb: $:

The result is an infinite recursion.

  
3\. The remedy for the failure in 1. is to adapt the construct used in **Common Uses** 2, namely the pattern: plus=: (monad):(dyad)

-   where monad is (0&$:)
-   and dyad is (4 : 0)

The verb phrase (4 : 0) (even when surrounded by parentheses) looks for a series of lines terminated by ) immediately after the assignment sentence to provide the [body](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Body "Vocabulary/Glossary") of the dyad definition.

---

### Details

#### Widening the scope of $:

1\. u f. can be used to widen the scope of $: contained within the [tacit](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Tacit "Vocabulary/Glossary") [recursive](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Recursive "Vocabulary/Glossary") verb u, assigning it to a larger containing verb.

Since $:, when executed, stands for the _named_ [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") that directly contains it, and since f. replaces the [name](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Name "Vocabulary/Glossary") of a verb with the verb [value](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary") to which the name is assigned, an instance of $: within a named verb u in the phrase u f. will refer to the larger verb that contains u f..

For example, suppose we want to separate the recursive phrases from the ack verb that computes the Ackermann function, and that we want to use $: for anonymous recursion.

If we try the following, we get a stack error:

```
   c1 =: >:@\]               NB. if 0=x -> 1+y
   c2 =: <:@\[ $: 1:         NB. if 0=y -> (x-1) ack 1
   c3 =: <:@\[ $: ($: <:)    NB. else   -> (x-1) ack x ack y-1
   ack=: c1\`c2\`c3@.(,&\* i. 0:)M.
   (i.4) ack"0\] 3
|stack error: c3
|   (i.4)    ack"0\]3

```

Because e.g. c3 is a named verb that directly contains $:, the instance of $: within c3 stands for c3 itself. Hence c3 recurs unconditionally, and so a stack error is produced.

The remedy is to use f. to replace the names of the recursive verbs with their respective values:

```
   ack=: c1\`(c2 f.)\`(c3 f.)@.(,&\* i. 0:)M.
   (i.4) ack"0\] 3
4 5 9 61
   ack
c1\`(<:@\[ $: 1:)\`(<:@\[ $: ($: <:))@.(,&\* (i.) 0:)M.

```

c3 f. gives the [value](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary") of c3; this value is the verb <:@\[ $: ($: <:).

It is important here to note that this value is symbolic only; the $: within it has no meaning until such time that $: is actually executed on argument(s) from within some particular verb.

Each instance of $: is now directly contained within ack, and thus stands for ack when executed.

The ability to separate recursive phrases from the verb in which they will be executed can be useful when a single-line verb would be too long and complex.

2\. The same scope-widening effect can be achieved by using recursive [gerunds](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Gerund "Vocabulary/Glossary") within ack:

```
   c1   =: >:@\]
   c2Ger=: (<:@\[ $: 1:)\`''         NB. recursive gerund
   c3Ger=: (<:@\[ $: ($: <:))\`''    NB. another recursive gerund
   ack  =: c1\`c2Ger\`c3Ger@.(,&\* i. 0:)M.
   (i.4) ack"0\] 3
4 5 9 61
   ack
c1\`(<:@\[ $: 1:)\`(<:@\[ $: ($: <:))@.(,&\* (i.) 0:)M.

```

When Agent (u@.v) selects c3Ger, it executes the [_anonymous_](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Anonymous "Vocabulary/Glossary") verb c3Ger\`:6 (the verb represented by c3Ger). When $: is executed within c3Ger\`:6, the _named verb_ that directly contains the given instance of $: is ack; therefore $: stands for ack. The same is true of the $: within c2Ger.

Using recursive gerunds for this purpose has the benefit of conveying at the time of definition that the given recursive phrase is intended to refer to a larger verb within which it will be evoked.

3\. Within a multi-line explicit verb definition, f. or recursive gerunds (see above [for the use of either](#Widen)) can be used to make various instances of $: contained in different private definitions each refer to the entire containing explicit verb, by applying f. to the earlier-defined recursive verbs within the final sentence of the explicit definition.

---

#### Restricting the scope of $:

1\. An [explicit](https://code.jsoftware.com/wiki/Vocabulary/Glossary#ExplicitDefinition "Vocabulary/Glossary") [modifier](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Modifier "Vocabulary/Glossary") can be used to restrict the scope of $:.

Since $: refers to the named verb that directly contains it, and since u and v within an explicit modifier's private namespace are named verbs, $: contained within an [operand](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Operand "Vocabulary/Glossary") u or v will stand only for u or v if these are executed within the body of the explicit definition.

For example, suppose we want a single verb that increments an argument, then uses anonymous recursion to print the argument and subtract one until zero is reached.

We might initially try the following:

```
   V=: ($:@<: \[ echo)^:\*@>:
   V 2
...
3
3
3
3
3
|stack error: echo
|       V 2

```

The problem is that @>: is part of the recursion, so we get (y+1)-1 in each iteration. We want to separate @>: from the recursion.

The remedy is to pass ($:@<: \[ echo)^:\* to an explicit adverb:

```
   V0=: ($:@<: \[ echo)^:\*{{u y}}@>:
   V0 2
3
2
1
0

```

Here $: only stands for the u operand of {{u y}}, which is ($:@<: \[ echo)^:\*.

Note that {{u}} would not have had any effect, because a given instance of $: is not assigned a verb value _until it is executed on arguments_. In the case of $:@<:^:\*{{u}}@>:, although $: is contained within the named verb u during the adverb's [execution](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Execution "Vocabulary/Glossary") (the process of deriving the resulting verb), u is never executed on the [argument](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Argument "Vocabulary/Glossary"). Instead the adverb simply returns the (anonymous) [derived](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Derived "Vocabulary/Glossary") verb (in this case just the unmodified [operand](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Operand "Vocabulary/Glossary") ($:@<: \[ echo)^:\*), and it is from within this _anonymous_ derived verb that $: is executed on the argument. Since in this case the instance of $: is not executed on argument(s) from within a named verb, $: therefore refers to the outermost verb phrase that contains it, which is ($:@<: \[ echo)^:\*@>:.

An [ambivalent](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Ambivalent "Vocabulary/Glossary") adverb for limiting the scope of tacit recursive verbs can be defined as

```
   Scoped=: {{ u{{u y}} : (u{{x u y}}) }}
   V1=: ($:@<: \[ echo)^:\*Scoped@>:
   V1 2
3
2
1
0

```

When f. displays a fixed verb which contains separate recursive verbs, it does so using the same mechanism:

```
   r=: $:@<^:\*
   r@>: f.
$:@<^:\* (1 : 0)@>:
u y
:
x u y
)

```

2\. It is possible for different instances of $: within a given sentence to refer to different verbs, by passing each tacit recursive verb to its own explicit modifier.

---

#### When a thread is started which executes $:

If $: occurs directly within the u operand to (u t. n),  $: stands only for this verb operand. This is true regardless of whether the derived verb u t. n occurs within a single-phrase verb definition.

```
   f=: 3 # \[: > ($:@<: \[ echo)^:\*t.1@>:
   f 2
3
2
1
0 0 0

```

$: within f refers only to ($:@<: \[ echo)^:\*, the verb executed in the thread started by u t. n.

---
