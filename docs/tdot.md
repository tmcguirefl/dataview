# Vocabulary/tdot - J Wiki

[\>>](https://code.jsoftware.com/wiki/Vocabulary/tcapdot "Vocabulary/tcapdot") [<<](https://code.jsoftware.com/wiki/Vocabulary/scapco "Vocabulary/scapco")   [Back to: Vocabulary](https://code.jsoftware.com/wiki/NuVoc "NuVoc")

<table class="wikitable"><tbody><tr><td><tt>[x] u t. n y</tt></td><td>Execute as task</td><td>Conjunction</td></tr></tbody></table>

**No rank** -- the result is a verb with infinite rank

---
```
   i. t. ''"0 i. 5
++-+---+-----+-------+
||0|0 1|0 1 2|0 1 2 3|
++-+---+-----+-------+

```

\[x\] u t. n y runs (\[x\] <@:u y) in an idle [thread](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Thread "Vocabulary/Glossary") and returns its result, which is a [_**pyx**_](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Pyx "Vocabulary/Glossary"). A pyx is a special box. It looks like an atomic [box](https://code.jsoftware.com/wiki/Vocabulary/Glossary#Box "Vocabulary/Glossary") and can be used like any other box. When the pyx is opened, the opening thread will block until the value is available. If the creation of the pyx ended in error, that error will be signaled when the pyx is opened.

## Suitable Tasks

### Task Overhead

In modern CPUs each core has its own caches, which these days amount to about half a megabyte for the level-2 data cache. Accesses to memory contained in the local caches is fast. Accesses to memory not in the local caches is slow.

When task A starts task B, the arguments to task B will presumably be contained in the caches of task A. Task B, which will probably be running in a different core, will have to copy the data from task A's caches to task B's. This will be slow.

Likewise, when task B completes, its result will be in its caches, and task A will have to read them, which will be slow.

In addition to these delays in accessing argument and results, there is an overhead for waking a thread, measured in tens of microseconds.

### Attributes of a Suitable Task

Considering the above, we can characterize a good task:

-   It takes more time to run than to start, i. e. it runs for hundreds of microseconds
-   It executes local memory accesses of at least 10x the size of the arguments+result.

A verb that adds two vectors is NOT a good candidate.

A verb that factors large extended-precision integers is a perfect candidate.

An explicit verb probably IS a good candidate, as long as the verb does appreciable processing.

## Details

### Task Options

The n argument to t. controls execution of the task. The format is

\[\[<\]_threadpool#_\]\[,< _keyword_\[,&<_keywordvalue_\]\]...  
or  
_keyword_

_threadpool#_ indicates which threadpool the task should be assigned to. Threads are assigned to threadpools when they are created. By default, threadpool 0 is used. Example of use:

```
   u t. 2 'abc'

```

runs u in threadpool 2 if threadpool 2 exists (if it does not exist, u may be run in the main thread).

#### Keyword: **worker**

The **worker** keyword controls whether the task should be executed in the originating thread if there is no waiting thread for it to run in.

```
   u t. 'worker'
   u t. (<'worker')
   u t. (<'worker';1)

```

all indicate that the task should always be run in a worker thread (provided the threadpool is not empty). If the keyword is omitted, a keywordvalue of 0 is used. If the keywordvalue is omitted, but the keyword itself is present, 1 is used for the keywordvalue. Supplying a keyword with a keywordvalue of 0 is like omitting the keyword.

#### Keyword: **locales**

The **locales** keyword indicates that the same verb should be executed in multiple threads, with each thread starting in a different numbered locale. **locales** is used in conjunction with **coremask** to achieve long-term cache persistence. If a thread is tied to a core using **coremask**, that thread can be tied to a locale using **locales**, and names in the locale can be used to ensure that the task executes on values in the thread's local cache. The values used by the locale, and its results, will tend to remain in cache for later use in the same locale.

The _keywordvalue_ is _threadmask_;_numbered\_locale\_list_. _threadmask_ is a bitmask of threads that participate in the execution: bit 0 corresponds to the current executing thread, higher bit _i_ indicates the thread in the designated threadpool with index _i_. _numbered\_locale\_list_ is a list of integers, corresponding to the 1-bits in _threadmask_ in littleendian order, giving the locale that the thread is to start in. The threads and locales must exist.

### Namespaces

The task has access to all public names. When it starts it has no private namespace (thus any assignments it makes before calling an explicit entity will be public).

Private variables are never shared between tasks.

### Initialization

When a task starts, some settings are inherited from the initiating task:

-   [implied locale](https://code.jsoftware.com/wiki/Vocabulary/Glossary#ImpliedLocale "Vocabulary/Glossary")
-   [comparison tolerance](https://code.jsoftware.com/wiki/Vocabulary/Glossary#CompTol "Vocabulary/Glossary")
-   boxed output positioning, as set by 9!:17
-   print precision, as set by 9!:11
-   lock status
-   debug and Performance Manager status
-   current working directory

Other parameters are reset to their initial values:

-   Number of parser calls (read by 6!:4)
-   High-water mark of memory usage (read by 7!:1)
-   Name-caching status (set by 9!:5)

### Concurrency

All tasks simultaneously access the same global namespace, and may assign to or erase names that are being looked up by other tasks.

When a name is evaluated, it is replaced by the most recent value assigned to the name at the time of the lookup. That value will be protected from change while it is in execution. However, the value assigned to the name may change at any time.

The synchronization features offered by (x T. y) allow locking of shared resources.

---

[Threads and Tasks](https://code.jsoftware.com/wiki/Vocabulary/tcapdot "Vocabulary/tcapdot") (T.)

---
