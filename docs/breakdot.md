# Vocabulary/breakdot - J Wiki

From J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/continuedot "Vocabulary/continuedot") [<<](https://code.jsoftware.com/wiki/Vocabulary/assertdot "Vocabulary/assertdot")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/ctrl.htm "jdic:ctrl")

<table class="wikitable"><tbody><tr><td><tt>break.</tt></td><td>Terminate loop</td><td>Control</td></tr></tbody></table>

Valid only inside an [explicit definition](https://code.jsoftware.com/wiki/Vocabulary/Glossary#ExplicitDefinition "Vocabulary/Glossary").

---

Stops executing any further [sentences](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Sentence "Vocabulary/Glossary") in the current [block](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Block "Vocabulary/Glossary") during the current iteration, plus any further iterations.

Use within the [block](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Block "Vocabulary/Glossary") delimited by…

-   [for. ... end.](https://code.jsoftware.com/wiki/Vocabulary/fordot "Vocabulary/fordot")
-   [for\_ijk. ... end.](https://code.jsoftware.com/wiki/Vocabulary/fordot "Vocabulary/fordot")
-   [while. ... end.](https://code.jsoftware.com/wiki/Vocabulary/whiledot "Vocabulary/whiledot")
-   [whilst. ... end.](https://code.jsoftware.com/wiki/Vocabulary/whiledot "Vocabulary/whiledot")
---

### More Information

The difference between (break.) and (continue.)

-   (break.) prematurely terminates the whole loop
-   (continue.) prematurely terminates just the current iteration.
```
test\_break=: 3 : 0
for\_i. i.6 do.
  echo 'before ',":i
  if. i>:3 do. break. end.
  echo 'after ',":i
end.
)

test\_continue=: 3 : 0
for\_i. i.6 do.
  echo 'BEFORE ',":i
  if. i>:3 do. continue. end.
  echo 'AFTER ',":i
end.
)

   test\_break''
before 0
after 0
before 1
after 1
before 2
after 2
before 3
   test\_continue''
BEFORE 0
AFTER 0
BEFORE 1
AFTER 1
BEFORE 2
AFTER 2
BEFORE 3
BEFORE 4
BEFORE 5

```
---

[Terminate iteration](https://code.jsoftware.com/wiki/Vocabulary/continuedot "Vocabulary/continuedot") (continue.), [Terminate Fold](https://code.jsoftware.com/wiki/Vocabulary/zcapco "Vocabulary/zcapco") (x Z: y)
