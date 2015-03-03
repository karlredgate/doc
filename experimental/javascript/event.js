
var events = require('events');

var x = new events.EventEmitter();

function junk( a ) {
    console.log( "A: " + a );
}

x.on( 'foo', junk );

x.emit( 'foo', 3 );
