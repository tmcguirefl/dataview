# Vocabulary/eqdot - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/eqco "Vocabulary/eqco") [<<](https://code.jsoftware.com/wiki/Vocabulary/eq "Vocabulary/eq")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d001.htm "jdic:d001")

<table class="wikitable"><tbody><tr><td><tt>=.</tt></td><td>Is (Local)</td><td>Other</td></tr></tbody></table>

---

Attaches a [value](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary") to a [name](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Name "Vocabulary/Glossary") to yield a [definition](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Definition "Vocabulary/Glossary").

This is called [private assignment](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Private "Vocabulary/Glossary").

```
   myname =. 99     NB. defines: myname to be a noun: 99

   myname
99
   myname + 1
100

```

Unlike [Is (Global)](https://code.jsoftware.com/wiki/Vocabulary/eqco "Vocabulary/eqco") (\=:), the definition goes away when the "process" executing the [assignment](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Assignment "Vocabulary/Glossary") terminates. If the name has already been defined before the "process" starts, then the previous value is reinstated.

This is called [private assignment](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Private "Vocabulary/Glossary").

"Process" here means either executing an [explicitly defined](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Explicit "Vocabulary/Glossary") verb, or loading a J [script](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Script "Vocabulary/Glossary").

Apart from that, everything said concerning [Is (Global)](https://code.jsoftware.com/wiki/Vocabulary/eqco "Vocabulary/eqco") (\=:) applies to (\=.) also.

In particular, if an assignment using (\=.) is executed within the J session window, then (\=.) behaves exactly like (\=:).

---

### Common uses

1\. Create [nouns](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Noun "Vocabulary/Glossary"), [adverbs](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Adverb "Vocabulary/Glossary"), [conjunctions](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Conjunction "Vocabulary/Glossary") and [verbs](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Verb "Vocabulary/Glossary") that persist only while the verb (/script) that assigns them is running (/loading), masking any prior definition of the same name.

2\. Use \=. where other languages employ a _local(ized) variable_.

---

### More Information

See [Private and Public Assignment](https://code.jsoftware.com/wiki/Vocabulary/Assignment "Vocabulary/Assignment")

> [![](https://code.jsoftware.com/mediawiki/images/f/ff/Important.png)](https://code.jsoftware.com/wiki/File:Important.png) Find time to study [Private and Public Assignment](https://code.jsoftware.com/wiki/Vocabulary/Assignment "Vocabulary/Assignment") carefully,
> 
>   
> since it describes and explains all uses of \=. and \=:

---

CategoryVoc CategoryVocAssign CategoryVocValue CategoryVocVariable
