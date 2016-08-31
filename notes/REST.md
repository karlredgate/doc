
<!--
-->

Definition
----------

Optimistic Concurrency Control
------------------------------

https://en.wikipedia.org/wiki/Optimistic_concurrency_control

HTTP does provide a form of built-in OCC: The GET method returns
an ETag for a resource and subsequent PUTs use the ETag value in
the If-Match headers; while the first PUT will succeed, the second
will not, as the value in If-Match is based on the first version
of the resource.

https://www.w3.org/1999/04/Editing/

TOCTTOU
https://en.wikipedia.org/wiki/Time_of_check_to_time_of_use

RDF and WebDAV
--------------

Describe my approach

[This article]( http://www.w3.org/2001/sw/wiki/REST )
is similar to my approach (READ IT FULLY).

https://en.wikipedia.org/wiki/WebDAV
https://en.wikipedia.org/wiki/Information_and_Content_Exchange
https://en.wikipedia.org/wiki/Web_syndication
https://en.wikipedia.org/wiki/History_of_web_syndication_technology
https://en.wikipedia.org/wiki/Filing_Open_Service_Interface_Definition


Tools
-----

 * search: REST API specification
 * https://github.com/swagger-api/swagger-spec
 * http://www.restdoc.org/spec.html
 * http://www.restfulobjects.org/
 * https://code.google.com/p/hackystat-sensorbase-uh/wiki/RestApiSpecification
 * http://raml.org/
 * https://github.com/raml-org/raml-spec/blob/master/raml-0.8.md#introduction

Application Description Languages
---------------------------------

Swagger has been renamed to OpenAPI

 * https://en.wikipedia.org/wiki/Overview_of_RESTful_API_Description_Languages
 * https://en.wikipedia.org/wiki/Web_Application_Description_Language
 * https://en.wikipedia.org/wiki/RAML_(software)
 * https://en.wikipedia.org/wiki/OpenAPI_Specification
 * https://github.com/swagger-api/swagger-spec/wiki

References
----------

<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
