<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:taglib="http://java.sun.com/xml/ns/j2ee"
                xmlns:jcr="http://www.jcp.org/jcr/1.0" xmlns:nt="http://www.jcp.org/jcr/nt/1.0"
                        xmlns:sling="http://sling.apache.org/jcr/sling/1.0"
                        version="1.0"
>

    <!-- Lists the tags in a .tld -->

    <xsl:output method="text" indent="yes" omit-xml-declaration="yes"/>
    <xsl:template match="/">
        <jcr:root>
            <xsl:apply-templates select="//taglib:tag"/>
        </jcr:root>
    </xsl:template>

    <xsl:template match="taglib:tag">
        <xsl:copy-of select="taglib:name"/>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>

</xsl:stylesheet>
