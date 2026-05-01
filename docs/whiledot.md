# Vocabulary/whiledot - J Wiki

[<<](https://code.jsoftware.com/wiki/Vocabulary/trydot "Vocabulary/trydot")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/ctrl.htm "jdic:ctrl")

<table class="wikitable"><tbody><tr><td><tt>while.</tt> <i>condition</i> <tt>do.</tt> <i>body</i> <tt>end.</tt></td><td>Loop while</td><td>Control</td></tr></tbody></table>

Valid only inside an [explicit definition](https://code.jsoftware.com/wiki/Vocabulary/Glossary#ExplicitDefinition "Vocabulary/Glossary").

This flow control structure is similar to the While iteration scheme found e.g. in Ada or Python.  
The conditional expression 
```
while. …
```
 sitting at the top of the loop, enables one to decide whether (and to what extent) the statements inside the 
```
do. … end.
```
 block are in turn executed.

The code below mimics in part the primitive 
```
x #: y
```
 (Antibase).

Arbitrary-Base-from-Decimal Conversion of Integers (méthode ancienne);  
verb 
```
afd
```
 takes 
```
number;base
```
 as (boxed) arguments.

```
afd=: monad define
 'n b'=. <.|> y           NB. fetch (positive) decimal integer and target base
 if. n < 1 do.
  v=. 0                   NB. zero is 0 in any base
 else.
  v=. i.0                 NB. initialise result vector (to empty)
  while. n > 0 do.
   v=. v,b|n              NB. amend vector with residue
   n=. <. n % b           NB. get next n through integer divide
  end.
 end.
 |.v                      NB. return digits in target base
)

```

Example use:

```
   afd \_122.3;91
1 31
   afd 44252;16
10 12 13 12

```

[Power of Verb](https://code.jsoftware.com/wiki/Vocabulary/hatco "Vocabulary/hatco") (\[x\] u^:v y), [Fold](https://code.jsoftware.com/wiki/Vocabulary/fcap "Vocabulary/fcap") (\[x\] u F. v y)

---

<table class="wikitable"><tbody><tr><td><tt>whilst.</tt> <i>condition</i> <tt>do.</tt> <i>body</i> <tt>end.</tt></td><td>Execute body once, then loop while</td><td>Control</td></tr></tbody></table>

Valid only inside an [explicit definition](https://code.jsoftware.com/wiki/Vocabulary/Glossary#ExplicitDefinition "Vocabulary/Glossary").

This flow control structure is almost identical to the While iteration scheme above.  
There's one difference: The loop is entered the _first_ time _disregarding_ the conditional expression present.

This feature is similar to the 
```
do … until (…)
```
 resp. 
```
repeat … until (…)
```
 loops found e.g. in Fortran or Pascal.  
It would be used in cases one wants to make sure (or knows that it does make sense) that the body of the loop (the 
```
do. … end.
```
 block) will be _executed once_ anyway.  
The conditional expression 
```
whilst. …
```
 will of course cut in on the second and succeeding visits.

This code snippet is intended to show that behaviour (and nothing more). It came as the result of my conversation with chat.openai.com (ChatGPT) on 2023-05-18, asking for a funny example using 
```
repeat … until(…)
```
 . \[NB. At that time it wasn't even aware that 
```
whilst. … do. … end.
```
 existed in J.\]

```
wtl=: 3 : 0
 condition=. FALSE=. 0
 caution=. 'This loop will definitely execute at least once.'
 hint=. 'Gotcha ;-)'
 laughter=. 'HaHaHaHaHa!'
 whilst. condition do.
  echo caution
  echo hint
  echo laughter
 end.
)

```

Example use:

```
   wtl 0
This loop will definitely execute at least once.
Gotcha ;-)
HaHaHaHaHa!

```

The code below uses an often cited approximation formula by Srinivasa Ramanujan along the lines of  
```
1/π ≈ C × Σ N/D
```
 .  
See for instance  

-   Chieh-Lei Wong, On the elegance of Ramanujan's series for 
    ```
    π
    ```
      [\[1\]](https://crypto.stanford.edu/pbc/notes/pi/ramanujan.html)  
    -   Ben Lynn, Ramanujan's Formula for Pi  [\[2\]](https://crypto.stanford.edu/pbc/notes/pi/ramanujan.html)

Approximation of 
```
π
```
; verb 
```
piR
```
 takes 
```
no of iterations
```
 as argument.

```
piR=: 3 : 0
 n=. <. | y                 NB. no of sum terms, accepting positive integers only
 k=. 0                      NB. initialising sum index k
 ci=. 9801 % (\* %:) 2       NB. inverse of constant factor (in front of sum)
 s=. 0                      NB. initialising sum
 whilst. k <: n do.
  sn=. (1103 + 26390\*k) \* !4\*k      NB. sum's numerator
  sd=. ((396&^ \* !) k)^4            NB. sum's denominator
  sf=. sn % sd                      NB. sum's fractional term
  s=. s + sf                        NB. accumulating
  k=. >: k                          NB. incrementing index
 end.
 pix=. ci % s               NB. return approximate value of π
)

```

Example use:

```
   9!:11 \]15                NB. set print precision

   piR 0                    NB. 1st round delivers
3.14159273001331
   9801 % 1103 \* (\* %:) 2   NB. already 7 leading digits correct
3.14159273001331
   9801 % 1103 \* 2^3r2
3.14159273001331
   0j15":,. piR("0) 1 2 3   NB. converging veery fast (approx 8 digits per step)
3.141592653589794
3.141592653589793
3.141592653589793

```
---

[Power of Verb](https://code.jsoftware.com/wiki/Vocabulary/hatco "Vocabulary/hatco") (\[x\] u^:v y), [Fold](https://code.jsoftware.com/wiki/Vocabulary/fcap "Vocabulary/fcap") (\[x\] u F. v y)

---
