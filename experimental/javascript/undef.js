
var util = require('util');
var isUndefined = util.isUndefined;

var a;

// this is how implemented
if ( a === void 0 ) console.log( " a is void 0" );
// this is present in newer versions of node
if ( isUndefined(a) ) console.log( " a is undefined" );
