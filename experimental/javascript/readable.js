#!/usr/bin/node

var stream = require('stream');
var x = new stream.Readable();

x._read = function ( size ) {
}

x.push( 'hello' );
x.push( 'this' );
x.push( 'is' );
x.push( 'a' );
x.push( 'test' );
x.push( 'of the' );
x.push( 'broadcast' );
// console.log( x.read() );  // this prints a buffer
console.log( x.read().toString() );

// vim:autoindent expandtab
