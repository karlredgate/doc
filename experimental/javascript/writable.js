#!/usr/bin/node

var stream = require('stream');
var x = new stream.Writable();

var string = "";
x._write = function ( chunk, encoding, callback ) {
    string += chunk.toString();
    callback( null );
}

x.write( 'hello' );
x.write( 'this' );
x.write( 'is' );
x.write( 'a' );
x.write( 'test' );
x.write( 'of the' );
x.write( 'broadcast' );

console.log( "OUT:"+string );

// vim:autoindent expandtab
