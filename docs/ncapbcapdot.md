# Vocabulary/ncapbcapdot - J Wiki

From J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/odot "Vocabulary/odot") [<<](https://code.jsoftware.com/wiki/Vocabulary/mcapdot "Vocabulary/mcapdot")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/dnb.htm "jdic:dnb")

<table class="wikitable"><tbody><tr><td><tt>NB.</tt></td><td>Comment</td><td>Noun/Other</td></tr></tbody></table>

---

Used to insert a comment in J code, either in the J [session](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Session "Vocabulary/Glossary") or in a script.

Everything from NB. to the end-of-line (LF) will be ignored by the interpreter.

```
foo=: verb define     NB. you can put a comment here to describe the verb.
NB. A comment can have a line to itself,
NB.
NB. -or it can stand in for a blank line

NB. -but actual blank lines are allowed too
echo 'y=' ; y     NB. you can have a trailing comment,
NB. -but not a leading comment, except to dummy out the line:
NB. echo 'y=' ; y
NB.You can often crush the comment right up to the period
NB. ...but it doesn't like to be followed directly by a period or a colon
NB. -so it's best to follow NB. by a space.
)
NB. but don't append a comment to the final ')' or else: syntax error

```
---

### Common uses

Insert narrative in application code, or dummy-out unwanted [lines](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Line "Vocabulary/Glossary") which you don't yet want to delete altogether

If you have to comment out an entire definition in a script, consider using [Explicit Definition](https://code.jsoftware.com/wiki/Vocabulary/com#commentoutcode "Vocabulary/com") (0 : 0) or (noun define) or (0 define)

```
0 : 0
unwantedverb =: dyad define
NB. The above 0 : 0 turns everything into an anonymous noun
NB. down to the closing right parenthesis
NB. including the "dyad define" line.
NB. But without altering the text of the original definition.
NB. It will be a "no-operation" when the script is loaded.
z =. x + y
z return.
)

```
---
