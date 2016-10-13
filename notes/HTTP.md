
<!--
-->

CORS
-----

https://github.com/eBay/cors-filter

XMLHttpRequest
--------------

https://xhr.spec.whatwg.org/
https://www.w3.org/TR/XMLHttpRequest/

### Tests

https://w3c-test.org/XMLHttpRequest/

HTTP/2
------

https://en.wikipedia.org/wiki/HTTP/2
https://tools.ietf.org/html/rfc7540
https://github.com/http2/http2-spec/wiki/Implementations
https://github.com/molnarg/node-http2

https://github.com/http2/http2-spec/wiki/Implementations
https://h2o.examp1e.net/

Cookieless Cookies
------------------

Can use ETags as persistence.

Server sends ETag header, client sends `If-None-Match` with
ETag content.

http://papers.ssrn.com/sol3/papers.cfm?abstract_id=1898390
http://ashkansoltani.org/2011/08/11/respawn-redux-flash-cookies/
https://github.com/lucb1e/cookielesscookies
http://www.arctic.org/~dean/tracking-without-cookies.html
http://www.arctic.org/~dean/cookies.html
https://en.wikipedia.org/wiki/HTTP_ETag

http://www.wired.com/2011/07/undeletable-cookie/
https://ashkansoltani.files.wordpress.com/2012/12/hulu_kissmetrics_complaint.pdf

https://en.wikipedia.org/wiki/HTTP_ETag


### Supercookies

or permacookies etc - Verizon uses X-UIDH headers

check here <http://lessonslearned.org/sniff>


Tiny WebServers
---------------

Mongoose was MIT licensed - but has changed to GPL; so use
civetweb instead.

https://code.google.com/archive/p/mongoose/
https://en.wikipedia.org/wiki/Mongoose_%28web_server%29
https://github.com/civetweb/civetweb
http://duktape.org/
https://github.com/gfwilliams/tiny-js

A local webserver for developers (written in go)
<https://github.com/cortesi/devd>
and the related filesystem watcher tool (also in go)
<https://github.com/cortesi/modd>

XMLHttpRequest (XHR)
--------------

( https://en.wikipedia.org/wiki/XMLHttpRequest )

There were level 1 and level 2 interfaces - but they were merged.

Read here ( https://xhr.spec.whatwg.org/ )
and more info here ( http://caniuse.com/#feat=xhr2 )

The caniuse site provides info on browser support for
many features.  Nice site.

Cache/Proxy
------------

### Varnish

https://docs.fastly.com/guides/vcl/guide-to-vcl
https://www.fastly.com/blog/benefits-using-varnish

Security
--------

https://www.ietf.org/wg/concluded/websec.html

### Content Security Policy

https://oxdef.info/csp-tester/
https://github.com/yandex/csp-tester

### Confused Deputy

### HTTP Strict Transport Security

https://en.wikipedia.org/wiki/HTTP_Strict_Transport_Security

### HTTP Public Key Pinning

https://en.wikipedia.org/wiki/HTTP_Public_Key_Pinning
http://news.netcraft.com/archives/2016/03/30/http-public-key-pinning-youre-doing-it-wrong.html
https://isc.sans.edu/diary/HTTP+Public+Key+Pinning%3A+How+to+do+it+right/20943
https://www.owasp.org/index.php/Certificate_and_Public_Key_Pinning
https://timtaubert.de/blog/2014/10/http-public-key-pinning-explained/
https://www.tollmanz.com/public-key-pinning-for-http/
https://developer.mozilla.org/en-US/docs/Web/Security/Public_Key_Pinning

WebSocket
---------

http://usualcarrot.com/nodejs-and-websocket-simple-chat-tutorial
http://lucumr.pocoo.org/2012/9/24/websockets-101/
https://github.com/miksago/node-websocket-server
https://github.com/theturtle32/WebSocket-Node
http://socket.io/

<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
