
Array.prototype.find = function ( filter ) {
    var result = [];
    var length = this.length;
    for ( var i = 0 ; i < length ; i++ ) {
        var element = this[i];
        if ( filter(element) ) {
            result = result.concat( element );
        }
    }
    return result;
}

Object.prototype.slots = function () {
    var object = this;
    return Object.getOwnPropertyNames( object.constructor.prototype );
}

Object.prototype.methods = function () {
    var object = this;
    function is_func( slot ) {
        return (typeof object[slot]) === 'function';
    }
    return Object.getOwnPropertyNames( object.constructor.prototype ).find( is_func );
}

Object.prototype.my_inspect = function () {
    var object = this;
    function inspect_slot( slot ) {
        var type = typeof object[slot];
        return [ slot, type ];
    }
    return Object.getOwnPropertyNames( object.constructor.prototype ).map( inspect_slot );
}

/* vim: set autoindent expandtab sw=4 syntax=javascript: */
