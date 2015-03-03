## When positions are all even

This is the problem of text nodes making the positions be doubled.
To fix add `xsl:strip-space` at the top of the stylesheet.

## Template match pattern ordering

least specific to most specific

If the least specific follows the most specific it will take precedence.

## Using external for doc for key

key definition uses a *match pattern*, not a *select expression*, to
identify the nodes that it indexes. When key() is called, it looks for
nodes that match the match pattern for the key *in the document
holding the current node*, and indexes them.

<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
