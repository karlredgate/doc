#!/usr/bin/node

var create_pipeline = require( "./pipeline" ).create_pipeline;

var output_chunks = [];
function save_data( chunk ) {
    output_chunks.push( chunk );
}

var error_chunks = [];
function save_error( chunk ) {
    error_chunks.push( chunk );
}


function send_pipeline2_result( failed ) {
    if ( failed ) {
        console.log( "pipeline2 failed" );
        error_chunks.map( process.stderr.write.bind(process.stderr) );
        return;
    }

    console.log( "pipeline2 succeeded - chunks " + output_chunks.length );
    console.log( "==================" );

    function p(chunk) {
        process.stdout.write( chunk );
    }

    output_chunks.map( p );
}

// this one will work
var commands2 = [
    ["ls", ["/var/log/"]],
    ["sed", ["-e", "s/^/XXX< /"]],
    ["sed", ["-e", "s/$/ >XXX/"]]
];


function send_pipeline1_result( failed ) {
    if ( failed ) {
        console.log( "pipeline1 failed" );
        function p( line ) {
            process.stdout.write(line);
            console.log( "   <<<" );
        }
        // errors.map( process.stderr.write.bind(process.stderr) );
        error_chunks.map( p );

        console.log( "==================" );
        console.log( "starting pipeline2" );
        console.log( "==================" );

        output_chunks.length = 0;
        error_chunks.length = 0;

        var pipeline2 = create_pipeline( commands2 );
        pipeline2.on( 'data', save_data );
        pipeline2.on( 'error-data', save_error );
        pipeline2.on( 'finish', send_pipeline2_result );

        return;
    }

    console.log( "pipeline1 succeeded - chunks " + output_chunks.length );
    console.log( "==================" );
    output_chunks.map( process.stdout.write.bind(process.stdout) );
}

var commands = [
    ["ls", ["-R","/var/log/"]],
    ["sed", ["-e", "s/^/XXX< /"]],
    ["sed", ["-e", "s/$/ >XXX/"]]
];

var pipeline1 = create_pipeline( commands );
pipeline1.on( 'data', save_data );
pipeline1.on( 'error-data', save_error );
pipeline1.on( 'finish', send_pipeline1_result );

/* vim: set autoindent expandtab sw=4 syntax=javascript: */
