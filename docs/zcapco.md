# Vocabulary/zcapco - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/zeroco "Vocabulary/zeroco") [<<](https://code.jsoftware.com/wiki/Vocabulary/xco "Vocabulary/xco")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc")

<table class="wikitable"><tbody><tr><td><tt>Z: y</tt></td><td>Get Fold status</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank "Vocabulary/RankInfo") _\-- operates on x and y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

Returns information about the currently executing [Fold](https://code.jsoftware.com/wiki/Vocabulary/fcap "Vocabulary/fcap").

<table><tbody><tr><td>&nbsp;Executed&nbsp;phrase&nbsp;</td><td>&nbsp;Meaning of result</td></tr><tr><td>&nbsp; <tt>Z: 0</tt></td><td>The number of times <tt>v</tt> has started execution</td></tr><tr><td>&nbsp; <tt>Z: 1</tt></td><td>The number of times <tt>u</tt> has started execution</td></tr><tr><td>&nbsp; <tt>Z: 2</tt></td><td>The number of times a result of <tt>u</tt> has been moved to the overall result</td></tr></tbody></table>

---

<table class="wikitable"><tbody><tr><td><tt>x Z: y</tt></td><td>Terminate Fold</td></tr></tbody></table>

[Rank Infinity](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank "Vocabulary/RankInfo") _\-- operates on x and y as a whole --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

Terminates [Fold](https://code.jsoftware.com/wiki/Vocabulary/fcap "Vocabulary/fcap"), in whole or part.

```
\_2 Z: 0   NB. no-op
\_2 Z: 1   NB. force termination of overrunning Fold

```

The phrases (x Z: 1) and (\_3 Z: n) _are the only ways_ to terminate F. and F: .

But the primitive Z: can prematurely terminate any [Fold](https://code.jsoftware.com/wiki/Vocabulary/fcap "Vocabulary/fcap"), or skip the production of wasted data in any given iteration of [Fold](https://code.jsoftware.com/wiki/Vocabulary/fcap "Vocabulary/fcap").

---

### Common Uses

1\. Halt [Unlimited Fold](https://code.jsoftware.com/wiki/Vocabulary/fcap#unlimited "Vocabulary/fcap") (F. or F:) after N iterations of Fold operand u or raise limit error.

```
   v=: {{
\_3 Z: 20         NB. raise limit error if we've done 20 iterations (protect against infinite loop)
\_2 Z: x <: Z:1   NB. terminate fold if we've done x iterations of u
>:y              NB. increment y
}}

   15 \] F: v 0   NB. increment y 15 times, collecting results
1 2 3 4 5 6 7 8 9 10 11 12 13 14 15

   30 \] F: v 0   NB. here our "20 iterations" limit is exceeded
|fold limit, executing dyad \]F:(4 : ...)
|   30    \]F:v 0

```

2\. Increase computational efficiency by aborting a wasteful computation.

Similar code to #1 except:

-   the x-argument of Z: should be an integer in the list: (\_3 \_2 \_1 0 1).
-   the y-argument of Z: should be a boolean condition detecting a wasteful application of u and/or v.
---

### More Information

The result of (x Z: y) is always $0 (an empty list).

-   If y is 0, no action is performed.
-   If y is 1, the action depends on x as shown in the table below.

<table><tbody><tr><td>&nbsp;Executed&nbsp;phrase&nbsp;</td><td>&nbsp;Effect</td></tr><tr><td>&nbsp; <tt>_3 Z: n</tt></td><td>If the Fold has already started execution of <tt>v</tt> at least <tt>n</tt> times, abort the fold with a <tt>fold limit</tt> error. Otherwise continue.<p><small>Useful to ensure that an <i>unlimited</i> fold (viz. <tt>F.</tt> or <tt>F:</tt>) does not run forever.</small></p></td></tr><tr><td>&nbsp; <tt>_2 Z: 1</tt></td><td>Execution of the enclosing Fold terminates immediately, with the result being the result after the last execution of <tt>u</tt>. If nothing has been added to the overall result, <tt>no result</tt> is signaled.</td></tr><tr><td>&nbsp; <tt>_1 Z: 1</tt></td><td>Execution of the current iteration terminates immediately. The next iteration begins with the next new value as <tt>x</tt>. The value of <tt>y</tt> in the next iteration is the result of the most recent execution of <tt>v</tt> that ran to completion. Nothing is added to the overall result for the current iteration.</td></tr><tr><td>&nbsp; <tt>&nbsp;0 Z: 1</tt></td><td>Execution of the enclosing Fold continues, but the result of the current execution of <tt>u</tt> is ignored. For Fold Multiple, nothing is added to the overall result. For Fold Single, the overall result is left unchanged from the previous iteration.</td></tr><tr><td>&nbsp; <tt>&nbsp;1 Z: 1</tt></td><td>Execution of the enclosing Fold continues but stops after the next completion of <tt>u</tt>.</td></tr></tbody></table>
