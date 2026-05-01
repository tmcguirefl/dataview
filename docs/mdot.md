# Vocabulary/mdot - J Wiki

From J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/mcapdot "Vocabulary/mcapdot") [<<](https://code.jsoftware.com/wiki/Vocabulary/lcapco "Vocabulary/lcapco")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc")

<table class="wikitable"><tbody><tr><td><tt>[x] u m. n y</tt></td><td>Modular arithmetic: <tt>[x] u y</tt> (mod <tt>n</tt>)</td><td>Conjunction</td></tr></tbody></table>

[Rank](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#ranku "Vocabulary/RankInfo") _\-- depends on the rank of u --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

\[x\] u m. n y performs the operation given in standard mathematical notation as \[x\] u y (mod n).

```
   2 (+ m. 5) 4
1

```
-   u must be one of the following:

<table class="wikitable"><tbody><tr><th>monadic</th><td><tt>%</tt></td><td><tt>%.</tt></td><td><tt>-/ .*</tt></td></tr></tbody></table>

<table class="wikitable"><tbody><tr><th>dyadic</th><td><tt>+</tt></td><td><tt>-</tt></td><td><tt>*</tt></td><td><tt>^</tt></td><td><tt>%</tt></td><td><tt>%.</tt></td></tr></tbody></table>

-   The monad is supported only for % %., where it returns the [modular multiplicative inverse](https://en.wikipedia.org/wiki/Modular_multiplicative_inverse) and for (-/ . \*), where it returns modular determinant.
-   x, y, and n must be tolerantly integral or extended.
-   Fast computation using integers is performed when n is small enough; otherwise extended integers are used.
-   The result is integer when the computation was done using integers and n is not extended or rational; otherwise extended integer.
-   x % m. n y, and x ^ m. n y when y is negative, operate on the modular multiplicative inverse and give domain error if that inverse does not exist.
---

### Performance Note

Executing x (u m. n) y requires two execution steps:

-   u m. n is executed to produce a _**derived verb**_
-   the derived verb is executed on the x and y arguments

If n is a small integer (on 64-bit systems, small is any value whose absolute value is less than 3037000499), producing the derived verb takes much more time than executing it on atomic arguments. If you are going to execute (u m. n) repeatedly, you would be well advised to assign it to a name, preferably a private name:

```
   plusmod =. + m. n

```

The derived verb will be assigned to the name plusmod and will not have to be recreated for each use.
