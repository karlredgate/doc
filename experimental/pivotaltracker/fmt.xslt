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

  <dc:title>Format text string into lines</dc:title>
  <dc:creator>Karl Redgate</dc:creator>
  <dc:description>
  </dc:description>

  <xsl:output method="text"/>
  <xsl:template match='text()' />

  <dc:description>
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
