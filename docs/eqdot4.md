# Vocabulary/eqdot4 - J Wiki

---

## \=. (Is (Local)) Noun/Other

[\>>](https://code.jsoftware.com/wiki/Vocabulary/eqco "Vocabulary/eqco") [<<](https://code.jsoftware.com/wiki/Vocabulary/eq "Vocabulary/eq")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d001.htm "jdic:d001")

**Is (Local)** \=. performs **_private assignment_**. A name that is privately assigned is visible only to the explicitly-defined entity that defined the name.

\=. used outside of an explicit definition has the same effect as \=: .

```
   'fe fi\_\_ fo fum'=. i.4  NB. Outside explicit definition: names are public
   fe ; fi ; fo ; fum
+-+-+-+-+
|0|1|2|3|
+-+-+-+-+
   foo=: verb define
fe=. 90          NB. private, holds true only while foo runs
fi\_\_=. 91        NB. locative, overwrites in locale
fo=: fe+fi       NB. public; =: overwrites the original value of fo
fum=. 1&+        NB. holds true only while foo runs (fum is now a verb)
fum y            NB. Execute fum; its result is the result of foo
)
   foo 999
1000
NB. Only fi\_\_ and fo have changed (as result of running: foo)...
   fe ; fi ; fo ; fum
+-+--+---+-+
|0|91|181|3|
+-+--+---+-+

```

**Note** that the load verb, which loads scripts, is explicitly defined, so any privately-assigned names in a script will disappear when the script has finished loading.

WARNING: _value_ here can be other than a **noun** value. Thus a verb defined in a script using \=. instead of \=: will disappear once the script has finished loading.

## Detailed Description

When an explicitly-defined entity starts running, a **_private namespace_** is created for it. Assignments to simple names using \=. define names in the youngest private namespace. Names in the youngest private namespace hide other variables of the same name.

Only the youngest private namespace is active. Older ones are ignored until all younger have been destroyed. When an explicit definition exits, its private namespace is destroyed along with all its names, and the youngest surviving namespace is activated.

Private assignment is not used for locatives, which are always public in their locale. When there is no private namespace (i. e. when no explicitly-defined entity is running), \=. performs public assignment, just like \=:.

\=. supports [simple assignment](https://code.jsoftware.com/wiki/Vocabulary/eqco#SimpleAssignment "Vocabulary/eqco"), [indirect assignment](https://code.jsoftware.com/wiki/Vocabulary/eqco#IndirectAssignment "Vocabulary/eqco"), [multiple assignment](https://code.jsoftware.com/wiki/Vocabulary/eqco#MultipleAssignment "Vocabulary/eqco"), and [AR assignment](https://code.jsoftware.com/wiki/Vocabulary/eqco#ARAssignment "Vocabulary/eqco") just as \=: does.

## Common uses

Used where other languages would employ a local variable.

### See Also

-   [Is (Global)](https://code.jsoftware.com/wiki/Vocabulary/eqco "Vocabulary/eqco")
-   [Entry in the J Dictionary](https://www.jsoftware.com/help/dictionary/d001.htm "jdic:d001") for \=.
---
