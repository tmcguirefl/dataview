# Vocabulary/underdot - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/underco "Vocabulary/underco") [<<](https://code.jsoftware.com/wiki/Vocabulary/under "Vocabulary/under")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d031.htm "jdic:d031")

<table class="wikitable"><tbody><tr><td><tt>_.</tt></td><td>Indeterminate</td><td>Noun</td></tr></tbody></table>

---

Indeterminate (\_.) is a [numeric](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Numeric "Vocabulary/Glossary") [atom](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Atom "Vocabulary/Glossary"). It is a placeholder broadly comparable with NaN (not a number). See: [WikiPedia:NaN](https://en.wikipedia.org/wiki/NaN "wikipedia:NaN") and [Essays/Indeterminate](https://code.jsoftware.com/wiki/Essays/Indeterminate "Essays/Indeterminate").

It can appear in data imported from external sources, eg from a DLL or data base package. For an exhaustive list of sources see the [entry in the J Dictionary](https://www.jsoftware.com/help/dictionary/d031.htm "jdic:d031").

If a computation produces NaN when the arguments were not NaN, J will signal a NaN error. If a NaN is an argument to a computation, it is undefined what the result value is: it could be NaN or any other value.

Some computations that produce NaN according to the IEEE standard do not produce NaN in J:

-   0 \* \_ = 0
-   0 \* \_\_ = 0
-   0 % 0 = 0
```
   p=: \_ \[ q=: \_\_
   p+q
|NaN error
|   p    +q
   p%q
|NaN error
|   p    %q
   0\*p,q
0 0
   1%q
0

```
---

### Common uses

**Indeterminate** (\_.) is **not recommended for use** in J computations. It signifies a "missing value" in statistical data. You should detect it using 128!:5 and replace it at the first opportunity with a proper [numeric](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Numeric "Vocabulary/Glossary") [value](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary") suited to the computation you want to perform, eg (0), (\_) or (\_\_).

```
   z
1 2 \_. 4
   128!:5 z
0 0 1 0
  0 (I. 128!:5 z) } z   NB. replace missing values with ZERO
1 2 0 4

```
---

### More Information

**Indeterminate** is the only [numeric](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Numeric "Vocabulary/Glossary") [atom](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Atom "Vocabulary/Glossary") that is **not equal to itself**. Further bizarre properties arise from this fact.

See [Essays/Indeterminate](https://code.jsoftware.com/wiki/Essays/Indeterminate "Essays/Indeterminate").

```
   z=: 1 2 \_. 4
   1+z
2 3 \_. 5
   z=z
1 1 0 1
   +/z
\_.

```

[Numbers](https://code.jsoftware.com/wiki/Vocabulary/quotedot#dyadic "Vocabulary/quotedot") (".) can take a left [argument](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Argument "Vocabulary/AbsolutelyEssentialTerms"). This specifies a numeric [atom](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Atom "Vocabulary/AbsolutelyEssentialTerms") to replace any ill-formed numbers. This (together with 3!:n) are the only ways to force \_. to arise in pure-J code. **But it is not recommended for the purpose!** Use (0) or [Infinity](https://code.jsoftware.com/wiki/Vocabulary/under "Vocabulary/under") (\_) instead.

```
   z=: '.2 0.2 2.45 3E56 3F56 \_1 \_0 77'
   NB. (".) accepts non-J-numerals like '.2' and '3E56' but not '3F56' ...
   ".z
|ill-formed number
|       ".z
   \_. ".z
0.2 0.2 2.45 3e56 \_. \_1 0 77
   0 ".z     NB. replace bad-numerals by ZERO
0.2 0.2 2.45 3e56 0 \_1 0 77
   \_ ".z     NB. replace bad-numerals by INFINITY
0.2 0.2 2.45 3e56 \_ \_1 0 77

```
---
