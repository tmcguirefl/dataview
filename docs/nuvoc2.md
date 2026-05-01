# NuVoc - J Vocabulary

**The Accessible Dictionary for J**  
*(from the J Wiki at code.jsoftware.com)*

These pages explain J primitives and concepts in greater depth than the original dictionary. They are linked directly from the primitive pages themselves.

## KEY

| Primitive | Valence(s) | COLOR CODE: Parts of Speech |
|-----------|------------|-----------------------------|
| **=**<br>**_:** | rank *Monadic-name*<br>•<br>*Dyadic-name* left-rank right-rank<br>monadic-rank *Dual-Valence-name* left-rank right-rank | **Verb**<br>**Adverb**<br>**Conjunction**<br>**Noun**<br>**Other**<br>**Control** |

**x y** — Arguments of verbs (left / right)  
**u v** — Verb or noun operands of modifiers (left / right)  
**m n** — Noun operands of modifiers (left / right)

## Primitives

### 0:
- **=**  
  - **_** [Self-Classify](https://code.jsoftware.com/wiki/Vocabulary/eq#monadic)  
  - • [Equal](https://code.jsoftware.com/wiki/Vocabulary/eq#dyadic) **0 0**  
  - **=.** [Is (Local)](https://code.jsoftware.com/wiki/Vocabulary/eqdot)  
  - **=:** [Is (Global)](https://code.jsoftware.com/wiki/Vocabulary/eqco)

- **<**  
  - **_** [Box](https://code.jsoftware.com/wiki/Vocabulary/lt)  
  - • [Lesser](https://code.jsoftware.com/wiki/Vocabulary/lt#dyadic) **0 0**  
  - **<.** **0** [Floor](https://code.jsoftware.com/wiki/Vocabulary/ltdot)  
  - • [Lesser of / Min](https://code.jsoftware.com/wiki/Vocabulary/ltdot#dyadic) **0 0**  
  - **<:** **0** [Decrement](https://code.jsoftware.com/wiki/Vocabulary/ltco)  
  - • [Lesser or Equal](https://code.jsoftware.com/wiki/Vocabulary/ltco#dyadic) **0 0**

- **>**  
  - **0** [Open](https://code.jsoftware.com/wiki/Vocabulary/gt)  
  - • [Greater](https://code.jsoftware.com/wiki/Vocabulary/gt#dyadic) **0 0**  
  - **>.** **0** [Ceiling](https://code.jsoftware.com/wiki/Vocabulary/gtdot)  
  - • [Greater of / Max](https://code.jsoftware.com/wiki/Vocabulary/gtdot#dyadic) **0 0**  
  - **>:** **0** [Increment](https://code.jsoftware.com/wiki/Vocabulary/gtco)  
  - • [Greater or Equal](https://code.jsoftware.com/wiki/Vocabulary/gtco#dyadic) **0 0**

- **_ __**  
  - [Negative Sign / Infinities](https://code.jsoftware.com/wiki/Vocabulary/under)

- **_.**  
  - [Indeterminate](https://code.jsoftware.com/wiki/Vocabulary/underdot)

- **_: __:**  
  - **_** [Infinites](https://code.jsoftware.com/wiki/Vocabulary/underco) **_ _**

### 4:
- **+**  
  - **0** [Conjugate](https://code.jsoftware.com/wiki/Vocabulary/plus)  
  - • [Plus](https://code.jsoftware.com/wiki/Vocabulary/plus#dyadic) **0 0**  
  - **+.** **0** [Real / Imag](https://code.jsoftware.com/wiki/Vocabulary/plusdot)  
  - • [GCD (Or)](https://code.jsoftware.com/wiki/Vocabulary/plusdot#dyadic) **0 0**  
  - **+:** **0** [Double](https://code.jsoftware.com/wiki/Vocabulary/plusco)  
  - • [Not-Or](https://code.jsoftware.com/wiki/Vocabulary/plusco#dyadic) **0 0**

- *****  
  - **0** [Signum](https://code.jsoftware.com/wiki/Vocabulary/star)  
  - • [Times](https://code.jsoftware.com/wiki/Vocabulary/star#dyadic) **0 0**  
  - ***.** **0** [Length / Angle](https://code.jsoftware.com/wiki/Vocabulary/stardot)  
  - • [LCM (And)](https://code.jsoftware.com/wiki/Vocabulary/stardot#dyadic) **0 0**  
  - ***:** **0** [Square](https://code.jsoftware.com/wiki/Vocabulary/starco)  
  - • [Not-And](https://code.jsoftware.com/wiki/Vocabulary/starco#dyadic) **0 0**

- **-**  
  - **0** [Negate](https://code.jsoftware.com/wiki/Vocabulary/minus)  
  - • [Minus](https://code.jsoftware.com/wiki/Vocabulary/minus#dyadic) **0 0**  
  - **-.** **0** [Not](https://code.jsoftware.com/wiki/Vocabulary/minusdot)  
  - • [Less](https://code.jsoftware.com/wiki/Vocabulary/minusdot#dyadic) **_ _**  
  - **-:** **0** [Halve](https://code.jsoftware.com/wiki/Vocabulary/minusco)  
  - • [Match](https://code.jsoftware.com/wiki/Vocabulary/minusco#dyadic) **_ _**

- **%**  
  - **0** [Reciprocal](https://code.jsoftware.com/wiki/Vocabulary/percent)  
  - • [Divide](https://code.jsoftware.com/wiki/Vocabulary/percent#dyadic) **0 0**  
  - **%.** **2** [Matrix Inverse](https://code.jsoftware.com/wiki/Vocabulary/percentdot)  
  - • [Matrix Divide](https://code.jsoftware.com/wiki/Vocabulary/percentdot#dyadic) **_ 2**  
  - **%:** **0** [Square Root](https://code.jsoftware.com/wiki/Vocabulary/percentco)  
  - • [Root](https://code.jsoftware.com/wiki/Vocabulary/percentco#dyadic) **0 0**

### 8:
- **^** (and **^!.p**)  
  - **0** [Exponential](https://code.jsoftware.com/wiki/Vocabulary/hat)  
  - • [Power](https://code.jsoftware.com/wiki/Vocabulary/hat#dyadic) **0 0**  
  - • [Stope Function](https://code.jsoftware.com/wiki/Vocabulary/hat#stope) **0 0**  
  - **^.** **0** [Natural Log](https://code.jsoftware.com/wiki/Vocabulary/hatdot)  
  - • [Logarithm](https://code.jsoftware.com/wiki/Vocabulary/hatdot#dyadic) **0 0**  
  - **^:** **_** [Power of Verb](https://code.jsoftware.com/wiki/Vocabulary/hatco) **_ _** (If, Inverse, DoWhile)

- **$**  
  - **_** [Shape Of](https://code.jsoftware.com/wiki/Vocabulary/dollar)  
  - • [Shape](https://code.jsoftware.com/wiki/Vocabulary/dollar#dyadic) **1 _**  
  - **$.** **_** [Sparse](https://code.jsoftware.com/wiki/Vocabulary/dollardot) **_ _**  
  - **$:** **_** [Self-Reference](https://code.jsoftware.com/wiki/Vocabulary/dollarco) **_ _**

- **~** (and **m~**)  
  - **_** [Reflex](https://code.jsoftware.com/wiki/Vocabulary/tilde)  
  - • [Passive](https://code.jsoftware.com/wiki/Vocabulary/tilde#dyadic) *lu ru*  
  - **0** [Evoke](https://code.jsoftware.com/wiki/Vocabulary/tildem) **0 0**  
  - **~.** **_** [Nub](https://code.jsoftware.com/wiki/Vocabulary/tildedot)  
  - **~:** **_** [Nub Sieve](https://code.jsoftware.com/wiki/Vocabulary/tildeco)  
  - • [Not-Equal](https://code.jsoftware.com/wiki/Vocabulary/tildeco#dyadic) **0 0**

- **|**  
  - **0** [Magnitude](https://code.jsoftware.com/wiki/Vocabulary/bar)  
  - • [Residue](https://code.jsoftware.com/wiki/Vocabulary/bar#dyadic) **0 0**  
  - **|.** (and **|.! .f**) **_** [Reverse](https://code.jsoftware.com/wiki/Vocabulary/bardot)  
  - • [Rotate](https://code.jsoftware.com/wiki/Vocabulary/bardot#dyadic) **_ _** / [Shift](https://code.jsoftware.com/wiki/Vocabulary/bardot#dyadicfit) **_ _**  
  - **|:** **_** [Transpose](https://code.jsoftware.com/wiki/Vocabulary/barco)  
  - • [Rearrange Axes](https://code.jsoftware.com/wiki/Vocabulary/barco#dyadic) **1 _**

### 12:
- **.**  
  - **2** [Determinant](https://code.jsoftware.com/wiki/Vocabulary/dot)  
  - • [Matrix Product](https://code.jsoftware.com/wiki/Vocabulary/dot#dyadic) **_ _**

- **:**  
  - [Definition](https://code.jsoftware.com/wiki/Vocabulary/cor) (Explicit Def., Verb Anatomy, mu Monad / Dyad lv rv)  
  - **:.** mu [Assign Obverse](https://code.jsoftware.com/wiki/Vocabulary/codot) *lu ru*  
  - **::** **_** [Assign Adverse](https://code.jsoftware.com/wiki/Vocabulary/coco) **_ _**

- **,**  
  - **_** [Ravel](https://code.jsoftware.com/wiki/Vocabulary/comma)  
  - • [Append](https://code.jsoftware.com/wiki/Vocabulary/comma#dyadic) **_ _**  
  - **,.** **_** [Ravel Items](https://code.jsoftware.com/wiki/Vocabulary/commadot)  
  - • [Stitch](https://code.jsoftware.com/wiki/Vocabulary/commadot#dyadic) **_ _**  
  - **,:** **_** [Itemize](https://code.jsoftware.com/wiki/Vocabulary/commaco)  
  - • [Laminate](https://code.jsoftware.com/wiki/Vocabulary/commaco#dyadic) **_ _**

- **;**  
  - **_** [Raze](https://code.jsoftware.com/wiki/Vocabulary/semi)  
  - • [Link](https://code.jsoftware.com/wiki/Vocabulary/semi#dyadic) **_ _**  
  - **;.** [Cut](https://code.jsoftware.com/wiki/Vocabulary/semidot) (with variants **;.0**, **;.+/-1 +/-2**)  
  - **;:** **1** [Words](https://code.jsoftware.com/wiki/Vocabulary/semico)  
  - • [Seq. Machine](https://code.jsoftware.com/wiki/Vocabulary/semico#dyadic) **_ _**

*(The full grid continues on the live page for all remaining symbols including ^. ! . / \ [ ] { } a. b. c. d. e. f. g. h. i. j. L. m. M. NB. o. p. q. r. s. S. t. T. u: x: Z: _9:–9: hooks, forks, u. v., and all control words. See the official page for the complete list.)*

## Ancillary Pages

These special articles explain principles and practice in greater depth. They are *task-oriented* and linked from the primitive pages.

| Page | Description |
|------|-------------|
| [J Reference Sheets](https://code.jsoftware.com/wiki/Guides/GettingStartedSerious#Useful_Resources) | One Sheet J Reference pages for J602 and J90X |
| [Vocabulary/AboutNuVoc](https://code.jsoftware.com/wiki/Vocabulary/AboutNuVoc) | About the Accessible Dictionary: how and why |
| [Vocabulary/AccurateAccumulation](https://code.jsoftware.com/wiki/Vocabulary/AccurateAccumulation) | `+/!.0 y` and `x +/@:*"1!.0 y` to avoid roundoff error |
| [Vocabulary/AET](https://code.jsoftware.com/wiki/Vocabulary/AET) | "Absolutely essential J terms" to know for NuVoc |
| [Vocabulary/Agreement](https://code.jsoftware.com/wiki/Vocabulary/Agreement) | How argument cells are matched for dyads (with tables) |
| [Vocabulary/AmendingBoxedStructures](https://code.jsoftware.com/wiki/Vocabulary/AmendingBoxedStructures) | Making replacements inside a boxed array |
| [Vocabulary/ArrayProcessing](https://code.jsoftware.com/wiki/Vocabulary/ArrayProcessing) | How do you process an array? (an introduction) |
| [Vocabulary/Assignment](https://code.jsoftware.com/wiki/Vocabulary/Assignment) | Private and public assignment explained |
| [Vocabulary/Beginner's Q&A](https://code.jsoftware.com/wiki/Vocabulary/Beginner'sQ%26A) | What a beginner needs to know, in brief |
| [Vocabulary/Constants](https://code.jsoftware.com/wiki/Vocabulary/Constants) | Number formation (an intro by examples) |
| [Vocabulary/ControlStructures](https://code.jsoftware.com/wiki/Vocabulary/ControlStructures) | Control words used in J definitions |
| [Vocabulary/CyclicGerund](https://code.jsoftware.com/wiki/Vocabulary/CyclicGerund) | Cyclic gerunds explained |
| [Vocabulary/Debug](https://code.jsoftware.com/wiki/Vocabulary/Debug) | How to debug an explicit definition |
| [Vocabulary/Dictionaries (addon)](https://code.jsoftware.com/wiki/Vocabulary/Dictionaries_(addon)) | Threadsafe ordered and unordered maps |
| [Vocabulary/DirectDefinition](https://code.jsoftware.com/wiki/Vocabulary/DirectDefinition) | Use `{{ }}` to write explicit definitions |
| [Vocabulary/Dissect](https://code.jsoftware.com/wiki/Vocabulary/Dissect) | Pictorial view and analysis of a J sentence |
| [Vocabulary/EZRank](https://code.jsoftware.com/wiki/Vocabulary/EZRank) | Rank in a hurry: "rank" concept rapidly explained |
| [Vocabulary/EmptyArguments](https://code.jsoftware.com/wiki/Vocabulary/EmptyArguments) | What happens when an argument to a verb has no atoms, or no cells |
| [Vocabulary/ErrorMessages](https://code.jsoftware.com/wiki/Vocabulary/ErrorMessages) | Error Messages (formal table plus explanations) |
| [Vocabulary/Foreigns](https://code.jsoftware.com/wiki/Vocabulary/Foreigns) | System Functions and Miscellaneous Features (`m!:n`) |
| [Vocabulary/FramingFill](https://code.jsoftware.com/wiki/Vocabulary/FramingFill) | Result collection and framing fill explained |
| [Vocabulary/GerundsAndAtomicRepresentation](https://code.jsoftware.com/wiki/Vocabulary/GerundsAndAtomicRepresentation) | Gerunds and Atomic Representation explained |
| [Vocabulary/Glossary](https://code.jsoftware.com/wiki/Vocabulary/Glossary) | J terms (a comprehensive formal list) |
| [Vocabulary/HowNuVoc](https://code.jsoftware.com/wiki/Vocabulary/HowNuVoc) **← START HERE** | How to use NuVoc |
| [Vocabulary/IFamily](https://code.jsoftware.com/wiki/Vocabulary/IFamily) | The `i.`-family of verbs described |
| [Vocabulary/Idioms](https://code.jsoftware.com/wiki/Vocabulary/Idioms) | Common Idioms used in J best practice |
| [Vocabulary/Inverses](https://code.jsoftware.com/wiki/Vocabulary/Inverses) | Inverse and Obverse explained |
| [Vocabulary/JBreak](https://code.jsoftware.com/wiki/Vocabulary/JBreak) | JBreak: forcing J to stop executing the current process |
| [Vocabulary/LAPACK](https://code.jsoftware.com/wiki/Vocabulary/LAPACK) | J interface to the LAPACK library |
| [Vocabulary/Lint](https://code.jsoftware.com/wiki/Vocabulary/Lint) | How to use `lint`: the builtin Program Flow Analyzer |
| [Vocabulary/Libraries](https://code.jsoftware.com/wiki/Vocabulary/Libraries) | The J Libraries and what they do |
| [Vocabulary/Locales](https://code.jsoftware.com/wiki/Vocabulary/Locales) | Locales explained |
| [Vocabulary/Loopless](https://code.jsoftware.com/wiki/Vocabulary/Loopless) | Loopless programming explained |
| [Vocabulary/Modifiers](https://code.jsoftware.com/wiki/Vocabulary/Modifiers) | Modifiers (adverbs and conjunctions) explained |
| [Vocabulary/ModifierTrains](https://code.jsoftware.com/wiki/Vocabulary/ModifierTrains) | Rules and examples for using modifier trains such as `([.*].)` |
| [Vocabulary/NounExplicitDefinition](https://code.jsoftware.com/wiki/Vocabulary/NounExplicitDefinition) | How to define a noun as an explicit entity using (`:`) |
| [Vocabulary/Nouns](https://code.jsoftware.com/wiki/Vocabulary/Nouns) | All about Nouns |
| [Vocabulary/NumericPrecisions](https://code.jsoftware.com/wiki/Vocabulary/NumericPrecisions) | Numeric Precisions in J |
| [Vocabulary/ObjectOrientedProgramming](https://code.jsoftware.com/wiki/Vocabulary/ObjectOrientedProgramming) | Object-Oriented Programming in J |
| [Vocabulary/Parsing](https://code.jsoftware.com/wiki/Vocabulary/Parsing) | How sentences are executed, step by step |
| [Vocabulary/PartsOfSpeech](https://code.jsoftware.com/wiki/Vocabulary/PartsOfSpeech) | The Parts of Speech: Noun, Verb, etc. |
| [Guides/Performance Monitor](https://code.jsoftware.com/wiki/Guides/Performance_Monitor) | Profile execution to find slow spots |
| [Vocabulary/ObsoleteSyntax](https://code.jsoftware.com/wiki/Vocabulary/ObsoleteSyntax) | No-longer-supported features of earlier versions of J |
| [Vocabulary/Printf](https://code.jsoftware.com/wiki/Vocabulary/Printf) | How to use the `printf` addon |
| [Vocabulary/RankFromV](https://code.jsoftware.com/wiki/Vocabulary/RankFromV) | The rank of a verb created by an adverb or conjunction |
| [Vocabulary/RankInfo](https://code.jsoftware.com/wiki/Vocabulary/RankInfo) | Rank Information linked from CategoryVoc pages |
| [Vocabulary/RankInfoIsImportant](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant) | Why is the rank of a verb important to know? |
| [Vocabulary/ReadingASentence](https://code.jsoftware.com/wiki/Vocabulary/ReadingASentence) | A beginner's guide to reading sentences |
| [Guides/Regular Expressions/Overview](https://code.jsoftware.com/wiki/Guides/Regular_Expressions/Overview) | Regex in J |
| [Vocabulary/ScreenOutputInput](https://code.jsoftware.com/wiki/Vocabulary/ScreenOutputInput) | Screen output and input explained |
| [Vocabulary/SpecialCombinations](https://code.jsoftware.com/wiki/Vocabulary/SpecialCombinations) | Special Combinations of primitives (with tables) |
| [Vocabulary/TBlock](https://code.jsoftware.com/wiki/Vocabulary/TBlock) | Clarification of the T-block and B-block in an `if.`-statement |
| [Vocabulary/TestYourJ](https://code.jsoftware.com/wiki/Vocabulary/TestYourJ) | Test Your J (tells you if you've any need of NuVoc) |
| [Vocabulary/Unreadability](https://code.jsoftware.com/wiki/Vocabulary/Unreadability) | The alleged unreadability of J — and what to do about it |
| [Vocabulary/UnicodeCodePoint](https://code.jsoftware.com/wiki/Vocabulary/UnicodeCodePoint) | The Unicode Code Point (UCP) explained |
| [Vocabulary/Valence](https://code.jsoftware.com/wiki/Vocabulary/Valence) | Verb *valence* explained |
| [Vocabulary/Verbs](https://code.jsoftware.com/wiki/Vocabulary/Verbs) | All about Verbs |
| [Vocabulary/VerbRank](https://code.jsoftware.com/wiki/Vocabulary/VerbRank) | Verb rank, and how J extends small verbs to big arrays |
| [JDic:vocabul](https://www.jsoftware.com/help/dictionary/vocabul.htm) | VOC — the original "pro version" of this portal page |
| [Vocabulary/Words](https://code.jsoftware.com/wiki/Vocabulary/Words) | All about J Words |
| [Vocabulary/ZeeLocale](https://code.jsoftware.com/wiki/Vocabulary/ZeeLocale) | "Factory words" — the z-locale and its contents |

---

[[Category:NuVoc]]

**Copy everything above this line into a file named `NuVoc.md` and open it in any Markdown viewer (GitHub, VS Code, Obsidian, etc.).** The primitives are now fully readable as a structured list, and all links are preserved.
