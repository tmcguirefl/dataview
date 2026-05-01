# Vocabulary/trydot - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/whiledot "Vocabulary/whiledot") [<<](https://code.jsoftware.com/wiki/Vocabulary/throwdot "Vocabulary/throwdot")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/ctrl.htm "jdic:ctrl")

<table class="wikitable"><tbody><tr><td><tt>try.</tt><br><tt>catch.</tt><br><tt>catchd.</tt><br><tt>catcht.</tt></td><td>Execute with error path<br>Error path<br>Error path only if not debugging<br>Catch <tt>throw.</tt> from called function</td><td>Control</td></tr></tbody></table>

Valid only inside an [explicit definition](https://code.jsoftware.com/wiki/Vocabulary/Glossary#ExplicitDefinition "Vocabulary/Glossary").

---

You put sentences into a try. structure when you want to recover if they fail. If there is an error in the block following try., the try. is aborted and control passes to the catch. . catcht. is a special case that picks up the special error case created by a throw. control word. As with other control structures, end. terminates the try. structure.

try. **temporarily turns off debug mode** and then executes the _**try. block**_, which is the sentences following the try. up to the first catch./catcht./catchd.. If the try. block completes without error, execution continues after the end.. If an error is encountered, control passes to one of the catch blocks:

1\. If the error is uncaught throw., in other words if [throw.](https://code.jsoftware.com/wiki/Vocabulary/throwdot "Vocabulary/throwdot") was executed in a function called by try. and has not already been intercepted, then:

-   if there is a catcht. block in the current try.structure, the error is reset and execution continues with the first sentence of the catcht. block;
-   otherwise, the current definition is terminated with the uncaught throw. error

2\. For other errors, the error is reset and execution continues with the first sentence of the catch. block.  

When control passes out of the try. block, whether because of error or from encountering a catch./catchd./catcht. control word, **debug mode is restored** to its setting before the try..

In the rare case where you need to debug the code in your try. block, include the catchd. control word somewhere in the structure. Its presence causes try. not to clear debug mode so that errors in your try. block will enter the debugger. If there is no catch., catchd. also functions as a catch. to start the error handler.

## Normal Uses

Two use cases are envisioned:

1\. To wrap an application with an error handler that catches errors for logging or presenting to the user, write

```
try.
 ''call the application''
catchd.
 emsg=.13!:12''  NB. save the error message for the error
 eno =. 13!:11''  NB. also the error number
end.

```

Because you used catchd., you can turn on debugging to trap on the error.

2\. If execution errors are part of normal operation, write

```
line =. ''read a command from the user''
try.
 cmdresult =. ". line  NB. Execute the user's line - it may fail
catch.
 cmdresult =. ''default result if there was an error''
end.

```

Because you used catch., debugging will be turned off before the user's line is executed, even if you are debugging the rest of your application.

---

[Assign Adverse](https://code.jsoftware.com/wiki/Vocabulary/coco "Vocabulary/coco") (\[x\] u :: v y)
