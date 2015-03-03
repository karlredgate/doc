#!/usr/bin/node

var stream = require('stream');
var x = new stream.Transform();

x._transform = function (chunk, encoding, done) {
    var data = chunk.toString();

    console.log( 'transform called' );
    console.log(data);

    this.push( "L:" + data );
    done();
}

x.write( 'hello' );
// console.log( x.read() );  // this prints a buffer
console.log( x.read().toString() );

// vim:autoindent expandtab
