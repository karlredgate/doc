
<!--
-->

recursive descent JSON parser
https://github.com/kutsurak/JSON-parser
https://github.com/douglascrockford/JSON-js

JSON Schema
-----------

 * https://spacetelescope.github.io/understanding-json-schema/reference/schema.html
 * http://json-schema.org/
 * http://json-schema.org/examples.html

JSON-LD
-------

json ld example
 * []( https://en.wikipedia.org/wiki/JSON-LD )
 * []( http://www.markus-lanthaler.com/research/on-using-json-ld-to-create-evolvable-restful-services.pdf )
 * []( http://www.w3.org/TR/json-ld/ )
 * []( https://en.wikipedia.org/wiki/Semantic_Web )
 * []( http://json-ld.org/playground/index.html )
 * []( http://stackoverflow.com/questions/23996953/json-ldhydra-link-discovery )
 * []( https://en.wikipedia.org/wiki/Resource_Description_Framework )
 * []( https://en.wikipedia.org/wiki/Turtle_(syntax) )

 * []( http://json-ld.org/learn.html )
 * []( https://www.youtube.com/watch?v=vioCbTo3C-4 )
 * []( https://www.youtube.com/watch?v=UmvWk_TQ30A )
 * []( https://www.youtube.com/watch?v=Tm3fD89dqRE )

### JSON-LD

```
01    {
02      "@context": "example-context.json",
03      "@id": "http://example.org/bob#me",
04      "@type": "Person",
05      "birthdate": "1990-07-04",
06      "knows": "http://example.org/alice#me",
07      "interest": {
08        "@id": "http://www.wikidata.org/entity/Q12418",
09        "title": "Mona Lisa",
10        "subject_of": "http://data.europeana.eu/item/04802/243FA8618938F4117025F17A8B813C5F9AA4D619",
11        "creator": "http://dbpedia.org/resource/Leonardo_da_Vinci"
12      }
13    }
```

The @context key on line 2 points to a JSON document describing how the document can be mapped to an RDF graph (see below). Each JSON object corresponds to an RDF resource. In this example the main resource being described is http://example.org/bob#me, as specified on line 3, through the use of the @id keyword. The @id keyword, when used as a key in a JSON-LD document, points to an IRI identifying the resource corresponding to the current JSON object. We describe the type of this resource on line 4, its birth date on line 5 and one of its friends on line 6. From line 7 to 12 we describe one of its interests, the Mona Lisa painting.

To describe this painting we create a new JSON object on line 7 and associate it with the Mona Lisa IRI in Wikidata on line 8. We then describe various properties of that painting from line 9 to line 11.

The JSON-LD context used in this example is given below.

EXAMPLE 13: JSON-LD context specification
```
01    {
02      "@context": {
03        "foaf": "http://xmlns.com/foaf/0.1/", 
04        "Person": "foaf:Person",
05        "interest": "foaf:topic_interest",
06        "knows": {
07          "@id": "foaf:knows",
08          "@type": "@id"
09        },
10        "birthdate": {
11          "@id": "http://schema.org/birthDate",
12          "@type": "http://www.w3.org/2001/XMLSchema#date"
13        },
14        "dcterms": "http://purl.org/dc/terms/",
15        "title": "dcterms:title",
16        "creator": {
17          "@id": "dcterms:creator",
18          "@type": "@id"
19        },
20        "subject_of": {
21          "@reverse": "dcterms:subject",
22          "@type": "@id"
23        }
24      }
25    }
```

<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
