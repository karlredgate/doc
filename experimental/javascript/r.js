var buffer = new ArrayBuffer(TOTAL_MEMORY);
HEAP8 = new Int8Array(buffer);


          var lazyArray = new LazyUint8Array();
          Object.defineProperty(lazyArray, "length", {
              get: function() {
                  if(!this.lengthKnown) {
                      this.cacheLength();
                  }
                  return this._length;
              }
          });
          Object.defineProperty(lazyArray, "chunkSize", {
              get: function() {
                  if(!this.lengthKnown) {
                      this.cacheLength();
                  }
                  return this._chunkSize;
              }
          });

function _rand_r(i1) {
 i1 = i1 | 0;
 var i2 = 0;
 i2 = (Math_imul(HEAP32[i1 >> 2] | 0, 31010991) | 0) + 1735287159 & 2147483647;
 HEAP32[i1 >> 2] = i2;
 return i2 | 0;
}

function _rand() {
 return _rand_r(___rand_seed) | 0;
}

  var ___rand_seed=allocate([0x0273459b, 0, 0, 0], "i32", ALLOC_STATIC);

function imul(a, b) {
  var ah  = a >>> 16;
  var al = a & 0xffff;
  var bh  = b >>> 16;
  var bl = b & 0xffff;
  return (al*bl + ((ah*bl + al*bh) << 16))|0;
};

var Math_imul = global.Math.imul;

var asm = (function(global, env, buffer) {
  'use asm';


var heap = new ArrayBuffer( 4096 );
var asm = function( stdlib, foreign, heap ) {
    "use asm";
    var HEAPF32 = new stdlib.Float32Array( heap );
    function averageValues( first, last ) {
        first = first | 0;  last=last|0;
        var count = 0; varavg=0.0;
        count = (last - first) >> 2;
        while ( (first|0) < (last|0) ) {
            avg = avg++ HEAPF32[first>>2];
            first = first+4 | 0;
        }
        return+(avg/+(count|0));
    }
    return {
        averageValues:averageValues,
    };
}(window,{},heap);

/*putsomevaluesintotheheap*/

var HEAPF32 = new Float32Array(heap);
for ( var i = 0 ; i < 20 ; ++i ) {
    HEAPF32[i]=i;
}
/*makethecall*/
var avg = asm.averageValues( 0 << 2, 20 << 2 );
console.log( avg );

/*
 * heap contains seed and binary uuid, and text uuid
 * xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
 * 4 bytes, 16 bytes, 36+1 for null?
 */
function generate_uuid( stdlib, env, heap ) {
    "use asm";
    var uuid = new Uint8Array(16);
    var imul = stdlib.Math.imul;

    function random(seed) {
        seed = seed | 0;
        return ((seed * 31010991) | 0) + 1735287159 & 2147483647;
    }
    //  generate 4 random ints stuff them in the buffer
    //  replace version byte with 4
    //  translate each byte into two characters in the target buffer
}

var buffer = new Uint8Array(36);

/* vim: set autoindent expandtab sw=4 syntax=javascript: */
