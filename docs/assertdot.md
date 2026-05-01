# Vocabulary/assertdot - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/breakdot "Vocabulary/breakdot") [<<](https://code.jsoftware.com/wiki/Vocabulary/zeroco "Vocabulary/zeroco")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/ctrl.htm "jdic:ctrl")

<table class="wikitable"><tbody><tr><td><tt>assert.</tt></td><td>Assertion</td><td>Control</td></tr></tbody></table>

Valid only inside an [explicit definition](https://code.jsoftware.com/wiki/Vocabulary/Glossary#ExplicitDefinition "Vocabulary/Glossary").

---

Signals [assertion failure](https://code.jsoftware.com/wiki/Vocabulary/ErrorMessages#assert "Vocabulary/ErrorMessages") if followed by a noun which is neither Boolean (1) nor an array: (1 1 1 …) of all 1's.

Behaves as a no-op if followed by a noun which is either Boolean (1) or an array: (1 1 1 …) of all 1's.

---

### Common Uses

1\. Check that the argument y is Boolean, else signal an error

```
   assert. y e. 0 1

```

2\. Write a test-script for an addon.

```
NB. Test script for selected J phrases.
NB. The assertions must appear inside an explicit definition
NB. in this case an anonymous one.

3 : 0''
  assert. (3j5)      -:  3 j. 5
  assert. (3j5 3j6)  -:  3 j. 5 6
  assert. (3j5 4j5)  -:  3 4 j. 5
  assert. 1 -: 2
  assert. (3j5 4j6)  -:  3 4 j. 5 6
)

```

The script will stop loading with an [assertion failure](https://code.jsoftware.com/wiki/Vocabulary/ErrorMessages#assert "Vocabulary/ErrorMessages") at the first line for which the **assertion** (Boolean test-phrase) is not obeyed.

```
   load '~temp/122.ijs'
|assertion failure: script
|   1    -:2

```
---

### Details

Note that assert. is followed by a single sentence and is not paired with end. .

### More Information

Use the [Foreign](https://code.jsoftware.com/wiki/Vocabulary/Foreigns "Vocabulary/Foreigns") (9!:35) to disable _all_ assert.\-statements. Once disabled, the noun phrase following assert. is never evaluated.

Use the [Foreign](https://code.jsoftware.com/wiki/Vocabulary/Foreigns "Vocabulary/Foreigns") (9!:34) to discover if assert. is enabled.

```
  trial=: 4 : 0
echo x ; 'trial: ON?' ; ((9!:34)'') ; ' y=' ; y
assert. y
)
   (9!:35) 0    NB. switch asserts OFF
   0 trial 1
┌─┬──────────┬─┬───┬─┐
│0│trial: ON?│0│ y=│1│
└─┴──────────┴─┴───┴─┘
   1 trial 0
┌─┬──────────┬─┬───┬─┐
│1│trial: ON?│0│ y=│0│
└─┴──────────┴─┴───┴─┘

   (9!:35) 1    NB. switch asserts back ON
   2 trial 1
┌─┬──────────┬─┬───┬─┐
│2│trial: ON?│1│ y=│1│
└─┴──────────┴─┴───┴─┘
   3 trial 0
┌─┬──────────┬─┬───┬─┐
│3│trial: ON?│1│ y=│0│
└─┴──────────┴─┴───┴─┘
|assertion failure: trial
|   y

```
