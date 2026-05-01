# Vocabulary/codot - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/coco "Vocabulary/coco") [<<](https://code.jsoftware.com/wiki/Vocabulary/cou "Vocabulary/cou")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc") [Thru to: Dictionary](https://www.jsoftware.com/help/dictionary/d311.htm "jdic:d311")

<table class="wikitable"><tbody><tr><td><tt>u&nbsp;:. v</tt></td><td>Obverse</td><td>Conjunction</td></tr></tbody></table>

[Rank](https://code.jsoftware.com/wiki/Vocabulary/RankInfo#ranku "Vocabulary/RankInfo") _\-- depends on the rank of u --_ [WHY IS THIS IMPORTANT?](https://code.jsoftware.com/wiki/Vocabulary/RankInfoIsImportant "Vocabulary/RankInfoIsImportant")

---

Creates a new [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") that behaves the same as u, except that its [obverse](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Obverse "Vocabulary/Glossary") is v

```
   append1 =: , :. }.  NB. Like , but obverse is }.
   'ab' append1 'cd'
abcd
   append1^:\_1 'abcd'  NB. This executes the obverse
bcd

```

The obverse of u is called by  u^:\_1 or  u&.v or  u&.:v .

Normally the obverse is the same as the inverse, i.e. a [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") that undoes the action of u . But u:.v can be used to assign an obverse when the default inverse is undefined or incorrect.

---

### Common uses

1\. Supply or correct the obverse of a [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") so that it can be used as the v of u&.v

```
verbname =: definition :. correct\_inverse

```

Consider a system that knows two formats for time:

-   a 3-[atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") [list](https://code.jsoftware.com/wiki/Vocabulary/AET#List "Vocabulary/AET") of hours/minutes/seconds (hms form)
-   an [atom](https://code.jsoftware.com/wiki/Vocabulary/AET#Atom "Vocabulary/AET") containing seconds from midnight (time form)

Verbs to convert between the two formats:

```
hmstotime =: 24 60 60&#."1
timetohms =: 24 60 60&#:"0
   \]hmss =: 2 3 $ 9 30 0 16 0 0  NB. two times in hms...
 9 30 0
16  0 0
   \]ts =: hmstotime hmss   NB. ...and in seconds from midnight
34200 57600

```

We would like to be able to compute in either format. So we should be able to add times in hms by converting to time and then converting back

```
   hmss +&.hmstotime 0 45 0  NB. go to time form to handle overflow of minutes: 45 minutes after the times
10 15 0
16 45 0

```

We should be able to add in hms form too:

```
   ts +&.timetohms 60   NB. add 60 seconds to ts... catastrophe!
32949 113491 0
58576   3661 0

```

What happened!?? We were expecting two times!

u b. \_1 shows the inverse of the verb u. That quickly reveals the problem

```
   timetohms b. \_1
24 60 60&#."0
   hmstotime b. \_1
24 60 60&#:"1

```

Those [ranks](https://code.jsoftware.com/wiki/Vocabulary/AET#Rank "Vocabulary/AET") are incorrect. The inverse of timetohms, which should convert an hms to a time, needs to have rank 1, and the inverse of hmstotime needs to have rank 0. The fix is easy - we assign the correct obverse to each verb

```
hmstotime =: 24 60 60&#."1 :. timetohms
timetohms =: 24 60 60&#:"0 :. hmstotime

```

and now:

```
   ts +&.timetohms 60
34260 57660

```

as expected.

---

[Under (Dual)](https://code.jsoftware.com/wiki/Vocabulary/ampdot "Vocabulary/ampdot") (u&.v), [Under (Dual)](https://code.jsoftware.com/wiki/Vocabulary/ampdotco "Vocabulary/ampdotco") (u&.:v)

---

### More Information

1.  . The [default inverses](https://code.jsoftware.com/wiki/Vocabulary/Inverses "Vocabulary/Inverses") are most ingenious and worth a look.
2.  . To see the obverse of the [verb](https://code.jsoftware.com/wiki/Vocabulary/AET#Verb "Vocabulary/AET") u, execute  u b. \_1 .
---

### Details

1\. The obverse of u :. v is v :. u. This is not obvious.

Consider

```
   u =: +
   v =: + :. -
   uv =: u :. v

```

Now, consider the obverse of uv -- is it v? The definition seems to say so. Since the obverse of uv is [defined](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Defined "Vocabulary/Glossary") as v, and v is + :. -, the obverse of the obverse of uv would be \-.

Not so. The obverse of uv is actually v :. u rather than simply v

```
   uv b. \_1
v :.u

```

So the obverse of the obverse of uv is u :. v.

```
   uv^:\_1^:\_1 (5)  NB. It uses u (+) instead of v^:\_1 (-)
5

```

It follows that the obverse of the v in u :. v is immaterial because it can never be executed.

---
