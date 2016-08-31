
<!--
-->

https://en.wikipedia.org/wiki/Forward_error_correction
https://en.wikipedia.org/wiki/Erasure_code
https://en.wikipedia.org/wiki/Binary_erasure_channel

https://en.wikipedia.org/wiki/Secret_sharing
https://en.wikipedia.org/wiki/Shamir%27s_Secret_Sharing

https://en.wikipedia.org/wiki/Reed%E2%80%93Solomon_error_correction

James Plank seems to be the core of this technology.
He has many papers on his site, along with source code.

http://web.eecs.utk.edu/~plank/plank/www/software.html

Maximum Distance Seperable (MDS) code
--------------------------------------

Linear block codes that achieve equality in the Singleton bound are called MDS (maximum distance separable) codes. Examples of such codes include codes that have only two codewords (the all-zero word and the all-one word, having thus minimum distance n), codes that use the whole of {\displaystyle (\mathbb {F} _{q})^{n}} (\mathbb {F} _{q})^{n} (minimum distance 1), codes with a single parity symbol (minimum distance 2) and their dual codes. These are often called trivial MDS codes.

In the case of binary alphabets, only trivial MDS codes exist.

https://en.wikipedia.org/wiki/Singleton_bound#MDS_codes

Read the rest of this:

https://en.wikipedia.org/wiki/Singleton_bound

BackBlaze
---------

Uses Reed Solomon and has open sourced their java library.

https://www.backblaze.com/blog/reed-solomon/
https://www.backblaze.com/blog/reed-solomon/
https://www.backblaze.com/pod.html
https://www.backblaze.com/blog/vault-cloud-storage-architecture/
https://github.com/Backblaze/JavaReedSolomon
https://www.youtube.com/watch?v=jgO09opx56o&feature=youtu.be
https://www.youtube.com/watch?v=xtRQ-y9cKdM

Fountain Codes
--------------

https://en.wikipedia.org/wiki/Fountain_code
[Raptor Forward Error Correction Scheme for Object Delivery]( https://tools.ietf.org/html/rfc5053 )
https://en.wikipedia.org/wiki/Raptor_code
https://en.wikipedia.org/wiki/Tornado_code
https://github.com/dbieber/fountaincode
https://github.com/rlucioni/Fountain-Codes
https://code.google.com/archive/p/fountain-codes/downloads

Reed Solomon Code
-----------------

http://www.cs.duke.edu/courses/spring11/cps296.3/decoding_rs.pdf
https://en.wikiversity.org/wiki/Reed%E2%80%93Solomon_codes_for_coders
http://web.eecs.utk.edu/~plank/plank/papers/CS-96-332.pdf
http://www.drdobbs.com/article/print?articleId=240157266&siteSectionName=testing
http://www.drdobbs.com/article/print?articleId=184410107&siteSectionName=cpp

jerasure
--------

http://jerasure.org/
https://github.com/tsuraan/Jerasure
http://web.eecs.utk.edu/~plank/plank/papers/CS-08-627.html

http://web.eecs.utk.edu/~plank/plank/www/software.html

http://jerasure.org/jerasure-2.0/

feclib
-------

http://feclib.sourceforge.net/

Facebook
--------

http://anrg.usc.edu/~maheswaran/Xorbas.pdf
http://storagemojo.com/2013/06/21/facebooks-advanced-erasure-codes/
http://smahesh.com/HadoopUSC/

Facebook's Realtime Distributed FS based on Apache Hadoop 0.20-append

https://github.com/facebookarchive/hadoop-20

http://www.umbrant.com/blog/2014/f4_facebook_warm_blob_storage.html
http://nosql.mypopescu.com/post/55864766590/papers-novel-erasure-codes-for-big-data-from
https://www.usenix.org/conference/atc12/technical-sessions/presentation/huang

<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
