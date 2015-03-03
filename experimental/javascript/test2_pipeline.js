#!/usr/bin/node

var create_pipeline = require( "./pipeline" ).create_pipeline;

var output_chunks = [];
function save_data( chunk ) {
    console.log( "saved chunk <" + chunk.toString() + ">" );
    output_chunks.push( chunk );
}

var error_chunks = [];
function save_error( chunk ) {
    error_chunks.push( chunk );
}

function send_pipeline_result( failed ) {
    if ( failed ) {
        console.log( "pipeline failed" );
        function p( line ) {
            process.stdout.write(line);
            console.log( "   <<<" );
        }
        // errors.map( process.stderr.write.bind(process.stderr) );
        error_chunks.map( p );
        return;
    }

    function po( line ) {
        console.log( "<<< chunk start >>>" );
        process.stdout.write(line);
        console.log( "<<< chunk end >>>" );
    }

    console.log( "pipeline succeeded - chunks " + output_chunks.length );
    console.log( "==================" );
    output_chunks.map( po );
}

var commands = [
    ["sed", ["-e","s/^$/<<<BLANK>>>/"]],
    ["sed", ["-e", "s/^/XXX< /"]],
    ["sed", ["-e", "s/$/ >XXX/"]]
];

var pipeline = create_pipeline( commands );
pipeline.on( 'data', save_data );
pipeline.on( 'error-data', save_error );
pipeline.on( 'finish', send_pipeline_result );

function send_to_pipeline( chunk ) {
    console.log( "PIPE: " + chunk.toString() );
    pipeline.write( chunk );
}

function end_pipeline() {
    console.log( "PIPE ended" );
    pipeline.end();
}

process.stdin.on( 'data', send_to_pipeline );
process.stdin.on( 'finish', end_pipeline );

/* vim: set autoindent expandtab sw=4 syntax=javascript: */
