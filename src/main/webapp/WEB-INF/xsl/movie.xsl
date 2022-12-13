<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:template match="shop">
        <html>
            <head>
                <title>Movie Shop</title>
            </head>
            
            <body bgcolor="#edf2f2" style="font-size: 24px; font-family: Arial;">                
                <xsl:apply-templates/>
                <div style="margin-left: 700px; font-family: Times;">
                    <p class="p">Total Number of Movies: <xsl:value-of select="count(movies/movie)"/></p>
                    <p class="p">Average Movie Rating: <xsl:value-of select="sum(movies/movie/rating) div count(movies/movie)" /></p>
                </div>
            </body>
        </html>
    </xsl:template>
    
    <!-- Specify the cascading XSL template rules -->
    <xsl:template match="shop/name">
        <h1 style="margin-left: 800px; margin-top: 200px; display: inline-block; background: black; color: white; padding: 5px 20px;">            
            <xsl:apply-templates/>            
        </h1>
    </xsl:template>
    
    <xsl:template match="movies">
        <table border="1" cellspacing="15" style="margin-left: 700px; font-size: 20px;">
            <thead style="background: black; color: white; padding: 0 5px;">
                <th>TITLE</th>
                <th>CD SET</th>
                <th>PRICE</th>
                <th>RATING</th>
            </thead>
            
            <tbody>
                <xsl:apply-templates/>
            </tbody>
        </table>
    </xsl:template>
    
    <xsl:template match="movie">
        <tr>
            <td>
                <xsl:value-of select="title"/>
            </td>
            <td style="text-align: center;">
                <xsl:value-of select="cdset"/>
            </td>
            <td style="text-align: center;">
                <xsl:value-of select="price"/>
            </td>
            <td>
                <div style="width: 100px; background: white; height: 12px;">
                    <div style="width: {10*rating}px; background: tomato; height: 12px;">    
                    </div>
                </div>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>