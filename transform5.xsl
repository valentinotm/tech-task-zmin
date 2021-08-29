<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:variable name="para">
  <p><xsl:copy-of select="/article/section[3]/para[1]/child::node()"/></p>
</xsl:variable>


<xsl:attribute-set name="inline-elements-attributes">
  <xsl:attribute name="href">#chapter-inline-elements.title</xsl:attribute>
  <xsl:attribute name="title"></xsl:attribute>
</xsl:attribute-set>


<xsl:attribute-set name="link-elements-attributes">
  <xsl:attribute name="href">#chapter-inline-elements</xsl:attribute>
  <xsl:attribute name="title">
    <xsl:value-of select="//section[@id='chapter-inline-elements']/title/text()"/>
  </xsl:attribute>
</xsl:attribute-set>


<xsl:template match="/">
  <html>
    <head>
    </head>
    <body>
      <article>
        <h1><xsl:value-of select="article/title"/></h1>

        <!-- First main section. Introduction -->
        <xsl:apply-templates select="article/section[1]"/>

        <!-- Second main section. Problem description -->
        <xsl:apply-templates select="article/section[2]"/>

        <!-- Third main section. DocBook elements catalog -->
        <xsl:apply-templates select="article/section[3]"/>

        <!-- Third main section. Bonus tasks -->
        <xsl:apply-templates select="article/section[4]"/>

        <!-- Fifth main section. Tools -->
        <xsl:apply-templates select="article/section[5]"/>

        <!-- Fifth main section. Acceptance criteria -->
        <xsl:apply-templates select="article/section[6]"/>

        <!-- Fifth main section. Resources -->
        <xsl:apply-templates select="article/section[7]"/>


      </article>
    </body>
  </html>
</xsl:template>


<!-- First main section. Introduction ===================== -->
<xsl:template match="article/section[1]">
  <xsl:copy select="section[1]">
    <xsl:attribute name="id">
      <xsl:text>chapter-introduction</xsl:text>
    </xsl:attribute>
    <h2><xsl:value-of select="title"/></h2>
    <p><xsl:value-of select="para[1]"/></p>
    <p><xsl:value-of select="para[2]"/></p>
  </xsl:copy>
</xsl:template>
<!-- First main section. Introduction ===================== -->


<!-- Second main section. Problem description ============= -->
<xsl:template match="article/section[2]">
  <xsl:copy select="section[2]">
    <h2><xsl:value-of select="title"/></h2>
    <p><xsl:value-of select="para[1]"/></p>
    <p><xsl:value-of select="para[2]"/></p>
  </xsl:copy>
</xsl:template>
<!-- Second main section. Problem description ============= -->


<!-- Third main section. DocBook elements catalog ========= -->
<xsl:template match="article/section[3]">
  <xsl:copy>
    <h2><xsl:value-of select="title"/></h2>
    <xsl:call-template name="para"/>
    <xsl:call-template name="block-level-section"/>
    <xsl:call-template name="inline-elements-section"/>
    <xsl:call-template name="link-elements-section"/>
  </xsl:copy>
</xsl:template>


<!-- Para template -->
<xsl:template match="article/section[3]/para[1]" name="para">
  <xsl:copy-of select="$para"/>
</xsl:template>


<!-- *** First inner section. Block-level elements *** -->
<xsl:template match="article/section[3]/section[1]" name="block-level-section">
<section>
  <h3><xsl:value-of select="section[1]/title"/></h3>
  <p><xsl:value-of select="section[1]/para[1]"/></p>
  <xsl:call-template name="first-inner-section"/>
  <xsl:call-template name="second-inner-section"/>
  <xsl:call-template name="third-inner-section"/>
  <xsl:call-template name="fourth-inner-section"/>
</section>
</xsl:template>


<!-- First inner section. Paragraph element -->
<xsl:template match="article/section[3]/section[1]/section[1]" name="first-inner-section">
<section>
  <h4><xsl:value-of select="section[1]/section[1]/title"/></h4>
  <p><xsl:copy-of select="section[1]/section[1]/para[1]/child::node()"/></p>
  <p><xsl:copy-of select="section[1]/section[1]/para[2]/child::node()"/></p>
  <p><xsl:value-of select="section[1]/section[1]/para[3]"/></p>
  <p><xsl:value-of select="section[1]/section[1]/para[4]"/></p>
</section>
</xsl:template>
<!-- First inner section. Paragraph element -->


<!-- Second inner section. Ordered list element -->
<xsl:template match="article/section[3]/section[1]/section[2]" name="second-inner-section">
<section>
  <h4><xsl:value-of select="section[1]/section[2]/title"/></h4>
  <p><xsl:copy-of select="section[1]/section[2]/para[1]/child::node()"/></p>
  <p><xsl:copy-of select="section[1]/section[2]/para[2]/child::node()"/></p>
  <p><xsl:value-of select="section[1]/section[2]/para[3]"/></p>
  <p><xsl:value-of select="section[1]/section[2]/para[4]"/></p>

  <ol>
    <xsl:for-each select="section[1]/section[2]/orderedlist[1]/listitem">
      <li>
        <p><xsl:value-of select="para"/></p>
      </li>
    </xsl:for-each>
  </ol>

  <p><xsl:value-of select="section[1]/section[2]/para[5]"/></p>

  <ol>
    <xsl:for-each select="section[1]/section[2]/orderedlist[2]/listitem">
      <li>
        <p><xsl:value-of select="para"/></p>
      </li>
    </xsl:for-each>
  </ol>

  <p><xsl:value-of select="section[1]/section[2]/para[6]"/></p>

  <ol>
    <li>
      <p>
      <xsl:copy-of select="section[1]/section[2]/orderedlist[3]/listitem[1]/para[1]/text()[1]"/>
      <kbd><xsl:copy-of select="section[1]/section[2]/orderedlist[3]/listitem[1]/para[1]/keycap/text()"/></kbd>
      <xsl:copy-of select="section[1]/section[2]/orderedlist[3]/listitem[1]/para[1]/text()[2]"/>
      </p>
    </li>

    <li>
      <xsl:for-each select="section[1]/section[2]/orderedlist[3]/listitem[2]/para">
        <p><xsl:copy-of select="text()"/></p>
      </xsl:for-each>
    </li>

    <li>
      <xsl:for-each select="section[1]/section[2]/orderedlist[3]/listitem[3]/para">
        <p><xsl:copy-of select="text()"/></p>
      </xsl:for-each>
      <ul>
        <xsl:for-each select="section[1]/section[2]/orderedlist[3]/listitem[3]/itemizedlist/listitem/para">
        <li><p><xsl:copy-of select="text()"/></p></li>
      </xsl:for-each>
      </ul>
    </li>

    <li>
      <p><xsl:copy-of select="section[1]/section[2]/orderedlist[3]/listitem[4]/para/text()"/></p>
    </li>
  </ol>
</section>
</xsl:template>
<!-- Second inner section. Ordered list element -->


<!-- Third inner section. Unordered list element -->
<xsl:template match="article/section[3]/section[1]/section[3]" name="third-inner-section">
<section>
  <h4><xsl:value-of select="section[1]/section[3]/title"/></h4>
  <xsl:for-each select="section[1]/section[3]/para[position() &lt; 6]">
    <p><xsl:copy-of select="child::node()"/></p>
  </xsl:for-each>

  <ul>
    <xsl:for-each select="section[1]/section[3]/itemizedlist[1]/listitem/para">
      <li><p><xsl:value-of select="child::node()"/></p></li>
    </xsl:for-each>
  </ul>

  <p><xsl:copy-of select="section[1]/section[3]/para[6]/child::node()"/></p>

  <ul>
    <p><xsl:copy-of select="section[1]/section[3]/itemizedlist[2]/para/child::node()"/></p>
    <xsl:for-each select="section[1]/section[3]/itemizedlist[2]/listitem/para">
      <li><p><xsl:value-of select="child::node()"/></p></li>
    </xsl:for-each>
  </ul>

  <p><xsl:copy-of select="section[1]/section[3]/para[7]/child::node()"/></p>

  <ul>
    <li>
      <p>
        <xsl:copy-of select="section[1]/section[3]/para/itemizedlist/listitem[1]/para/text()[1]"/>
        <kbd><xsl:copy-of select="section[1]/section[3]/para/itemizedlist/listitem[1]/para/keycap/text()"/></kbd>
        <xsl:copy-of select="section[1]/section[3]/para/itemizedlist/listitem[1]/para/text()[2]"/>
      </p>
    </li>
    <li>
      <xsl:for-each select="section[1]/section[3]/para/itemizedlist/listitem[2]/para">
        <p><xsl:value-of select="child::node()"/></p>
      </xsl:for-each>
    </li>
    <li>
      <xsl:for-each select="section[1]/section[3]/para/itemizedlist/listitem[3]/para">
        <p><xsl:value-of select="child::node()"/></p>
      </xsl:for-each>
      <ul>
        <xsl:for-each select="section[1]/section[3]/para/itemizedlist/listitem[3]/itemizedlist/listitem/para">
          <li><p><xsl:value-of select="child::node()"/></p></li>
        </xsl:for-each>
      </ul>
    </li>
    <li>
      <p><xsl:value-of select="section[1]/section[3]/para/itemizedlist/listitem[4]/para"/></p>
    </li>
  </ul>
</section>
</xsl:template>
<!-- Third inner section. Unordered list element -->


<!-- Fourth inner section. Optional block-level elements tasks -->
<xsl:template match="article/section[3]/section[1]/section[4]" name="fourth-inner-section">
  <section>
    <h4><xsl:value-of select="section[1]/section[4]/title"/></h4>
    <xsl:for-each select="section[1]/section[4]/para">
      <p><xsl:copy-of select="child::node()"/></p>
    </xsl:for-each>
  </section>
</xsl:template>
<!-- Fourth inner section. Optional block-level elements tasks -->

<!-- ^^^ First inner section. Block-level elements ^^^ -->


<!-- *** Second inner section. Inline elements *** -->
<xsl:template match="article/section[3]/section[2]" name="inline-elements-section">
<section xsl:use-attribute-sets="inline-elements-attributes">
  <h3>
    <xsl:attribute name="id">
      <xsl:text>chapter-inline-elements.title</xsl:text>
    </xsl:attribute>
    <xsl:value-of select="section[2]/title"/>
  </h3>
  <p><xsl:value-of select="section[2]/para[1]"/></p>
  <xsl:call-template name="command-element-inner-section"/>
  <xsl:call-template name="emphasis-element-inner-section"/>
  <xsl:call-template name="optional-element-inner-section"/>
</section>
</xsl:template>


<!-- First inner section. 'command' element -->
<xsl:template match="article/section[3]/section[2]/section[1]" name="command-element-inner-section">
<section>
  <h4><xsl:value-of select="section[2]/section[1]/title"/></h4>
  <xsl:for-each select="section[2]/section[1]/para[position() &lt; 5]">
      <p><xsl:copy-of select="child::node()"/></p>
  </xsl:for-each>
  <p>
    <xsl:value-of select="section[2]/section[1]/para[5]/text()[1]"/>
    <kbd><xsl:value-of select="section[2]/section[1]/para[5]/keycap"/></kbd>
    <xsl:value-of select="section[2]/section[1]/para[5]/text()[2]"/>
  </p>
</section>
</xsl:template>
<!-- First inner section. 'command' element -->

<!-- First inner section. 'emphasis' element -->
<xsl:template match="article/section[3]/section[2]/section[2]" name="emphasis-element-inner-section">
<section>
  <h4><xsl:value-of select="section[2]/section[2]/title"/></h4>
  <xsl:for-each select="section[2]/section[2]/para[position() &lt; 5]">
      <p><xsl:copy-of select="child::node()"/></p>
  </xsl:for-each>
  <p>
    <xsl:value-of select="section[2]/section[2]/para[5]/text()[1]"/>
    <em><xsl:value-of select="section[2]/section[2]/para[5]/emphasis"/></em>
    <xsl:value-of select="section[2]/section[2]/para[5]/text()[2]"/>
  </p>
</section>
</xsl:template>
<!-- First inner section. 'emphasis' element -->

<!-- First inner section. Optional inline elements task -->
<xsl:template match="article/section[3]/section[2]/section[2]" name="optional-element-inner-section">
<section>
  <h4><xsl:value-of select="section[2]/section[3]/title"/></h4>
  <p><xsl:copy-of select="section[2]/section[3]/para/child::node()"/></p>
</section>
</xsl:template>
<!-- First inner section. 'emphasis' element -->

<!-- ^^^ Second inner section. Inline elements ^^^ -->



<!-- *** Third inner section. Link elements *** -->
<xsl:template match="article/section[3]/section[3]" name="link-elements-section">
<section>
  <h3><xsl:value-of select="section[3]/title"/></h3>
  <p><xsl:value-of select="section[3]/para[1]"/></p>
  <xsl:call-template name="internal-links-inner-section"/>
  <xsl:call-template name="external-links-inner-section"/>
  <xsl:call-template name="optional-links-inner-section"/>
</section>
</xsl:template>

<!-- First inner section. Internal links -->
<xsl:template match="article/section[3]/section[3]/section[1]" name="internal-links-inner-section">
<section>
  <h4><xsl:value-of select="section[3]/section[1]/title"/></h4>
  <xsl:for-each select="section[3]/section[1]/para[position() &lt; 5]">
      <p><xsl:copy-of select="child::node()"/></p>
  </xsl:for-each>

  <p>
    <xsl:value-of select="section[3]/section[1]/para[5]/text()[1]"/>
    <a>
      <xsl:attribute name="href">
        <xsl:text>#chapter-introduction</xsl:text>
      </xsl:attribute>
      <xsl:value-of select="section[3]/section[1]/para[5]/link"/>
    </a>
    <xsl:value-of select="section[3]/section[1]/para[5]/text()[2]"/>
  </p>

  <p>
    <xsl:value-of select="section[3]/section[1]/para[6]/text()[1]"/>
    <a>
      <xsl:attribute name="href">
        <xsl:text>#incorrect-target</xsl:text>
      </xsl:attribute>
      <xsl:value-of select="section[3]/section[1]/para[6]/link"/>
    </a>
    <xsl:value-of select="section[3]/section[1]/para[6]/text()[2]"/>
  </p>

</section>
</xsl:template>
<!-- First inner section. Internal links -->

<!-- Second inner section. External links -->
<xsl:template match="article/section[3]/section[3]/section[2]" name="external-links-inner-section">
<section>
  <h4><xsl:value-of select="section[3]/section[2]/title"/></h4>
  <xsl:for-each select="section[3]/section[2]/para[position() &lt; 5]">
      <p><xsl:copy-of select="child::node()"/></p>
  </xsl:for-each>

  <p>
    <xsl:value-of select="section[3]/section[2]/para[5]/text()[1]"/>
    <a>
      <xsl:attribute name="href">
        <xsl:text>http://www.docbook.org/tdg/en/html/ulink.html</xsl:text>
      </xsl:attribute>
      <xsl:value-of select="section[3]/section[2]/para[5]/ulink"/>
    </a>
    <xsl:value-of select="section[3]/section[2]/para[5]/text()[2]"/>
  </p>
</section>
</xsl:template>
<!-- Second inner section. External links -->


<!-- Third inner section. Optional link elements task -->
<xsl:template match="article/section[3]/section[3]/section[3]" name="optional-links-inner-section">
<section>
  <h4><xsl:value-of select="section[3]/section[3]/title"/></h4>
  <xsl:for-each select="section[3]/section[3]/para[position() &lt; 3]">
      <p><xsl:copy-of select="child::node()"/></p>
  </xsl:for-each>

  <p>
    <xsl:value-of select="section[3]/section[3]/para[3]/text()[1]"/>
    <a xsl:use-attribute-sets="link-elements-attributes">
      <xsl:value-of select="section[3]/section[3]/para[3]/link"/>
    </a>
    <xsl:value-of select="section[3]/section[3]/para[3]/text()[2]"/>
  </p>

  <p><xsl:copy-of select="section[3]/section[3]/para[4]/node()"/></p>

  <p><xsl:copy-of select="section[3]/section[3]/para[5]/node()"/></p>

  <p>
    <xsl:value-of select="section[3]/section[3]/para[6]/text()[1]"/>
    <a xsl:use-attribute-sets="link-elements-attributes">
      <kbd><xsl:value-of select="section[3]/section[3]/para[6]/link/keycap"/></kbd>
      <xsl:value-of select="section[3]/section[3]/para[6]/link/text()"/>
      <em><xsl:value-of select="section[3]/section[3]/para[6]/link/emphasis"/></em>
    </a>
    <xsl:value-of select="section[3]/section[3]/para[6]/text()[2]"/>
  </p>

</section>
</xsl:template>
<!-- Third inner section. Optional link elements task -->

<!-- ^^^ Third inner section. Link elements ^^^ -->

<!-- Third main section. DocBook elements catalog ========= -->



<!-- Fourth main section. Bonus tasks ========= -->
<xsl:template match="article/section[4]">
  <xsl:copy>
    <h2><xsl:value-of select="title"/></h2>
    <p><xsl:value-of select="para"/></p>
    <xsl:call-template name="table-of-content-inner-section"/>
    <xsl:call-template name="multiple-html-page-inner-section"/>
  </xsl:copy>
</xsl:template>

<!-- *** First inner section. Implement table of contents *** -->
<xsl:template match="article/section[4]/section[1]" name="table-of-content-inner-section">
  <xsl:copy>
    <h3><xsl:value-of select="section[1]/title"/></h3>
    <p><xsl:value-of select="section[1]/para"/></p>
    <p><xsl:value-of select="section[1]/orderedlist/listitem/para[1]"/></p>
    <ol>
      <xsl:for-each select="section[1]/orderedlist/listitem">
        <li><p><xsl:value-of select="para"/></p></li>
      </xsl:for-each>
    </ol>
  </xsl:copy>
</xsl:template>
<!-- ^^^ First inner section. Implement table of contents ^^^ -->

<!-- *** Second inner section. Implement multiple HTML page output *** -->
<xsl:template match="article/section[4]/section[2]" name="multiple-html-page-inner-section">
  <xsl:copy>
    <h3><xsl:value-of select="section[2]/title"/></h3>
    <p><xsl:value-of select="section[2]/para"/></p>
    <p><xsl:value-of select="section[2]/orderedlist/listitem/para[1]"/></p>
    <ol>
      <xsl:for-each select="section[2]/orderedlist/listitem">
        <li><p><xsl:copy-of select="para"/></p></li>
      </xsl:for-each>
    </ol>
  </xsl:copy>
</xsl:template>
<!-- ^^^ Second inner section. Implement multiple HTML page output ^^^ -->

<!-- Fourth main section. Bonus tasks ========= -->


<!-- Fifth main section. Tools ========= -->
<xsl:template match="article/section[5]">
  <xsl:copy>
    <h2><xsl:value-of select="title"/></h2>
    <xsl:for-each select="para">
      <p><xsl:value-of select="."/></p>
    </xsl:for-each>
  </xsl:copy>
</xsl:template>
<!-- Fifth main section. Tools ========= -->

<!-- Sixth main section. Acceptance criteria ========= -->
<xsl:template match="article/section[6]">
  <xsl:copy>
    <h2><xsl:value-of select="title"/></h2>
    <xsl:for-each select="para">
      <p><xsl:value-of select="."/></p>
    </xsl:for-each>
  </xsl:copy>
</xsl:template>
<!-- Sixth main section. Acceptance criteria ========= -->

<!-- Seventh main section. Resources ========= -->
<xsl:template match="article/section[7]">
  <xsl:copy>
    <h2><xsl:value-of select="title"/></h2>
    <xsl:for-each select="para">
      <p><xsl:value-of select="."/></p>
    </xsl:for-each>

    <xsl:call-template name="resouses-itemized-list"/>
    <xsl:call-template name="resouses-first-inner-section"/>

  </xsl:copy>
</xsl:template>

<xsl:template match="article/section[7]/itemizedlist" name="resouses-itemized-list">

    <ol>
      <xsl:for-each select="itemizedlist/listitem">
        <li>
          <p>
            <a>
              <xsl:attribute name="href">
                <xsl:value-of select="para/ulink"/>
              </xsl:attribute>
              <xsl:value-of select="para/ulink"/>
            </a>
            <xsl:value-of select="para/text()"/>
          </p>
        </li>
      </xsl:for-each>
    </ol>

</xsl:template>



<xsl:template match="article/section[7]/section" name="resouses-first-inner-section">

<xsl:for-each select="section">
  <h3><xsl:value-of select="title"/></h3>
  <p><xsl:copy-of select="para/text()"/></p>

  <ol>
    <xsl:for-each select="itemizedlist/listitem">
      <li>
        <p>
          <a>
            <xsl:attribute name="href">
              <xsl:value-of select="para/ulink"/>
            </xsl:attribute>
            <xsl:value-of select="para/ulink"/>
          </a>
          <xsl:value-of select="para/text()"/>
        </p>
      </li>
    </xsl:for-each>
  </ol>
</xsl:for-each>

</xsl:template>

<!-- Seventh main section. Resources ========= -->


</xsl:stylesheet>