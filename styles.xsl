<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<!-- Root element template -->
<xsl:template match="/article">
  <html>
    <body>

      <!-- The content of main document heading -->
      <h1><xsl:value-of select="title"/></h1>

      
        <!-- First section of the document -->
        <section>
          <h2><xsl:value-of select="section[1]/title"/></h2>
          <p><xsl:value-of select="section/para[1]"/></p>
          <p><xsl:value-of select="section/para[2]"/></p>
        </section>

        <!-- Second section of the document -->
        <section>
          <h2><xsl:value-of select="section[2]/title"/></h2>
          <p><xsl:value-of select="section[2]/para[1]"/></p>
          <p><xsl:value-of select="section[2]/para[2]"/></p>
        </section>



        <!-- Third section of the document -->
        <section id="docbook-element-catalog">
          <h2><xsl:value-of select="section[3]/title"/></h2>   
          <!-- First paragraph of third section -->
          <p>
            <xsl:value-of select="section[3]/para/text()[1]"/>
            <code style="color:red;">
              <xsl:value-of select="section/para/code[1]"/>
            </code>
            <xsl:value-of select="section[3]/para/text()[2]"/>
            <code style="color:red;">
              <xsl:value-of select="section/para/code[2]"/>
            </code>
            <xsl:value-of select="section[3]/para/text()[3]"/>
            <code style="color:red;">
              <xsl:value-of select="section/para/code[3]"/>
            </code>
            <xsl:value-of select="section[3]/para/text()[4]"/>
            <code style="color:red;">
              <xsl:value-of select="section/para/code[4]"/>
            </code>
            <xsl:value-of select="section[3]/para/text()[5]"/>
          </p>




          <!-- Inner section of the document -->
          <section id="block-level-elements">
            <h3><xsl:value-of select="section[3]/section/title"/></h3>    
            <!-- First paragraph of first inner section -->
            <p><xsl:value-of select="section[3]/section/para[1]"/></p>




            <section id="paragraph-element">
              <h4><xsl:value-of select="section[3]/section/section/title"/></h24> 
              <!-- First paragraph of first inner section -->
              <p>            
                <xsl:value-of select="section[3]/section/section/para/text()[1]"/>
                <code style="color:red;">
                  <xsl:value-of select="section/section/section/para/code[1]"/>
                </code>
                <xsl:value-of select="section[3]/section/section/para/text()[2]"/>
              </p>
              <p>            
                <xsl:value-of select="section[3]/section/section/para[2]/text()[1]"/>
                <code style="color:red;">
                  <xsl:value-of select="section/section/section/para[2]/code[1]"/>
                </code>
                <xsl:value-of select="section[3]/section/section/para[2]/text()[2]"/>
              </p>
              <p><xsl:value-of select="section[3]/section/section/para[3]"/></p>
              <p><xsl:value-of select="section[3]/section/section/para[4]"/></p>
            </section>



            
            <section id="order-list-element">
              <h4><xsl:value-of select="section[3]/section/section[2]/title"/></h4>
              <p>            
                <xsl:value-of select="section[3]/section/section[2]/para/text()[1]"/>
                <code style="color:red;">
                  <xsl:value-of select="section/section/section[2]/para/code[1]"/>
                </code>
                <xsl:value-of select="section[3]/section/section[2]/para/text()[2]"/>
              </p>
              <p>            
                <xsl:value-of select="section[3]/section/section[2]/para[2]/text()[1]"/>
                <code style="color:red;">
                  <xsl:value-of select="section/section/section[2]/para[2]/code[1]"/>
                </code>
                <xsl:value-of select="section[3]/section/section[2]/para[2]/text()[2]"/>
                <code style="color:red;">
                  <xsl:value-of select="section/section/section[2]/para[2]/code[2]"/>
                </code>
                <xsl:value-of select="section[3]/section/section[2]/para[2]/text()[3]"/>
                <code style="color:red;">
                  <xsl:value-of select="section/section/section[2]/para[2]/code[3]"/>
                </code>
                <xsl:value-of select="section[3]/section/section[2]/para[2]/text()[4]"/>
                <code style="color:red;">
                  <xsl:value-of select="section/section/section[2]/para[2]/code[4]"/>
                </code>
                <xsl:value-of select="section[3]/section/section[2]/para[2]/text()[5]"/>
                <code style="color:red;">
                  <xsl:value-of select="section/section/section[2]/para[2]/code[5]"/>
                </code>
                <xsl:value-of select="section[3]/section/section[2]/para[2]/text()[6]"/>
              </p>
              <p>
              <xsl:value-of select="section[3]/section/section[2]/para[3]/text()[1]"/>
              </p>
              <p>
              <xsl:value-of select="section[3]/section/section[2]/para[4]/text()[1]"/>
              </p>

              <ul>
                <xsl:for-each select="section[3]/section/section[2]/orderedlist[1]/listitem">
                  <li>
                    <p><xsl:value-of select="para"/></p>
                  </li>
                </xsl:for-each>
              </ul>

              <p>
                <xsl:value-of select="section[3]/section/section[2]/para[5]"/>
              </p>

              <ul>
                <p><xsl:value-of select="section[3]/section/section[2]/orderedlist[2]/para[1]"/></p>
                <xsl:for-each select="section[3]/section/section[2]/orderedlist[2]/listitem">
                  <li>
                    <p><xsl:value-of select="para"/></p>
                  </li>
                </xsl:for-each>
              </ul>

              <p><xsl:value-of select="section[3]/section/section[2]/para[6]"/></p>

              <ul>
                <li>
                  <p>
                    <xsl:value-of select="section[3]/section/section[2]/orderedlist[3]/listitem/para/text()[1]"/>
                    <kbd style="color:green;">
                      <xsl:value-of select="section[3]/section/section[2]/orderedlist[3]/listitem/para/keycap[1]"/>
                    </kbd>
                    <xsl:value-of select="section[3]/section/section[2]/orderedlist[3]/listitem/para/text()[2]"/>
                  </p>
                </li>
                <li>
                  <p>
                    <xsl:value-of select="section[3]/section/section[2]/orderedlist[3]/listitem[2]/para[1]"/>
                  </p>
                  <p>
                    <xsl:value-of select="section[3]/section/section[2]/orderedlist[3]/listitem[2]/para[2]"/>
                  </p>
                </li>
                <li>
                  <p><xsl:value-of select="section[3]/section/section[2]/orderedlist[3]/listitem[3]/para[1]"/></p>
                  <p><xsl:value-of select="section[3]/section/section[2]/orderedlist[3]/listitem[3]/para[2]"/></p>
                  <ol>
                  <xsl:for-each select="section[3]/section/section[2]/orderedlist[3]/listitem/itemizedlist/listitem/para">
                    <li>
                      <p><xsl:value-of select="."/></p>
                    </li>
                  </xsl:for-each>
                  </ol>
                </li>
                <li>
                  <p>
                    <xsl:value-of select="section[3]/section/section[2]/orderedlist[3]/listitem[4]/para"/>
                  </p>
                </li>
              </ul>       
            </section>

            <xsl:call-template name="third-level-section">

            </xsl:call-template>




          </section>




        </section>


    </body>
  </html>
</xsl:template>


<!-- third level section template -->
<xsl:template match="section/section/section" name="third-level-section">
<section>
  <h2><xsl:value-of select="section/section/section/title"/></h2>


</section>
</xsl:template>



</xsl:stylesheet>

