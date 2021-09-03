<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<html>
  <head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title><xsl:value-of select="article/title"/></title>
  </head>
  <body style="font-family:Helvetica,Arial,sans-serif;padding:50px;">
    <xsl:apply-templates/>
  </body>
</html>
</xsl:template>


<xsl:template match="article">
  <xsl:copy>
    <h2>Table of content</h2>
    <ol>
      <xsl:apply-templates select="section" mode="toc"/>
    </ol>
    <xsl:apply-templates/>
  </xsl:copy>
</xsl:template>


<!-- Article title ============ -->
<xsl:template match="title">
  <h1 style="color:blue">
    <xsl:attribute name="id">
      <xsl:choose>
        <xsl:when test="@id">
          <xsl:value-of select="@id"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="."/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
    <xsl:apply-templates/>
  </h1>
</xsl:template>


<!-- Section title ============ -->
<xsl:template match="section/title">
  <h2 style="color:blue">
    <xsl:attribute name="id">
      <xsl:choose>
        <xsl:when test="@id">
          <xsl:value-of select="@id"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="."/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
    <xsl:apply-templates/>
  </h2>
</xsl:template>


<!-- Second level section title ============ -->
<xsl:template match="section/section/title">
  <h3 style="color:blue">
    <xsl:attribute name="id">
      <xsl:choose>
        <xsl:when test="@id">
          <xsl:value-of select="@id"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="."/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
    <xsl:apply-templates/>
  </h3>
</xsl:template>


<xsl:template match="section">
  <xsl:copy>
    <xsl:if test="@id">
      <xsl:attribute name="id">
            <xsl:value-of select="@id"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:attribute name="title">
          <xsl:value-of select="title"/>
    </xsl:attribute>
    <xsl:apply-templates/>
  </xsl:copy>
</xsl:template>


<xsl:template match="para">
  <p>
    <xsl:apply-templates/>
  </p>
</xsl:template>


<xsl:template match="code">
  <xsl:copy>
      <xsl:attribute name="style">
        <xsl:text>color:red;</xsl:text>
      </xsl:attribute>
    <xsl:apply-templates/>
  </xsl:copy>
</xsl:template>


<xsl:template match="orderedlist">
  <ol>
    <xsl:apply-templates/>
  </ol>
</xsl:template>


<xsl:template match="listitem">
  <li>
    <xsl:apply-templates/>
  </li>
</xsl:template>


<xsl:template match="keycap">
  <kbd>
    <xsl:attribute name="style">
      <xsl:text>font-weight:bold;</xsl:text>
    </xsl:attribute>
    <xsl:apply-templates/>
  </kbd>
</xsl:template>


<xsl:template match="itemizedlist">
  <ul>
    <xsl:apply-templates/>
  </ul>
</xsl:template>


<xsl:template match="emphasis">
  <em>
    <xsl:apply-templates/>
  </em>
</xsl:template>


<xsl:template match="link">
  <a style="color:green;">
    <xsl:attribute name="href">
      #<xsl:value-of select="@linkend"/>
    </xsl:attribute>
    <xsl:apply-templates/>
  </a>
</xsl:template>


<xsl:template match="ulink">
  <a style="color:green;">
    <xsl:attribute name="href">
      <xsl:value-of select="@url"/>
    </xsl:attribute>
    <xsl:apply-templates/>
  </a>
</xsl:template>


<xsl:template match="section" mode="toc">
  <li>
    <a>
      <xsl:attribute name="href">
        #<xsl:value-of select="title"/>
      </xsl:attribute>
      <xsl:value-of select="title"/>
    </a>
  </li>
</xsl:template>


</xsl:stylesheet>