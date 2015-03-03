
This is for Node.JS, but also for general Javascript.

## Do not count on semicolon insertion

Why - explain why ugly
Perhaps can cause unexpected behavior?

## Avoid boomerangs

Just because you have anonymous functions does not mean you should
use them everywhere.
All too often you will see Javascript code that looks like this:

```javascript
foo( 1, function () {
            bar( 2, function () {
                baz( 3, function () {
                    // This is terrible
                }
            }
        }
);
```

Sometimes the indents are skipped and each is at the left edge,
even though it is really structured like this.
This make for code where t is very difficult to track the
control flow.
You should create functions with useful names and use the
names as the callbacks.
With this style the code does appear to execute bottom to top
but that is not unreasonable given the way the program flow
operates.

```javascript
function callback3() {
    // Easier to read - when callback names are useful
}
function callback2() {
    baz( 3, callback3 );
}
function callback1() {
   bar( 2, callback2 );
}
foo( 1, callback1 );
```

## Iterating over an array

Do not use `for`

```javascript
var foo = [1,2,3];
function double_it(element) { return element*2; }
foo.map( double_it );
```

## Using bind for callbacks

The binding of `this` in callbacks can sometimes cause confusion.
Usually you will see people using closures instead.
The way to get the exact binding you want in callbacks is to
use `bind()` to create a new function with `this` bound to the
argument you want.

```javascript
// this is not a great example
// make one with an object
var term1 = 3;
function multiply(term) { return this * term; }
var a = [2,4,6];
a.map( multiply.bind(term1) );
```

## EventEmitter

Examples of usefulness

## Streams

read streams, write streams and how to use

<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
