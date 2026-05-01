# Vocabulary/com - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/coa "Vocabulary/coa") [<<](https://code.jsoftware.com/wiki/Vocabulary/cor "Vocabulary/cor")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d310n.htm "jdic:d310n")

<table class="wikitable"><tbody><tr><td><tt>m&nbsp;: n</tt></td><td>Explicit Definition</td><td>Conjunction</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank "Vocabulary/RankInfo") _\-- operates on x and y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Defines an [explicit entity](https://code.jsoftware.com/wiki/Vocabulary/Glossary#ExplicitEntity "Vocabulary/Glossary").

> [![](https://code.jsoftware.com/mediawiki/images/5/54/Information.png)](https://code.jsoftware.com/wiki/File:Information.png) [Conjunction](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Conjunction "Vocabulary/Glossary") **Def** (:) has several different uses, requiring several pages to document it
> 
> -   [Vocabulary/cor](https://code.jsoftware.com/wiki/Vocabulary/cor "Vocabulary/cor") – A _swatch_ (roadmap) of the different usages of (:) you'll encounter
> -   Vocabulary/com **\[THIS PAGE\]** – the complete formal details of [Explicit Definition](https://code.jsoftware.com/wiki/Vocabulary/Glossary#ExplicitDefinition "Vocabulary/Glossary")
> -   [Vocabulary/coa](https://code.jsoftware.com/wiki/Vocabulary/coa "Vocabulary/coa") – anatomy of a sample [explicit definition](https://code.jsoftware.com/wiki/Vocabulary/Glossary#ExplicitDefinition "Vocabulary/Glossary")
> -   [Vocabulary/cou](https://code.jsoftware.com/wiki/Vocabulary/cou "Vocabulary/cou") – how to use (:) to combine monad and dyad valences from separate definitions
> -   [Vocabulary/NounExplicitDefinition](https://code.jsoftware.com/wiki/Vocabulary/NounExplicitDefinition "Vocabulary/NounExplicitDefinition") – defining a noun as an explicit entity.

Operand m determines what sort of [entity](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Entity "Vocabulary/Glossary") gets defined. The allowed values for m are:

<table class="wikitable"><tbody><tr><td><b><tt>m</tt></b></td><td><b>Type of entity</b></td></tr><tr><td><tt>0</tt></td><td><a href="#mnoun">noun</a></td></tr><tr><td><tt>1</tt></td><td><a href="#mmodifier">adverb</a></td></tr><tr><td><tt>2</tt></td><td><a href="#mmodifier">conjunction</a></td></tr><tr><td><tt>3</tt></td><td>verb (<a href="#mmonad">monadic</a> or <a href="#ambivalent">bivalent</a>)</td></tr><tr><td><tt>4</tt></td><td><a href="#mdyad">dyadic-only verb</a></td></tr><tr><td><tt>13</tt></td><td>verb, but <a href="#m13">create a tacit form if possible</a></td></tr></tbody></table>

The _Standard Library_ stdlib defines six words (nouns) to serve as mnemonics for these integers: noun, adverb, conjunction, verb, monad, dyad.

Other values are available, defined [below](#allmvalues).

Operand n is a [string](https://code.jsoftware.com/wiki/Vocabulary/Glossary#String "Vocabulary/Glossary") specifying the contents of the entity.

For a [verb](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Verb "Vocabulary/Glossary") or a [modifier](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Modifier "Vocabulary/Glossary"), n (called the [body](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Body "Vocabulary/Glossary")) consists of one of more [sentences](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Sentence "Vocabulary/Glossary") of J code.

In most cases, the [entity](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Entity "Vocabulary/Glossary") defined in this way is a [verb](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Verb "Vocabulary/Glossary"). Therefore in what follows we shall mainly describe _verbs_.

An explicit _verb_ corresponds to a _function_, _method_, or _program_ in other programming languages.

When the verb defined by (m : n) is subsequently [executed](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Execution "Vocabulary/Glossary")

-   a [private namespace](https://code.jsoftware.com/wiki/Vocabulary/Glossary#PrivateNamespace "Vocabulary/Glossary") is created for it
-   the [argument(s)](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Argument "Vocabulary/Glossary") to the verb are allocated names in the private namespace (y and for dyads, x also)
-   then the sentences of the [body](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Body "Vocabulary/Glossary") are executed in turn.

The result of the last sentence executed becomes the verb's [result](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Result "Vocabulary/Glossary").

For an explicit **verb**, this result must be a **noun**, else J signals  syntax error .  
This can be puzzling, because the syntax of each individual sentence in the [body](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Body "Vocabulary/Glossary") may in fact be correct.

### Common uses

1\. Define a verb by _explicit definition_

**Note:** You don't need (:) to define a (named) verb if you can specify the _value_ of the verb by using @, @:, &, or as a _train_. (This is called _tacit definition_.)

```
  sum=: +/                          NB. tacit definition
  count=: #                         NB. tacit definition
  mean=: 3 : '(sum y) % (count y)'  NB. explicit definition

```

2\. "Compile" an explicit definition into a tacit definition (of a verb)

```
   13 : '(sum y) % (count y)'
sum % count

```

3\. Comment-out lines of code in a J script. In other words define a block of lines to be ignored:

This is turned into an unnamed noun (cf 4.) which is discarded if it's not assigned to a name or used in a phrase.

```
0 : 0
This is a block of lines
which may contain code:
   DISPLAYLOAD\_j\_=: 0
which we want J to ignore for now.
)

```

4\. Write a message into the J session as a J script loads

```
smoutput 0 : 0
This is a message inside a J script
which we want J to output to the user.
)

```
---

### More Information

#### Defining a Noun

You can use (:) to define a noun of any rank or type. See: [Defining a noun as an explicit entity using (:)](https://code.jsoftware.com/wiki/Vocabulary/NounExplicitDefinition "Vocabulary/NounExplicitDefinition").

---

#### Defining a Monadic Verb

Define a monadic verb like this

in just the same way as you define a noun

```
mean =: monad : 0   NB. Return mean of list y
total =. +/ y       NB. Add up the items of y
number =. #y        NB. Get # of items
total % number      NB. Return total/number of items
)

```

Here's what happens:

1.  Executing  monad : 0 starts defining a **monad**, i.e. a particular kind of verb.  -   The m\-operand (monad), says what kind of entity is being defined.
      2.   The n\-operand 0 says it's a **_multiline definition_**.
    
2.  Execution of the phrase  monad : 0 is temporarily suspended while J reads successive lines from the J session or the J script itself, just as described for a literal noun. These lines become the **body** of the monad. They are not used until the monad comes to be executed.  
    If you enter  monad : 0 via the keyboard, J will read _all_ successive lines you enter, until you enter the single character: )
3.  Once the **_body delimiter_**, a line containing the single word ), is reached, the suspended phrase  monad : 0 is resumed.
4.  When the monad eventually comes to be executed, J uses its y\-argument as the value of the name y, then executes the sentences of the body in turn. Thus the first sentence adds up all the items of y and [assigns](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Assignment "Vocabulary/Glossary") the result to the name total.
5.  The result of the **last** sentence executed need not be assigned to any name at all. It becomes the result of the monad.
6.  The construct:  mean =: is **not** part of the definition of the monad itself!  monad : 0 defines a verb that calculates the "mean". The [value](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary") of  monad : 0 is that actual verb. (Yes -- a **value** can be a **verb** rather a **noun!**) What you then do with that (verb) value is up to you. But... if you plan to execute that verb more than once, you'd better [assign](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Assignment "Vocabulary/Glossary") the value to a **name**, such as mean.

Whenever a name like mean is defined like this, it takes its [part of speech](https://code.jsoftware.com/wiki/Vocabulary/Glossary#PartOfSpeech "Vocabulary/Glossary") from the **value** assigned to it. So in this example, the name mean becomes a verb. Until the result of  monad : 0 is assigned to the name mean, it is called an [anonymous verb](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Anonymous "Vocabulary/Glossary").

#### Other ways of defining a Monadic Verb

The name define is itself a word in the 'z'-locale. It is defined as (: 0). Therefore you could start your verb definition with

```
   name =: monad define

```

instead of

```
   name =: monad : 0

```

> [![](https://code.jsoftware.com/mediawiki/images/5/54/Information.png)](https://code.jsoftware.com/wiki/File:Information.png) The name monad is another mnemonic for the number 3.
> 
>   
> It is a noun. It resides in the 'z' locale. It is defined in stdlib.ijs as part of the _standard library_.  
> Experienced J programmers often don't use it. Instead they use the number 3 directly,  
> as in  name =: 3 : 0

---

#### Defining a Dyadic Verb

To define a dyad, use dyad instead of monad

```
distance =: dyad define   NB. Distance between two points x and y
%: +/ \*: x - y            NB. sqrt of sum of squares of distances between coordinates
)

```

Everything said above under "Defining a Monadic Verb" applies to a _dyad_ too. Additionally, when the _dyad_ comes to be executed, it **must** be given a left argument (x\-argument) as well as a right argument (y\-argument). The x\-argument is assigned to the name x when the **dyad** starts to run.

> [![](https://code.jsoftware.com/mediawiki/images/5/54/Information.png)](https://code.jsoftware.com/wiki/File:Information.png) The name dyad is a mnemonic for the number 4.
> 
>   
> It is a noun. It resides in the 'z' locale. It is defined in stdlib.ijs as part of the _standard library_.  
> Experienced J programmers often don't use it. Instead they use the number 4 directly,  
> as in  distance =: 4 : 0

---

#### The Value of a Verb is the Verb Itself

Before we examine execution of an explicit verb, consider again what a verb **is**. To see the value of any name, type the name itself as a single sentence:

```
   distance
4 : 0
NB. Distance between two points x and y
%: +/ \*: x - y   NB. sqrt of sum of squares of distances between coordinates
)

```

The value of distance is a verb, one that would be created by executing the lines shown.

The internal representation used 4 : 0 rather than dyad define

To prove that : produces an anonymous verb, execute it by itself without assigning it to a name. The verb will be created and its value immediately typed:

```
   dyad define
NB. distance
%: +/ \*: x - y
)
4 : 0
NB. distance
%: +/ \*: x - y
)

```

The part up to the first ) is the definition, and the part starting with 4 : 0 is the result, which is the anonymous verb. Since this result is not assigned to a name, J discards it without ever executing it.

#### Executing the Verb; Private Namespaces

You execute the explicit verb by giving it arguments. Execution comprises the following steps:

1.  A private namespace is created for the execution.  
    If the verb is recursive, a new private namespace is created every time the explicit verb is executed.
2.  The argument(s), the names y and (for dyads) x, are defined in the private namespace and initialized with the argument values.  
    The names x, y, u, v, m, and n are special. They refer to arguments/operands of the explicit entity. [Avoid using them for other purposes](#uvnames).
3.  The sentences are then executed one by one.
4.  Assignments that use \=. define names in the private namespace. The private namespace is accessible only from sentences running in the explicit verb that defined them.  
    Noun arguments are passed by value, not by name, so nouns appearing in the sentence are evaluated using the private namespace before verbs appearing in the sentence are executed.  
    Tacitly-defined verbs executed by the sentence still have access to the private namespace. The details are [here](https://code.jsoftware.com/wiki/Vocabulary/Locales#Lookup "Vocabulary/Locales").
5.  The result of the last sentence executed becomes the result of the execution of the verb. This must be a noun.  
    Strictly it is the last result that is not in a **_T-block_**.
6.  At the end of the execution the private namespace is destroyed and all its names are released.
```
   total =: 20
   mean 2 4 6
4
   total
20

```

The name total used in the explicit verb was defined in its private namespace and did not affect the previous definition.

---

#### Control Structures

By default, sentences are executed in sequence from the first sentence of the body to the last. You can alter this sequence by using [control structures](https://www.jsoftware.com/help/dictionary/ctrl.htm "jdic:ctrl"). These include, among others, the familiar _if-then-else_ and _do-while_ constructs.

Whatever the resulting sequence (or selection) of sentences which are executed, the result of the verb is always the result of the last sentence executed.

Strictly it is the last result that is **_not in a T-block_**.

---

#### Defining a Dual-Valence Verb

A **_dual-valence verb_** is one that can be executed either monadically or dyadically. The monadic and dyadic versions of the verb are completely separate, except for the name. The body of the verb has sections for each.

A dual-valence verb looks like:

```
verb define
_sentences for the monadic case_
:
_sentences for the dyadic case_
)

```

verb is defined to be 3. The valence separator : and the final ) lines may have no additional characters except spaces.

```
   distance =: verb define  NB. dist betw x and y, or origin and y if x omitted
(y \* 0) distance y  NB. If x omitted, use origin
:
%: +/ \*: x - y
)
   distance 3 4   NB. Monad
5
   1 1 distance 3 4  NB. Dyad
3.60555

```
---

#### Defining a Modifier

You can define an **explicit adverb** using adverb define (or its equivalent 1 : 0), and an **explicit conjunction** using conjunction define (or its equivalent 2 : 0).

> [![](https://code.jsoftware.com/mediawiki/images/5/54/Information.png)](https://code.jsoftware.com/wiki/File:Information.png) The symbols m and n have been used above to denote the
> 
> operands of the conjunction : as in 3 : 0 where m is 3 (=verb) and n is 0 (=inline definition). But **in this section**, where we are discussing **user-defined modifiers**, m and n are the names of **operands of the user-defined** conjunction, when that operand is a noun.

The classic use of an explicit modifier is when you have some template for processing data, and the same sequence can be used with different verbs. You would define an explicit modifier for the template, and the verb to be used would be passed in as an operand.

Here is an example explicit conjunction.

```
NB. conjunction: execute u, counting time.  n is a descriptive string
uptime =. 6!:1
showtime =: conjunction define
    display 'Starting ' , n
    starttime =. uptime ''
    u y
    endtime =. uptime ''
    duration =. endtime - starttime
    display 'Exiting ' , n , ' time=' , ": duration
)
NB. sample execution
   randvec =: 1e7 (?@$) 0
   /:~ showtime 'sort' randvec
Starting sort
Exiting sort time=1.716
1.40492e\_7 1.84709e\_7 2.45538e\_7 3.39289e\_7 3.56141e\_7 ...

```

Understand the **three** executions that led to the result seen.

1.  The first execution was the execution of 2 : 0. This read the lines for the body and saved them in an anonymous conjunction. This conjunction was then assigned to the name showtime.
2.  The next execution was of /:~ showtime 'sort'. This execution created an **anonymous derived verb** which contained the saved values of the operands /:~ and 'sort' as well as the body of showtime.  
    Strictly speaking, this step is the execution of showtime, but no sentences from the body of showtime have been executed yet.
3.  Finally, _anonymousverb_ randvec was executed. A new private namespace was created, operands and arguments were given defined names, and then, at last, the sentences of the body were executed.

##### When Is The Body Executed?

There are two classes of modifier:

1.  Modifiers whose body refers to x or y operate as in the example above. The execution of the modifier itself saves the uv operands in an anonymous verb; subsequently the anonymous verb is executed on noun argument(s), at which time the body of the modifier is executed. The execution of the modifier itself **always** produces a verb.  
    The body is interpreted in the same way as bodies produced by 3 : 0, in that the definition starts with the monadic (or only) valence, which may optionally be followed by a line containing a single : character, followed by the dyadic valence.  
    The anonymous verb could be assigned to a name and used later.
2.  A modifier M whose body does **not** refer to x or y is handled differently. The body of the modifier is executed during the execution of the modifier itself. The result R of executing the body becomes the result of the modifier, and it may have **any part of speech**.  1.  Because M is executed without looking at x or y arguments, there is no question about how many operands M has: an adverb has one operand, a conjunction has two.  
          In other words, you do not use a single : character to create different valences for this type of modifier.
      2.  The result R is usually a verb, and usually a tacit verb at that, as in the first example below. All tacit verbs are bivalent.
      3.  The result R does not have be be a tacit verb. It doesn't have to be a verb at all. It can be any part of speech, and in particular it can be the result of creating an explicit modifier using m : n as in the second example below.
      4.  If R is an explicit entity, that entity may be made bivalent, using a : line in the usual way.
      5.  If R is an adverb or conjunction, it may be necessary to enclose M\-and-operands in parentheses.  
          because of subtle details in the parsing rules.

Here is an example of a modifier that does not refer to x or y:

```
   endtoend =: adverb define
NB. Run the results of each cell of u along a single axis
;@:(<@u)
)
   i."0 endtoend
;@:(<@(i."0))
   i."0 endtoend 3 4 5
0 1 2 0 1 2 3 0 1 2 3 4

```

Note that executing i."0 endtoend produced a verb with no body, i. e. a tacit verb. The body of endtoend was executed when i."0 endtoend was executed. The body was consumed, and the result of executing endtoend was the verb shown above.

Here is an example of a an adverb that returns an adverb:

```
   NB. Adverb. m is a rank, result is adverb that applies ITS u at that rank.  So, u m rankadv produces u"m
   rankadv =: 1 : 0
   1 : ('u " ',":m)
)
   2 rankadv   NB. The result of rankadv is an adverb
1 : 'u " 2'
   + 2 rankadv  NB. applying that result to a verb produces a verb
+"2

```

##### What Names Are Defined When The Body Is Started?

When the body of a modifier starts execution, the name u is defined in the private namespace with an initial value of the left operand. This value might be either a noun or a verb. The name v is similarly defined, for conjunctions only.

In addition, if u is a noun, it is also assigned to the name m. For conjunctions, if v is a noun it is also assigned to the name n.

If the modifier refers to x or y, those names are also defined when the body starts execution.

##### What Are Those Names Set To?

Noun operands are **passed by value**. Named nouns are replaced by their value before being assigned to u/v/m/n.

Named verb operands are **passed by name**. The name of a named verb becomes the initial value of u or v. If an operand is not named, the value of the anonymous operand is assigned to u or v.

_**Beware**_ two subtleties:

1.  The modifier has a different namespace from the caller. If u or v refers to a name that is defined in the private namespace of the caller, the definition will be unavailable to the modifier.
    
    To pass the **value** of a named verb rather than its name, you may apply the f. adverb which replaces the name with an anonymous verb having the same value.
    
2.  When the names x/y/u/v/m/n are encountered during parsing, they are immediately replaced by their values, making an exception to the rule that verbs are passed by name.

Example:

```
a1 =: adverb define
incoming\_g =: g
incoming\_u =: u
u y
)

v1 =: monad define
g =. +:
g a1 y
)
   v1 3
|value error: g
|       u y
   incoming\_g
+-+
|g|
+-+
g
   incoming\_u
+-+
|g|
+-+
g


```
-   u was initialized to g, as evidenced by the value error. When u was assigned to incoming\_u, the special name was replaced by its value.
-   The definition of g in v1 was not visible in a1.

Continuing using v2, which applies f. to g:

```
v2 =: monad define
g =. +:
g f. a1 y
)
   v2 3
6
   incoming\_g
+-+
|g|
+-+
g
   incoming\_u
+--+
|+:|
+--+
+:

```

The name g is still undefined inside a1, but now its value in v2 has been passed into a1 and assigned to u.

##### What Is The Implied Locale When The Body Is Executed? **Version 9.6 and earlier**

When a [locative](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Locative "Vocabulary/Glossary") is executed (whether for a verb or for a modifier), the [implied locale](https://code.jsoftware.com/wiki/Vocabulary/Glossary#ImpliedLocale "Vocabulary/Glossary") is set to the locale indicated by the locative.

As described above, an explicit modifier that refers to x or y, the execution of the _modifier occurs_ when the modifier receives its operands, creating the anonymous derived verb which is executes the body of the modifier on x/y. The derived verb is **not** a locative, and the locale is not changed before executing the body.

The following examples show what happens.

When the modifier does not contain x or y, the body is executed in the locale of the locative

```
   advshowloc\_z\_ =: 1 : 0
smoutput 'Executed in ' , > coname''
u
)
   + advshowloc
Executed in base
+-+
|+|
+-+
+

```

and the resulting verb is **not** a locative

```
   v\_new\_ =: +
   v =: -
   t =: v advshowloc\_new\_
Executed in new
   t 6  NB. t is executed in base
\_6

```

When the modifier contains x or y, the execution of the modifier itself creates an anonymous derived verb in the locale that is active when the modifier _finishes_ (which is the same as the implied locale before the modifier started)

```
   advxyshowloc\_z\_ =: 1 : 0
smoutput 'Executed in ' , > coname''
u y
)
   v advxyshowloc\_new\_ 6
Executed in base
\_6
   t =: v advxyshowloc\_new\_
   t 6
Executed in base
\_6

```

To execute the derived verb in the same locale as the modifier that created it, assign it to a locative:

```
   t\_new\_ =: v advxyshowloc\_new\_
   t\_new\_ 6
Executed in new
6

```

##### Modifiers using x or y **After version 9.6**

As noted above, modifiers that refer to x or y produce 2 executions: the first to collect u/v, the second to execute the body of the definition. If the modifier is executed through a locative (for example, conjname\_abc\_), the result of the first execution is represented by an _**anonymous locative**_, which ensures that both executions occur in the same locale, namely the one given by the locative at the time of the first execution.

---

### Details

1\. n can be a string instead of 0, in which case it will be used as the body of the explicit entity.

```
   distance =: dyad : '%: +/ \*: x - y'
   1 1 distance 6 13
13

```

You could use LF characters to cram multiple lines of body into one sentence. (But this is not a recommended technique.)

2\. n can be a list of boxes, in which case each box contains one line of the script.

3\. m can be the special value 13 which will attempt to create a [tacit verb](https://code.jsoftware.com/wiki/Vocabulary/Glossary#TacitVerb "Vocabulary/Glossary") which has no body and refers to its arguments implicitly.

```
   distance =: 13 : '%: +/ \*: x - y'  NB. try to create tacit form
   distance    NB. Did it?  Yes, it did!
\[: %: \[: +/ \[: \*: -
   1 1 distance 6 13   NB. Same results
13

```

Be aware of the quirks of using 13 ::

-   The resulting verb is not guaranteed to be tacit.
-   If the resulting verb is tacit, it does not have a private namespace.
-   A tacit verb can be applied in either valence, so you must use it correctly
-   If you get exotic, you may encounter a bug or two in the implementation of 13 :

4\. Attempting to execute an empty body, or empty section of body for dual-valence verbs, is a domain error. A section is empty if it contains no words, after comments (beginning with NB.) have been removed.

5\. Attempting to execute a valence that does not have a body or section of body is a domain error.

6\. Certain sentences in [control structures](https://www.jsoftware.com/help/dictionary/ctrl.htm "jdic:ctrl"), such as the sentences between if. and do. or while. and do., are called **_T blocks_** (for test blocks). Sentences in a T block are ignored for purposes of setting the final result of the entity; so, precisely, the result of an explicit entity is the result of the last sentence executed that was not in any T block. A full discussion of T-blocks is [here](https://code.jsoftware.com/wiki/Vocabulary/TBlock "Vocabulary/TBlock").

7\. If the executed valence is not empty, but no sentence is executed that was not in any T block, the result of the entity is i. 0 0.

8\. If the result of a **verb** according to the preceding rules is not a noun, a noun result was required error is raised when the verb finishes execution.

9\. If the last sentence of a T block has a result that is not a noun, a noun result was required error is raised.

10\. Modifiers that refer to x or y and any of u v m n must perforce produce verbs. The body of such a modifier follows the rules for dual-valence verbs: the sentences for the monad come first, followed by : and then the sentences for the dyad. If : is not present, only one valence will be defined: the dyad if the modifier refers to x, otherwise the monad.

11\. For compatibility with old versions of J, modifiers that do not refer to u, v, m, or n are executed as if they did not refer to x or y, and the name(s) x (and, for conjunctions, y) are initialized with the operand(s) of the modifier (which in modern J would be assigned to u/v).

12\. The names x, y, u, v, m, and n are treated specially in explicit definitions. Normally verbs are passed into modifiers by name; but these names are overwritten when a modifier starts, so they

-   are always immediately replaced by their **value**
-   generate a value error if they are not defined.

Even if they are not being passed into an explicit modifier.

For example,

```
v =: (\* v@:<:) \` 1: @. (<&2)  NB. recursive factorial

```

will work if typed into a J session, but will fail inside an explicit verb (with value error because the name could not be replaced).

Because load is an explicit verb, these names are also replaced by their value in lines executed while a script is loading.

The sensible response to this behavior is to avoid the predefined names except for their uses as operands and arguments.

---
