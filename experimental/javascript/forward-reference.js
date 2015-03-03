
// both kinds of forward reference work ??? not sure why
module.exports = Foobar;

var x = Foobar;

function Foobar(options) {
}

console.log( x );
