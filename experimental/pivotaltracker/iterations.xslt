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

  <dc:description>
  </dc:description>
  <xsl:template match='object[kind="iteration"]'>
      <xsl:text>Iteration </xsl:text>
      <xsl:value-of select='number' />
      <xsl:text> (</xsl:text>
      <xsl:value-of select='start' />
      <xsl:text> to </xsl:text>
      <xsl:value-of select='finish' />
      <xsl:text>)&#10;</xsl:text>
      <xsl:text>==========================================================&#10;</xsl:text>
      <xsl:text>&#10;</xsl:text>
      <xsl:apply-templates />
  </xsl:template>

  <dc:description>
  </dc:description>
  <xsl:template match='object[kind="story"]'>
      <xsl:text>#</xsl:text>
      <xsl:value-of select='id' />
      <xsl:text> (</xsl:text>
      <xsl:value-of select='story_type' />
      <xsl:text>/</xsl:text>
      <xsl:value-of select='current_state' />
      <xsl:text>) </xsl:text>
      <xsl:value-of select='owner_ids/array/item' />

      <xsl:choose>
          <xsl:when test='estimate'>
              <xsl:text> (</xsl:text>
              <xsl:value-of select='estimate' />
              <xsl:text> points)</xsl:text>
          </xsl:when>
          <xsl:otherwise>
              <xsl:text> (unestimated)</xsl:text>
          </xsl:otherwise>
      </xsl:choose>

      <xsl:text>&#10;</xsl:text>
      <xsl:text>Title: </xsl:text>
      <xsl:value-of select='name' />
      <xsl:text>&#10;</xsl:text>
      <xsl:text>&#10;</xsl:text>
      <xsl:call-template name='fmt'>
          <xsl:with-param name='value' select='description' />
          <xsl:with-param name='width' select='50' />
      </xsl:call-template>
      <xsl:text>&#10;</xsl:text>
      <xsl:apply-templates />
      <xsl:text>----------------------------------------------------------&#10;</xsl:text>
  </xsl:template>

  <dc:description>
  </dc:description>
  <xsl:template match='notes'>
      <xsl:text>----------------------------------------------------------&#10;</xsl:text>
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
              <xsl:value-of select="$chunk" />
              <xsl:text>&#10;</xsl:text>
          </xsl:when>
          <!--
            - there is an embedded newline in the existing chunk
            - so print up to the newline and then format everything after the newline
            -->
          <xsl:when test='$line != ""'>
              <xsl:value-of select="$line" />
              <xsl:text>&#10;</xsl:text>
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
              <xsl:value-of select="$chunk" />
              <xsl:value-of select="$nextline" />
              <xsl:text>&#10;</xsl:text>
              <xsl:call-template name='fmt'>
                  <xsl:with-param name='value' select='substring-after($rest,"&#10;")' />
                  <xsl:with-param name='width' select='$width' />
              </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
              <xsl:value-of select="$chunk" />
              <xsl:value-of select='$nextword' />
              <xsl:text>&#10;</xsl:text>
              <xsl:call-template name='fmt'>
                  <xsl:with-param name='value' select='substring-after($rest," ")' />
                  <xsl:with-param name='width' select='$width' />
              </xsl:call-template>
          </xsl:otherwise>
      </xsl:choose>

  </xsl:template>

</xsl:stylesheet>
<!-- vim: set autoindent expandtab sw=4 syntax=xslt: -->
