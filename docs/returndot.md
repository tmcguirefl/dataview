# Vocabulary/returndot - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/selectdot "Vocabulary/selectdot") [<<](https://code.jsoftware.com/wiki/Vocabulary/ifdot "Vocabulary/ifdot")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/ctrl.htm "jdic:ctrl")

<table class="wikitable"><tbody><tr><td><tt>return.</tt></td><td>Exit with result</td><td>Control</td></tr></tbody></table>

Valid only inside an [explicit definition](https://code.jsoftware.com/wiki/Vocabulary/Glossary#ExplicitDefinition "Vocabulary/Glossary").

---

Terminates the verb without executing any further code

```
  return.         NB. returns the last noun calculated so far.

  y + 1 return.   NB. place the value to be returned BEFORE this control word, not AFTER.

```
---

### Common Uses

1\. Optionally exit a verb definition before the last [sentence](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Sentence "Vocabulary/Glossary") and return a noun value

```
return\_trial=: 3 : 0
if. y do.
  'y is true' return.
else.
  'y is false'
end.
'...exits'
)

   return\_trial 1
y is true

   return\_trial 0
...exits

```
