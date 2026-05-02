# Building Web Applications with JHS

## A Tutorial for J Programmers

---

## Introduction

JHS — J HTTP Server — is a web application framework that ships with J9. If you
have written J before but never built a web app with it, your first instinct might
be to reach for a pattern you know from other platforms: serve some HTML files,
write some JavaScript on the client, call a backend endpoint. Resist that instinct.
JHS has its own model, and once you understand it, it is elegant and remarkably
compact. The purpose of this tutorial is to give you that mental model before you
start writing code, because without it the framework feels arbitrary.

We will build understanding from first principles: how JHS starts, how it renders
pages, how the browser and server talk to each other, and how you wire up event
handlers. By the end you should be able to write a working multi-page application
from scratch.

---

## Part 1 — The Mental Model

### JHS is a servlet server, not a file server

Most web development tutorials begin with a folder of `.html` files that a server
sends to the browser on request. JHS does not work that way. There are no HTML
files. Every page your users see is generated on the fly by J code running on the
server. The browser asks for `/mypage`, the server runs a J verb, and the verb
returns a complete HTML document.

This is the servlet model, familiar to Java developers, and it suits J extremely
well. A J verb that produces HTML is just a verb — it can query a database, crunch
numbers, reshape arrays — and then emit markup. The division of labour is clean:
the server owns all state and all logic; the browser is a thin display layer.

### The URL is the locale name

The most important thing to understand about JHS routing is this: **the URL path
segment is the name of a J locale**. When the browser visits `http://localhost:65002/dashboard`,
JHS looks for a locale called `dashboard` and calls a verb in that locale. There is
no routing table, no switch statement, no configuration file mapping URLs to
handlers. The URL *is* the handler address.

This has a direct consequence for how you structure your application. Each
page of your app is a J script that defines one locale. The locale contains the
page's HTML template, its styles, its JavaScript, and its event-handling verbs.
Everything for one page lives in one file.

### Pages are defined by three nouns and one verb

A JHS page locale exports three globally-scoped nouns and (at minimum) one verb:

- **`HBS`** — the body template. A string containing J sentences separated by
  line-feeds. JHS evaluates each sentence and concatenates the results to build
  the HTML body.
- **`CSS`** — a plain string of CSS rules, inlined into a `<style>` tag.
- **`JS`** — a plain string of JavaScript, inlined into a `<script>` tag.
- **`jev`** — the event dispatcher. JHS calls this verb for every request to your
  page's URL, whether it is an initial browser load or an AJAX event from a button
  click.

You do not write an HTTP response by hand. You call `jhr` and the framework
assembles the response from `HBS`, `CSS`, `JS`, and a standard HTML skeleton,
then sends it.

---

## Part 2 — Starting Up

### The configuration file

Every JHS application starts with a `.cfg` file. This file has a fixed structure
that never varies:

```j
NB. myapp/jhs.cfg

config_jhs_ =: 3 : 0
PORT =: 65002
AUTO =: 0        NB. don't auto-launch a browser
USER =: ''       NB. no built-in password protection
PASS =: ''
TIPX =: 'MyApp/'

NB. Load your application files here
load '~/myapp/src/db.ijs'
load '~/myapp/src/pageone.ijs'
load '~/myapp/src/pagetwo.ijs'

NB. Do not edit past this line
)
load '~addons/ide/jhs/core.ijs'
init_jhs_ ''
```

The two lines at the very end are fixed and must always appear exactly as shown.
`load '~addons/ide/jhs/core.ijs'` loads the entire JHS framework into the `jhs`
locale. `init_jhs_ ''` calls the `init` verb in the `jhs` locale, which reads your
`config_jhs_` verb, binds the socket on the port you specified, and enters the
event loop.

The `config_jhs_` verb is called by the JHS startup machinery as part of
initialisation. The body of the verb is where you put your settings and your
application file loads. Everything inside the verb runs before the server begins
accepting connections, so any startup work — opening a database, initialising
globals — belongs here.

To start the server:

```sh
cd ~/myapp
jconsole -js "load '~/myapp/jhs.cfg'" > /tmp/myapp.log 2>&1 &
```

Then open `http://localhost:65002/pageone` in a browser.

### A note on `init_jhs_`

`init_jhs_` is simply `init` in the `jhs` locale (J locale-qualified name syntax:
`verb_locale_`). The `init` verb calls `jfe 1` to start the event loop. If you have
ever tried driving JHS with a manual `getdata` loop inside `jconsole -js` and
wondered why it seemed to work but behaved strangely, the reason is that `jfe` in
script mode is a no-op. The `.cfg` / `init_jhs_` pattern is the correct one for
browser-facing applications. The manual `getdata` loop is only appropriate for
headless applications (such as a JSON-over-HTTP API server) that do not use the
JHS page framework at all.

---

## Part 3 — Writing a Page

### Locale setup

Every page file begins the same way:

```j
coclass 'mypage'
coinsert 'jhs'
```

`coclass 'mypage'` switches the current locale to `mypage`, so every definition
that follows lives there. `coinsert 'jhs'` inserts the `jhs` locale into
`mypage`'s search path, giving your verbs access to all the JHS helpers
(`jhr`, `jhrajax`, `jhrcmds`, `getv`, `JASEP`, etc.) without needing to
qualify every name with `_jhs_`.

### The body template — `HBS`

`HBS` is defined using J's explicit string notation:

```j
HBS =: 0 : 0
jhh1 'Welcome'
'name' jhtext '';20
'greet' jhb 'Say hello'
'msg'   jhspan ''
)
```

Each line between the `0 : 0` and the closing `)` is a J sentence. When the page
is rendered, JHS evaluates every line in order and concatenates the results. Each
line must return a string of HTML. Blank lines return empty strings, which is fine.

JHS ships with a library of helper verbs for common HTML elements. They all follow
the same dyadic pattern: the left argument is the element's `id` attribute, the
right argument is its content or configuration. A few of the most useful:

```j
jhh1 'text'                NB. <h1>text</h1>
'id' jhb 'Button label'    NB. a button
'id' jhtext '';20          NB. a text input, 20 chars wide, initially empty
'id' jhpassword '';15      NB. a password input
'id' jhspan 'initial'      NB. a <span> — updateable by the server
'id' jhdiv ''              NB. a <div> — updateable by the server
jhbr                       NB. <br>
jhhr                       NB. <hr/>
jhtablea                   NB. <table>
jhtr 'Label:' ; 'id' jhtext '';10  NB. a table row: label + input
jhtablez                   NB. </table>
```

You can also put raw HTML strings directly in `HBS`:

```j
HBS =: 0 : 0
'<div class="container">'
jhh1 'My Page'
'id' jhtext '';30
'</div>'
)
```

### Styles and JavaScript — `CSS` and `JS`

```j
CSS =: 0 : 0
body { font-family: sans-serif; background: #f5f5f5; }
.container { max-width: 600px; margin: 40px auto; }
)

JS =: 0 : 0
function ev_greet_click() {
  jdoajax(['name'], '');
}
function ev_greet_click_ajax(ts) {
  jbyid('msg').innerHTML = ts[0];
}
)
```

CSS and JS are plain strings. JHS inlines `CSS` into `<style>` tags and `JS` into
`<script>` tags. The JavaScript runs in the browser alongside `jscore.js`, the JHS
client framework.

### Rendering the page — `jhr`

To send the assembled page to the browser, call `jhr` inside your `jev` verb (more
on `jev` shortly):

```j
'My App Title' jhr ''
```

`jhr` takes the page title as its left argument and a tag-substitution list as its
right. It assembles `HBS` (via `jhbs`), `CSS`, `JS`, and the standard JHS HTML
skeleton into a complete HTTP response, and sends it. The right argument lets you
substitute `<TAG>` placeholders in your `HBS` template:

```j
'My App' jhr 'ERRMSG' ; 'Incorrect password'
NB. replaces any <ERRMSG> occurrence in HBS with 'Incorrect password'
```

---

## Part 4 — How the Browser and Server Talk

Before you can write event handlers, you need to understand the request-response
cycle in detail. The JHS model is unfamiliar at first but extremely coherent once
you see it.

### What happens when the browser loads a page

1. Browser visits `http://localhost:65002/mypage`.
2. The JHS event loop receives the request. It identifies the URL as `mypage`.
3. It constructs the J sentence `'jev_mypage_ 0'` and evaluates it.
4. J parses `jev_mypage_` as: look up verb `jev` in locale `mypage`.
5. Your `jev` verb runs with argument `0`.
6. Inside `jev`, you call `'My App' jhr ''`.
7. `jhr` assembles and sends the full HTML response.
8. The browser displays the page.

### What happens when the user clicks a button

The JHS JavaScript framework (`jscore.js`) manages all event handling in the
browser. When the user clicks a button with `id="greet"`:

1. The framework sets two hidden form fields: `jmid = 'greet'`, `jtype = 'click'`.
2. If there is a JS function named `ev_greet_click()`, it is called.
3. That function typically calls `jdoajax(['name'], '')`.
4. `jdoajax` POSTs back to the current page URL (`/mypage`) with the form
   data — including `jmid`, `jtype`, the value of the `name` input, and a
   `jdo` field set to `'jev_mypage_ 0'`.
5. The JHS event loop receives the POST. It reads the `jdo` field and evaluates it.
6. `jev_mypage_ 0` runs your `jev` verb again — the same verb as for GET, with the
   same argument `0`.
7. Inside `jev`, you read `jmid` and `jtype` from the request, dispatch to your
   handler logic, and call `jhrajax` to send back data.
8. The browser receives the ajax response and calls `ev_greet_click_ajax(ts)`.

The key insight is that **the same `jev` verb handles both the initial page load
and every subsequent ajax event**. It is the single entry point for all requests
to your page's URL. Your `jev` verb must inspect `jmid` to know which case it is
dealing with.

### The `jevsentence` mechanism

When the browser loads your page, the JHS JavaScript framework reads the `jlocale`
hidden field (whose value is `'mypage'` — set by JHS when it renders the form) and
sets:

```js
jevsentence = "jev_" + jform.jlocale.value + "_ 0";
// → "jev_mypage_ 0"
```

Every call to `jdoajax` posts this string as the `jdo` value. On the server, JHS
reads `jdo` from the form data and evaluates it as a J sentence. This is how the
URL and the J verb stay in sync — the browser tells the server exactly which locale
to call back into.

---

## Part 5 — Writing the Event Dispatcher

### Why you must define `jev` in your locale

This is the subtlety that trips up new JHS developers most often.

`jev_mypage_` means: look up verb `jev` in locale `mypage`. If you have not defined
`jev` in `mypage`, the locale search path continues: `mypage → jhs → z`. The `jhs`
locale *does* define a `jev` verb — it is the standard JHS event dispatcher. It
reads `jmid` and `jtype` from the request and evaluates `'ev_',jmid,'_',jtype,' 0'`
— expecting to find, for example, `ev_greet_click` as a verb somewhere in the `jhs`
locale's own search path. Your page verbs are not in that path.

The result: clicks produce a cryptic "value error: ev_greet_click" because the
`jhs` `jev` is running but cannot find your verbs.

The solution is to **shadow** the `jhs` `jev` by defining your own `jev` in your
page locale. By convention, assign it to both `jev` and `jev_get` (the traditional
JHS name for the GET handler) at once:

```j
jev_get =: jev =: 3 : 0
  ...
)
```

Now `jev_mypage_` finds your verb first, before searching `jhs`.

### The dispatcher pattern

Your `jev` verb is a single verb that handles two cases: initial page load (GET)
and ajax events (POST). Distinguish them by checking `jmid`:

```j
jev_get =: jev =: 3 : 0
  mid  =. getv 'jmid'
  type =. getv 'jtype'

  if. 0 = # mid do.
    NB. ─── GET: render the page ───────────────────────────────────────────
    'My App' jhr ''
    return.
  end.

  NB. ─── POST ajax event: dispatch on mid_type ───────────────────────────
  if. 'greet_click' -: mid,'_',type do.
    name =. dltb getv 'name'
    jhrajax 'Hello, ', name, '!'
  elseif. 'clear_click' -: mid,'_',type do.
    jhrcmds 'set msg *'
  else.
    jhrajax ''   NB. no-op response for unhandled events
  end.
)
```

On GET, `jmid` is an empty string, so `0 = # mid` is true and you render the page.
On POST ajax, `jmid` is the id of the element that triggered the event and `jtype`
is the event type (`'click'`, `'enter'`, `'change'`). Concatenating them gives you
a dispatch key.

One strict rule: **every code path through `jev` must call exactly one of `jhr`,
`jhrajax`, or `jhrcmds`**. These all call `htmlresponse` internally, which sends
the HTTP response and closes the connection. Calling it zero times leaves the
browser hanging; calling it twice causes an error.

---

## Part 6 — Sending Responses

### Full page response — `jhr`

Use `jhr` when you want to replace the entire page. This is appropriate for GET
loads and for events that should navigate to a completely different state.

```j
'Page Title' jhr ''
```

### AJAX data response — `jhrajax`

Use `jhrajax` when the event only needs to update part of the page. The data you
send is a string, optionally split into multiple values using the `JASEP` separator
(ASCII character 1: `1{a.`).

```j
jhrajax 'single value'

jhrajax 'value one',JASEP,'value two',JASEP,'value three'
```

On the browser side, the callback receives an array `ts` of strings split on
`JASEP`:

```js
function ev_submit_click_ajax(ts) {
  jbyid('result').innerHTML = ts[0];
  jbyid('count').innerHTML  = ts[1];
}
```

The callback naming convention is `ev_<mid>_<type>_ajax`. If JHS cannot find a
function by that name, it looks for a plain `ajax(ts)` function as a fallback.

### Browser command response — `jhrcmds`

Use `jhrcmds` when you want to issue structured commands to the browser without
sending raw JASEP data. Commands are strings with a keyword, an element id, and a
value separated by spaces and `*`:

```j
jhrcmds 'set myspan *new content'      NB. set innerHTML of element 'myspan'
jhrcmds 'set myinput *new value'       NB. set value of a text input
jhrcmds 'pageopen *otherloc'           NB. navigate browser to /otherloc
jhrcmds 'alert *Something went wrong'  NB. browser alert dialog
```

You can pass a boxed list to send multiple commands at once:

```j
jhrcmds ('set msg *Error') ; ('set name *')
```

`jhcmds` (without `r`) is the variant used inside `jev` before rendering the page
with `jhr`. Because `jhcmds` does not send the response immediately, it queues
commands to be executed by the browser when the page finishes loading:

```j
jev_get =: jev =: 3 : 0
  if. 0 = # getv 'jmid' do.
    jhcmds 'set username *',CURRENT_USER   NB. runs on page load
    'My App' jhr ''                        NB. sends the page
    return.
  end.
  ...
)
```

---

## Part 7 — JavaScript Conventions

The JHS JavaScript framework uses naming conventions to connect browser events to
J handlers and back.

### Event handler functions

When the user interacts with an element with `id="foo"` (e.g. clicks a button),
the framework looks for a JS function named `ev_foo_click()`. If it exists, it is
called. If not, the framework sends an ajax request directly to the server (the
server-side `jev` runs, and the framework looks for `ev_foo_click_ajax()` on return).

You can use this: if your button only does server-side work and nothing
browser-side, you do not need a JS function at all. Just handle `'foo_click'` in
your J `jev` verb and implement `ev_foo_click_ajax` in `JS` if you need to update
the DOM on the way back.

But most of the time you will write a JS function to control exactly what data is
sent:

```js
// send the values of the 'username' and 'password' inputs to the server
function ev_login_click() {
  jdoajax(['username', 'password'], '');
}
```

`jdoajax(ids, data)`:
- `ids` — array of form element ids whose current values should be included in
  the POST body. The server reads them with `getv 'elementid'`.
- `data` — an extra string sent as `jdata=...`. Rarely needed.

### Useful JS framework functions

```js
jbyid('elementid')              // document.getElementById shorthand
jscdo('btnid')                  // programmatically fire a click on element 'btnid'
jdoajax(['id1','id2'], '')      // send ajax request with listed element values
```

### Triggering J from keyboard events

JHS generates `ev_<id>_enter` events when the user presses Enter in a text field.
You can use a JS shim to redirect Enter to a button click:

```js
function ev_username_enter() { jscdo('login'); }
function ev_password_enter()  { jscdo('login'); }
```

---

## Part 8 — A Complete Working Example

Here is a complete, runnable page that demonstrates GET rendering, form input,
ajax events, error display, and DOM update — in one file, about 70 lines of J.

```j
NB. src/greeter.ijs — accessible at /greeter

coclass 'greeter'
coinsert 'jhs'

HBS =: 0 : 0
'<div class="wrap">'
jhh1 'Greeter'
'<p>Type your name and press the button.</p>'
'err' jhspan ''
jhtablea
jhtr 'Your name:' ; 'name' jhtext '';25
jhtablez
jhbr
'greet'  jhb 'Say hello'
'clear'  jhb 'Clear'
jhbr,jhbr
'result' jhspan ''
'</div>'
)

CSS =: 0 : 0
body { font-family: sans-serif; padding: 40px; }
.wrap { max-width: 480px; }
#err    { color: red; display: block; min-height: 1em; }
#result { font-size: 1.4rem; font-weight: bold; color: #2c7; }
)

JS =: 0 : 0
function ev_name_enter()  { jscdo('greet'); }
function ev_greet_click() { jdoajax(['name'], ''); }
function ev_clear_click() { jdoajax([], '');        }

function ev_greet_click_ajax(ts) {
  jbyid('err').innerHTML    = (ts[0]==='ok') ? '' : ts[1];
  jbyid('result').innerHTML = (ts[0]==='ok') ? ts[1] : '';
}
function ev_clear_click_ajax(ts) {
  jbyid('result').innerHTML = '';
  jbyid('err').innerHTML    = '';
}
)

jev_get =: jev =: 3 : 0
  mid  =. getv 'jmid'
  type =. getv 'jtype'

  NB. GET — just render the page
  if. 0 = # mid do.
    'Greeter' jhr ''
    return.
  end.

  NB. greet button
  if. 'greet_click' -: mid,'_',type do.
    name =. dltb getv 'name'
    if. 0 = # name do.
      jhrajax 'error',JASEP,'Please enter your name.'
    else.
      jhrajax 'ok',JASEP,'Hello, ',name,'!'
    end.
    return.
  end.

  NB. clear button
  if. 'clear_click' -: mid,'_',type do.
    jhrajax ''
    return.
  end.

  jhrajax ''   NB. unhandled event — send empty response
)
```

To wire this into your application, add one line to `config_jhs_` in `jhs.cfg`:

```j
load '~/myapp/src/greeter.ijs'
```

Then start the server and visit `http://localhost:65002/greeter`.

---

## Part 9 — Multi-Page Navigation

### Navigating from J

To send the browser to a different page from a J event handler, use `jhrcmds`:

```j
jhrcmds 'pageopen *dashboard'
```

This instructs the browser to navigate to `/dashboard`. The browser executes the
command as JavaScript `location.href`, so it is a full page load — the `jev` verb
for `dashboard` will be called with an empty `jmid`.

### Navigating from JavaScript

From client-side code you can navigate directly:

```js
location.href = '/dashboard';
```

Or from an ajax callback:

```js
function ev_login_click_ajax(ts) {
  if (ts[0] === 'ok') { location.href = '/dashboard'; }
  else { jbyid('errmsg').innerHTML = ts[1]; }
}
```

### Protecting pages

If a page should only be accessible to logged-in users, check your session state
at the top of `jev` before doing anything else:

```j
jev_get =: jev =: 3 : 0
  mid =. getv 'jmid'
  if. 0 = # mid do.
    if. _1 = MS_UID_jhs_ do.
      jhrcmds 'pageopen *login'
      return.
    end.
    'Dashboard' jhr ''
    return.
  end.
  ...
)
```

---

## Part 10 — Common Mistakes

**Forgetting to define `jev` in your locale.**
If you only define `jev_get` but not `jev`, the JHS framework's own `jev` verb runs
instead, cannot find your event verbs, and produces "value error" alerts in the
browser. Always write `jev_get =: jev =: 3 : 0`.

**Calling `jhr` or `jhrajax` more than once per request.**
These verbs call `htmlresponse`, which closes the socket. A second call is an
error. Every branch of your `jev` verb must converge on exactly one response call.

**Forgetting to call any response verb at all.**
If a code path through `jev` returns without calling `jhr`, `jhrajax`, or
`jhrcmds`, the browser hangs waiting for a response. You will see "server busy"
appear in the status area. Always have a catch-all at the bottom of your ajax
dispatch that calls `jhrajax ''`.

**Using `select./case.` for string dispatch.**
In J9.8, `select.` with string comparisons silently hangs. Use `if./elseif.`
chains for all string-based branching — in `jev` dispatch, in schema-building SQL,
everywhere.

**Not calling `db_open` before the server starts.**
Database setup and other startup tasks must be called from inside `config_jhs_`,
after loading the relevant files. There is no other startup hook.

**Expecting `getv` to return an unboxed value without `dltb`.**
`getv 'fieldname'` returns a character vector from the form POST. J pads boxed
character vectors to a common length, so there may be trailing spaces. Always
apply `dltb` (drop leading/trailing blanks) before using string values from
form fields.

---

## Summary

JHS application development in J comes down to four ideas:

1. **The URL is the locale.** Each page of your application is a J locale. The URL
   path segment is the locale name. No routing table required.

2. **Three nouns, one verb.** `HBS` defines the body template, `CSS` the styles,
   `JS` the client-side scripts. `jev` handles every request — GET and POST alike.

3. **Define `jev` in your locale.** Shadow the framework's `jev` so that your event
   dispatch is in control. Check `jmid` to distinguish page loads from ajax events.

4. **Always send exactly one response.** Every code path through `jev` must call
   `jhr`, `jhrajax`, or `jhrcmds` exactly once.

Once these four ideas are solid, the rest is J. You have the full language — arrays,
database access, numerical computing — available in your event handlers. That is the
point of writing web applications in J: the language that processes the data is the
same language that serves the page.
