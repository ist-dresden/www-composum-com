<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:taglib="http://java.sun.com/xml/ns/j2ee"
                xmlns:jcr="http://www.jcp.org/jcr/1.0" xmlns:nt="http://www.jcp.org/jcr/nt/1.0"
                        xmlns:sling="http://sling.apache.org/jcr/sling/1.0"
                        version="1.0"
>

    <!-- Generates a taglib documentation from a .tld -->

    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
    <xsl:template match="/">
        <jcr:root>
            <xsl:apply-templates select="//taglib:tag"/>
        </jcr:root>
    </xsl:template>

    <xsl:template match="taglib:tag">
        <xsl:variable name="tagID" select="concat('tag_', generate-id())"/>
        <xsl:element name="{$tagID}">
            <xsl:attribute name="jcr:primaryType">cpp:Container</xsl:attribute>
            <xsl:attribute name="sling:resourceType">ist/composum/components/documentation/taglib/tag</xsl:attribute>
            <xsl:attribute name="jcr:description"><xsl:value-of select="normalize-space(taglib:description)"/></xsl:attribute>
            <xsl:attribute name="jcr:title"><xsl:value-of select="taglib:name"/></xsl:attribute>
            <xsl:element name="attributes">
                <xsl:attribute name="jcr:primaryType">cpp:Container</xsl:attribute>
                <xsl:attribute name="sling:resourceType">ist/composum/components/documentation/taglib/tag/attributes</xsl:attribute>
                <xsl:apply-templates select="taglib:attribute"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template match="taglib:attribute">
        <xsl:variable name="attributeID" select="concat('attribute_', generate-id())"/>
        <xsl:element name="{$attributeID}">
            <xsl:attribute name="jcr:primaryType">cpp:Element</xsl:attribute>
            <xsl:attribute name="sling:resourceType">ist/composum/components/documentation/taglib/tag/attribute</xsl:attribute>
            <xsl:attribute name="jcr:description"><xsl:value-of select="normalize-space(taglib:description)"/></xsl:attribute>
            <xsl:attribute name="jcr:title"><xsl:value-of select="taglib:name"/></xsl:attribute>
            <!-- If taglib:type is not present, we add a valueType String . If it's java.lang.String, we use String as well. Otherwise take the taglib:type verbatim. -->
            <xsl:choose>
                <xsl:when test="not(taglib:type)">
                    <xsl:attribute name="valueType">String</xsl:attribute>
                </xsl:when>
                <xsl:when test="taglib:type = 'java.lang.String'">
                    <xsl:attribute name="valueType">String</xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="valueType"><xsl:value-of select="taglib:type"/></xsl:attribute>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
