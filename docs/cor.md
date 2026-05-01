# Vocabulary/cor - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/com "Vocabulary/com") [<<](https://code.jsoftware.com/wiki/Vocabulary/dotco "Vocabulary/dotco")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d310n.htm "jdic:d310n")

<table class="wikitable"><tbody><tr><td><tt>m&nbsp;: n</tt></td><td>Def</td><td>Conjunction</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank "Vocabulary/RankInfo") _\-- operates on x and y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Defines all types of [entities](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Entity "Vocabulary/Glossary").

> [![](https://code.jsoftware.com/mediawiki/images/5/54/Information.png)](https://code.jsoftware.com/wiki/File:Information.png) [Direct definition](https://code.jsoftware.com/wiki/Vocabulary/DirectDefinition "Vocabulary/DirectDefinition") {{ … }} is a _**RECOMMENDED**_ simpler alternative for defining new [verbs](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Verb "Vocabulary/AbsolutelyEssentialTerms") and other [entities](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Entity "Vocabulary/Glossary"). It is converted into a form of (m : n), so you will need to come back here if you need to understand details such as if./do./end. .
> 
> DirectDefinition is _not available_ in systems earlier than J902.

> [![](https://code.jsoftware.com/mediawiki/images/5/54/Information.png)](https://code.jsoftware.com/wiki/File:Information.png) [Conjunction](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Conjunction "Vocabulary/Glossary") **Def** (:) has several different uses, requiring several pages to document it
> 
> -   Vocabulary/cor **\[THIS PAGE\]** – A _swatch_ (roadmap) of the different usages of (:) you'll encounter
> -   [Vocabulary/com](https://code.jsoftware.com/wiki/Vocabulary/com "Vocabulary/com") – the complete formal details of [Explicit Definition](https://code.jsoftware.com/wiki/Vocabulary/Glossary#ExplicitDefinition "Vocabulary/Glossary")
> -   [Vocabulary/coa](https://code.jsoftware.com/wiki/Vocabulary/coa "Vocabulary/coa") – anatomy of a sample [explicit definition](https://code.jsoftware.com/wiki/Vocabulary/Glossary#ExplicitDefinition "Vocabulary/Glossary")
> -   [Vocabulary/cou](https://code.jsoftware.com/wiki/Vocabulary/cou "Vocabulary/cou") – how to use (:) to combine monad and dyad valences from separate definitions
> -   [Vocabulary/NounExplicitDefinition](https://code.jsoftware.com/wiki/Vocabulary/NounExplicitDefinition "Vocabulary/NounExplicitDefinition") – defining a noun as an explicit entity.

---

### Swatch

Below is a _swatch_ for the different uses of (:) you'll encounter in published J code

<table class="wikitable"><tbody><tr><td><b>#</b></td><td><b>Sample sentence</b></td><td><b>What it defines</b></td></tr><tr><td>1</td><td><tt>myverb =: 3&nbsp;: 0</tt></td><td>Either an <a title="Vocabulary/Glossary" href="/wiki/Vocabulary/Glossary#Ambivalent">ambivalent verb</a> or a <a title="Vocabulary/Glossary" href="/wiki/Vocabulary/Glossary#Monad">monad</a>. <b><a title="Vocabulary/com" href="/wiki/Vocabulary/com">More...</a></b> <b>[<i>Notes:</i> <a href="#1">#1</a> <a href="#2">#2</a>]</b></td></tr><tr><td>2</td><td><tt>myverb =: verb define</tt></td><td>[Same as: 1]</td></tr><tr><td>3</td><td><tt>myverb =: monad define</tt></td><td>[Same as: 1]</td></tr><tr><td>4</td><td><tt>myverb =: (3&nbsp;: 0)"1</tt></td><td>[See: 1]. A <a title="Vocabulary/AbsolutelyEssentialTerms" href="/wiki/Vocabulary/AbsolutelyEssentialTerms#Verb">verb</a> of <a title="Vocabulary/AbsolutelyEssentialTerms" href="/wiki/Vocabulary/AbsolutelyEssentialTerms#VerbRank">rank</a> <tt>1</tt>. <b><a title="Vocabulary/com" href="/wiki/Vocabulary/com">More...</a></b> <b>[<i>Notes:</i> <a href="#1">#1</a> <a href="#2">#2</a> <a href="#3">#3</a>]</b></td></tr><tr><td>5</td><td><tt>myverb =: 4&nbsp;: 0</tt></td><td>A <a title="Vocabulary/Glossary" href="/wiki/Vocabulary/Glossary#Dyad">dyad</a>. <b><a title="Vocabulary/com" href="/wiki/Vocabulary/com">More...</a></b> <b>[<i>Notes:</i> <a href="#1">#1</a> <a href="#5">#5</a>]</b></td></tr><tr><td>6</td><td><tt>myverb =: dyad define</tt></td><td>[Same as: 5]</td></tr><tr><td>7</td><td><tt>myverb =: 0&amp;$:&nbsp;:(4&nbsp;: 0)</tt></td><td>[See: 5]. An <a title="Vocabulary/Glossary" href="/wiki/Vocabulary/Glossary#Ambivalent">ambivalent verb</a>, <tt>x</tt> defaulting to <tt>0</tt>. <b><a title="Vocabulary/com" href="/wiki/Vocabulary/com">More...</a></b> <b>[<i>Notes:</i> <a href="#1">#1</a> <a href="#5">#5</a> <a href="#6">#6</a>]</b></td></tr><tr><td>8</td><td><tt>plus =: 0&amp;$:&nbsp;: +</tt></td><td>An <a title="Vocabulary/Glossary" href="/wiki/Vocabulary/Glossary#Ambivalent">ambivalent verb</a>, <tt>x</tt> defaulting to <tt>0</tt>. Tacit verb. This example could also be written (0&amp;+&nbsp;: +)<b>[<i>Notes:</i> <a href="#6">#6</a>]</b></td></tr><tr><td>9</td><td><tt>myverb =: 3&nbsp;: 'Jcode(y)'</tt></td><td>A <a title="Vocabulary/Glossary" href="/wiki/Vocabulary/Glossary#Monad">monad</a> with a 1-line <a title="Vocabulary/Glossary" href="/wiki/Vocabulary/Glossary#Body">body</a>. <b><a title="Vocabulary/com" href="/wiki/Vocabulary/com">More...</a></b> <b>[<i>Notes:</i> <a href="#4">#4</a>]</b></td></tr><tr><td>10</td><td><tt>myverb =: verb def 'Jcode(y)'</tt></td><td>[Same as: 9]</td></tr><tr><td>11</td><td><tt>myverb =: monad def 'Jcode(y)'</tt></td><td>[Same as: 9]</td></tr><tr><td>12</td><td><tt>myverb =: 4&nbsp;: 'Jcode(x,y)'</tt></td><td>A <a title="Vocabulary/Glossary" href="/wiki/Vocabulary/Glossary#Dyad">dyad</a> with a 1-line <a title="Vocabulary/Glossary" href="/wiki/Vocabulary/Glossary#Body">body</a>. <b><a title="Vocabulary/com" href="/wiki/Vocabulary/com">More...</a></b> <b>[<i>Notes:</i> <a href="#4">#4</a>]</b></td></tr><tr><td>13</td><td><tt>myverb =: dyad def 'Jcode(x,y)'</tt></td><td>[Same as: 12]</td></tr><tr><td>14</td><td><tt>3&nbsp;: 0 ''</tt></td><td>[See: 1]. An <a title="Vocabulary/Glossary" href="/wiki/Vocabulary/Glossary#Anonymous">anonymous</a> <a title="Vocabulary/Glossary" href="/wiki/Vocabulary/Glossary#Monad">monad</a>, immediately executed with <tt>y=''</tt>. <b><a title="Vocabulary/com" href="/wiki/Vocabulary/com">More...</a></b> <b>[<i>Notes:</i> <a href="#1">#1</a> <a href="#7">#7</a>]</b></td></tr><tr><td>15</td><td><tt>123 (4&nbsp;: 0) 456</tt></td><td>[See: 5]. An <a title="Vocabulary/Glossary" href="/wiki/Vocabulary/Glossary#Anonymous">anonymous</a> <a title="Vocabulary/Glossary" href="/wiki/Vocabulary/Glossary#Dyad">dyad</a>, immediately executed with <tt>x=123</tt> and <tt>y=456</tt>. <b><a title="Vocabulary/com" href="/wiki/Vocabulary/com">More...</a></b> <b>[<i>Notes:</i> <a href="#1">#1</a> <a href="#7">#7</a>]</b></td></tr><tr><td>16</td><td><tt>myadvb =: 1&nbsp;: 0</tt></td><td>An <a title="Vocabulary/Glossary" href="/wiki/Vocabulary/Glossary#Adverb">adverb</a> named: <tt>myadvb</tt>. <b><a title="Vocabulary/com" href="/wiki/Vocabulary/com">More...</a></b> <b>[<i>Notes:</i> <a href="#1">#1</a> <a href="#8">#8</a>]</b></td></tr><tr><td>17</td><td><tt>myadvb =: 1&nbsp;: 'Jcode(x,y)'</tt></td><td>An <a title="Vocabulary/Glossary" href="/wiki/Vocabulary/Glossary#Adverb">adverb</a> named: <tt>myadvb</tt> with a 1-line <a title="Vocabulary/Glossary" href="/wiki/Vocabulary/Glossary#Body">body</a>. <b><a title="Vocabulary/com" href="/wiki/Vocabulary/com">More...</a></b> <b>[<i>Notes:</i> <a href="#4">#4</a> <a href="#8">#8</a>]</b></td></tr><tr><td>18</td><td><tt>myconj =: 2&nbsp;: 0</tt></td><td>A <a title="Vocabulary/Glossary" href="/wiki/Vocabulary/Glossary#Conjunction">conjunction</a> named: <tt>myconj</tt>. <b><a title="Vocabulary/com" href="/wiki/Vocabulary/com">More...</a></b> <b>[<i>Notes:</i> <a href="#1">#1</a> <a href="#8">#8</a>]</b></td></tr><tr><td>19</td><td><tt>myconj =: 2&nbsp;: 'Jcode(x,y)'</tt></td><td>A <a title="Vocabulary/Glossary" href="/wiki/Vocabulary/Glossary#Conjunction">conjunction</a> named: <tt>myconj</tt> with a 1-line <a title="Vocabulary/Glossary" href="/wiki/Vocabulary/Glossary#Body">body</a>. <b><a title="Vocabulary/com" href="/wiki/Vocabulary/com">More...</a></b> <b>[<i>Notes:</i> <a href="#4">#4</a> <a href="#8">#8</a>]</b></td></tr><tr><td>20</td><td><tt>mynoun =: 0&nbsp;: 0</tt></td><td><a title="Vocabulary/Glossary" href="/wiki/Vocabulary/Glossary#Body">Body</a> becomes a <a title="Vocabulary/NounExplicitDefinition" href="/wiki/Vocabulary/NounExplicitDefinition#Defining_a_LF-separated_string">LF-separated noun</a> named: <tt>mynoun</tt>. <b><a title="Vocabulary/com" href="/wiki/Vocabulary/com">More...</a></b> <b>[<i>Notes:</i> <a href="#1">#1</a>]</b></td></tr><tr><td>21</td><td><tt>mynoun =: noun define</tt></td><td>[Same as: 20]</td></tr><tr><td>22</td><td><tt>mynoun =: convert 0&nbsp;: 0</tt></td><td>[See: 20]. <tt>convert</tt> is a placeholder for a verb to determine the <a title="Vocabulary/Glossary" href="/wiki/Vocabulary/Glossary#Type">type</a> of <tt>mynoun</tt> . <b><a title="Vocabulary/com" href="/wiki/Vocabulary/com">More...</a></b> <b>[<i>Notes:</i> <a href="#1">#1</a> <a href="#9">#9</a>]</b></td></tr><tr><td>23</td><td><tt>mynoun =: &gt; &lt;;._2 (0&nbsp;: 0)</tt></td><td>[Common special case of: 22]. Name: <tt>mynoun</tt> becomes a <a title="Vocabulary/NounExplicitDefinition" href="/wiki/Vocabulary/NounExplicitDefinition">table</a>. <b><a title="Vocabulary/com" href="/wiki/Vocabulary/com">More...</a></b> <b>[<i>Notes:</i> <a href="#1">#1</a> <a href="#9">#9</a>]</b></td></tr><tr><td>24</td><td><tt>mynoun =: &gt; &lt;;._2 [ 0&nbsp;: 0</tt></td><td>[Same as: 23]. <tt>&nbsp;[ </tt>can be replaced by <tt>&nbsp;]</tt></td></tr><tr><td>25</td><td><tt>0&nbsp;: 0</tt></td><td>[See: 20]. <a title="Vocabulary/Glossary" href="/wiki/Vocabulary/Glossary#Body">Body</a> is ignored (i.e. commented-out). <b><a title="Vocabulary/com" href="/wiki/Vocabulary/com">More...</a></b> <b>[<i>Notes:</i> <a href="#1">#1</a> <a href="#10">#10</a>]</b></td></tr><tr><td>26</td><td><tt>smoutput 0&nbsp;: 0</tt></td><td>[See: 20]. <a title="Vocabulary/Glossary" href="/wiki/Vocabulary/Glossary#Body">Body</a> is written out to the J session. <b><a title="Vocabulary/com" href="/wiki/Vocabulary/com">More...</a></b> <b>[<i>Notes:</i> <a href="#1">#1</a> <a href="#11">#11</a>]</b></td></tr><tr><td>27</td><td><tt>(&lt;;._2 (0&nbsp;: 0)) =: &lt;;._2 (0&nbsp;: 0)</tt></td><td>[See: 23]. Multiple multiline nouns, with execution continuing <b><a title="Vocabulary/com" href="/wiki/Vocabulary/com">More...</a></b> <b>[<i>Notes:</i> <a href="#1">#1</a> <a href="#12">#12</a>]</b></td></tr></tbody></table>

---

### Notes

**#1.** A _**multiline explicit definition**_ is triggered by an [invocation](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Invocation "Vocabulary/Glossary") of the form

```
   myname : 0

```

or

```
   myname define

```

where

-   myname is a placeholder for a [public](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Public "Vocabulary/Glossary") [name](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Name "Vocabulary/Glossary"): ( noun adverb conjunction verb ) or an [integer](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Integer "Vocabulary/Glossary") [atom](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Atom "Vocabulary/Glossary") in the list ( 0 1 2 3 ) specifying the [type](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Type "Vocabulary/Glossary") of [entity](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Entity "Vocabulary/Glossary") being defined,
-   define is a [public](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Public "Vocabulary/Glossary") [name](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Name "Vocabulary/Glossary") for the verb: (:0)

The _definition_ covers several successive lines of the script (or J session). This block of lines is called the [body](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Body "Vocabulary/Glossary") (of the definition).

The [body](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Body "Vocabulary/Glossary") starts on the **next line** of the script, and includes all lines up to the _terminator_, which is a Right Parenthesis: ) on a line by itself

```
verb : 0
body line 1
body line 2
)

```
-   The _**terminator:**_ ) **is not** part of the body of the definition and is discarded.
-   The _**line feed:**_ (LF) at the end of the final line **is** part of the body of the definition and is retained.

The result of the definition: a noun, verb, adverb or conjunction (depending on the value of placeholder: myname) _replaces_ the invocation in the sentence, and execution of the sentence continues. Thus, in this example

```
double =: verb define
2 \* y
)

```
-   the invocation is: verb define
-   the interpreter reads ahead to scan the body of the definition
-   the body of the definition is the single line (2 \* y)
-   the definition creates a verb which then replaces the invocation in the sentence
-   the sentence continues, assigning the new verb to the name: double .

If you are typing into the J session, the block of lines starts with the next line entered after the sentence executing the : conjunction or define, and continues to the terminator. The normal 3-space indent at the J session prompt is suppressed while you are entering the body of the definition.

---

**#2.** The [body](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Body "Vocabulary/Glossary") of this explicit verb may optionally contain the separator (:) on a line by itself, like this:

```
 ''optional text for the monadic valence''
 :
 ''optional text for the dyadic valence''

```

If the body contains the separator (:), then the verb can be used in any valence for which text is given:

-   text only above the separator - monad only
-   text only below the : separator - dyad only
-   text both above and below - [ambivalent verb](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Ambivalent "Vocabulary/Glossary"), with the monad or dyad text being executed according to how the verb is used

If the body doesn't contain the separator (:), then the verb may be used only as a [monad](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Monad "Vocabulary/Glossary").

---

**#3.** This shows how to specify the [rank](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#VerbRank "Vocabulary/AbsolutelyEssentialTerms") of myverb at the moment you define it

```
   myverb0=: 3 : 0 "1
NB. (verb body here)
)

```

It saves you doing this:

```
   myverb0=: 3 : 0
NB. (verb body here)
)
   myverb=: myverb0"1

```
---

**#4.** The string: 'Jcode(x,y)' stands for a sentence in J code which optionally includes the arguments x and y (either or both may be absent).

The string: 'Jcode(y)' stands for a sentence in J code which optionally includes the argument y, but **must not** include x. Otherwise you'll see no error until the verb is run, whereupon you see the following unhelpful behavior

```
   foo=: 3 : 'x+y'

   3 foo 4   NB. called as dyad
|domain error: foo
|   3     foo 4

   foo 4     NB. called as monad
|value error: x
|       x+y

```

The remedy in this case is to define foo=: 4 : 'x+y'

---

**#5.** The [body](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Body "Vocabulary/Glossary") of this explicit verb defines a [dyad](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Dyad "Vocabulary/Glossary"). It **should not** contain the separator (:) as shown in Note: [#2](#2). Otherwise those lines **above** the colon line are ignored.

---

**#6.** This shows how to define an [ambivalent verb](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Ambivalent "Vocabulary/Glossary") where the [monad](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Monad "Vocabulary/Glossary") is defined to be the same as the [dyad](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Dyad "Vocabulary/Glossary") with x=0

```
   myverb=: 0&$: :(4 : 0)
NB. (dyad body here, using both x and y)
)

```

Strictly speaking, this verb definition is [tacit](https://code.jsoftware.com/wiki/Vocabulary/Glossary#TacitVerb "Vocabulary/Glossary"), but with an embedded [explicit](https://code.jsoftware.com/wiki/Vocabulary/Glossary#ExplicitEntity "Vocabulary/Glossary") verb definition: (4 : 0) .

This is the recommended way of defaulting the x-argument, since the [body](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Body "Vocabulary/Glossary") uses [Self-reference](https://code.jsoftware.com/wiki/Vocabulary/dollarco "Vocabulary/dollarco") ($:) to avoid mention of the name myverb itself.

However you'll often see this method of defaulting x (_**NOT RECOMMENDED**_):

```
   myverb=: 3 : 0
0 myverb y   NB. call the NAMED verb as a dyad with x=0
:
NB. (dyad body here)
)

```

It is not recommended because if you ever copy the verb or change its name: myverb you may forget to edit the recursive call within the body: 0 myverb y

---

**#7.** **Principle:** If you provide the y-argument to a [monad](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Monad "Vocabulary/Glossary") at the point it is defined, the verb is immediately executed to compute a noun. Ditto if you provide both x- and y-arguments to a [dyad](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Dyad "Vocabulary/Glossary").

This shows how to adjust a script whilst it is actually being loaded. You can set flags or change the definition of a given verb according to some feature of the user's platform.

Example: suppose myverb comes in two forms:

-   myverb\_UNIX -- suitable for a UNIX platform
-   myverb\_WIN -- suitable for a Windows platform

J sets the system flag IFWIN\_z\_ to 1 when running under Windows. You can use this flag to alter myverb accordingly

```
3 : 0''
if. IFWIN do. myverb=: myverb\_WIN
else.         myverb=: myverb\_UNIX
end.
empty''   NB. to make sure this verb returns a noun not a verb
)

```
---

**#8.** The [body](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Body "Vocabulary/Glossary") of a [modifier](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Modifier "Vocabulary/Glossary") resembles that of a [verb](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Verb "Vocabulary/AbsolutelyEssentialTerms"), except that it will refer to at least one of the [operands](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Operand "Vocabulary/AbsolutelyEssentialTerms") u v m n.

v and n being undefined for an [adverb](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Adverb "Vocabulary/Glossary").

The created modifier will use its operand(s) to create a new entity, which may in turn be a verb referring to to _its_ arguments.

```
   + 2 : '(u v) y' \*: 20
420

```
-   2 : '(u v) y' created a modifier
-   in \+ 2 : '(u v) y' \*:, that modifier took the operands + and \*: to create a verb
-   that verb was executed on the value 20. It executed (+ \*:) 20
```
   #~ 2 : '(u v) y' # 'abc'
aaabbbccc

```

Same conjunction, different verbs, now executing (#~ #) 'abc'

Details [here](https://code.jsoftware.com/wiki/Vocabulary/com#mmodifier "Vocabulary/com").

---

**#9.** This shows how to represent a noun of any type as the [body](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Body "Vocabulary/Glossary") of an explicit definition.

Example 1: replace convert by cutopen

cutopen is a

-   [Standard Library](http://www.jsoftware.com/help/user/library.htm) word(s) residing in the 'z'-locale
-   Defined in the factory script stdlib.ijs which is located in  ~system/main/stdlib.ijs-   View the definition(s) in a JQt session by entering:  open '~system/main/stdlib.ijs'
```
   DIRECTION=: cutopen 0 : 0
North
East
South
West
)
   DIRECTION
+-----+----+-----+----+
|North|East|South|West|
+-----+----+-----+----+

```

Example 2: replace convert by the verb: ".@>@cutopen

```
   NOS=: ".@>@cutopen 0 : 0
 0.1  1.1  2.1  3.1  4.1
 5.1  6.1  7.1  8.1  9.1
10.1 11.1 12.1 13.1 14.1
)
   smoutput $NOS
3 5

```
---

**#10.** This shows how to include lines in a script which are to be ignored when the script is loaded.

For instance, you can insert comments or comment-out lines of code without the use of NB.

Example:

```
0 : 0
These are test-sentences for execution using Ctrl-R
   IFWIN\_z\_ =: 0
   IFWIN\_z\_ =: 1
)

```
---

**#11.** This shows how to include lines in a script which are to be printed in the session whilst the script is being loaded.

For instance, you can instruct the user how to proceed once the script is loaded

Example:

```
smoutput 0 : 0
To run the program, enter:
   run''
)

```
---

**#12.** The definition creates a noun/verb/adverb/conjunction that then plays a normal part in the subsequent execution of the sentence. Example:

```
   (<;.\_2 (0 : 0)) =: <;.\_2 (0 : 0)
Lorem ipsum dolor sit amet, consectetur
adipiscing elit, sed do eiusmod
)
name1
name2
)
   name1
Lorem ipsum dolor sit amet, consectetur
   name2
adipiscing elit, sed do eiusmod

```

Each occurrence of an invocation 0 : 0 causes the interpreter to read the body of a definition.

1.  The right-hand one is encountered first in the normal order of execution; it produces a literal noun containing LF characters. This noun replaces the invocation in the sentence, and execution continues.
2.  <;.\_2 _string_boxes each string, as delimited by the trailing LF character. The delimiters are removed.
3.  The left-hand 0 : 0 is executed, reading a list of names and creating a literal noun containing LF characters. This noun replaces the invocation in the sentence, and execution continues.
4.  The names are converted to a list of boxed strings.
5.  The names are assigned with the text calculated earlier (this assignment removes the boxing).
---
