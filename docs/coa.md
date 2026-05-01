# Vocabulary/coa - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/cou "Vocabulary/cou") [<<](https://code.jsoftware.com/wiki/Vocabulary/com "Vocabulary/com")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d310n.htm "jdic:d310n")

<table class="wikitable"><tbody><tr><td><tt>3&nbsp;: n</tt></td><td><tt>4&nbsp;: n</tt></td><td>Explicit Verb Definition</td><td>Conjunction</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank "Vocabulary/RankInfo") _\-- operates on x and y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Defines an [explicit](https://code.jsoftware.com/wiki/Vocabulary/Glossary#ExplicitEntity "Vocabulary/Glossary") [verb](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Verb "Vocabulary/Glossary").

> [![](https://code.jsoftware.com/mediawiki/images/5/54/Information.png)](https://code.jsoftware.com/wiki/File:Information.png) [Conjunction](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Conjunction "Vocabulary/Glossary") **Def** (:) has several different uses, requiring several pages to document it
> 
> -   [Vocabulary/cor](https://code.jsoftware.com/wiki/Vocabulary/cor "Vocabulary/cor") – A _swatch_ (roadmap) of the different usages of (:) you'll encounter
> -   [Vocabulary/com](https://code.jsoftware.com/wiki/Vocabulary/com "Vocabulary/com") – the complete formal details of [Explicit Definition](https://code.jsoftware.com/wiki/Vocabulary/Glossary#ExplicitDefinition "Vocabulary/Glossary")
> -   Vocabulary/coa **\[THIS PAGE\]** – anatomy of a sample [explicit definition](https://code.jsoftware.com/wiki/Vocabulary/Glossary#ExplicitDefinition "Vocabulary/Glossary")
> -   [Vocabulary/cou](https://code.jsoftware.com/wiki/Vocabulary/cou "Vocabulary/cou") – how to use (:) to combine monad and dyad valences from separate definitions
> -   [Vocabulary/NounExplicitDefinition](https://code.jsoftware.com/wiki/Vocabulary/NounExplicitDefinition "Vocabulary/NounExplicitDefinition") – defining a noun as an explicit entity.

The word: define is a synonym for  : 0  
  Thus the word: define hides an occurrence of  m : n

-   Operand m tells what type of verb it is  -   one of the special values 3 or 4, or their synonyms: verb (=3), monad (=3), or dyad (=4).
    
-   Operand n specifies the J code which J uses to define the verb.  -   If n is a character string — it must be valid J code and will become the body of a (one-line) verb.
      -   If n is the special value 0 — this signals to J that a **multiline body** starts with the line immediately below the  m : n line.    -   and ends with the line consisting of a single: )

It follows that the phrase:

-    verb define is equivalent to  3 : 0
-    monad define is equivalent to  3 : 0 also
-    dyad define is equivalent to  4 : 0

These forms are what you usually see in the code of expert J-ers.

When J executes the phrase:  m : n — it creates the verb then-and-there.

-   The verb thus created is anonymous, i.e. it is simply a value.
-   But typically this (verb) value is straightaway assigned to a name, e.g. covar (as in the worked example below).

<table class="wikitable"><tbody><tr><td><b><tt>m</tt></b></td><td><b>Type of verb</b></td><td></td><td><b><tt>n</tt></b></td><td><b>Type of body</b></td></tr><tr><td><tt>3</tt></td><td>monad, or dual-valence</td><td></td><td>string</td><td>one-liner</td></tr><tr><td><tt>4</tt></td><td>dyad only</td><td></td><td><tt>0</tt></td><td>multiline body follows immediately</td></tr></tbody></table>

---

#### Example:

The following table is the anatomy of a sample explicit verb named: covar

<table class="wikitable"><tbody><tr><td><b>Notes</b></td><td><b>Code</b></td></tr><tr><td>0</td><td><tt>NB. Calculate covariance of two lists</tt><p><tt>NB. x and y are the lists</tt><br><tt>NB. If x is omitted, y is used, giving variance of y</tt><br><tt>NB. Calculates mean of each first, then finds average of the product of deviations</tt><br><tt>NB. Result is covariance (atom)</tt></p></td></tr><tr><td>2, 1</td><td><tt>covar =: verb define</tt></td></tr><tr><td>3</td><td><tt>NB. monad: take covariance of y with itself</tt></td></tr><tr><td>11</td><td><tt>qprintf 'y '</tt></td></tr><tr><td>4, 12</td><td><tt>y covar y</tt></td></tr><tr><td>5</td><td><tt>:</tt></td></tr><tr><td>6, 7, 4</td><td><tt>if. 0 = #y do.</tt></td></tr><tr><td></td><td><tt>&nbsp;&nbsp;smoutput 'empty covariance'</tt></td></tr><tr><td>12, 7</td><td><tt>&nbsp;&nbsp;0 return.</tt></td></tr><tr><td>7</td><td><tt>end.</tt></td></tr><tr><td>9, 8</td><td><tt>sumx =. +/ x</tt></td></tr><tr><td>9, 8</td><td><tt>meanx =. sumx&nbsp;% (#x)</tt></td></tr><tr><td>9, 4</td><td><tt>meany =. (+/ y)&nbsp;% #y</tt></td></tr><tr><td>10</td><td><tt>DMEANY =: meany NB. debug</tt></td></tr><tr><td>11</td><td><tt>qprintf 'meanx meany ' NB. debug</tt></td></tr><tr><td>12</td><td><tt>(+/ (x-meanx)*(y-meany))&nbsp;% #x</tt></td></tr><tr><td>13</td><td><tt>)</tt></td></tr></tbody></table>

{i} Download a J script of the definition of covar: [File:Covar.ijs](https://code.jsoftware.com/wiki/File:Covar.ijs "File:Covar.ijs")

#### Notes:

0\. The verb definition itself is preceded by a prologue describing the arguments it needs, and the result it computes.

-   This is a convention among J-ers and is not essential for this example to work.

1\. The phrase  verb define starts the definition of the verb. (This line is loosely called the _header_)

-   define (or its equivalent:  :0 ) says that the body of the verb consists of all lines below this one, down to the line consisting of the single word:
```
)

```

2\. The verb created by  verb define is assigned to the name covar

-   The assignment uses \=: which makes it public, i.e. the name covar will be available for use outside the script it was defined in.  -   Use \=. instead of \=: to define a verb that goes away once it has served its purpose within the script, i.e. while the script is actually loading.
      -   **WARNING:** Be careful not to use \=. by mistake within a script when you mean \=: (...or you might spend hours trying to find out where your verb has gone!)

3\. The first section of the body defines the _monadic valence_ of the verb.

-   Execution of covar monadically starts with the first line of this section.

4\. When you run covar (either monadically or dyadically), the value of the right-hand argument to covar gets privately assigned to the name y.

-   You can re-assign y privately, but the new value does not leak outside the verb, i.e. it stays confined inside the verb's namespace, and disappears along with the namespace when the verb terminates.

5\. The _valence separator_ is the line containing the single word:

```
:

```
-   It is meant to resemble the conjunction: [Monad-Dyad](https://code.jsoftware.com/wiki/Vocabulary/cou "Vocabulary/cou") (:) — (although inside a verb definition body it doesn't actually run this primitive.)
-   The lines above the _valence separator_ are the _monadic section_ of the body
-   The lines below the _valence separator_ are the _dyadic section_ of the body.

6\. Execution of covar dyadically starts with the first line of the dyadic section.

7\. [Control structures](https://www.jsoftware.com/help/dictionary/ctrl.htm "jdic:ctrl") such as if./do./else./end. and do./while./end. can change the order in which sentences are executed, or (as here) whether they're executed at all.

8\. When you run covar dyadically, the value of the left-hand argument to the verb gets privately assigned to the name x.

-   What Note 4 (above) says about y applies to x too.

9\. Any name assigned using \=. is a private assignment.

-   A name so defined is not visible outside the body of the explicit verb — it stays confined inside the verb's namespace, which disappears when the verb terminates.

10\. Assignment using \=: is public and the name is visible from inside any other verb (in the same locale).

-   This feature is typically used when debugging, where it can be very handy. For example, try putting this sentence inside the body:  y\_z\_ =: y
-   But it is poor practise to design your code to rely on \=: , since it leads to verbs "feeling inside each others' guts", whether or not you mean them to.  -   The main purpose of private assignment is to prevent this kind of abuse happening by accident, because [it's known to farm some excessively time-wasting bugs.](https://www.amazon.com/Psychology-Computer-Programming-Weinberg-Hardcover/dp/B00IGYXW66/ref=sr_1_3)
    
-   A user's trick: the extra spaces before the \=: indicate that this is a debugging assignment. Subsequent search for \=: preceded by two spaces will find all debugging assignments.

11\. qprintf is another useful debugging tool. It is part of the printf addon.  
   To make sure it's available, you need to have executed:

```
require 'format/printf'

```

12\. The result of the last line executed by the verb becomes the result returned by the verb.

-   This result doesn't need to be assigned to a name. It just "drops out the bottom".  -   This happens whether you want it to or not.    -   Some verbs aren't designed to return a useful result.
              -   In practice that rarely does any harm. That is, unless the last value you assign is not a noun but a verb (whereupon J puzzlingly signals  syntax error ).
              -   But if you really don't want to see the result that drops out (e.g. it's not a noun), try having  empty'' or  i.0 0 as the last line of your definition.
    
-   A good safety end-stop, and a clear indication that the verb is not meant to return a result for anyone to use.
-   **NOTE:** the last line executed is not always the last line of the body.  -   Use the [control word](https://www.jsoftware.com/help/dictionary/ctrl.htm "jdic:ctrl") return. to return precisely the value you want to be the verb's result.

13\. A line containing the single word: ) is the _body delimiter_.

-   The body consists of all the lines above it, up to the  m : n line (loosely called the _header_).
-   The body **does not** include the _body delimiter_. Nor does it include the _header_ either.
---

#### Sample execution:

```
   covar 1 2 3 4 5
y=1 2 3 4 5
meanx=3 meany=3
2
   DMEANY          NB. This name has been assigned using (=:) - so it's still there.
3
   sumx            NB. This name has been assigned using (=.) - so it disappears when covar stops running.
|value error: sumx

```

Running the verb monadically (i.e. with a y\-argument but no x\-argument) starts in the _monadic valence_ section. This prints y and then calls the _dyadic valence_ section.

The _dyadic valence_ section prints meanx and meany . Then it terminates with the result 2.

The "debug" noun DMEANY persists after the verb has terminated, but all the names (e.g. sumx) assigned by private assignment disappear again

or, if they existed before, they revert to their former values

```
   5 4 3 2 1 covar 1 2 3 4 5
meanx=3 meany=3
\_2

```

Running the verb **dyadically** (i.e. with both an x\-argument and a y\-argument) starts in the _dyadic valence_ section.

---

### Details

-   covar =: verb define  -   If there's no valence separator (:) in the body, only the _monadic valence_ gets defined.
      -   If you then call covar with an x\-argument, J will signal  domain error
    
-   covar =: monad define  -   The same thing happens (because both monad and verb are synonyms for the number 3)
    
-   mydyad =: dyad define  -   Only the _dyadic valence_ gets defined.
      -   If you then call mydyad monadically, i.e. **without** an x\-argument, J will signal  domain error .
---
