# Vocabulary/tcapdot - J Wiki

T. y sets the [debug thread](https://code.jsoftware.com/wiki/Vocabulary/Glossary#DebugThread "Vocabulary/Glossary") number to y. The [master thread](https://code.jsoftware.com/wiki/Vocabulary/Glossary#MasterThread "Vocabulary/Glossary") is always thread 0. On entry into debug suspension, the debug thread is set to the number of the thread that caused the suspension.

During debug suspension, sentences are executed in the debug thread. Commands that end suspension, giving a line number to resume at or a value to be used as the value of the debugged sentence, execute in the debug thread but the value they produce is applied in the thread that caused the suspension.

T. y takes effect when its result becomes the result of a sentence entered from the keyboard during debug suspension.

<table class="wikitable"><tbody><tr><td colspan="5"><b><tt>x T. y</tt> functions</b></td></tr><tr><td><b>Description</b></td><td><b><tt>x</tt></b></td><td><b>Type/</b><p><b>Precision</b><br><b>of Result</b></p></td><td><b>Type/</b><p><b>Precision</b><br><b>of <tt>y</tt></b></p></td><td><b>Action</b></td></tr><tr><td>Create thread</td><td><tt>0</tt></td><td>Integer atom</td><td><tt>[[&lt;]<i>threadpool#</i>][⁠;⁠&lt;'<b>coremask</b>'&nbsp;;&nbsp;<i>core_mask</i>]</tt></td><td>Create a <a title="Vocabulary/Glossary" href="/wiki/Vocabulary/Glossary#Thread">thread</a> in threadpool <tt><i>pool#</i></tt> (default 0), if possible. Result is the sequential thread number, or <tt>_1</tt> if the thread could not be created. The <a title="Vocabulary/Glossary" href="/wiki/Vocabulary/Glossary#MasterThread">master thread</a> is thread 0 and is not a member of any threadpool.<br>Even if your code does not create tasks, the system can take advantage of threadpool 0 to make primitives run faster; you should use <tt>8 T. ''</tt> to query the number of cores N in your system, and create N-1 threads in threadpool 0.<br><tt>{{0 T.0}}^:] &lt;: {. 8 T. ''</tt><p>The <b><tt>coremask</tt></b> (default all cores) is an integer or character atom or list giving a littleendian binary mask of cores that the thread can execute in. The correspondence of mask bit to core is OS-dependent.<br><small><b><tt>coremask</tt></b> is not supported for Mac or OpenBSD</small></p></td></tr><tr><td>Number of worker threads</td><td><tt>1</tt></td><td>Integer atom</td><td><tt>''</tt></td><td>The total number of worker threads that have been created.</td></tr><tr><td>Thread statistics for a threadpool</td><td><tt>2</tt></td><td>Integer list<br><tt><i>#idle</i>,<i>#unfinished</i>,<i>#threads</i></tt></td><td>[<tt><i>pool#</i></tt>]</td><td>Statistics are reported for threadpool <tt><i>pool#</i></tt> (default 0). <tt><i>#idle</i></tt> is the number of threads not working on a user task or an internal task. <tt><i>#unfinished</i></tt> is the number of user tasks that have not completed. <tt><i>#threads</i></tt> is the number of worker threads in the threadpool.</td></tr><tr><td>Info on executing thread</td><td><tt>3</tt></td><td>Integer list<br><tt><i>thread#</i>,<i>threadpool#</i>,<i>index&nbsp;in&nbsp;threadpool</i></tt></td><td><tt>''</tt></td><td>The number of the currently-executing thread and threadpool. <i>Index in threadpool</i> is a distinguishing number within the threadpool. The master thread is thread 0, its threadpool is _1, and its index is 0. Indexes of worker threads are positive.</td></tr><tr><td>Rattle a box to get status</td><td><tt>4</tt></td><td>Integer array, one for each atom in <tt>y</tt></td><td>A box or array of boxes</td><td><table class="wikitable"><tbody><tr><th colspan="2">The threads continue to run between calculation of each atom of this result</th></tr><tr><th><b>Status</b></th><th><b>Result atom</b></th></tr><tr><td>Pyx waiting to run</td><td><tt>_</tt></td></tr><tr><td>Pyx running in thread <i>n</i></td><td><i>n</i></td></tr><tr><td>Pyx completed with <a title="Vocabulary/ErrorMessages" href="/wiki/Vocabulary/ErrorMessages#ErrorNumbers">error number</a> <i>n</i></td><td>-<i>n</i></td></tr><tr><td>Pyx completed with no error</td><td><tt>_1000</tt></td></tr><tr><td>Not a pyx</td><td><tt>_1001</tt></td></tr></tbody></table><p><small>Note: non-negative status codes indicate tasks that are not finished yet.</small></p></td></tr><tr><td>Create a pyx</td><td><tt>5</tt></td><td>The created pyx</td><td>The maximum number of seconds to wait for the result, or 0 for no limit</td><td>A pyx is created. <b>It is very easy to lock up the system with user-created pyxes.</b> For example, the sentence<br><tt>5 T. 0</tt><br>entered from the keyboard will lock up. Pyxes used to hold the results of tasks are <b>not</b> susceptible to lockup.<p>User-created pyxes can be used as semaphores between tasks.</p></td></tr><tr><td>Install a value into a pyx</td><td><tt>6</tt></td><td><tt>i. 0 0</tt></td><td><tt><i>pyx</i>,&lt;<i>value</i></tt></td><td><i>value</i> becomes the value of <i>pyx</i>, waking up any tasks that were waiting for it. It is illegal to store a value or errorcode into a pyx more than once.</td></tr><tr><td>Install errorcode into a pyx</td><td><tt>7</tt></td><td><tt>i. 0 0</tt></td><td><tt><i>pyx</i>,&lt;<i>errorcode</i></tt></td><td><i>pyx</i> becomes a pyx in error, with <a title="Vocabulary/ErrorMessages" href="/wiki/Vocabulary/ErrorMessages#Defining_your_own_error_conditions">error code</a> <i>errorcode</i>, waking up any tasks that were waiting for it. It is illegal to store a value or errorcode into a pyx more than once.</td></tr><tr><td>Read system characteristics relating to threads</td><td><tt>8</tt></td><td>Integer list<br><tt><i>corecount</i>,<i>maxthreads</i></tt></td><td><tt>''</tt></td><td><tt><i>corecount</i></tt> is the number of cores in your machine. <tt><i>maxthreads</i></tt> is the maximum number of threads supported, including the master thread.</td></tr><tr><td rowspan="3">Mutexes</td><td><tt>10</tt></td><td><tt><i>mutex</i></tt></td><td><tt><i>shared</i></tt></td><td>Create a mutex. <i>shared</i> is 0 for an exclusive mutex, 1 for a shared mutex (also called a recursive mutex). The mutex is opaque; its type, shape, and value are meaningful only as an argument to a mutex function, and they may not be displayed or modified; but the mutex may safely be passed as an argument or put into a box, and it is not considered boxed for the purposes of <tt>;</tt>, <tt>L.</tt>, and similar.</td></tr><tr><td><tt>11</tt></td><td>Integer<br><tt><i>errorcode</i></tt></td><td><tt><i>mutex</i>[;<i>timeout</i>]</tt></td><td>Take an lock on <i>mutex</i>, waiting up to <i>timeout</i> seconds (or forever if <i>timeout</i> is _ or omitted). <i>errorcode</i> is 0 if the lock was taken, 1 if the request timed out. A <i>timeout</i> value of 0 will always return immediately.<p>Requesting a lock on a mutex that the thread already has a lock on is allowed only for a shared mutex and will return immediately still holding the lock.</p></td></tr><tr><td><tt>13</tt></td><td><tt>i. 0 0</tt></td><td><tt><i>mutex</i></tt></td><td>Release the lock on the mutex. For shared mutexes, the lock is released only after every execution of <tt>(11 T. mutex)</tt> has been matched by a <tt>(13 T. mutex)</tt>. It is an error for a thread to release a mutex it doesn't have a lock on.</td></tr><tr><td>Set lingertime for a threadpool</td><td><tt>14</tt></td><td>Previous value of lingertime</td><td><tt><i>pool#</i>,<i>lingertime</i></tt></td><td>instruct threads in threadpool <tt><i>pool#</i></tt> to stay active, waiting for jobs, for <tt><i>lingertime</i></tt> seconds after they complete the last task, before they go into a wait state. This is useful if you expect your code to create tasks so fast that a new task would be requested before a thread could come out of a wait state. The maximum <tt><i>lingertime</i></tt> is 0.1 second.</td></tr><tr><td>Wake up all threads in a threadpool</td><td><tt>15</tt></td><td><tt>i. 0 0</tt></td><td><tt><i>pool#</i></tt></td><td>Start all threads in theadpool <tt><i>pool#</i></tt>. If you expect that a task will be dispatched to the threadpool within the threadpool's lingertime (set by <tt>14 T.</tt>, the threads will be immediately ready for work without the operating system's thread-start delay.</td></tr><tr><td rowspan="3">Atomically<br>Modifiable<br>Values<br>(AMV)</td><td><tt>16</tt></td><td><tt><i>AMV</i></tt></td><td><tt><i>initial value</i></tt></td><td>Create an Atomically Modifiable Value (AMV) and set its value to <i>initial value</i>. An AMV is a boxed integer atom, but it should be accessed only through AMV primitives (<tt>17 T.</tt> and <tt>18 T.</tt>). An AMV may be assigned to a name</td></tr><tr><td><tt>17</tt></td><td>value of <i>AMV</i> before addition</td><td><tt><i>AMV</i>,&lt;<i>increment</i></tt></td><td>Add <i>increment</i> to the value of <i>AMV</i>, and return the value of <i>AMV</i> before the change. The modification is performed <i><b>atomically</b></i>, that is, the read, increment, and store cannot be interrupted by other threads.</td></tr><tr><td><tt>18</tt></td><td><tt>''</tt> if modification performed; value of <i>AMV</i> if modification not performed</td><td><tt><i>AMV</i>,<i>desired</i>;<i>expected</i></tt></td><td>Perform <i><b>compare and swap</b></i> on <i>AMV</i>: if the value of <i>AMV</i> is <i>expected</i>, it is replaced with <i>desired</i>, and the result is <tt>0$0</tt>; otherwise the result is the value of <i>AMV</i>. The modification is performed <i><b>atomically</b></i>, that is, the read, compare, and conditional store cannot be interrupted by other threads.</td></tr><tr><td>Yield execution</td><td><tt>20</tt></td><td><tt>i. 0 0</tt></td><td><tt>''</tt></td><td>If other threads are eligible for execution on the same core as the current thread, the OS pauses the execution of the current thread to allow one of the others to run.</td></tr><tr><td>Get/Set coremask<br><small>not supported for Mac or OpenBSD</small></td><td><tt>22</tt></td><td>Previous value of coremask</td><td><tt><i>thread#</i></tt> (must be 0)[;<tt><i>coremask</i></tt>]</td><td>If <tt><i>coremask</i></tt> is given, install that value as the coremask in the executing thread. Return the previous coremask for the executing thread.</td></tr><tr><td>Destroy thread</td><td><tt>55</tt></td><td><tt>1</tt> if a thread was destroyed, <tt>0</tt> if not</td><td><i>threadpool #</i> or <tt>''</tt></td><td>The thread to be destroyed is the highest-numbered thread in the given <i>threadpool</i>, or the highest-numbered thread if <i>threadpool</i> is omitted. If the selected thread is the only worker thread in its threadpool and there are tasks waiting in the threadpool, the deletion blocks until that condition clears. The selected thread is then marked for deletion after it finishes any task it is executing.</td></tr></tbody></table>

---

### Shared mutexes

A shared mutex (sometimes called a recursive mutex) is one which can be locked multiple times on the same thread. It must be unlocked as many times as it has been locked before it will be available to other threads. If an exclusive mutex is locked more than once on the same thread, an error will be thrown.

Exclusive and shared mutexes have similar performance; you should choose whichever one does a better job of enforcing application invariants.

---

### Threadpools

Parallelizable primitives use threadpool 0. For best results, you should create one fewer worker thread in threadpool 0 than you have cores in your CPU. **Note** that a J thread can use all the resources of a core, making it a bad idea to create J threads for more than one hyperthread per core.

You should use threadpool 0 for your heavy computation also.

If you have threads that are often idle, consider allocating them in a different threadpool. That will avoid the thrashing that would result if you had too many threads in threadpool 0.

### Details and Examples

User-created pyxes can be used as _**semaphores**_ using the following protocol. Note that attempting to display a pyx will wait for its value to be assigned.

 Originating task |     | Responding task |
| --- | --- | --- |
 localpyx=.5 T. 30  
_function_ t. '' localpyx;local\_stuff |     |  |
  |     | 'remotepyx remote\_stuff'=.y |
 Set up shared data for responding task to use |     | Get ready to receive |
 'remotepyx remote\_stuff'=.>localpyx |     | 6 T. remotepyx,<(localpyx =. 5 T. 30);<local\_stuff |
 \*\*\* The responding task has control of the shared data \*\*\* |
 6 T. remotepyx,<(localpyx =. 5 T. 30);<local\_stuff |     | 'remotepyx remote\_stuff'=.>localpyx |
 \*\*\* The originating task has control of the shared data \*\*\* |
 Control can be passed back and forth indefinitely |

Mutexes can be used as _**locks**_ to guarantee exclusive use of a resource. First create a mutex by executing mutex =: 10 T. 0 .

 Task 0 |     | Task 1 |
| --- | --- | --- |
 11 T. mutex NB. acquire mutex |     |  |
 _use shared resource_ |     |  |
 _continue to use shared resource_ |     | 11 T. mutex NB. try to acquire lock, block because mutex already owned |
 _continue to use shared resource_ |     | _still blocked_ |
 13 T. mutex NB. release mutex |     | _end block and acquire mutex_ |
  |     | _use shared resource_ |
  |     | 13 T. mutex NB. release mutex |

### Deadlocks

If you create tasks that have enough resources to create their result, they will run to completion without the possibility of deadlock.

If your tasks wait for the results of tasks that started later, it is up to you to ensure that they do not deadlock. A trivial example of deadlock is

```
   pyxes =: {{ y {:: pyxes \[ 6!:3 (1)}} t. 'worker'"0 (1 0)

```

Each thread waits for the other: deadlock.

---

### Oddities

Threads cannot be created on Raspberry Pi distribution, or on a 32-bit version..

---

[Execute as Task](https://code.jsoftware.com/wiki/Vocabulary/tdot "Vocabulary/tdot") (t.)

---
