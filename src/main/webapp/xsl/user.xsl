<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="5.0">
    <xsl:output method="html"/>
    <xsl:template match="/">
        <html  bgcolor="#EDF2F2">
            <head>
                <title>Admin View</title>
                <link rel="stylesheet" type="text/css" href="css/style.css" />
                <link rel="stylesheet" type="text/css" href="css/users.css" />
            </head>
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="user">
        <table class="content-table">
            <thead>
                <tr>
                    <th colspan="4">
                        <h3>User Information</h3>
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="td-title">ID</td>
                    <td class="td-title">Name</td>
                    <td class="td-title">Email</td>
                    <td class="td-title">Date of Birth</td>
                </tr>
                <xsl:apply-templates/>
            </tbody>
        </table>
    </xsl:template>
    <xsl:template match="/user">
        <tr>
            <td>
                <xsl:value-of select="ID"/>
            </td>
            <td>
                <xsl:value-of select="name"/>
            </td>
            <td>
                <xsl:variable name="emailurl" select="email"></xsl:variable>
                <a href="http://localhost:8080/prototype/account.jsp?emailView={$emailurl}" style="text-decoration: none; color black;">
                    <xsl:value-of select="email"/>
                </a>
            </td>
            <td>
                <xsl:value-of select="DOB"/>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>