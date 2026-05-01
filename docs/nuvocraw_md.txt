:{| class="wikitable" style="font-size:0.8em;margin-left:0em;;background-color:#ffffff;border:none;width:95%;"
|- style="font-weight:bold;"
|rowspan="3" style="text-align:center;border-left:none;border-top:none;border-bottom:none;" |KEY:
|style="text-align:center;"|[[Vocabulary#Primitive|Primitiv]][[Vocabulary/JCPUBenchmarks|e]]
|colspan="3" style="text-align:center" |[[Vocabulary/Valence|Valence(s)]]
|rowspan="3" style="border-top:none;border-bottom:none;border-left:none;border-right:none;" |
|colspan="3" style="text-align:center" |COLOR CODE: [[Vocabulary/PartsOfSpeech|Parts of Speech]]
|-
|style="text-align:center;font-size:1.4em;font-weight:bold;background-color:#ddccff;border-right:none;" |<tt>=</tt>
|style="border-left:none;border-right:none;text-align:right;"|<tt>rank</tt> <i>Monadic-name</i> &nbsp;
|style="border-left:none;border-right:none"|•&nbsp;
|style="border-left:none;text-align:left;"|<i>Dyadic-name</i>  <tt>left-rank right-rank</tt>
|style="text-align:center;background-color:#ddccff;" |[[Vocabulary/Glossary#Verb|Verb]]
|style="text-align:center;background-color:#cceeff;" |[[Vocabulary/Glossary#Adverb|Adverb]]
|style="text-align:center;background-color:#eeffcc;" |[[Vocabulary/Glossary#Conjunction|Conjunction]]
|-
|style="text-align:center;font-size:1.4em;font-weight:bold;background-color:#ddccff;border-right:none;" |<tt>_:</tt>
|colspan="3" style="border-left:none;text-align:center" |<tt>monadic-rank</tt>&nbsp;&nbsp;<i>Dual-Valence-name</i>&nbsp;&nbsp;<tt>left-rank right-rank</tt>
|style="text-align:center;background-color:#ffccee;" |[[Vocabulary/Glossary#Noun|Noun]]
|style="text-align:center;background-color:#dddddd;" |[[Vocabulary/Glossary#Copula|Other]]
|style="text-align:center;background-color:#eeaaaa;" |[[Vocabulary/Glossary#Control|Control]]
|}


<span id="maintable"></span>

:{| class="wikitable" style="font-size:0.8em;;background-color:#ffffff;border:none;width:95%;"
|-
|style="text-align:center;font-size:1.4em;font-weight:bold;background-color:#ffccee;border-right:none;" |<tt>x&nbsp;y</tt>
|colspan="3" style="text-align:center;border-left:none" |&nbsp;&nbsp;[[Vocabulary/Verbs#Executing_an_Explicit_Definition:_Private_Namespaces|Arguments of verbs<br>left / right]]
|style="text-align:center;font-size:1.4em;font-weight:bold;background-color:#ddccff;border-right:none;" |<tt>u&nbsp;v</tt>
|colspan="3" style="text-align:center;border-left:none" |&nbsp;&nbsp;[[Vocabulary/Modifiers|Verb or noun operands of modifiers<br>left / right]]
|style="text-align:center;font-size:1.4em;font-weight:bold;background-color:#ffccee;border-right:none;" |<tt>m&nbsp;n</tt>
|colspan="3" style="text-align:center;border-left:none" |&nbsp;&nbsp;[[Vocabulary/Modifiers|Noun operands of modifiers<br>left / right]]
|style="border-left:none;border-right:none;border-top:none;border-bottom:none;" |
|-
|style="border-left:none;border-right:none" |0:
|-
|style="text-align:center;font-size:1.4em;font-weight:bold;background-color:#ddccff;border-right:none;font-size:1.4em;font-weight:bold" |<tt>=</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>_</tt>&nbsp;''[[Vocabulary/eq#monadic|Self-Classify]]''
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/eq#dyadic|Equal]]&nbsp;&nbsp;<tt>0&nbsp;0</tt>
|style="background-color:#dddddd;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>=.</tt>
|colspan="3" style="text-align:center;border-left:none;" |[[Vocabulary/eqdot|Is (Local)]]
|style="background-color:#dddddd;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>=:</tt>
|colspan="3" style="text-align:center;border-left:none;" |[[Vocabulary/eqco|Is (Global)]]
|colspan="4" style="border-left:none;border-right:none;border-top:none;border-bottom:none;" |
|-
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt><</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/lt|Box]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/lt#dyadic|Lesser]]&nbsp;&nbsp;<tt>0&nbsp;0</tt>
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt><.</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>0</tt>&nbsp;&nbsp;[[Vocabulary/ltdot|Floor]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/ltdot#dyadic|Lesser of / Min]]&nbsp;&nbsp;<tt>0&nbsp;0</tt>
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt><:</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>0</tt>&nbsp;&nbsp;[[Vocabulary/ltco|Decrement]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/ltco#dyadic|Lesser or Equal]]&nbsp;&nbsp;<tt>0&nbsp;0</tt>
|-
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>></tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>0</tt>&nbsp;&nbsp;[[Vocabulary/gt|Open]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/gt#dyadic|Greater]]&nbsp;&nbsp;<tt>0&nbsp;0</tt>
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>>.</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>0</tt>&nbsp;&nbsp;[[Vocabulary/gtdot|Ceiling]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/gtdot#dyadic|Greater of / Max]]&nbsp;&nbsp;<tt>0&nbsp;0</tt>
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>>:</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>0</tt>&nbsp;&nbsp;[[Vocabulary/gtco|Increment]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/gtco#dyadic|Greater or Equal]]&nbsp;&nbsp;<tt>0&nbsp;0</tt>
|-
|style="background-color:#ffccee;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>_&nbsp;__</tt>
|colspan="3" style="text-align:center;border-left:none;" |[[Vocabulary/under|Negative Sign / Infinities]]
|style="background-color:#ffccee;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>_.</tt>
|colspan="3" style="text-align:center;border-left:none;" |[[Vocabulary/underdot|Indeterminate]]
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>_:&nbsp;__:</tt>
|colspan="3" style="text-align:center;border-left:none" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/underco|Infinites]]&nbsp;&nbsp;<tt>_&nbsp;_</tt>
|-
|style="border-left:none;border-right:none" |4:
|-
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>+</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>0</tt>&nbsp;&nbsp;[[Vocabulary/plus|Conjugate]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/plus#dyadic|Plus]]&nbsp;&nbsp;<tt>0&nbsp;0</tt>
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>+.</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>0</tt>&nbsp;&nbsp;[[Vocabulary/plusdot|Real / Imag]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/plusdot#dyadic|GCD (Or)]]&nbsp;&nbsp;<tt>0&nbsp;0</tt>
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>+:</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>0</tt>&nbsp;&nbsp;[[Vocabulary/plusco|Double]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/plusco#dyadic|Not-Or]]&nbsp;&nbsp;<tt>0&nbsp;0</tt>
|-
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>*</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>0</tt>&nbsp;&nbsp;[[Vocabulary/star|Signum]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/star#dyadic|Times]]&nbsp;&nbsp;<tt>0&nbsp;0</tt>
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>*.</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>0</tt>&nbsp;&nbsp;[[Vocabulary/stardot|Length / Angle]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/stardot#dyadic|LCM (And)]]&nbsp;&nbsp;<tt>0&nbsp;0</tt>
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>*:</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>0</tt>&nbsp;&nbsp;[[Vocabulary/starco|Square]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/starco#dyadic|Not-And]]&nbsp;&nbsp;<tt>0&nbsp;0</tt>
|-
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>-</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>0</tt>&nbsp;&nbsp;[[Vocabulary/minus|Negate]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/minus#dyadic|Minus]]&nbsp;&nbsp;<tt>0&nbsp;0</tt>
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>-.</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>0</tt>&nbsp;&nbsp;[[Vocabulary/minusdot|Not]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/minusdot#dyadic|Less]]&nbsp;&nbsp;<tt>_&nbsp;_</tt>
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>-:</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>0</tt>&nbsp;&nbsp;[[Vocabulary/minusco|Halve]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/minusco#dyadic|Match]]&nbsp;&nbsp;<tt>_&nbsp;_</tt>
|-
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>%</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>0</tt>&nbsp;&nbsp;[[Vocabulary/percent|Reciprocal]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/percent#dyadic|Divide]]&nbsp;&nbsp;<tt>0&nbsp;0</tt>
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>%.</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>2</tt>&nbsp;&nbsp;[[Vocabulary/percentdot|Matrix Inverse]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/percentdot#dyadic|Matrix Divide]]&nbsp;&nbsp;<tt>_&nbsp;2</tt>
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>%:</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>0</tt>&nbsp;&nbsp;[[Vocabulary/percentco|Square Root]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/percentco#dyadic|Root]]&nbsp;&nbsp;<tt>0&nbsp;0</tt>
|-
|style="border-left:none;border-right:none" |8:
|-
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold;line-height:1" |<tt>^</tt><br/><tt>^!.p</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>0</tt>&nbsp;&nbsp;[[Vocabulary/hat|Exponential]] <br/>&nbsp;
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/hat#dyadic|Power]]&nbsp;&nbsp;<tt>0&nbsp;0</tt> <br />
[[Vocabulary/hat#stope|Stope Function]]&nbsp;&nbsp;<tt>0&nbsp;0</tt>
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>^.</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>0</tt>&nbsp;&nbsp;[[Vocabulary/hatdot|Natural Log]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/hatdot#dyadic|Logarithm]]&nbsp;&nbsp;<tt>0&nbsp;0</tt>
|style="background-color:#eeffcc;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>^:</tt>
|colspan="3" style="text-align:center;border-left:none;" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/hatco|Power of Verb]]&nbsp;&nbsp;<tt>_&nbsp;_</tt> <br />
([[Vocabulary/hatco#IfDyad|If]], [[Vocabulary/hatco#Inverse|Inverse]], [[Vocabulary/hatco#DoWhile|DoWhile]])
|-
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>$</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/dollar|Shape Of]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/dollar#dyadic|Shape]]&nbsp;&nbsp;<tt>1&nbsp;_</tt>
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>$.</tt>
|colspan="3" style="text-align:center;border-left:none;" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/dollardot|Sparse]]&nbsp;&nbsp;<tt>_&nbsp;_</tt>
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>$:</tt>
|colspan="3" style="text-align:center;border-left:none;" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/dollarco|Self-Reference]]&nbsp;&nbsp;<tt>_&nbsp;_</tt>
|-
|rowspan="2" style="background-color:#cceeff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>u~</tt><br/><tt>m~</tt>
|style="vertical-text-align:center;text-align:right;border-left:none;border-right:none;border-bottom:none;" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/tilde|Reflex]]
|style="vertical-text-align:center;border-left:none;border-bottom:none;border-right:none" |•
| style="text-align:left;border-left:none;border-bottom:none;" |&nbsp;[[Vocabulary/tilde#dyadic|Passive]]&nbsp;&nbsp;<tt>lu&nbsp;ru</tt><br/>
|rowspan="2" style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>~.</tt>
|rowspan="2" style="text-align:right;border-left:none;border-right:none" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/tildedot|Nub]]
|rowspan="2" style="border-left:none;border-right:none"|•
|rowspan="2" style="text-align:left;border-left:none;" |&nbsp;
|rowspan="2" style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>~:</tt>
|rowspan="2" style="text-align:right;border-left:none;border-right:none" |<tt>_</tt>&nbsp;&nbsp; [[Vocabulary/tildeco|Nub Sieve]]
|rowspan="2" style="border-left:none;border-right:none" |•
|rowspan="2" style="text-align:left;border-left:none" |[[Vocabulary/tildeco#dyadic|Not-Equal]]&nbsp;&nbsp;<tt>0&nbsp;0</tt>
|-
|colspan="3" style="border-top:none;border-left:none;border-right:none;text-align:center;|
<tt>0</tt>&nbsp;&nbsp;[[Vocabulary/tildem|Evoke]]&nbsp;&nbsp;<tt>0&nbsp;0</tt>
|-
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt><nowiki>|</nowiki></tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>0</tt>&nbsp;&nbsp;[[Vocabulary/bar|Magnitude]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/bar#dyadic|Residue]]&nbsp;&nbsp;<tt>0&nbsp;0</tt>
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold;" |<tt><nowiki>|.</nowiki></tt><br/><tt><tt><nowiki>|.!.f</nowiki></tt>

|style="text-align:right;border-left:none;border-right:none" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/bardot|Reverse]]<br/>  <tt>_</tt>&nbsp;&nbsp;[[Vocabulary/bardot#monadicfit|Shift Right 1]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/bardot#dyadic|Rotate]]&nbsp;&nbsp;<tt>_&nbsp;_</tt><br/>
[[Vocabulary/bardot#dyadicfit|Shift]]&nbsp;&nbsp;<tt>_&nbsp;_</tt>

|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt><nowiki>|:</nowiki></tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/barco|Transpose]]
|style="border-left:none;border-right:none"|•
|style="text-align:left;border-left:none" |[[Vocabulary/barco#dyadic|Rearrange Axes]]&nbsp;&nbsp;<tt>1&nbsp;_</tt>
|-
|style="border-left:none;border-right:none" |12:
|-
|style="background-color:#eeffcc;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>.</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>2</tt>&nbsp;&nbsp;[[Vocabulary/dot|Determinant]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/dot#dyadic|Matrix Product]]&nbsp;&nbsp;<tt>_&nbsp;_</tt>
|colspan="8" |
|-
|style="background-color:#eeffcc;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>:</tt>
|colspan="3" style="text-align:center;border-left:none;" |[[Vocabulary/cor|Definition]]<br>([[Vocabulary/com|Explicit Def.]], [[Vocabulary/coa|Verb Anatomy]], <tt>mu</tt>&nbsp;&nbsp;[[Vocabulary/cou|Monad / Dyad]]&nbsp;&nbsp;<tt>lv&nbsp;rv</tt>)
|style="background-color:#eeffcc;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>:.</tt>
|colspan="3" style="text-align:center;border-left:none" |<tt>mu</tt>&nbsp;&nbsp;[[Vocabulary/codot|Assign Obverse]]&nbsp;&nbsp;<tt>lu&nbsp;ru</tt>
|style="background-color:#eeffcc;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>::</tt>
|colspan="3" style="text-align:center;border-left:none;" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/coco|Assign Adverse]]&nbsp;&nbsp;<tt>_&nbsp;_</tt>
|-
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>,</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/comma|Ravel]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/comma#dyadic|Append]]&nbsp;&nbsp;<tt>_&nbsp;_</tt>
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>,.</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/commadot|Ravel Items]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/commadot#dyadic|Stitch]]&nbsp;&nbsp;<tt>_&nbsp;_</tt>
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>,:</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/commaco|Itemize]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/commaco#dyadic|Laminate]]&nbsp;&nbsp;<tt>_&nbsp;_</tt>
|-
|rowspan="4" style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>;</tt>
|rowspan="4" style="text-align:right;border-left:none;border-right:none" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/semi|Raze]]
|rowspan="4" style="border-left:none;border-right:none" |•
|rowspan="4" style="text-align:left;border-left:none" |[[Vocabulary/semi#dyadic|Link]]&nbsp;&nbsp;<tt>_&nbsp;_</tt>
|style="background-color:#eeffcc;border-right:none;border-bottom:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>;.</tt>
|style="text-align:center;border-left:none;border:none" |
|style="border-left:none;border:none" |[[Vocabulary/semidot|Cut]]
|style="text-align:left;border:none" |
|rowspan="4" style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>;:</tt>
|rowspan="4" style="text-align:right;border-left:none;border-right:none" |<tt>1</tt>&nbsp;&nbsp;[[Vocabulary/semico|Words]]
|rowspan="4" style="border-left:none;border-right:none" |•
|rowspan="4" style="text-align:left;border-left:none" |[[Vocabulary/semico#dyadic|Seq. Machine]]&nbsp;&nbsp;<tt>_&nbsp;_</tt>
|-
|style="background-color:#cceeff;border-right:none;border-top:none;border-bottom:none;text-align:center;font-size:1.4em;font-weight:bold;margin:1px" |<tt>;.0</tt>
|style="text-align:center;border:none" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/semidot0|Reversed]]
|style="border-left:none;border:none" |•
|style="text-align:left;border:none" |[[Vocabulary/semidot0#dyadic|Subarray]]&nbsp;&nbsp;<tt>2&nbsp;_</tt>
|-
|style="background-color:#cceeff;border-right:none;border-top:none;border-bottom:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>;.&plusmn;1&nbsp;&plusmn;2</tt>
|style="text-align:center;border:none" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/semidot1|SelfIntervals]]
|style="border-left:none;border:none" |•
|style="text-align:left;border:none" |[[Vocabulary/semidot1#dyadic|Intervals]]&nbsp;&nbsp;<tt>1&nbsp;_</tt>
|-
|style="background-color:#cceeff;border-right:none;border-top:none;;text-align:center;font-size:1.4em;font-weight:bold" |<tt>;.&plusmn;3</tt>
|style="text-align:center;border-right:none;border-top:none;border-left:none;border-bottom:light" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/semidot3|MaxCubes]]
|style="border-left:none;border-right:none;border-top:none;border-left:none;border-bottom:light" |•
|style="text-align:left;border-right:none;border-top:none;border-left:none;border-bottom:light" |[[Vocabulary/semidot3#dyadic|Subarrays]]&nbsp;&nbsp;<tt>2&nbsp;_</tt>
|-
|style="border-left:none;border-right:none" |16:
|-
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>#</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/number|Tally]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/number#dyadic|Copy]]&nbsp;&nbsp;<tt>1&nbsp;_</tt>
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>#.</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>1</tt>&nbsp;&nbsp;[[Vocabulary/numberdot|Base Two]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/numberdot#dyadic|Base]]&nbsp;&nbsp;<tt>1&nbsp;1</tt>
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>#:</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/numberco|Antibase Two]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/numberco#dyadic|Antibase]]&nbsp;&nbsp;<tt>1&nbsp;0</tt>
|-
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>!</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>0</tt>&nbsp;&nbsp;[[Vocabulary/bang|Factorial]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/bang#dyadic|Out Of]]&nbsp;&nbsp;<tt>0&nbsp;0</tt>
|style="background-color:#eeffcc;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>!.</tt>
|colspan="3" style="text-align:center;border-left:none;" |<tt>mu</tt>&nbsp;&nbsp;[[Vocabulary/bangdot|Fit (Customize)]]&nbsp;&nbsp;<tt>lu&nbsp;ru</tt>
|style="background-color:#eeffcc;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>!:</tt>
|colspan="3" style="text-align:center;border-left:none;" |<tt>0</tt>&nbsp;&nbsp;[[Vocabulary/bangco|Foreign (System Functions)]]&nbsp;&nbsp;<tt>0&nbsp;0</tt>
|-
|style="background-color:#cceeff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>/</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/slash|Insert]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/slash#dyadic|Table]]&nbsp;&nbsp;<tt>_&nbsp;_</tt>
|style="background-color:#cceeff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>/.</tt><br><tt>/..</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/slashdot|Oblique]]<br>&nbsp;
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/slashdot#dyadic|Key]]&nbsp;&nbsp;<tt>_&nbsp;_</tt><br>[[Vocabulary/slashdot#dyadic|Key dyad]]&nbsp;&nbsp;<tt>_&nbsp;_</tt>
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>/:</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/slashco|Grade Up]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/slashco#dyadic|Sort Up [Using]]]&nbsp;&nbsp;<tt>_&nbsp;_</tt>
|-
|style="background-color:#cceeff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>\</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/bslash|Prefix]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/bslash#dyadic|Infix]]&nbsp;&nbsp;<tt>_&nbsp;_</tt>
|style="background-color:#cceeff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>\.</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/bslashdot|Suffix]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/bslashdot#dyadic|Outfix]]&nbsp;&nbsp;<tt>_&nbsp;_</tt>
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>\:</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/slashco|Grade Down]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/slashco#dyadic|Sort Down [Using]]]&nbsp;&nbsp;<tt>_&nbsp;_</tt>
|-
|style="border-left:none;border-right:none" |20:
|-
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>[</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/squarelf|Same]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/squarelf#dyadic|Left]]&nbsp;&nbsp;<tt>_&nbsp;_</tt>
|style="background-color:#eeffcc;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>[.</tt>
|colspan="3" style="text-align:center;border-left:none;" |[[Vocabulary/squarelfdot|Lev]]
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>[:</tt>
|colspan="3" style="text-align:center;border-left:none;" |[[Vocabulary/squarelfco|Cap]]
|-
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>]</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/squarert|Same]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/squarert#dyadic|Right]]&nbsp;&nbsp;<tt>_&nbsp;_</tt>
|style="background-color:#eeffcc;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>].</tt>
|colspan="3" style="text-align:center;border-left:none;" |[[Vocabulary/squarertdot|Dex]]
|style="background-color:#cceeff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>]:</tt>
|colspan="3" style="text-align:center;border-left:none;" |[[Vocabulary/squarertco|Ident]]
|-
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>{</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>1</tt>&nbsp;&nbsp;[[Vocabulary/curlylf|Catalogue]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/curlylf#dyadic|From]]&nbsp;&nbsp;<tt>0&nbsp;_</tt>
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>{.</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/curlylfdot|Head]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/curlylfdot#dyadic|Take]]&nbsp;&nbsp;<tt>1&nbsp;_</tt>
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>{:</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/curlylfco|Tail]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>{::</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/curlylfcoco|Map]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/curlylfcoco#dyadic|Fetch]]&nbsp;&nbsp;<tt>1&nbsp;_</tt>
|-
|style="background-color:#cceeff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>}</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/curlyrt|Composite Item]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/curlyrt#dyadic|Amend]]&nbsp;&nbsp;<tt>_&nbsp;_</tt>
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>}.</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/curlyrtdot|Behead]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/curlyrtdot#dyadic|Drop]]&nbsp;&nbsp;<tt>1&nbsp;_</tt>
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>}:</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/curlyrtco|Curtail]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |
|style="background-color:#eeaaaa;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>{{ }}</tt>
|colspan="3" style="text-align:center;border-left:none;" |[[Vocabulary/DirectDefinition|DirectDefinition]]
|-
|style="border-left:none;border-right:none" |24:
|-
|style="background-color:#eeffcc;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>"</tt>
|colspan="3" style="text-align:center;border-left:none;" |[[Vocabulary/quote|Rank]]<br>(<tt>u"n</tt>&nbsp;&nbsp;[[Vocabulary/quote|Assign]], <tt>m"n</tt>&nbsp;&nbsp;[[Vocabulary/quotem|Constant]], <tt>u"v&nbsp;m"v</tt>&nbsp;&nbsp;[[Vocabulary/quotev|Copy]])
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>".</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>1</tt>&nbsp;&nbsp;[[Vocabulary/quotedot|Do]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/quotedot#dyadic|Numbers]]&nbsp;&nbsp;<tt>_&nbsp;_</tt>
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>":</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/quoteco|Default Format]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/quoteco#dyadic|Format]]&nbsp;&nbsp;<tt>1&nbsp;_</tt>
|-
|style="background-color:#eeffcc;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>`</tt>
|colspan="3" style="text-align:center;border-left:none;" |[[Vocabulary/grave|Tie (Gerund)]]
|colspan="4" |
|style="background-color:#eeffcc;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>`:</tt>
|colspan="3" style="text-align:center;border-left:none;" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/graveco|Evoke Gerund]]&nbsp;&nbsp;<tt>_&nbsp;_</tt>
|-
|rowspan="2" style="background-color:#eeffcc;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>@</tt>
|rowspan="2" colspan="3" style="text-align:center;border-left:none;" |<tt>mv</tt>&nbsp;&nbsp;[[Vocabulary/at|Atop]]&nbsp;&nbsp;<tt>lv&nbsp;rv</tt>
|style="background-color:#eeffcc;border-right:none;border-bottom:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>m@.n</tt>
|colspan="3" style="text-align:center;border-left:none;border-bottom:none;" |<tt>mv</tt>&nbsp;&nbsp;[[Vocabulary/atdot|Select From Agenda]]&nbsp;&nbsp;<tt>lv&nbsp;rv</tt>
|rowspan="2" style="background-color:#eeffcc;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>@:</tt>
|rowspan="2" colspan="3" style="text-align:center;border-left:none;" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/atco|At]]&nbsp;&nbsp;<tt>_&nbsp;_</tt>
|-
|style="background-color:#eeffcc;border-right:none;border-top:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>m@.v</tt>
|colspan="3" style="border-top:none;border-left:none;border-right:none;text-align:center;|<tt>mv</tt>&nbsp;&nbsp;[[Vocabulary/atdot#agent|Agent]]&nbsp;&nbsp;<tt>mv&nbsp;mv</tt>
|-
|style="background-color:#eeffcc;border-right:none;border-bottom:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>m&v u&n</tt>
|style="vertical-text-align:center;text-align:right;border-left:none;border-right:none;border-bottom:none;" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/ampm|Bond]]
|style="vertical-text-align:center;border-left:none;border-bottom:none;border-right:none" |•
|style="text-align:left;border-left:none;border-bottom:none;" |&nbsp;
|rowspan="2" style="background-color:#eeffcc;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>&.</tt>
|rowspan="2" colspan="3" style="text-align:center;border-left:none;" |<tt>mv</tt>&nbsp;&nbsp;[[Vocabulary/ampdot|Under (Dual)]]&nbsp;&nbsp;<tt>mv&nbsp;mv</tt>
|rowspan="2" style="background-color:#eeffcc;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>&:</tt>
|rowspan="2" colspan="3" style="text-align:center;border-left:none;" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/ampco|Appose]]&nbsp;&nbsp;<tt>_&nbsp;_</tt>
|rowspan="2" style="background-color:#eeffcc;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>&.:</tt>
|rowspan="2" colspan="3" style="text-align:center;border-left:none;" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/ampdotco|Under]]&nbsp;&nbsp;<tt>_&nbsp;_</tt>
|-
|style="background-color:#eeffcc;border-right:none;border-top:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>u&v</tt>
|colspan="3" style="border-top:none;border-left:none;border-right:none;text-align:center;|<tt>mv</tt>&nbsp;&nbsp;[[Vocabulary/ampv|Compose]]&nbsp;&nbsp;<tt>mv&nbsp;mv</tt>
|-
|rowspan="2" style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>?</tt>
|rowspan="2" style="text-align:right;border-left:none;border-right:none" |<tt>0</tt>&nbsp;&nbsp;[[Vocabulary/query|Roll]]
|rowspan="2" style="border-left:none;border-right:none" |•
|rowspan="2" style="text-align:left;border-left:none" |[[Vocabulary/query#dyadic|Deal]]&nbsp;&nbsp;<tt>0&nbsp;0</tt>
|rowspan="2" style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>?.</tt>
|style="text-align:right;border-left:none;border-right:none;border-bottom:none;" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/querydot|Roll]]
|style="border-left:none;border-right:none;border-bottom:none;" |•
|style="text-align:left;border-left:none;border-bottom:none;" |[[Vocabulary/querydot#dyadic|Deal]]&nbsp;&nbsp;<tt>0&nbsp;0</tt>
|rowspan="2" style="background-color:#ffccee;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>a.</tt>
|rowspan="2" colspan="3" style="text-align:center;border-left:none;" |[[Vocabulary/adot|Alphabet (all bytes)]]
|-
|colspan="3" style="text-align:center;border-left:none;border-top:none;" |(fixed seed)
|-
|style="border-top:light;border-left:none;border-right:none" |29:
|-
|style="background-color:#ffccee;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>a:</tt>
|colspan="3" style="text-align:center;border-left:none;" |[[Vocabulary/aco|Ace (Boxed Empty)]]
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>A.</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>1</tt>&nbsp;&nbsp;[[Vocabulary/acapdot|Anagram Index]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/acapdot#dyadic|Anagram]]&nbsp;&nbsp;<tt>0&nbsp;_</tt>
|style="background-color:#cceeff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>m b.</tt><br/><tt>u b.</tt>
|colspan="3" style="text-align:center;border-left:none;" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/bdot|Boolean]], [[Vocabulary/bdot#bitwise|Bitwise]], [[Vocabulary/bdot#bitshift|Bitwise Shift]]&nbsp;&nbsp;<tt>0&nbsp;0</tt> <br/>
<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/bdotu|Verb Info (Obverse, Rank, Identity)]]
|-
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>c.</tt>
|style="text-align:right;border-left:none;border-right:none" |
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/cdot|Convert to Precision]]&nbsp;&nbsp;<tt>_&nbsp;_</tt>
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>C.</tt><br/>
<tt>C.!.2</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>1</tt>&nbsp;&nbsp;[[Vocabulary/ccapdot|Cycle-Direct]] <br/>
<tt>1</tt>&nbsp;&nbsp;[[Vocabulary/ccapdot#permparity|Permutation Parity]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/ccapdot#dyadic|Permute]]&nbsp;&nbsp;<tt>1&nbsp;_</tt> <br/>
<small><tt>&nbsp;</tt></small>
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>e.</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/edot|Raze In]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/edot#dyadic|Member (In)]]&nbsp;&nbsp;<tt>_&nbsp;_</tt>
|-
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>E.</tt>
|style="text-align:right;border-left:none;border-right:none" |
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/ecapdot|Find Matches]]&nbsp;&nbsp;<tt>_&nbsp;_</tt>
|style="background-color:#cceeff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>f.</tt>
|colspan="3" style="text-align:center;border-left:none;" |[[Vocabulary/fdot|Fix]]
|style="background-color:#eeffcc;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>F. F.. F.:<br/>F: F:. F::</tt>
|colspan="3" style="text-align:center;border-left:none;" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/fcap|Fold]]&nbsp;&nbsp;<tt>_&nbsp;_</tt>
|-
|style="background-color:#eeffcc;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>H.</tt>
|colspan="3" style="text-align:center;border-left:none;" |<tt>0</tt>&nbsp;&nbsp;[[Vocabulary/hcapdot|Hypergeometric]]&nbsp;&nbsp;<tt>0&nbsp;0</tt>
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>i.</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>1</tt>&nbsp;&nbsp;[[Vocabulary/idot|Integers]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/idot#dyadic|Index Of]]&nbsp;&nbsp;<tt>_&nbsp;_</tt>
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>i:</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>0</tt>&nbsp;&nbsp;[[Vocabulary/ico|Steps]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/ico#dyadic|Index Of Last]]&nbsp;&nbsp;<tt>_&nbsp;_</tt>
|-
|style="border-left:none;border-right:none" |33:
|-
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>I.</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>1</tt>&nbsp;&nbsp;[[Vocabulary/icapdot|Indices]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/icapdot#dyadic|Interval Index]]&nbsp;&nbsp;<tt>_&nbsp;_</tt>
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>j.</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>0</tt>&nbsp;&nbsp;[[Vocabulary/jdot|Imaginary]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/jdot#dyadic|Complex]]&nbsp;&nbsp;<tt>0&nbsp;0</tt>
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>L.</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/lcapdot|Level Of]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |
|-
|style="background-color:#eeffcc;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>L:</tt>
|colspan="3" style="text-align:center;border-left:none;" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/lcapco|Level At]]&nbsp;&nbsp;<tt>_&nbsp;_</tt>
|style="background-color:#eeffcc;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>m.</tt>
|colspan="3" style="text-align:center;border-left:none;" |<tt>mu</tt>&nbsp;&nbsp;[[Vocabulary/mdot|Modular arithmetic]]&nbsp;&nbsp;<tt>lu&nbsp;ru</tt>
|style="background-color:#cceeff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>M.</tt>
|colspan="3" style="text-align:center;border-left:none;" |<tt>mu</tt>&nbsp;&nbsp;[[Vocabulary/mcapdot|Memo]]&nbsp;&nbsp;<tt>lu&nbsp;ru</tt>
|-
|style="background-color:#dddddd;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>NB.</tt>
|colspan="3" style="text-align:center;border-left:none;" |[[Vocabulary/ncapbcapdot|Comment]]
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>o.</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>0</tt>&nbsp;&nbsp;[[Vocabulary/odot|Pi Times]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/odot#dyadic|Circle Function]]&nbsp;&nbsp;<tt>0&nbsp;0</tt>
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>p.</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>1</tt>&nbsp;&nbsp;[[Vocabulary/pdot|Roots]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/pdot#dyadic|Polynomial]]&nbsp;&nbsp;<tt>1&nbsp;0</tt>
|-
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>p..</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>1</tt>&nbsp;&nbsp;[[Vocabulary/pdotdot|Polynomial Deriv.]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/pdotdot#dyadic|Polynomial Int.]]&nbsp;&nbsp;<tt>0&nbsp;1</tt>
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>p:</tt>
|colspan="3" style="text-align:center;border-left:none;" |<tt>0</tt>&nbsp;&nbsp;[[Vocabulary/pco|Primes]]&nbsp;&nbsp;<tt>_&nbsp;_</tt>
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>q:</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/qco|Prime Factors]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/qco#dyadic|Prime Exponents]]&nbsp;&nbsp;<tt>0&nbsp;0</tt>
|-
|style="border-left:none;border-right:none" |37:
|-
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>r.</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>0</tt>&nbsp;&nbsp;[[Vocabulary/rdot|Angle]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/rdot#dyadic|Polar]]&nbsp;&nbsp;<tt>0&nbsp;0</tt>
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>s:</tt>
|colspan="3" style="text-align:center;border-left:none;" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/sco|Symbol]]&nbsp;&nbsp;<tt>_&nbsp;_</tt>
|style="background-color:#eeffcc;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>S:</tt>
|colspan="3" style="text-align:center;border-left:none;" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/scapco|Spread]]&nbsp;&nbsp;<tt>_&nbsp;_</tt>
|-
|style="background-color:#eeffcc;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>t.</tt>
|colspan="3" style="text-align:center;border-left:none;" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/tdot|Run as task]]&nbsp;&nbsp;<tt>_&nbsp;_</tt>
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>T.</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/tcapdot|Set debug thread]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/tcapdot#dyadic|Threads/tasks]]&nbsp;&nbsp;<tt>_&nbsp;_</tt>
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>u:</tt>
|colspan="3" style="text-align:center;border-left:none;" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/uco|Unicode]]&nbsp;&nbsp;<tt>_&nbsp;_</tt>
|-
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>x:</tt>
|colspan="3" style="text-align:center;border-left:none;" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/xco|Extended Precision]]&nbsp;&nbsp;<tt>_&nbsp;_</tt>
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>Z:</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/zcapco|Get Fold status]]
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |[[Vocabulary/zcapco#dyadic|Terminate Fold]]&nbsp;&nbsp;<tt>_&nbsp;_</tt>
|style="background-color:#ddccff;text-align:center;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>_9:</tt> to <tt>9:</tt>
|colspan="3" style="text-align:center;border-left:none;" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/zeroco|Constant Functions]]&nbsp;&nbsp;<tt>_&nbsp;_</tt>
|-
|style="background-color:#eeffcc;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>'' '''(u v)''' '' </tt>
|colspan="3" style="text-align:center;border-left:none;" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/hook|Hook]]&nbsp;&nbsp;<tt>_&nbsp;_</tt>
|style="background-color:#eeffcc;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>'' '''(f g h)''' ''</tt>
|colspan="3" style="text-align:center;border-left:none;" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/fork|Fork]]&nbsp;&nbsp;<tt>_&nbsp;_</tt><br>[[Vocabulary/fork#invisiblemodifiers|Modifier trains]]
|style="background-color:#ddccff;border-right:none;text-align:center;font-size:1.4em;font-weight:bold;font-weight:bold" |<tt>u. v.</tt>
|colspan="3" style="text-align:center;border-left:none;" |<tt>_</tt>&nbsp;&nbsp;[[Vocabulary/udot|<tt>u</tt>/<tt>v</tt> in caller's context]]&nbsp;&nbsp;<tt>_&nbsp;_</tt>
|-
|style="border-left:none;border-right:none" |41: <span id="controls"></span>
|-
|style="background-color:#eeaaaa;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>assert.</tt>
|colspan="3" style="text-align:center;border-left:none;" |[[Vocabulary/assertdot|Assertion]]
|style="background-color:#eeaaaa;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>break.</tt>
|colspan="3" style="text-align:center;border-left:none;" |[[Vocabulary/breakdot|Terminate loop]]
|style="background-color:#eeaaaa;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>continue.</tt>
|colspan="3" style="text-align:center;border-left:none;" |[[Vocabulary/continuedot|Terminate iteration]]
|-
|style="background-color:#eeaaaa;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>else.</tt><br><tt>elseif.</tt>
|colspan="3" style="text-align:center;border-left:none;" |[[Vocabulary/elsedot|Execute alternative]]
|style="background-color:#eeaaaa;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>for.</tt><br><tt>for_ijk.</tt>
|colspan="3" style="text-align:center;border-left:none;" |[[Vocabulary/fordot|Repeat for each item]]
|style="background-color:#eeaaaa;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>goto_lbl.</tt><br><tt>label_lbl.</tt>
|colspan="3" style="text-align:center;border-left:none;" |[[Vocabulary/gotodot|Go to label]]
|-
|style="background-color:#eeaaaa;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>if.</tt>
|colspan="3" style="text-align:center;border-left:none;" |[[Vocabulary/ifdot|Execute if]]
|style="background-color:#eeaaaa;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>return.</tt>
|colspan="3" style="text-align:center;border-left:none;" |[[Vocabulary/returndot|Exit with result]]
|style="background-color:#eeaaaa;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>select.</tt><br><tt>case.</tt><br><tt>fcase.</tt>
|colspan="3" style="text-align:center;border-left:none;" |[[Vocabulary/selectdot|Select among alternatives]]
|-
|style="background-color:#eeaaaa;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>throw.</tt>
|colspan="3" style="text-align:center;border-left:none;" |[[Vocabulary/throwdot|Throw to higher-level <tt>catcht.</tt>]]
|style="background-color:#eeaaaa;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>try.</tt><br><tt>catch.</tt><br><tt>catchd.</tt><br><tt>catcht.</tt>
|colspan="3" style="text-align:center;border-left:none;" |[[Vocabulary/trydot|Execute, catching errors]]
|style="background-color:#eeaaaa;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>while.</tt><br><tt>whilst.</tt>
|colspan="3" style="text-align:center;border-left:none;" |[[Vocabulary/whiledot|Loop while]]
|-
|style="border-left:none;border-right:none" |45: obsolete<span id="obsolete"></span>
|-
|style="background-color:#eeffcc;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>d.</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>0</tt>&nbsp;&nbsp;''[[Vocabulary/ddot|Ordinary]]<br/>[[Vocabulary/ddot|Derivative]]''
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |
|style="background-color:#eeffcc;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>u D.</tt><br/><tt>m D.</tt>
|style="text-align:right;border-left:none;border-right:none" |<tt>mu</tt>&nbsp;&nbsp;''[[Vocabulary/dcapdot|Derivative]]'' <br/>
<tt>mu</tt>&nbsp;&nbsp;''[[Vocabulary/dcapdot#dcapdotm|Assign Derivative]]''
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |
|style="background-color:#eeffcc;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>D:</tt>
|style="text-align:right;border-left:none;border-right:none" |
|style="border-left:none;border-right:none" |•
|style="text-align:left;border-left:none" |''[[Vocabulary/dcapco|Secant Slope]]''&nbsp;&nbsp;<tt>mu&nbsp;mu</tt>
|-
|style="background-color:#eeffcc;border-right:none;text-align:center;font-size:1.4em;font-weight:bold" |<tt>m&v u&n</tt>
|colspan="3" style="text-align:center" |<tt>0</tt>&nbsp;&nbsp;''[[Vocabulary/ampm#dyadic|PowerBond]]''

|}
----
<span id="bottomrefs"></span>

=== Ancillary Pages ===

These are special articles written to comply with NuVoc standards, and tagged: Category:NuVoc.

They explain principles and practice in greater depth than appropriate on the primitives' pages themselves (all tagged: CategoryVoc), or which are relevant to more than one page.

They are <i>task-oriented</i> rather than <i>function-oriented</i>

* i.e. they describe features from the point-of-view of what the reader wants to achieve, rather than document J's functionality (as the primitive-pages do)

These pages are linked from the primitive-pages themselves, at the point where they are relevant.

But for convenient lookup and revision, they are listed below:

:{| class="wikitable"
|-
|[[Guides/GettingStartedSerious#Useful_Resources|J Reference Sheets]]
| One Sheet J Reference pages for J602 and J90X
|-
|[[Vocabulary/AboutNuVoc]]
|About the Accessible Dictionary: how and why
|-
|[[Vocabulary/AccurateAccumulation]]
|<tt>+/!.0 y</tt> and <tt>x +/@:*"1!.0 y</tt> to avoid roundoff error
|-
|[[Vocabulary/AET]]
|"Absolutely essential J terms" to know for NuVoc
|-
|[[Vocabulary/Agreement]]
|How argument cells are matched for dyads (with tables)
|-
|[[Vocabulary/AmendingBoxedStructures]]
|Making replacements inside a boxed array
|-
|[[Vocabulary/ArrayProcessing]]
|How do you process an array? (an introduction)
|-
|[[Vocabulary/Assignment]]
|Private and public assignment explained
|-
|[[Vocabulary/Beginner%27sQ%26A|Vocabulary/Beginner's Q&A]]
|What a beginner needs to know, in brief
|-
|[[Vocabulary/Constants]]
|Number formation (an intro by examples)
|-
|[[Vocabulary/ControlStructures]]
|Control words used in J definitions
|-
|[[Vocabulary/CyclicGerund]]
|Cyclic gerunds explained
|-
|[[Vocabulary/Debug]]
|How to debug an explicit definition
|-
|[[Vocabulary/Dictionaries (addon)]]
|Threadsafe ordered and unordered maps
|-
|[[Vocabulary/DirectDefinition]]
|Use <tt>{{ }}</tt> to write explicit definitions
|-
|[[Vocabulary/Dissect]]
|Pictorial view and analysis of a J sentence
|-
|[[Vocabulary/EZRank]]
|Rank in a hurry: "rank" concept rapidly explained
|-
|[[Vocabulary/EmptyArguments]]
|What happens when an argument to a verb has no atoms, or no cells (two different conditions!)
|-
|[[Vocabulary/ErrorMessages]]
|Error Messages (formal table plus explanations)
|-
|[[Vocabulary/Foreigns]]
|System Functions and Miscellaneous Features (<tt>m!:n</tt>)
|-
|[[Vocabulary/FramingFill]]
|Result collection and framing fill explained
|-
|[[Vocabulary/GerundsAndAtomicRepresentation]]
|Gerunds and Atomic Representation explained
|-
|[[Vocabulary/Glossary]]
|J terms (a comprehensive formal list)
|-
|[[Vocabulary/HowNuVoc]] &nbsp; <b><tt><--START HERE--</tt></b>
|How to use NuVoc
|-
|[[Vocabulary/IFamily]]
|The <tt>i.</tt>-family of verbs described
|-
|[[Vocabulary/Idioms]]
|Common Idioms used in J best practice
|-
|[[Vocabulary/Inverses]]
|Inverse and Obverse explained
|-
|[[Vocabulary/JBreak]]
|JBreak: forcing J to stop executing the current process
|-
|[[Vocabulary/LAPACK]]
|J interface to the LAPACK library
|-
|[[Vocabulary/Lint]]
|How to use <tt>lint</tt>: the builtin Program Flow Analyzer
|-
|[[Vocabulary/Libraries]]
|The J Libraries and what they do
|-
|[[Vocabulary/Locales]]
|Locales explained
|-
|[[Vocabulary/Loopless]]
|Loopless programming explained: repeating a function on cells, partitions, subarrays, etc.
|-
|[[Vocabulary/Modifiers]]
|Modifiers (adverbs and conjunctions) explained
|-
|[[Vocabulary/ModifierTrains]]
|Rules and examples for using modifier trains such as <tt>([.*].)</tt>
|-
|[[Vocabulary/NounExplicitDefinition]]
|How to define a noun as an explicit entity using (<tt>:</tt>)
|-
|[[Vocabulary/Nouns]]
|All about Nouns
|-
|[[Vocabulary/NumericPrecisions]]
|Numeric Precisions in J
|-
|[[Vocabulary/ObjectOrientedProgramming]]
|Object-Oriented Programming in J
|-
|[[Vocabulary/Parsing]]
|How sentences are executed, step by step
|-
|[[Vocabulary/PartsOfSpeech]]
|The Parts of Speech: Noun, Verb, etc.  Call by name and call by value.
|-
|[[Guides/Performance_Monitor|Guides/Performance Monitor]]
|Profile execution to find slow spots
|-
|[[Vocabulary/ObsoleteSyntax]]
|No-longer-supported features of earlier version of J, seen in some of the older references.
|-
|[[Vocabulary/Printf]]
|How to use the <tt>printf</tt> addon
|-
|[[Vocabulary/RankFromV]]
|The rank of a verb created by an adverb or conjunction
|-
|[[Vocabulary/RankInfo]]
|Rank Information linked from CategoryVoc pages
|-
|[[Vocabulary/RankInfoIsImportant]]
|Why is the rank of a verb important to know?
|-
|[[Vocabulary/ReadingASentence]]
|A beginner's guide to reading sentences
|-
|[[Guides/Regular Expressions/Overview]]
|Regex in J
|-
|[[Vocabulary/ScreenOutputInput]]
|Screen output and input explained
|-
|[[Vocabulary/SpecialCombinations]]
|Special Combinations of primitives (with tables)
|-
|[[Vocabulary/TBlock]]
|Clarification of the <b>T-block</b> and the <b>B-block</b> in an <tt>if.</tt>-statement
|-
|[[Vocabulary/TestYourJ]]
|Test Your J (tells you if you've any need of NuVoc)
|-
|[[Vocabulary/Unreadability]]
|The alleged unreadability of J - and what to do about it
|-
|[[Vocabulary/UnicodeCodePoint]]
|The Unicode Code Point (UCP) explained
|-
|[[Vocabulary/Valence]]
|Verb <i>valence</i> explained
|-
|[[Vocabulary/Verbs]]
|All about Verbs
|-
|[[Vocabulary/VerbRank]]
|Verb rank, and how J extends small verbs to big arrays
|-
|[[JDic:vocabul]]
|VOC - the original "pro version" of this portal page
|-
|[[Vocabulary/Words]]
|All about J Words
|-
|[[Vocabulary/ZeeLocale]]
|"Factory words" - the z-locale and its contents
|}

----
[[Category:NuVoc]]

