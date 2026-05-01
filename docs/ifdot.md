# Vocabulary/ifdot - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/returndot "Vocabulary/returndot") [<<](https://code.jsoftware.com/wiki/Vocabulary/gotodot "Vocabulary/gotodot")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/ctrl.htm "jdic:ctrl")

<table class="wikitable"><tbody><tr><td><tt>if.</tt> <i>condition</i> <tt>do.</tt> <i>block</i> <tt>end.</tt></td><td>Execute if</td><td>Control</td></tr></tbody></table>

Valid only inside an [explicit definition](https://code.jsoftware.com/wiki/Vocabulary/Glossary#ExplicitDefinition "Vocabulary/Glossary").

---

Conditionally execute one of a choice of [blocks](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Block "Vocabulary/Glossary").

```
T=. 0<#y
if. T do. B1 else. B0 end.

```

> [![](https://code.jsoftware.com/mediawiki/images/c/cb/Warning.png)](https://code.jsoftware.com/wiki/File:Warning.png) WARNING:
> 
> if. T do. …  
> only tests the first atom of the evaluated [T-block](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Tblock "Vocabulary/Glossary") T.  
> Thus
> 
> ```
>    if. 'chalk' = 'cheez' do. sneeze'' end.
> 
> ```
> 
> will test **true** because the first atom of the evaluated [T-block](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Tblock "Vocabulary/Glossary") is 1 even if some subsequent atoms are 0
> 
> ```
>    'chalk' = 'cheez'
> 1 1 0 0 0
> 
> ```

---

### Common Uses

1\. Execute the ensuing [block](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Block "Vocabulary/Glossary") provided the array evaluated by the [T-block](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Tblock "Vocabulary/Glossary") is empty or its first atom is nonzero.

```
if\_trial=: 3 : 0
if. y do.
  echo 'y is true'
end.
)

   if\_trial 0
   if\_trial 1
y is true
   if\_trial 1 1 1 1 1
y is true
   if\_trial 0 1 1 1 1  NB. see above: WARNING
   if\_trial 1 0 0 0 0  NB. see above: WARNING
y is true
   if\_trial ''  NB. empty is true
y is true
   if\_trial 5  NB. Any nonzero is true
y is true

   emptyif\_trial=: 3 : 0  NB. Empty T-block tests true
if. do.
  echo 'empty T is true'
end.
)
   emptyif\_trial 0
empty T is true

```

2\. Execute the first [block](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Block "Vocabulary/Glossary") provided y is true, else execute the second [block](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Block "Vocabulary/Glossary")

```
else\_trial=: 3 : 0
if. y do.
  echo 'y is true'
else.
  echo 'y is false'
end.
)

   else\_trial 0
y is false
   else\_trial 1
y is true

```

3\. Execute a succession of [blocks](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Block "Vocabulary/Glossary") according to the value of y

```
elseif\_trial=: 3 : 0
if. y=2 do.
  echo 'y = 2'
elseif. y=1 do.
  echo 'y = 1'
else.          NB. prior to J 9.01 use: elseif. do.
  echo 'y is neither'
end.
)

   elseif\_trial 2
y = 2
   elseif\_trial 1
y = 1
   elseif\_trial 0
y is neither

```
---

[Power of Verb](https://code.jsoftware.com/wiki/Vocabulary/hatco "Vocabulary/hatco") (\[x\] u^:n y), [Agenda](https://code.jsoftware.com/wiki/Vocabulary/atdot "Vocabulary/atdot") (\[x\] m@v y.)

Use these control words inside the loop…

-   [Execute alternative](https://code.jsoftware.com/wiki/Vocabulary/elsedot "Vocabulary/elsedot") (else.)
-   [Execute alternative](https://code.jsoftware.com/wiki/Vocabulary/elsedot "Vocabulary/elsedot") (elseif.)
-   [End of block](https://code.jsoftware.com/mediawiki/index.php?title=Vocabulary/enddot&action=edit&redlink=1 "Vocabulary/enddot (page does not exist)") (end.)

Consider using instead: [Execute case](https://code.jsoftware.com/wiki/Vocabulary/selectdot "Vocabulary/selectdot") (select.)
