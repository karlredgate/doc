

http://daringfireball.net/projects/markdown/

Markdown Parsers
----------------

### Sundown

Sundown is a Markdown parser based on the original code of the Upskirt library by Natacha Porté.

https://github.com/vmg/sundown

### libsoldout (upskirt)

For some projects of mine, I wanted a lightweight C library that can parse John Gruber's markdown format into whatever I want, and that is easily extendable.

The only C implementations of markdown that I know of are Discount and PEG-markdown. Discount seemed a little bit too integrated and focused on HTML output for my taste, and PEG-markdown seemed to have a lot of dependencies and stuff. So I wrote my own.

I like to keep things simple, so I wrote a function that performs only markdown parsing: no file reading or writing, no (X)HTML considerations, etc. The actual output is performed by a set of dedicated callback functions, called here a renderer. Some example renderers are provided, but you are free to use your own to output in any format you like.

This callback mechanism make libupskirt so flexible that it does not need any flag or external information besides input text and renderer to operate.

The code almost completely feels my needs and those of users I know of, so I consider the project as being mature. I will of course fix bugs that are discovered, and will consider feature requests, but don't expect much changes at this point.

There has been a lot of discussion about how offensive the name of the project used to be. So I wrote how it ended up having such a name. Eventually I renamed it to the more neutral and thematically-consistent name it currently has.

http://fossil.instinctive.eu/libsoldout/home
http://fossil.instinctive.eu/index.html

http://fossil.instinctive.eu/libsoldout/wiki?name=about-the-name

### Discount

http://www.pell.portland.or.us/~orc/Code/markdown/

### PEG-Markdown

http://github.com/jgm/peg-markdown/tree/master

API-Blueprint
-------------

This is a variant of Markdown for apiary.io

http://apiblueprint.org/
https://github.com/apiaryio/api-blueprint/releases/tag/format-1A8
https://github.com/apiaryio/api-blueprint/releases/tag/format-1A9

https://github.com/apiaryio/api-blueprint-ast
http://api-elements.readthedocs.io/en/latest/element-definitions/#parse-result-elements

There are parsers for this specifically:

### Drafter

Drafter is complex builder of API Blueprint. Internally it uses
Snowcrash library, reference API Blueprint parser.

API Blueprint is Web API documentation language. You can find API
Blueprint documentation on the API Blueprint site.

Additionally Drafter provide set of Wrappers for serialization, of
parsing result, via SOS library into JSON and YAML format.

https://github.com/apiaryio/sos

Drafter also provides the user ability to select the type of the
output. There are two possible values:

API Elements Parse Result: Parse Result is defined in API Elements
according to Parse Result Namespace.  Normal AST Parse Result: Parse
Result defined by the API Blueprint AST Parse Result. The AST is
deprecated and only available in the Drafter command line tool.  By
default, Drafter assumes the Refract Parse Result.

Both the types of Parse Results are available in two different
serialization formats, YAML and JSON. YAML is the default for the
CLI.

https://github.com/apiaryio/drafter

### Snowcrash (C++)

Snow Crash is the reference API Blueprint parser built on top of
the Sundown Markdown parser.

API Blueprint is Web API documentation language. You can find API
Blueprint documentation on the API Blueprint site.

https://github.com/apiaryio/snowcrash


<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
