
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

 * <https://en.wikipedia.org/wiki/Overview_of_RESTful_API_Description_Languages>
 * <https://en.wikipedia.org/wiki/Web_Application_Description_Language>
 * <https://en.wikipedia.org/wiki/RAML_(software)>
 * <https://en.wikipedia.org/wiki/OpenAPI_Specification>
 * <https://github.com/swagger-api/swagger-spec/wiki>

 * <http://swagger.io/specification/>
 * <https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md>
 * <https://github.com/OAI/OpenAPI-Specification>

 * https://en.wikipedia.org/wiki/RSDL
 * http://www.balisage.net/Proceedings/vol10/html/Robie01/BalisageVol10-Robie01.html
 * https://apiblueprint.org/
 * https://apiblueprint.org/documentation/tutorial.html
 * https://en.wikipedia.org/wiki/Apache_Avro
 * https://en.wikipedia.org/wiki/Apache_Thrift

 * http://www.semanticinterface.org/
 * http://www.semanticinterface.org/semantic-interfaces
 * http://www.semanticinterface.org/articles

 * http://www.markus-lanthaler.com/research/a-semantic-description-language-for-restful-data-services-to-combat-semaphobia.pdf

GraphQL - Facebook
------------------

How to use

https://en.wikipedia.org/wiki/GraphQL
http://graphql.org/
http://facebook.github.io/graphql/

URI Resources
-------------

https://en.wikipedia.org/wiki/Representational_state_transfer
http://www.ics.uci.edu/~fielding/pubs/dissertation/rest_arch_style.htm

http://www.ics.uci.edu/~fielding/pubs/dissertation/evaluation.htm#sec_6_2
http://stackoverflow.com/questions/1929347/rest-multiple-uri-for-the-same-resource
https://www.w3.org/2001/tag/issues.html#httpRange-14
https://lists.w3.org/Archives/Public/www-tag/2002Jul/0253
https://lists.w3.org/Archives/Public/www-tag/2002Apr/0221
http://archives.neohapsis.com/archives/fulldisclosure/2006-10/0296

References
----------

<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
