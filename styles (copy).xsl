<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- Root element template -->
<xsl:template match="/">
  <html>
    <body>
      <h1><xsl:value-of select="article/title"/></h1>
      <!-- First level section -->
      <xsl:apply-templates select="article/section"/>
    </body>
  </html>
</xsl:template>

<!-- Code element template -->
<xml:template match="section[1]">

  <xml:for-each select="code">

      <code style="color: red;">
        <xsl:text> </xsl:text><xsl:value-of select="."/>
      </code>
      
  </xml:for-each>

</xml:template>






<!-- Whole article template -->
<xsl:template match="article">

  <!-- First level section -->
  <xsl:for-each select="section">

    <section style="padding-left: 25px;">
    
        <h2>1. <xsl:value-of select="title"/></h2>

          <!-- Selects each para element and show its text -->
          <xsl:for-each select="para">
            <p><xsl:value-of select="."/></p>
          </xsl:for-each>

          <!-- Second level section -->
          <xsl:for-each select="section">

            <section style="padding-left: 25px;">
            
                <h3>2. <xsl:value-of select="title"/></h3>

                  <!-- Selects each para element and show its text -->
                  <xsl:for-each select="para">
                    <p><xsl:value-of select="."/></p>
                  </xsl:for-each>

                  <!-- Third level section -->
                  <xsl:for-each select="section">

                    <section style="padding-left: 25px;">
                    
                        <h4>3. <xsl:value-of select="title"/></h4>

                          <!-- Selects each para element and show its text -->
                          <xsl:for-each select="para">
                            <p><xsl:value-of select="."/></p>
                          </xsl:for-each>

                          <!-- Selects each para element and show its text -->
                          <xsl:for-each select="orderedlist">
                            <ul>
                              <xsl:for-each select="listitem">
                                <li><p><xsl:value-of select="."/></p></li>
                              </xsl:for-each>
                            </ul>
                          </xsl:for-each>

                    </section>

                  </xsl:for-each>
                  <!-- End of third level section -->

            </section>

          </xsl:for-each>
          <!-- End of second level section -->

    </section>

  </xsl:for-each>
  <!-- End of first level section -->

</xsl:template>






<!-- <xsl:template match="article/section">
  <xsl:for-each select="para">
    <p><xsl:value-of select="."/></p>
  </xsl:for-each>
</xsl:template> -->



<!-- First section code element -->
<!-- <xsl:for-each select="para">
  <code style="color: red;">
    <xsl:text> </xsl:text><xsl:value-of select="."/>
  </code>
</xsl:for-each> -->







<!-- Second level section template -->
<!-- <xsl:template match="article/section/section">
  <section style="padding-left: 25px;">
      <h3>2. <xsl:value-of select="title"/></h3>
      <xsl:apply-templates select="para"/>
      <xsl:apply-templates select="section"/>
  </section>
</xsl:template> -->




<!-- Third level section template -->
<!-- <xsl:template match="article/section/section/section">
  <section style="padding-left: 25px;">
      <h4>3. <xsl:value-of select="title"/></h4>
      <xsl:for-each select="para">
          <p><xsl:value-of select="."/></p>
      </xsl:for-each>
  </section>
</xsl:template> -->

<!-- Paragraph element template -->
<xsl:template match="article/section/para">
  <p><xsl:value-of select="."/></p>
</xsl:template>

<!-- First level section template -->
<xsl:template match="article/section">
  <section style="padding-left: 25px;">
      <h2>1. <xsl:value-of select="title"/></h2>
      <xsl:apply-templates select="para"/>
      <xsl:apply-templates select="section"/>
  </section>
</xsl:template>

<!-- Second level section template -->
<xsl:template match="article/section/section">
  <section style="padding-left: 25px;">
      <h3>2. <xsl:value-of select="title"/></h3>
      <p><xsl:value-of select="para"/></p>
      <xsl:apply-templates select="section"/>
  </section>
</xsl:template>

<!-- Third level section template -->
<xsl:template match="article/section/section/section">
  <section style="padding-left: 25px;">
      <h4>3. <xsl:value-of select="title"/></h4>
      <xsl:for-each select="para">
          <p><xsl:value-of select="."/></p>
      </xsl:for-each>
  </section>
</xsl:template>




<!-- Article element template
<xsl:template match="article">
  <xsl:for-each select="section">
    <section>
      <h2><xsl:value-of select="title"/></h2>
      <xsl:apply-templates select="para"/>
    </section>
  </xsl:for-each>
</xsl:template>

Section element template
<xsl:template match="section">
  <xsl:for-each select="para">
    <p><xsl:value-of select="para"/></p>
  </xsl:for-each>
</xsl:template> -->


    <!-- <xsl:for-each select="article/section">
      <section match="section">S
        <h2><xsl:value-of select="title"/></h2>
        <p><xsl:value-of select="para[1]"/></p>
        <p><xsl:value-of select="para[2]"/></p>
        <xsl:for-each select="section">
          <section match="section">
              <h3><xsl:value-of select="title"/></h3>
              <p><xsl:value-of select="para[1]"/></p>
              <p><xsl:value-of select="para[2]"/></p>
              <xsl:for-each select="section">
              <section match="section">
                  <h4><xsl:value-of select="title"/></h4>
                  <p><xsl:value-of select="para[1]"/></p>
                  <p><xsl:value-of select="para[2]"/></p>
                  <p><xsl:value-of select="para[3]"/></p>
                  <p><xsl:value-of select="para[4]"/></p>
                  <ol match="orderedlist">
                      <li match="listitem">
                        <p match="para"><xsl:value-of select="para"/></p>
                      </li>
                  </ol>
              </section>
            </xsl:for-each>
          </section>
        </xsl:for-each>
      </section>
    </xsl:for-each> -->

</xsl:stylesheet>

