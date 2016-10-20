
<!--
-->

XSLT XPATH
----------

**`child::book`**
Selects all book nodes that are children of the current node

**`attribute::lang`**
Selects the lang attribute of the current node

**`child::*`**
Selects all element children of the current node

**`attribute::*`**
Selects all attributes of the current node

**`child::text()`**
Selects all text node children of the current node

**`child::node()`**
Selects all children of the current node

**`descendant::book`**
Selects all book descendants of the current node

**`ancestor::book`**
Selects all book ancestors of the current node

**`ancestor-or-self::book`**
Selects all book ancestors of the current node - and the current as well if it is a book node

**`child::*/child::price`**
Selects all price grandchildren of the current node

XSL-FO
------

https://en.wikipedia.org/wiki/XSL_Formatting_Objects
https://www.w3.org/Style/XSL/
https://www.w3.org/TR/xsl/
https://www6.software.ibm.com/developerworks/education/x-xslfo/x-xslfo-a4.pdf
https://www6.software.ibm.com/developerworks/education/x-xslfo2/x-xslfo2-a4.pdf
http://www.renderx.com/files/wikipedia-pdf/XSL_Formatting_Objects.pdf

This one looks interesting
https://en.wikipedia.org/wiki/Text_Encoding_Initiative

https://xmlgraphics.apache.org/fop/
http://xmlgraphics.apache.org/

Streaming XSLT
--------------

https://en.wikipedia.org/wiki/Streaming_Transformations_for_XML
http://stx.sourceforge.net/
http://www.xml.com/pub/a/2003/02/26/stx.html

Schemas
-------

### XSD

This is an XSLT to translate XSD to RNG - which I can use
for translating the STIX security schemas to RNG.

 * https://github.com/epiasini/XSDtoRNG

STIX is the security schema out of Mitre.

### Relax-NG

### Schematron

<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
