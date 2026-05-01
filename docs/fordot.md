# Vocabulary/fordot - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/gotodot "Vocabulary/gotodot") [<<](https://code.jsoftware.com/wiki/Vocabulary/elsedot "Vocabulary/elsedot")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/ctrl.htm "jdic:ctrl")

<table class="wikitable"><tbody><tr><td><tt>for.</tt> <i>noun</i> <tt>do.</tt> <i>body</i> <tt>end.</tt></td><td>Repeat for each item</td><td>Control</td></tr></tbody></table>

<table class="wikitable"><tbody><tr><td><tt>for_ijk.</tt> <i>noun</i> <tt>do.</tt> <i>body</i> <tt>end.</tt></td><td>Repeat for each item, named</td><td>Control</td></tr></tbody></table>

Valid only inside an [explicit definition](https://code.jsoftware.com/wiki/Vocabulary/Glossary#ExplicitDefinition "Vocabulary/Glossary").

---

Execute the ensuing [block](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Block "Vocabulary/Glossary"), or body, which starts after the next do., once for each item of the noun, which results from initial evaluation of a [T-block](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Tblock "Vocabulary/Glossary").

```
   for. i. nloops do.  NB. loop nloops times
<loop body>
   end.

   for\_i. 'for';'each';'word' do.  NB. loop 3 times, with i successively assuming the value of the words
<loop body>
   end.

```

Use (for\_ijk.) instead of (for.) to give a name referencing the successive items. At each iteration…

-   (ijk) takes the value of the current item, and
-   (ijk\_index) takes the values: (0, 1, 2, …) in turn.

(ijk) (here) is a representative [pronoun](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Pronoun "Vocabulary/Glossary") whose value you can inspect (read-only) at each iteration. Substitute your own choice of name, e.g. (i), which will also generate (i\_index).

If you use for. with no name, the loop will be executed once for each item of the [T-block](https://code.jsoftware.com/wiki/Vocabulary/TBlock "Vocabulary/TBlock"), and the actual values in the T-block noun are immaterial.

---

### Common uses

1\. Execute a given [block](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Block "Vocabulary/Glossary") 3 times

```
3 : 0''
for. i.3 do.
  echo 'alpha'
end.
)
alpha
alpha
alpha

```

When you use (for.) the statements within the [block](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Block "Vocabulary/Glossary") can't see the actual items of the [T-block](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Tblock "Vocabulary/Glossary").

2\. Execute a given [block](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Block "Vocabulary/Glossary") once for each item of a given noun, viz. (0.5 + i.3), inspecting its value in turn, also its index in the list:

```
3 : 0''
for\_ijk. 0.5 + i.3 do.
  echo 'bravo' ; ijk ; ijk\_index
end.
)
┌─────┬───┬─┐
│bravo│0.5│0│
└─────┴───┴─┘
┌─────┬───┬─┐
│bravo│1.5│1│
└─────┴───┴─┘
┌─────┬───┬─┐
│bravo│2.5│2│
└─────┴───┴─┘

```

### Details

1.  The result of the [T-block](https://code.jsoftware.com/wiki/Vocabulary/TBlock "Vocabulary/TBlock"), which gives the values to be repeated over, may be a noun of any rank. The loop is executed once for each item of the T-block.
2.  At the end of a for\_ijk. loop, the names ijk and ijk\_index remain locally defined.
-   If the loop was exited by break. or goto., the names simply retain their latest values.
-   If the loop was exited by executing all the iterations, ijk is set to an empty list and ijk\_index is set to the number of iterations that were executed.

[Power of Verb](https://code.jsoftware.com/wiki/Vocabulary/hatco "Vocabulary/hatco") (\[x\] u^:v y)

You may use these control words inside a for-loop:

-   [Terminate loop](https://code.jsoftware.com/wiki/Vocabulary/breakdot "Vocabulary/breakdot") (break.) …see this link for a code sample.
-   [Terminate Iteration](https://code.jsoftware.com/wiki/Vocabulary/continuedot "Vocabulary/continuedot") (continue.)
