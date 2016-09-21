
<!--
-->

Tag Soup
--------

These are the browser parsers that handle misformed HTML

https://en.wikipedia.org/wiki/Tag_soup

Link vs Script Tags
-------------------

```
<script src="demo_async.js" async></script>
Try it Yourself »
```

The async attribute is a boolean attribute.

When present, it specifies that the script will be executed asynchronously as soon as it is available.

Note: The async attribute is only for external scripts (and should only be used if the src attribute is present).

Note: There are several ways an external script can be executed:

If async is present: The script is executed asynchronously with the rest of the page (the script will be executed while the page continues the parsing)
If async is not present and defer is present: The script is executed when the page has finished parsing
If neither async or defer is present: The script is fetched and executed immediately, before the browser continues parsing the page

        chrome  IE      FF      S       O
async   Yes     10.0    3.6     Yes     Yes

Differences Between HTML 4.01 and HTML5
The async attribute is new in HTML5.

Differences Between HTML and XHTML
In XHTML, attribute minimization is forbidden, and the async attribute must be defined as <script async="async">.

an I load javascript code using <link> tag
http://stackoverflow.com/questions/2631635/ddg#2631785

Link "rel" types
----------------

name = cdata [CS]

This attribute names the current anchor so that it may be the
destination of another link. The value of this attribute must be a
unique anchor name. The scope of this name is the current document.
Note that this attribute shares the same name space as the id
attribute.

href = uri [CT]

This attribute specifies the location of a Web resource, thus
defining a link between the current element (the source anchor) and
the destination anchor defined by this attribute.

hreflang = langcode [CI]

This attribute specifies the base language of the resource designated
by href and may only be used when href is specified.

type = content-type [CI]

This attribute gives an advisory hint as to the content type of the
content available at the link target address. It allows user agents
to opt to use a fallback mechanism rather than fetch the content
if they are advised that they will get content in a content type
they do not support.

Authors who use this attribute take responsibility to manage the
risk that it may become inconsistent with the content available at
the link target address.

For the current list of registered content types, please consult
[MIMETYPES].

rel = link-types [CI]

This attribute describes the relationship from the current document
to the anchor specified by the href attribute. The value of this
attribute is a space-separated list of link types.

rev = link-types [CI]

This attribute is used to describe a reverse link from the anchor
specified by the href attribute to the current document. The value
of this attribute is a space-separated list of link types.

charset = charset [CI]

This attribute specifies the character encoding of the resource
designated by the link. Please consult the section on character
encodings for more details.



Authors may use the following recognized link types, listed here
with their conventional interpretations. In the DTD, %LinkTypes
refers to a space-separated list of link types. White space characters
are not permitted within link types.



These link types are case-insensitive, i.e., "Alternate" has the
same meaning as "alternate".



User agents, search engines, etc. may interpret these link types
in a variety of ways. For example, user agents may provide access
to linked documents through a navigation bar.



Alternate

Designates substitute versions for the document in which the link
occurs. When used together with the lang attribute, it implies a
translated version of the document. When used together with the
media attribute, it implies a version designed for a different
medium (or media).

Stylesheet

Refers to an external style sheet. See the section on external style
sheets for details. This is used together with the link type
"Alternate" for user-selectable alternate style sheets.

Start

Refers to the first document in a collection of documents. This
link type tells search engines which document is considered by the
author to be the starting point of the collection.

Next

Refers to the next document in a linear sequence of documents. User
agents may choose to preload the "next" document, to reduce the
perceived load time.

Prev

Refers to the previous document in an ordered series of documents.
Some user agents also support the synonym "Previous".

Contents

Refers to a document serving as a table of contents. Some user
agents also support the synonym ToC (from "Table of Contents").

Index

Refers to a document providing an index for the current document.

Glossary

Refers to a document providing a glossary of terms that pertain to
the current document.

Copyright

Refers to a copyright statement for the current document.

Chapter

Refers to a document serving as a chapter in a collection of
documents.

Section

Refers to a document serving as a section in a collection of
documents.

Subsection

Refers to a document serving as a subsection in a collection of
documents.

Appendix

Refers to a document serving as an appendix in a collection of
documents.

Help

Refers to a document offering help (more information, links to other
sources information, etc.)

Bookmark

Refers to a bookmark. A bookmark is a link to a key entry point
within an extended document. The title attribute may be used, for
example, to label the bookmark. Note that several bookmarks may be
defined in each document.

Authors may wish to define additional link types not described in
this specification. If they do so, they should use a profile to
cite the conventions used to define the link types. Please see the
profile attribute of the HEAD element for more details.

<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
