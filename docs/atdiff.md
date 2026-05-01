# Vocabulary/atdiff - J Wiki

2\. So what's the difference between [Atop](https://code.jsoftware.com/wiki/Vocabulary/at "Vocabulary/at") (@) and [Compose](https://code.jsoftware.com/wiki/Vocabulary/ampv "Vocabulary/ampv") (&) ?

None at all, for the _monads_ (u@v) and (u&v)

```
  u&v y ↔ u v y
  u@v y ↔ u v y

```

But the _dyads_ are different:

```
  x u&v y ↔ (v x) u (v y)
  x u@v y ↔ u x v y

```

According to the [J Dictionary](https://www.jsoftware.com/help/dictionary/d632.htm "jdic:d632") -- &: _is equivalent to_ & _except that the ranks of the resulting function are infinite; the relation is similar to that between_ @: _and_ @
