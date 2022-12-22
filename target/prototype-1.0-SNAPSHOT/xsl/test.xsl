<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:template match="output">
        <html>
            <head>
                <title>Output</title>
            </head>
            
            <body bgcolor="#edf2f2" style="font-size: 24px; font-family: Arial;">                
                <xsl:apply-templates/>
                <div style="margin-left: 700px; font-family: Times;">
                    <p class="p"> Log count = <xsl:value-of select="count(output/log)"/></p>
                    
                </div>
            </body>
        </html>
    </xsl:template>
    
    <!-- Specify the cascading XSL template rules -->
    <xsl:template match="output/log">
        Log count = <xsl:value-of select="count(output/log)"/>
        <xsl:apply-templates/>
    </xsl:template>
    
</xsl:stylesheet>