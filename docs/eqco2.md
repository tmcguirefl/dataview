# Vocabulary/eqco2 - J Wiki

---

## \=: (Is (Global)) Noun/Other

[\>>](https://code.jsoftware.com/wiki/Vocabulary/lt "Vocabulary/lt") [<<](https://code.jsoftware.com/wiki/Vocabulary/eqdot "Vocabulary/eqdot")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d001.htm "jdic:d001")  
**_J terms used below:_** [Name](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Name "Vocabulary/Glossary") ; [Value](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary") ; [Assignment](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Assignment "Vocabulary/Glossary") ; [Public](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Public "Vocabulary/Glossary") ; [Private](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Private "Vocabulary/Glossary") ; [Namespace](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Namespace "Vocabulary/Glossary") ; [Define](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Define "Vocabulary/Glossary") ; [Global](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Global "Vocabulary/Glossary") ; [MultipleAssignment](https://code.jsoftware.com/wiki/Vocabulary/Glossary#MultipleAssignment "Vocabulary/Glossary") ; [SimpleAssignment](https://code.jsoftware.com/wiki/Vocabulary/Glossary#SimpleAssignment "Vocabulary/Glossary") ; [ARAssignment](https://code.jsoftware.com/wiki/Vocabulary/Glossary#ARAssignment "Vocabulary/Glossary") ; [IndirectAssignment](https://code.jsoftware.com/wiki/Vocabulary/Glossary#IndirectAssignment "Vocabulary/Glossary")

\=: performs **_public assignment_**. A name assigned by \=: will be accessible from other verbs. This contrasts with \=. which assigns to names that are visible only in the verb where they are defined.

**Note** that the value assigned need not be a noun. In the example below, the execution of 3 : 0 produces a verb, which is then assigned to the name verb1. verb1 is then used as a verb.

```
   verb1 =: 3 : 0   NB. Create a verb and assign it to a name.  The body of the verb follows:
priv =. y + 1   NB. private assignment
pub =: y    NB. public assignment
priv   NB. priv is defined inside the verb.  Here it provides the result of the verb
)
   verb1 3   NB. Execute the verb, giving result of 4
4
   pub   NB. The public name is still visible...
3
   priv   NB. ...but the private one is not
|value error: priv

```

## Detailed Description

**_Assignment_** **_defines_** a name, giving it a **_value_**. When the name appears in subsequent sentences, the assigned value will be recovered.

**For new users:** J has a hierarchy of namespaces that are searched to find the definition of a name. An executing explicitly-defined entity has a _private namespace_ all to itself; beyond that are other namespaces called _locales_. Normal name lookup searches the private namespace first followed by some of the locales, but you can look in a locale directly by using a _locative_ such as

name\_loc\_

which will look in locale

loc

.

You can remain blissfully unaware of all this. If you don't use locatives, all your public assignments and name searches will be in the default locale, and you can focus on the distinction between public and private namespaces.

### Simple Assignment

**_Simple assignment_** takes the form _name_ =: _value_. The _value_ may be any of the main parts of speech (noun, verb, adverb, or conjunction). After the assignment, the _name_ takes the part of speech and value of the assigned _value_.

Any previous definition of the _name_ is superseded by the new _value_.

In public assignment (as performed by \=:), the name is always defined in a locale: in the specified locale if the name is a locative, or in the current locale otherwise. This differs from private assignment (\=.) which may define a name in a private namespace.

Public assignment to a non-locative is not allowed if that name is defined in the active private namespace (because it is almost certainly an error: the name so defined could never be referenced, since it would be hidden by the private name).

Names assigned by public assignment are **_public_** in that they can be referenced by a locative from anywhere. If the name's locale is in the search path of the current locale, the name can be referenced without a locative, by using the simple name. Names defined in the z locale are in the search path of all locales, and are therefore **_global_**: they can be referred to using the simple name from anywhere.

```
   n =: 5   NB. assigning a noun
   n
5
   v =: -   NB. assigning a verb
   v
-
   v n     NB. use the names
\_5
   name\_loc\_ =: 2 3 4  NB. assigns in locale loc

```

### Multiple Assignment

**_Multiple assignment_** takes the form '_string_' =: _value_.

The _string_ is broken into words, each of which must be a valid name. The names may be a mixture of locatives and non-locatives. Each item of the _value_ is assigned to the corresponding name, with one level of boxing removed.

The number of items of _value_ must equal the number of names, unless _value_ is an atom, in which case it is replicated to match the number of names.

```
   3 ; 4  NB. a noun
+-+-+
|3|4|
+-+-+
   'a b' =: 3 ; 4
   a   NB. Note boxing removed
3
   b
4

```

### AR Assignment

**_AR assignment_** is a variant of multiple assignment, activated when the first character of _string_ is the back-quote \` . The items of _value_ must be atomic representations (ARs), and each AR is converted to a value before being assigned to the corresponding name.

AR assignment requires that there be more than one name (implementation restriction).

AR assignment is most often used to assign multiple names with verb values:

```
   +\`-\`\*\`%  NB. 4 ARs
+-+-+-+-+
|+|-|\*|%|
+-+-+-+-+
   '\`plus minus times divide' =:  +\`-\`\*\`%  NB. Assign 4 verb-names
   plus
+
   divide
%
   9 divide 2 plus 1
3

```

### Indirect Assignment

**_Indirect assignment_** takes the form (_nameexpr_) =: _value_. The _nameexpr_, when evaluated, must produce either a list of boxed names or a string suitable as the string in multiple or AR assignment. The items of _value_ are assigned to the names as in multiple assignment.

```
   'a' , each '123'   NB. An expression creating three names
+--+--+--+
|a1|a2|a3|
+--+--+--+
   ('a' , each '123') =: 100 101 102  NB. Assignment to the names
   a1
100
   a2
101
   a3
102

```

## Common uses

Used to create nouns, adverbs, conjunctions and verbs, the building-blocks of an application.

### See Also

-   [Is (Local)](https://code.jsoftware.com/wiki/Vocabulary/eqdot "Vocabulary/eqdot")
-   [Entry in the J Dictionary](https://www.jsoftware.com/help/dictionary/d001.htm "jdic:d001") for \=:
---

EXPERIMENT TO DISPLAY GLOSSARY TERMS BELOW THE RANK/NAVIGATION BAR -- [Ian Clark](https://code.jsoftware.com/wiki/User:Ian_Clark "User:Ian Clark") <<DateTime(2014-02-26T09:33:48Z)>>

---
