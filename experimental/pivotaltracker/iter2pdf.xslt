<?xml version='1.0' ?>
<xsl:stylesheet xmlns:xsl='http://www.w3.org/1999/XSL/Transform'
                xmlns:fn='http://www.w3.org/2005/02/xpath-functions'
                xmlns:xsd='http://www.w3.org/2001/XSL/XMLSchema'
                xmlns:xsi='http://www.w3.org/2001/XSL/XMLSchema-instance'
                xmlns:dc="http://purl.org/dc/elements/1.1/"
                xmlns:DNS='http://svn.sn.stratus.com/storbitz/DNS'
                xmlns:IPv6='http://svn.sn.stratus.com/storbitz/IPv6'
                xmlns:util='http://svn.sn.stratus.com/storbitz/utils'
                xmlns:str='http://exslt.org/strings'
                version='1.0'>

  <dc:title>Generate a nice report of the stories in an iteration</dc:title>
  <dc:creator>Karl Redgate</dc:creator>
  <dc:description>
  Create a text report from an XML doc from PivotalTracker.com
  </dc:description>

  <xsl:output method="text"/>
  <xsl:template match='text()' />
  <xsl:strip-space elements="*" />

  <dc:description>
  </dc:description>
  <xsl:template match='/'>
      <xsl:text>%PDF-1.0&#10;</xsl:text>

      <xsl:call-template name='InfoObject'>
          <xsl:with-param name='objnum' select='1' />
      </xsl:call-template>

      <xsl:call-template name='FontObject'>
          <xsl:with-param name='objnum' select='2' />
          <xsl:with-param name='BaseFont'>Helvetica</xsl:with-param>
      </xsl:call-template>

      <xsl:call-template name='FontObject'>
          <xsl:with-param name='objnum' select='3' />
          <xsl:with-param name='BaseFont'>Helvetica-Bold</xsl:with-param>
      </xsl:call-template>

      <xsl:call-template name='PagesObject'>
          <xsl:with-param name='objnum' select='4' />
          <xsl:with-param name='PageCount' select='4' />
      </xsl:call-template>

      <xsl:call-template name='CatalogObject'>
          <xsl:with-param name='objnum' select='5' />
          <xsl:with-param name='PagesObject' select='4' />
      </xsl:call-template>

      <xsl:apply-templates />

      <xsl:call-template name='xref'>
          <xsl:with-param name='objcount' select='5' />
      </xsl:call-template>

      <xsl:call-template name='trailer'>
          <xsl:with-param name='objcount' select='5' />
          <xsl:with-param name='RootObject' select='1' />
          <xsl:with-param name='InfoObject' select='4' />
      </xsl:call-template>

  </xsl:template>

  <dc:description>
    You need to make the context of the apply-templates be the (array/item)s
    because if you make the object the context, all positions are 2.
    You need to add the strip-space at the top of the stylesheet or the
    context is doubled for the text nodes and the positions are 2,4,6,...
  </dc:description>
  <xsl:template match='array/item[object/kind="iteration"]'>
      <xsl:value-of select='position()' />
      <xsl:text> 0</xsl:text>
      <xsl:text> obj&#10;</xsl:text>
      <xsl:text>&lt;&lt; /Length 200 &gt;&gt;&#10;endobj&#10;</xsl:text>
      <xsl:text>stream&#10;BT&#10;</xsl:text>

      <xsl:text>/F2 11 Tf&#10;</xsl:text>
      <xsl:text>24 750 Td&#10;</xsl:text>
      <xsl:text>(Iteration </xsl:text>
      <xsl:value-of select='object/number' />
      <xsl:text> [</xsl:text>
      <xsl:value-of select='object/start' />
      <xsl:text> to </xsl:text>
      <xsl:value-of select='object/finish' />
      <xsl:text>]</xsl:text>
      <xsl:text>) Tj&#10;</xsl:text>
      <xsl:text>0 -11 Td&#10;</xsl:text>
      <xsl:text>&#10;</xsl:text>

      <xsl:apply-templates />

      <xsl:text>ET&#10;endstream&#10;</xsl:text>
      <xsl:text>endobj&#10;</xsl:text>

  </xsl:template>

  <dc:description>
  </dc:description>
  <xsl:template match='object[kind="story"]'>
      <xsl:text>(</xsl:text>
      <xsl:text>#</xsl:text>
      <xsl:value-of select='id' />
      <xsl:text> [</xsl:text>
      <xsl:value-of select='story_type' />
      <xsl:text>/</xsl:text>
      <xsl:value-of select='current_state' />
      <xsl:text>] </xsl:text>
      <xsl:value-of select='owner_ids/array/item' />

      <xsl:choose>
          <xsl:when test='estimate'>
              <xsl:text> [</xsl:text>
              <xsl:value-of select='estimate' />
              <xsl:text> points]</xsl:text>
          </xsl:when>
          <xsl:otherwise>
              <xsl:text> [unestimated]</xsl:text>
          </xsl:otherwise>
      </xsl:choose>

      <xsl:text>) Tj&#10;</xsl:text>
      <xsl:text>0 -11 Td&#10;</xsl:text>

      <xsl:text>(Title: </xsl:text>
      <xsl:value-of select='name' />
      <xsl:text>) Tj&#10;</xsl:text>
      <xsl:text>0 -11 Td&#10;</xsl:text>

      <xsl:text>&#10;</xsl:text>
      <xsl:call-template name='fmt'>
          <xsl:with-param name='value' select='description' />
          <xsl:with-param name='width' select='80' />
      </xsl:call-template>
      <xsl:text>&#10;</xsl:text>
      <xsl:apply-templates />
  </xsl:template>

  <dc:description>
  </dc:description>
  <xsl:template match='notes'>
      <xsl:text>(----------------------------------------------------------) Tj&#10;</xsl:text>
      <xsl:text>0 -11 Td&#10;</xsl:text>
      <xsl:apply-templates />
  </xsl:template>

  <dc:description>
  </dc:description>
  <xsl:template match='note'>
      <xsl:text> === Comment (</xsl:text>
      <xsl:value-of select='author' />
      <xsl:text>    </xsl:text>
      <xsl:value-of select='noted_at' />
      <xsl:text>)&#10;</xsl:text>
      <xsl:value-of select='text' />
      <xsl:text>&#10;</xsl:text>
  </xsl:template>

  <dc:description>
  </dc:description>
  <xsl:template match='tasks'>
      <xsl:text>----------------------------------------------------------&#10;</xsl:text>
      <xsl:for-each select='task'>
          <xsl:sort select='position' />
          <xsl:apply-templates select="." />
      </xsl:for-each>
  </xsl:template>

  <dc:description>
  </dc:description>
  <xsl:template match='task'>
      <xsl:choose>
      <xsl:when test='complete = "true"'>Task complete</xsl:when>
      <xsl:otherwise>Task INCOMPLETE</xsl:otherwise>
      </xsl:choose>

      <xsl:text>&#10;</xsl:text>
      <xsl:text>    </xsl:text>
      <xsl:value-of select='description' />
      <xsl:text>&#10;</xsl:text>
  </xsl:template>

  <dc:description>
      If "$rest" contains a newline earlier than 
  </dc:description>
  <xsl:template name='fmt'>
      <xsl:param name="value" />
      <xsl:param name="width" />

      <xsl:variable name="chunk" select="substring($value,1,$width)" />
      <xsl:variable name="line" select='substring-before($chunk,"&#10;")' />
      <xsl:variable name="rest" select="substring($value,$width+1)" />
      <xsl:variable name="nextword" select='substring-before($rest," ")' />
      <xsl:variable name="nextline" select='substring-before($nextword,"&#10;")' />

      <xsl:choose>
          <!-- all the data fits in the next line -->
          <xsl:when test='$rest = ""'>
              <xsl:text>(</xsl:text>
              <xsl:value-of select="$chunk" />
              <xsl:text>) Tj&#10;</xsl:text>
              <xsl:text>0 -11 Td&#10;</xsl:text>
          </xsl:when>
          <!--
            - there is an embedded newline in the existing chunk
            - so print up to the newline and then format everything after the newline
            -->
          <xsl:when test='$line != ""'>
              <xsl:text>(</xsl:text>
              <xsl:value-of select="$line" />
              <xsl:text>) Tj&#10;</xsl:text>
              <xsl:text>0 -11 Td&#10;</xsl:text>
              <xsl:call-template name='fmt'>
                  <xsl:with-param name='value' select='substring-after($value,"&#10;")' />
                  <xsl:with-param name='width' select='$width' />
              </xsl:call-template>
          </xsl:when>
          <!--
            - there is a newline within the 'nextword'
            - so only print up to the newline and then format after the newline
            -->
          <xsl:when test='$nextline != ""'>
              <xsl:text>(</xsl:text>
              <xsl:value-of select="$chunk" />
              <xsl:value-of select="$nextline" />
              <xsl:text>) Tj&#10;</xsl:text>
              <xsl:text>0 -11 Td&#10;</xsl:text>
              <xsl:call-template name='fmt'>
                  <xsl:with-param name='value' select='substring-after($rest,"&#10;")' />
                  <xsl:with-param name='width' select='$width' />
              </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
              <xsl:text>(</xsl:text>
              <xsl:value-of select="$chunk" />
              <xsl:value-of select='$nextword' />
              <xsl:text>) Tj&#10;</xsl:text>
              <xsl:text>0 -11 Td&#10;</xsl:text>
              <xsl:call-template name='fmt'>
                  <xsl:with-param name='value' select='substring-after($rest," ")' />
                  <xsl:with-param name='width' select='$width' />
              </xsl:call-template>
          </xsl:otherwise>
      </xsl:choose>

  </xsl:template>

  <dc:description>
  </dc:description>
  <xsl:template name='InfoObject'>
      <xsl:param name="objnum" />
      <xsl:param name="generation">0</xsl:param>
      <xsl:value-of select='$objnum' />
      <xsl:text> </xsl:text>
      <xsl:value-of select='$generation' />
      <xsl:text> obj&#10;</xsl:text>
      <xsl:text>&lt;&lt;
/Author(Karl Redgate)
/Creator(Karl Redgate)
/CreationDate(D:20150301104239) 
/ModDate(D:20150301104239) 
/Producer(Karl Redgate)
&gt;&gt;
endobj
</xsl:text>
  </xsl:template>

  <dc:description>
  </dc:description>
  <xsl:template name='FontObject'>
      <xsl:param name="objnum" />
      <xsl:param name="generation">0</xsl:param>
      <xsl:param name="BaseFont" />

      <xsl:value-of select='$objnum' />
      <xsl:text> </xsl:text>
      <xsl:value-of select='$generation' />
      <xsl:text> obj&#10;</xsl:text>
      <xsl:text>&lt;&lt; /Type /Font /Subtype /Type1 /BaseFont /</xsl:text>
      <xsl:value-of select='$BaseFont' />
      <xsl:text> &gt;&gt;&#10;endobj&#10;</xsl:text>
  </xsl:template>

  <dc:description>
  </dc:description>
  <xsl:template name='CatalogObject'>
      <xsl:param name="objnum" />
      <xsl:param name="generation">0</xsl:param>
      <xsl:param name="PagesObject" />

      <xsl:value-of select='$objnum' />
      <xsl:text> </xsl:text>
      <xsl:value-of select='$generation' />
      <xsl:text> obj&#10;</xsl:text>
      <xsl:text>&lt;&lt; /Type /Catalog&#10;</xsl:text>
      <xsl:text>/Pages </xsl:text>
      <xsl:value-of select='$PagesObject' />
      <xsl:text> </xsl:text>
      <xsl:value-of select='$generation' />
      <xsl:text> R &gt;&gt;&#10;endobj&#10;</xsl:text>
  </xsl:template>

  <dc:description>
  </dc:description>
  <xsl:template name='PagesObject'>
      <xsl:param name="objnum" />
      <xsl:param name="generation">0</xsl:param>
      <xsl:param name="PageCount" />

      <xsl:value-of select='$objnum' />
      <xsl:text> </xsl:text>
      <xsl:value-of select='$generation' />
      <xsl:text> obj&#10;</xsl:text>
      <xsl:text>&lt;&lt; /Type /Pages&#10;</xsl:text>
      <xsl:text>/Count </xsl:text>
      <xsl:value-of select='$PageCount' />
      <xsl:text>&#10;</xsl:text>
      <xsl:text>/Kids [ </xsl:text>
      <xsl:text> ]&#10;</xsl:text>
      <xsl:text> &gt;&gt;&#10;endobj&#10;</xsl:text>
  </xsl:template>

  <dc:description>
  </dc:description>
  <xsl:template name='xref'>
      <xsl:param name='objcount' />
      <xsl:param name="generation">0</xsl:param>

      <xsl:text>xref&#10;</xsl:text>
      <xsl:value-of select='$generation' />
      <xsl:text> </xsl:text>
      <xsl:value-of select='$objcount' />
      <xsl:text>&#10;</xsl:text>
      <xsl:text>&#10;</xsl:text>
  </xsl:template>

  <dc:description>
  </dc:description>
  <xsl:template name='trailer'>
      <xsl:param name='objcount' />
      <xsl:param name='RootObject' />
      <xsl:param name='InfoObject' />
      <xsl:param name="generation">0</xsl:param>

      <xsl:text>trailer&#10;</xsl:text>
      <xsl:text>&lt;&lt;&#10;</xsl:text>

      <xsl:text>/Size </xsl:text>
      <xsl:value-of select='$objcount' />
      <xsl:text>&#10;</xsl:text>

      <xsl:text>/Root </xsl:text>
      <xsl:value-of select='$RootObject' />
      <xsl:text> </xsl:text>
      <xsl:value-of select='$generation' />
      <xsl:text> R&#10;</xsl:text>

      <xsl:text>/Info </xsl:text>
      <xsl:value-of select='$InfoObject' />
      <xsl:text> </xsl:text>
      <xsl:value-of select='$generation' />
      <xsl:text> R&#10;</xsl:text>

      <xsl:text>&gt;&gt;
startxref

%%EOF
</xsl:text>
  </xsl:template>

</xsl:stylesheet>
<!-- vim: set autoindent expandtab sw=4 syntax=xslt: -->
