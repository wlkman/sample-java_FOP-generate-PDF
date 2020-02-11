<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"    
        xmlns:fo="http://www.w3.org/1999/XSL/Format">
    <!-- Attribute used for table border -->
    <xsl:attribute-set name="tableBorder">
          <xsl:attribute name="border">solid 0.1mm black</xsl:attribute>
    </xsl:attribute-set>
    <xsl:template match="organization">
        <fo:root>
              <fo:layout-master-set>
                <fo:simple-page-master master-name="simpleA4"
                      page-height="29.7cm" page-width="21.0cm" margin="1cm">
                  <fo:region-body/>
                </fo:simple-page-master>
              </fo:layout-master-set>
            <fo:page-sequence master-reference="simpleA4">
              <fo:flow flow-name="xsl-region-body">
                 <fo:block font-size="16pt" font-family="Helvetica" color="blue" font-weight="bold" space-after="5mm">
                      Organization Name: <xsl:value-of select="orgname"/>
                  </fo:block>
                  <fo:block font-size="10pt">
                      <fo:table table-layout="fixed" width="100%" border-collapse="separate">    
                        <fo:table-column column-width="5cm"/>
                        <fo:table-column column-width="5cm"/>
                            <fo:table-column column-width="5cm"/>
                            <fo:table-header>
                              <fo:table-cell xsl:use-attribute-sets="tableBorder">
                                <fo:block font-weight="bold">Name</fo:block>
                              </fo:table-cell>
                            <fo:table-cell xsl:use-attribute-sets="tableBorder">
                                <fo:block font-weight="bold">City</fo:block>
                            </fo:table-cell>
                            <fo:table-cell xsl:use-attribute-sets="tableBorder">
                                <fo:block font-weight="bold">Start Date</fo:block>
                            </fo:table-cell>
                        </fo:table-header>
                        <fo:table-body>
                              <xsl:apply-templates select="branch"/>
                        </fo:table-body>
                      </fo:table>
                  </fo:block>
              </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
    <xsl:template match="branch">
    <fo:table-row>   
      <fo:table-cell xsl:use-attribute-sets="tableBorder">
        <fo:block>
          <xsl:value-of select="name"/>
        </fo:block>
      </fo:table-cell>
     
      <fo:table-cell xsl:use-attribute-sets="tableBorder">
        <fo:block>
          <xsl:value-of select="city"/>
        </fo:block>
      </fo:table-cell>   
      <fo:table-cell xsl:use-attribute-sets="tableBorder">
      <fo:block>
          <xsl:value-of select="startdate"/>
      </fo:block>
      </fo:table-cell>
    </fo:table-row>
  </xsl:template>
</xsl:stylesheet>