<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<!-- Main template ======================================================== -->


<xsl:template match="/">
<html>
  <body>
    <h1><xsl:value-of select="article/title"/></h1>

    <!-- First section -->
    <xsl:call-template name="first-section"/>

    <!-- Second section -->
    <xsl:call-template name="second-section"/>

    <!-- Third section -->
    <xsl:call-template name="third-section"/>

  </body>
</html>
</xsl:template>



<!-- First main section ==================================================== -->



<xsl:template match="/article/section[1]" name="first-section">
  <section>
    <h2><xsl:value-of select="/article/section[1]/title"/></h2>
    <xsl:for-each select="/article/section[1]/para">
      <p><xsl:value-of select="."/></p>
    </xsl:for-each>
  </section>
</xsl:template>



<!-- Second main section ==================================================== -->



<xsl:template match="/article/section[2]" name="second-section">
  <section>
    <h2><xsl:value-of select="/article/section[2]/title"/></h2>
    <xsl:for-each select="/article/section[2]/para">
      <p><xsl:value-of select="."/></p>
    </xsl:for-each>
  </section>
</xsl:template>



<!-- Third main section =================================================== -->
<xsl:template match="/article/section[3]" name="third-section">
  <section>
    <h2><xsl:value-of select="/article/section[3]/title"/></h2>
    <p>
      <xsl:value-of select="/article/section[3]/para/text()[1]"/>
      <code style="color:red;">
        <xsl:value-of select="/article/section[3]/para/code[1]"/>
      </code>
      <xsl:value-of select="/article/section[3]/para/text()[2]"/>
      <code style="color:red;">
        <xsl:value-of select="/article/section/para/code[2]"/>
      </code>
      <xsl:value-of select="/article/section[3]/para/text()[3]"/>
      <code style="color:red;">
        <xsl:value-of select="/article/section/para/code[3]"/>
      </code>
      <xsl:value-of select="/article/section[3]/para/text()[4]"/>
      <code style="color:red;">
        <xsl:value-of select="/article/section/para/code[4]"/>
      </code>
      <xsl:value-of select="/article/section[3]/para/text()[5]"/>
    </p>

    <xsl:call-template name="second-level-section"/>

  </section>
</xsl:template>


<!-- Second level section -->
<xsl:template match="/article/section[3]/section" name="second-level-section">

  <xsl:for-each select="/article/section[3]/section">
    <section>
        <h3><xsl:value-of select="title"/></h3>
        <p><xsl:value-of select="para"/></p>

        <xsl:call-template name="third-level-section"/>

    </section>
  </xsl:for-each>

</xsl:template>


<!-- Third level section. Paragraph element -->
<xsl:template match="/article/section[3]" name="third-level-section">

  <xsl:for-each select="section">
    <section>
        <h4><xsl:value-of select="title"/></h4>
        

        <xsl:for-each select="para">
          <p><xsl:value-of select="."/></p>
        </xsl:for-each>


    </section>
  </xsl:for-each>

</xsl:template>




<!-- Fourth main section =================================================== -->




</xsl:stylesheet>