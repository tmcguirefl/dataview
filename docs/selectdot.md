# Vocabulary/selectdot - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/throwdot "Vocabulary/throwdot") [<<](https://code.jsoftware.com/wiki/Vocabulary/returndot "Vocabulary/returndot")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/ctrl.htm "jdic:ctrl")

<table class="wikitable"><tbody><tr><td><tt>select.</tt> <i>selector</i><br><tt>case.</tt> <i>value</i> <tt>do.</tt><br><tt>fcase.</tt> <i>value</i> <tt>do.</tt></td><td>Evaluate selector<br>Execute if <i>value</i> matches <i>selector</i><br>Execute if <i>value</i> matches <i>selector</i>, then fall through to next <tt>[f]case.</tt></td><td>Control</td></tr></tbody></table>

Valid only inside an [explicit definition](https://code.jsoftware.com/wiki/Vocabulary/Glossary#ExplicitDefinition "Vocabulary/Glossary").

---

Execute one (or one sequence) of a list of [blocks](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Block "Vocabulary/Glossary") whose case.\-_value_ includes the value of the select.\-_selector_.

The block following the select. is evaluated. Then the blocks following each subsequent case. or fcase. are evaluated. When a case is found whose value [includes](#inclusion) the result of the select.\-block, the block following its do. is executed.

After a case.-block has been executed, control passes to a single end. statement corresponding to the select., **unless** the executing case is fcase.\--a _fallthrough case_. Execution of an fcase. is followed by unconditional execution of the next case.\-block, which may be another fcase.:

```
select\_trial=: 3 : 0
select. y
fcase. 'A' do.
case. 'a' do.
  echo 'select a'
fcase. 'B' do.
case. 'b' do.
  echo 'select b'
case. do.    NB. optional catch-all case
  echo 'none of these'
end.
)

   select\_trial 'a'
select a
   select\_trial 'A'
select a
   select\_trial 'b'
select b
   select\_trial 'B'
select b
   select\_trial 'C'
none of these
   select\_trial 99
none of these

```
---

## Details

1\. The select.\-block is terminated by the first case., not by a do..

2\. The block following each case. or fcase., except the last, is terminated by do., not end..

3\. If the case.\-_value_ is omitted, the case matches any _selector_.

4\. _value_ may be a list of boxed values; the case is executed if the _selector_ matches any of them. If the _selector_ or _value_ is unboxed, it is first boxed before being tested. Thus an _unboxed_ select. selection list would have to be matched by a case.\-_value_ list _item-by-item,_ in the same order, to cause execution of that case.

Formally, the test is selector e.&boxopen value where boxopen=:<^:(0&(>: L.)), as defined in the [Standard Library](https://code.jsoftware.com/wiki/Standard_Library/stdlib#boxopen "Standard Library/stdlib").

---

[Agenda](https://code.jsoftware.com/wiki/Vocabulary/atdot "Vocabulary/atdot") (\[x\] u@.v y)

---
