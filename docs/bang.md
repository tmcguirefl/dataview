# Vocabulary/bang - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/bangdot "Vocabulary/bangdot") [<<](https://code.jsoftware.com/wiki/Vocabulary/numberco "Vocabulary/numberco")   [Down to: Dyad](#dyadic)   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d410.htm "jdic:d410")

<table class="wikitable"><tbody><tr><td><tt>! y</tt></td><td>Factorial</td></tr></tbody></table>

[Rank 0](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank0a "Vocabulary/RankInfo") _\-- operates on individual atoms of y, producing a result of the same shape --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

The _Factorial_ of y.

Might be regarded as a special case of the _Stope_ function (see link below), for start value identical to number of steps and step size \_1:   n ^!.\_1 n .

```
   \*/ 5 4 3 2 1    NB. product (5th 'falling power' of 5)
120
   ! 5             NB. gets abbreviated
120
   ! i.6           NB. 0! = 1
1 1 2 6 24 120

```

More generally, it computes the _[Gamma function](https://en.wikipedia.org/wiki/Gamma_function "wikipedia:Gamma function")_ of (1+y) (sometimes called the [Pi function](https://en.wikipedia.org/wiki/Pi_function "wikipedia:Pi function")). If we defined Ga(y) as _Gamma_ of real argument (y) we get

```
   gamma=: ga=: !@<: : \[:      NB. monadic Ga(y)= (y-1)!

   ga \_1r4p1    NB. Ga(-π/4)
\_5.42531
   ga 0         NB. Ga(0)
\_
   ga -i.6
\_ \_\_ \_ \_\_ \_ \_\_
   ga 1 = ! 0   NB. Ga(1)= 1 = 0!
1
   ga 1p1       NB. Ga(π)
2.28804
   ga 2p1       NB. Ga(2π)
195.936
   !(<:2p1)     NB. (2π-1)!
195.936

   exp=: ^ : \[:                NB. Exponential function, monad

   NB. calculating the (positive) intersections of exp(y)and ga(y) by
   NB. solving exp(y)- ga(y)= 0 numerically, using Newton-Raphson
   NB. with seed values 1 and 10, resp

   (exp-ga) VN^:\_ (1)       NB. IP4=~ (0.52;1.69)
0.524922
   ga (exp-ga) VN^:\_ (1)
1.69033
   (exp-ga) VN^:\_ (10)      NB. IP5=~ (7.46;1743)
7.4636
   ga (exp-ga) VN^:\_ (10)   NB. Gamma overtaking the Exponential
1743.42

```
---

<table class="wikitable"><tbody><tr><td><tt>x&nbsp;! y</tt></td><td>Out Of</td></tr></tbody></table>

[Rank 0 0](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#rank00a "Vocabulary/RankInfo") _\-- operates on individual atoms of x and y, producing a result of the same shape --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Returns y_\-Combinations-_x:  **yCx**  (read: x out of y  or: y pick x).

The number of ways of picking x balls (unordered) from a bag of y balls:

```
   10!10      NB. There is only 1 way of picking all 10 balls
1
   1!10       NB. There are 10 ways of choosing 1 ball from 10
10
   2!10       NB. 45 ways to pick 2 out of 10
45
   5!10
252

```

This example was found in K.E. Iverson, Computers and Mathematical Notation, [E. Ambivalence](http://www.jsoftware.com/papers/camn.htm); the table shows the first five rows of Pascal's Triangle:

```
   0 1 2 3 4 !/ 0 1 2 3 4       NB. 'Out Of' table "with meaningful zeros"
1 1 1 1 1
0 1 2 3 4
0 0 1 3 6
0 0 0 1 4
0 0 0 0 1

   |:!/~i.5                     NB. (transposed view)
1 0 0 0 0
1 1 0 0 0
1 2 1 0 0
1 3 3 1 0
1 4 6 4 1

```

### Common uses

In Probability theory, also Functional Analysis (Infinite Series).

---

### Details

In general x ! y is defined as (!y) % (!x) \* (!(y-x)) .

[Stope Function](https://code.jsoftware.com/wiki/Vocabulary/hat#stope "Vocabulary/hat") (^!.\_1 y) to count permutations.

---

### See Also

[John D. Cook, Binomial Coefficients](http://www.johndcook.com/blog/binomial_coefficients/) discusses the domain of this operation, giving three definitions (from basic to general). There, x!y would be represented using a pixelated image, with x on the bottom and y on the top, both surrounded by extra large parenthesis. Something like this:

 
```
{y \choose x}
```
  or    
```
\binom{y}{x}
```
  in 'Math' (subset of LaTeX) notation.

---
