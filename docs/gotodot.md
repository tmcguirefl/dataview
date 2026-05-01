# Vocabulary/gotodot - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/ifdot "Vocabulary/ifdot") [<<](https://code.jsoftware.com/wiki/Vocabulary/fordot "Vocabulary/fordot")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/ctrl.htm "jdic:ctrl")

<table class="wikitable"><tbody><tr><td><tt>goto_lbl.</tt></td><td>Go to label</td><td>Control</td></tr></tbody></table>

<table class="wikitable"><tbody><tr><td><tt>label_lbl.</tt></td><td>(target label)</td><td>Control</td></tr></tbody></table>

Valid only inside an [explicit definition](https://code.jsoftware.com/wiki/Vocabulary/Glossary#ExplicitDefinition "Vocabulary/Glossary").

---

Make the labelled statement the next statement to be executed

```
f=: 3 : 0
  if. y do. goto\_true. else. goto\_false. end.
  label\_true.  'true'  return.
  label\_false. 'false' return.
)

   f 0
false

   f 1
true

```
