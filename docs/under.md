# Vocabulary/under - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/underdot "Vocabulary/underdot") [<<](https://code.jsoftware.com/wiki/Vocabulary/gtco "Vocabulary/gtco")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d030.htm "jdic:d030")

<table class="wikitable"><tbody><tr><td><tt>_</tt></td><td>Negative Sign</td><td>Other</td></tr></tbody></table>

---

As the first character of a [numeric](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Numeric "Vocabulary/Glossary") [constant](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Constant "Vocabulary/Glossary"), (\_) acts as a **negative sign** to produce a negative constant.

The two-character constant (\_\_) combines these usages and represents **Negative infinity**.

The negative sign (\_) is part of the [number (constant)](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Constant "Vocabulary/Glossary") that follows it. Any noun that begins with a negative sign must be a valid number. This is different from applying [Negate](https://code.jsoftware.com/wiki/Vocabulary/minus "Vocabulary/minus") (\-), which is a [verb](https://code.jsoftware.com/wiki/Vocabulary/AbsolutelyEssentialTerms#Verb "Vocabulary/AbsolutelyEssentialTerms") primitive that forms a [phrase](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Phrase "Vocabulary/Glossary") to be evaluated.

```
   5 \_3 22
5 \_3 22
   5 -3 22   NB. equivalent to: 5 - (3 22)
2 \_17

```
---

### Common uses

1\. Embed negative numbers in a [numeric](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Numeric "Vocabulary/Glossary") [vector](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Vector "Vocabulary/Glossary") or [matrix](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Table "Vocabulary/Glossary").

---

[Negate](https://code.jsoftware.com/wiki/Vocabulary/minus "Vocabulary/minus") (\- y)

---

<table class="wikitable"><tbody><tr><td><tt>_</tt></td><td>Infinity</td><td>Noun</td></tr></tbody></table>

---

Standing by itself, (\_) represents the [value](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Value "Vocabulary/Glossary") **Infinity** (an IEEE [floating-point](https://code.jsoftware.com/wiki/Vocabulary/Glossary#FloatingPoint "Vocabulary/Glossary") value).

---

### Common uses

1\. Use as a docile placeholder in a [numeric](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Numeric "Vocabulary/Glossary") [vector](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Vector "Vocabulary/Glossary") or [matrix](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Table "Vocabulary/Glossary").

```
   \]z=: 2 3$ 0 1 \_ 3 4 5
0 1 \_
3 4 5
   1+z
1 2 \_
4 5 6
   \_ = z
0 0 1
0 0 0
   \_ = 1+z
0 0 1
0 0 0

```

Note that (\_) is a [floating-point](https://code.jsoftware.com/wiki/Vocabulary/Glossary#FloatingPoint "Vocabulary/Glossary") value and its use will force the entire [array](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Array "Vocabulary/Glossary") to be floating-point.

2\. Specify (\_) as the placeholder to be used for a badly-formed numeral when converting a [string](https://code.jsoftware.com/wiki/Vocabulary/Glossary#String "Vocabulary/Glossary") using [Numbers](https://code.jsoftware.com/wiki/Vocabulary/quotedot#dyadic "Vocabulary/quotedot") (".).

```
   \_ ". '33 -44 55.5 66.6.6 \_77'
33 \_44 55.5 \_ \_77

```

**Note:** the use of (\_) here is better-behaved in practice than [Indeterminate](https://code.jsoftware.com/wiki/Vocabulary/underdot "Vocabulary/underdot") (\_.)

---

### Details

1\. Some normally-indeterminate forms involving infinity are defined in J:

-   0 \* \_ = 0
-   0 \* \_\_ = 0
-   \_ ^ 0 = 1
-   1 ^ \_ = 1
---
