<?xml version="1.0" encoding="UTF-8"?>

<!--
  - <license>
  - Copyright (c) 2003-2004, Sun Microsystems, Inc.
  - Copyright (c) 2022-2024, Web-Legacy
  - All rights reserved.
  -
  - Redistribution and use in source and binary forms, with or without
  - modification, are permitted provided that the following conditions are met:
  -
  -     * Redistributions of source code must retain the above copyright
  -       notice, this list of conditions and the following disclaimer.
  -     * Redistributions in binary form must reproduce the above copyright
  -       notice, this list of conditions and the following disclaimer in the
  -       documentation and/or other materials provided with the distribution.
  -     * Neither the name of Sun Microsystems, Inc. nor the names of its
  -       contributors may be used to endorse or promote products derived from
  -       this software without specific prior written permission.
  -
  - THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
  - ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
  - WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  - DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
  - ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  - (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
  - LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
  - ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  - (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  - SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  - </license>
-->

<!--
    Document   : tag.html.xsl
    Created on : December 18, 2002, 5:22 PM
    Author     : mroth
    Description:
        Creates the tag detail page (right frame), listing the known
        information for a given tag in a tag library.
-->

<xsl:stylesheet version="1.0" xmlns:jakartaee="https://jakarta.ee/xml/ns/jakartaee"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">

    <xsl:output method="html" indent="yes" />

    <xsl:param name="tlddoc-shortName">default</xsl:param>
    <xsl:param name="tlddoc-tagName">default</xsl:param>

    <!-- template rule matching source root element -->
    <xsl:template match="/">
        <xsl:apply-templates select="jakartaee:tlds/jakartaee:taglib" />
    </xsl:template>

    <xsl:template match="jakartaee:taglib">
        <xsl:if test="jakartaee:short-name=$tlddoc-shortName">
            <xsl:apply-templates select="jakartaee:tag|jakartaee:tag-file" />
        </xsl:if>
    </xsl:template>

    <xsl:template match="jakartaee:tag|jakartaee:tag-file">
        <xsl:if test="jakartaee:name=$tlddoc-tagName">
            <xsl:variable name="tldname">
                <xsl:choose>
                    <xsl:when test="../jakartaee:display-name!=''">
                        <xsl:value-of select="../jakartaee:display-name" />
                    </xsl:when>
                    <xsl:when test="../jakartaee:short-name!=''">
                        <xsl:value-of select="../jakartaee:short-name" />
                    </xsl:when>
                    <xsl:otherwise>
                        Unnamed TLD
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:variable name="title">
                <xsl:value-of select="jakartaee:name" />
                (<xsl:value-of select="normalize-space(/jakartaee:tlds/jakartaee:config/jakartaee:window-title)" />)
            </xsl:variable>
            <html>
                <head>
                    <title>
                        <xsl:value-of select="normalize-space($title)" />
                    </title>
                    <meta name="keywords">
                        <xsl:attribute name="content">
                            <xsl:value-of select="normalize-space($title)" />
                        </xsl:attribute>
                    </meta>
                    <link rel="stylesheet" type="text/css" href="../stylesheet.css"
                          title="Style" />
                </head>
                <script>
                    function asd()
                    {
                    parent.document.title="<xsl:value-of select="normalize-space($title)" />";
                    }
                </script>
                <body bgcolor="white" onload="asd();">
                    <!-- =========== START OF NAVBAR =========== -->
                    <a name="navbar_top"><!-- --></a>
                    <table border="0" width="100%" cellpadding="1" cellspacing="0">
                        <tr>
                            <td COLSPAN="3" BGCOLOR="#EEEEFF" CLASS="NavBarCell1">
                                <a NAME="navbar_top_firstrow"><!-- --></a>
                                <table BORDER="0" CELLPADDING="0" CELLSPACING="3">
                                    <tr ALIGN="center" VALIGN="top">
                                        <td BGCOLOR="#EEEEFF" CLASS="NavBarCell1">&#160;
                                            <a href="../overview-summary.html">
                                                <font CLASS="NavBarFont1">
                                                    <b>Overview</b>
                                                </font>
                                            </a>&#160;
                                        </td>
                                        <td BGCOLOR="#EEEEFF" CLASS="NavBarCell1">&#160;
                                            <a href="tld-summary.html">
                                                <font CLASS="NavBarFont1">
                                                    <b>Library</b>
                                                </font>
                                            </a>&#160;
                                        </td>
                                        <td BGCOLOR="#FFFFFF" CLASS="NavBarCell1Rev">&#160;
                                            <font CLASS="NavBarFont1Rev">&#160;Tag&#160;</font>&#160;
                                        </td>
                                        <td BGCOLOR="#EEEEFF" CLASS="NavBarCell1">&#160;
                                            <a HREF="../help-doc.html">
                                                <font CLASS="NavBarFont1">
                                                    <b>Help</b>
                                                </font>
                                            </a>&#160;
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td ALIGN="right" VALIGN="top" ROWSPAN="3">
                                <em>
                                </em>
                            </td>
                        </tr>
                        <tr>
                            <td BGCOLOR="white" CLASS="NavBarCell2">
                                <font SIZE="-2">
                                    <!--&#160;PREV TAGLIB&#160; -->
                                    <!--&#160;NEXT TAGLIB&#160; -->
                                </font>
                            </td>
                            <td BGCOLOR="white" CLASS="NavBarCell2">
                                <font SIZE="-2">
                                    &#160;
                                    <a HREF="../index.html" TARGET="_top">
                                        <b>FRAMES</b>
                                    </a>&#160;
                                    &#160;
                                    <xsl:element name="a">
                                        <xsl:attribute name="href">
                                            <xsl:value-of select="jakartaee:name" />.html</xsl:attribute>
                                        <xsl:attribute name="target">_top</xsl:attribute>
                                        <b>NO FRAMES</b>
                                    </xsl:element>&#160;
                                    <script>
                                        <!--
                                        if(window==top) {
                                            document.writeln('<A HREF="alltags-noframe.html" TARGET=""><B>All Tags</B></A>');
                                        }
                                        // -->
                                    </script>
                                    <noscript>
                                        <a HREF="../alltags-noframe.html" TARGET="">
                                            <b>All Tags</b>
                                        </a>
                                    </noscript>
                                </font>
                            </td>
                        </tr>
                    </table>
                    <!-- =========== END OF NAVBAR =========== -->

                    <hr />
                    <h2>
                        <font size="-1">
                            <xsl:value-of select="$tldname" />
                        </font>
                        <br />Tag <xsl:value-of select="jakartaee:name" />
                    </h2>
                    <hr />
                    <xsl:value-of select="jakartaee:description" disable-output-escaping="yes" />
                    <br />
                    <p />
                    <xsl:if test="jakartaee:example!=''">
                        <b>Example:</b>
                        <br />
                        <pre>
                            <xsl:value-of select="jakartaee:example" />
                        </pre>
                        <p />
                    </xsl:if>
                    <hr />

                    <!-- Tag Information -->
                    <table border="1" cellpadding="3" cellspacing="0" width="100%">
                        <tr bgcolor="#CCCCFF" class="TableHeadingColor">
                            <td colspan="2">
                                <font size="+2">
                                    <b>Tag Information</b>
                                </font>
                            </td>
                        </tr>
                        <tr>
                            <td>Tag Class</td>
                            <td>
                                <xsl:choose>
                                    <xsl:when test="jakartaee:tag-class!=''">
                                        <xsl:value-of select="jakartaee:tag-class" />
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <i>None</i>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </td>
                        </tr>
                        <tr>
                            <td>TagExtraInfo Class</td>
                            <td>
                                <xsl:choose>
                                    <xsl:when test="jakartaee:tei-class!=''">
                                        <xsl:value-of select="jakartaee:tei-class" />
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <i>None</i>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </td>
                        </tr>
                        <tr>
                            <td>Body Content</td>
                            <td>
                                <xsl:choose>
                                    <xsl:when test="jakartaee:body-content!=''">
                                        <xsl:value-of select="jakartaee:body-content" />
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <i>None</i>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </td>
                        </tr>
                        <tr>
                            <td>Display Name</td>
                            <td>
                                <xsl:choose>
                                    <xsl:when test="jakartaee:display-name!=''">
                                        <xsl:value-of select="jakartaee:display-name" />
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <i>None</i>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <p />

                    <!-- Attribute Information -->
                    <table border="1" cellpadding="3" cellspacing="0" width="100%">
                        <tr bgcolor="#CCCCFF" class="TableHeadingColor">
                            <td colspan="5">
                                <font size="+2">
                                    <b>Attributes</b>
                                </font>
                            </td>
                        </tr>
                        <xsl:choose>
                            <xsl:when test="count(jakartaee:attribute)&gt;0">
                                <tr>
                                    <td>
                                        <b>Name</b>
                                    </td>
                                    <td>
                                        <b>Required</b>
                                    </td>
                                    <td>
                                        <b>Request-time</b>
                                    </td>
                                    <td>
                                        <b>Type</b>
                                    </td>
                                    <td>
                                        <b>Description</b>
                                    </td>
                                </tr>
                                <xsl:apply-templates select="jakartaee:attribute">
                                    <xsl:sort select="jakartaee:name" />
                                </xsl:apply-templates>
                            </xsl:when>
                            <xsl:otherwise>
                                <td colspan="5">
                                    <i>No Attributes Defined.</i>
                                </td>
                            </xsl:otherwise>
                        </xsl:choose>
                    </table>
                    <br />
                    <p />

                    <!-- Variable Information -->
                    <table border="1" cellpadding="3" cellspacing="0" width="100%">
                        <tr bgcolor="#CCCCFF" class="TableHeadingColor">
                            <td colspan="5">
                                <font size="+2">
                                    <b>Variables</b>
                                </font>
                            </td>
                        </tr>
                        <xsl:choose>
                            <xsl:when test="count(jakartaee:variable)&gt;0">
                                <tr>
                                    <td>
                                        <b>Name</b>
                                    </td>
                                    <td>
                                        <b>Type</b>
                                    </td>
                                    <td>
                                        <b>Declare</b>
                                    </td>
                                    <td>
                                        <b>Scope</b>
                                    </td>
                                    <td>
                                        <b>Description</b>
                                    </td>
                                </tr>
                                <xsl:apply-templates select="jakartaee:variable">
                                    <xsl:sort select="jakartaee:name-given" />
                                    <xsl:sort select="jakartaee:name-from-attribute" />
                                </xsl:apply-templates>
                            </xsl:when>
                            <xsl:otherwise>
                                <td colspan="2">
                                    <i>No Variables Defined.</i>
                                </td>
                            </xsl:otherwise>
                        </xsl:choose>
                    </table>
                    <br />
                    <p />

                    <!-- =========== START OF NAVBAR =========== -->
                    <a name="navbar_bottom"><!-- --></a>
                    <table border="0" width="100%" cellpadding="1" cellspacing="0">
                        <tr>
                            <td COLSPAN="3" BGCOLOR="#EEEEFF" CLASS="NavBarCell1">
                                <a NAME="navbar_bottom_firstrow"><!-- --></a>
                                <table BORDER="0" CELLPADDING="0" CELLSPACING="3">
                                    <tr ALIGN="center" VALIGN="top">
                                        <td BGCOLOR="#EEEEFF" CLASS="NavBarCell1">&#160;
                                            <a href="../overview-summary.html">
                                                <font CLASS="NavBarFont1">
                                                    <b>Overview</b>
                                                </font>
                                            </a>&#160;
                                        </td>
                                        <td BGCOLOR="#EEEEFF" CLASS="NavBarCell1">&#160;
                                            <a href="tld-summary.html">
                                                <font CLASS="NavBarFont1">
                                                    <b>Library</b>
                                                </font>
                                            </a>&#160;
                                        </td>
                                        <td BGCOLOR="#FFFFFF" CLASS="NavBarCell1Rev">&#160;
                                            <font CLASS="NavBarFont1Rev">&#160;Tag&#160;</font>&#160;
                                        </td>
                                        <td BGCOLOR="#EEEEFF" CLASS="NavBarCell1">&#160;
                                            <a HREF="../help-doc.html">
                                                <font CLASS="NavBarFont1">
                                                    <b>Help</b>
                                                </font>
                                            </a>&#160;
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td ALIGN="right" VALIGN="top" ROWSPAN="3">
                                <em>
                                </em>
                            </td>
                        </tr>
                        <tr>
                            <td BGCOLOR="white" CLASS="NavBarCell2">
                                <font SIZE="-2">
                                    <!--&#160;PREV TAGLIB&#160; -->
                                    <!--&#160;NEXT TAGLIB&#160; -->
                                </font>
                            </td>
                            <td BGCOLOR="white" CLASS="NavBarCell2">
                                <font SIZE="-2">
                                    &#160;
                                    <a HREF="../index.html" TARGET="_top">
                                        <b>FRAMES</b>
                                    </a>&#160;
                                    &#160;
                                    <xsl:element name="a">
                                        <xsl:attribute name="href">
                                            <xsl:value-of select="jakartaee:name" />.html</xsl:attribute>
                                        <xsl:attribute name="target">_top</xsl:attribute>
                                        <b>NO FRAMES</b>
                                    </xsl:element>&#160;
                                    <script>
                                        <!--
                                        if(window==top) {
                                            document.writeln('<A HREF="alltags-noframe.html" TARGET=""><B>All Tags</B></A>');
                                        }
                                        // -->
                                    </script>
                                    <noscript>
                                        <a HREF="../alltags-noframe.html" TARGET="">
                                            <b>All Tags</b>
                                        </a>
                                    </noscript>
                                </font>
                            </td>
                        </tr>
                    </table>
                    <!-- =========== END OF NAVBAR =========== -->
                    <hr />
                    <small>
                        <i>
                            Output Generated by
                            <a href="https://weblegacy.github.io/tlddoc/" target="_blank">Tag Library Documentation Generator</a>.
                            Java, JSP, and JavaServer Pages are trademarks or
                            registered trademarks of Sun Microsystems, Inc. in the US and other
                            countries. Copyright 2002-4 Sun Microsystems, Inc.
                            4150 Network Circle
                            Santa Clara, CA 95054, U.S.A.
                            All Rights Reserved.
                        </i>
                    </small>
                </body>
            </html>
        </xsl:if>
    </xsl:template>

    <xsl:template match="jakartaee:attribute">
        <tr valign="top">
            <td>
                <xsl:apply-templates select="jakartaee:name" />
            </td>
            <td>
                <xsl:choose>
                    <xsl:when test="jakartaee:required!=''">
                        <xsl:value-of select="jakartaee:required" />
                    </xsl:when>
                    <xsl:otherwise>false</xsl:otherwise>
                </xsl:choose>
            </td>
            <td>
                <xsl:choose>
                    <xsl:when test="jakartaee:rtexprvalue!=''">
                        <xsl:value-of select="jakartaee:rtexprvalue" />
                    </xsl:when>
                    <xsl:otherwise>false</xsl:otherwise>
                </xsl:choose>
            </td>
            <td>
                <xsl:choose>
                    <xsl:when test="jakartaee:deferred-value">
                        <xsl:choose>
                            <xsl:when test="jakartaee:deferred-value/jakartaee:type">
                                <code>javax.el.ValueExpression</code>
                                <br />(<i>must evaluate to </i>
                                <code>
                                    <xsl:value-of select="jakartaee:deferred-value/jakartaee:type" />
                                </code>)
                            </xsl:when>
                            <xsl:otherwise>
                                <code>javax.el.ValueExpression</code>
                                <br />(<i>must evaluate to </i>
                                <code>java.lang.Object</code>)
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="jakartaee:deferred-method">
                        <xsl:choose>
                            <xsl:when test="jakartaee:deferred-method/jakartaee:method-signature">
                                <code>javax.el.MethodExpression</code>
                                <br />(<i>signature must match </i>
                                <code>
                                    <xsl:value-of select="jakartaee:deferred-method/jakartaee:method-signature" />
                                </code>)
                            </xsl:when>
                            <xsl:otherwise>
                                <code>javax.el.MethodExpression</code>
                                <br />(<i>signature must match </i>
                                <code>void methodname()</code>)
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="jakartaee:type!=''">
                        <code>
                            <xsl:value-of select="jakartaee:type" />
                        </code>
                    </xsl:when>
                    <xsl:otherwise>
                        <code>java.lang.String</code>
                    </xsl:otherwise>
                </xsl:choose>
            </td>
            <td>
                <xsl:choose>
                    <xsl:when test="jakartaee:description!=''">
                        <xsl:value-of select="jakartaee:description" disable-output-escaping="yes" />
                    </xsl:when>
                    <xsl:otherwise>
                        <i>No Description</i>
                    </xsl:otherwise>
                </xsl:choose>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="jakartaee:variable">
        <tr>
            <td>
                <xsl:choose>
                    <xsl:when test="jakartaee:name-given!=''">
                        <xsl:value-of select="jakartaee:name-given" />
                    </xsl:when>
                    <xsl:when test="jakartaee:name-from-attribute!=''">
                        <i>From attribute '<xsl:value-of select="jakartaee:name-from-attribute" />'</i>
                    </xsl:when>
                    <xsl:otherwise>
                        <i>Unknown</i>
                    </xsl:otherwise>
                </xsl:choose>
            </td>
            <td>
                <xsl:choose>
                    <xsl:when test="jakartaee:variable-class!=''">
                        <code>
                            <xsl:value-of select="jakartaee:variable-class" />
                        </code>
                    </xsl:when>
                    <xsl:otherwise>
                        <code>java.lang.String</code>
                    </xsl:otherwise>
                </xsl:choose>
            </td>
            <td>
                <xsl:choose>
                    <xsl:when test="jakartaee:declare!=''">
                        <xsl:value-of select="jakartaee:declare" />
                    </xsl:when>
                    <xsl:otherwise>true</xsl:otherwise>
                </xsl:choose>
            </td>
            <td>
                <xsl:choose>
                    <xsl:when test="jakartaee:scope!=''">
                        <xsl:value-of select="jakartaee:scope" />
                    </xsl:when>
                    <xsl:otherwise>NESTED</xsl:otherwise>
                </xsl:choose>
            </td>
            <td>
                <xsl:choose>
                    <xsl:when test="jakartaee:description!=''">
                        <xsl:value-of select="jakartaee:description" disable-output-escaping="yes" />
                    </xsl:when>
                    <xsl:otherwise>
                        <i>No Description</i>
                    </xsl:otherwise>
                </xsl:choose>
            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet>