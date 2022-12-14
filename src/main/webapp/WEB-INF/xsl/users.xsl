<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="5.0">
    <xsl:output method="html"/>
    <xsl:template match="users">
        <html  bgcolor="#edf2f2" style="font-size: 24px; font-family: Arial;">
            <head>
                <title>Admin View</title>  
            </head>
            <body style="background-color: #edf2f2;">
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="users">
        <table border="1" cellspacing="15" style="margin-left: 600px; font-size: 20px; margin-top: 300px;">
            <thead style="background: black; color: white; padding: 0 5px;">
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Date of Birth</th>
            </thead>
            <tbody>
                <xsl:apply-templates/>
            </tbody>
        </table>
    </xsl:template>
    <xsl:template match="/users/user">
        <tr>
            <td><xsl:value-of select="ID"/></td>
            <td><xsl:value-of select="name"/></td>
            <td>
                <xsl:variable name="emailurl" select="email"></xsl:variable>
                <a href="http://localhost:8080/prototype/account.jsp?email={$emailurl}" style="text-decoration: none; color black;">
                    <xsl:value-of select="email"/>
                </a>
            </td>
            <td><xsl:value-of select="DOB"/></td>
        </tr>        
    </xsl:template>
</xsl:stylesheet>