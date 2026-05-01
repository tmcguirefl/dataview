# Vocabulary/throwdot - J Wiki

From J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/trydot "Vocabulary/trydot") [<<](https://code.jsoftware.com/wiki/Vocabulary/selectdot "Vocabulary/selectdot")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/ctrl.htm "jdic:ctrl")

<table class="wikitable"><tbody><tr><td><tt>throw.</tt></td><td>Execute throw</td><td>Control</td></tr></tbody></table>

Valid only inside an [explicit definition](https://code.jsoftware.com/wiki/Vocabulary/Glossary#ExplicitDefinition "Vocabulary/Glossary").

---

Causes execution to resume after [catcht.](https://code.jsoftware.com/wiki/Vocabulary/trydot "Vocabulary/trydot") in a higher-level function.

throw. terminates the current explicit definition with an uncaught throw. error. Execution resumes in the caller:

1.  If the caller is executing in a [try.](https://code.jsoftware.com/wiki/Vocabulary/trydot "Vocabulary/trydot") control that has a [catcht.](https://code.jsoftware.com/wiki/Vocabulary/trydot "Vocabulary/trydot"), the error is cleared and execution continues at the line following the catcht.
2.  Otherwise, the caller terminates with the uncaught throw. error, and execution continues in _its_ caller, continuing the search for an active catcht. . Calling functions are terminated one by one until catcht. is encountered.

If no calling function contains an active catcht., J returns to immediate mode with the uncaught throw. error.

throw. may be thought of as a special type of error that is not intercepted by [catch.](https://code.jsoftware.com/wiki/Vocabulary/trydot "Vocabulary/trydot") or [u :: v](https://code.jsoftware.com/wiki/Vocabulary/coco "Vocabulary/coco").

---

### Common Uses

1\. Return a noun from sub without signalling an error and execute a given [B-block](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Bblock "Vocabulary/Glossary") in its caller: main

```
main=: 3 : 0   NB. calls: sub
 try.
  sub y
 catcht.
  select. type\_jthrow\_
   case. 'aaaa' do. 'throw aaaa'
   case. 'bbb'  do. 'throw bbb'
   case. 'cc'   do. 'throw cc'
   case.        do. throw.   NB. handled by a higher-level catcht. (if any)
  end.
 end.
)

sub=: 3 : 0
 if. y<0 do. type\_jthrow\_=: 'aaaa' throw. end.
 if. y<4 do. type\_jthrow\_=: 'bbb'  throw. end.
 if. y<8 do. type\_jthrow\_=: 'cc'   throw. end.
 (":y),' not thrown'
)

   main \_4
throw aaaa
   main 1
throw bbb
   main 5
throw cc
   main 88
88 not thrown

```

NOTE: throw. can communicate information back to its target catcht.. via a global name in a given locale, e.g. type\_jthrow\_ above.
