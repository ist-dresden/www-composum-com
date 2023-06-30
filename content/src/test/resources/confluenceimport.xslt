<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:cpp="http://sling.composum.com/pages/1.0"
                xmlns:jcr="http://www.jcp.org/jcr/1.0"
                xmlns:nt="http://www.jcp.org/jcr/nt/1.0"
                xmlns:sling="http://sling.apache.org/jcr/sling/1.0"
                xmlns:xhtml="http://www.w3.org/1999/xhtml"
>

    <xsl:output method="xml" indent="yes" encoding="UTF-8" omit-xml-declaration="yes"/>
    <xsl:strip-space elements="*"/>

    <xsl:template match="/">
        <column-0
                jcr:primaryType="cpp:Container"
                sling:resourceType="composum/pages/components/container/row/column"
                xmlns:cpp="http://sling.composum.com/pages/1.0"
                xmlns:jcr="http://www.jcp.org/jcr/1.0"
                xmlns:nt="http://www.jcp.org/jcr/nt/1.0"
                xmlns:sling="http://sling.apache.org/jcr/sling/1.0"
        >
            <xsl:apply-templates select="//xhtml:body/*"/>
        </column-0>
    </xsl:template>

    <xsl:template match="xhtml:h1|xhtml:h2|xhtml:h3">
        <xsl:element name="title_{substring-after(generate-id(),'N')}">
            <xsl:attribute name="jcr:primaryType">cpp:Element</xsl:attribute>
            <xsl:attribute name="sling:resourceType">composum/pages/components/element/title</xsl:attribute>
            <xsl:attribute name="textAlignment">left</xsl:attribute>
            <xsl:attribute name="title">
                <xsl:value-of select="normalize-space(string(.))"/>
            </xsl:attribute>
            <image
                    jcr:primaryType="nt:unstructured"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="xhtml:h4">
        <xsl:element name="title_{substring-after(generate-id(),'N')}">
            <xsl:attribute name="jcr:primaryType">cpp:Element</xsl:attribute>
            <xsl:attribute name="sling:resourceType">composum/pages/components/element/title</xsl:attribute>
            <xsl:attribute name="textAlignment">text</xsl:attribute>
            <xsl:attribute name="subtitle">
                <xsl:value-of select="normalize-space(string(.))"/>
            </xsl:attribute>
            <image
                    jcr:primaryType="nt:unstructured"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="xhtml:p">
        <xsl:if test="normalize-space(string(.))">
            <xsl:element name="text_{substring-after(generate-id(),'N')}">
                <xsl:attribute name="jcr:primaryType">cpp:Element</xsl:attribute>
                <xsl:attribute name="sling:resourceType">composum/pages/components/element/text</xsl:attribute>
                <xsl:attribute name="textAlignment">text</xsl:attribute>
                <xsl:attribute name="text">
                    <xsl:value-of select="normalize-space(string(.))"/>
                </xsl:attribute>
            </xsl:element>
        </xsl:if>
    </xsl:template>

    <xsl:template match="xhtml:div[@class='page-metadata']"/>
    <xsl:template match="xhtml:div[@id='breadcrumb-section']"/>
    <xsl:template match="xhtml:div[@id='footer']"/>

    <xsl:template match="xhtml:div|xhtml:blockquote">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="xhtml:table[@class='wysiwyg-macro']">
        <xsl:for-each select=".//xhtml:td">
            <xsl:apply-templates/>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="xhtml:table">
        <xsl:element name="table_{substring-after(generate-id(),'N')}">
            <xsl:attribute name="jcr:primaryType">cpp:Element</xsl:attribute>
            <xsl:attribute name="sling:resourceType">composum/pages/components/composed/table</xsl:attribute>
            <xsl:attribute name="bordered">{Boolean}true</xsl:attribute>
            <xsl:attribute name="striped">{Boolean}true</xsl:attribute>
            <xsl:apply-templates select=".//xhtml:tr"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="xhtml:tr">
        <xsl:element name="row_{substring-after(generate-id(),'N')}">
            <xsl:attribute name="jcr:primaryType">cpp:Element</xsl:attribute>
            <xsl:attribute name="sling:resourceType">composum/pages/components/composed/table/row</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="xhtml:td">
        <xsl:element name="column_{substring-after(generate-id(),'N')}">
            <xsl:attribute name="jcr:primaryType">cpp:Element</xsl:attribute>
            <xsl:attribute name="sling:resourceType">composum/pages/components/composed/table/cell</xsl:attribute>
            <xsl:attribute name="text">
                <xsl:value-of select="normalize-space(string(.))"/>
            </xsl:attribute>
        </xsl:element>
    </xsl:template>

    <xsl:template match="xhtml:th">
        <xsl:element name="column_{substring-after(generate-id(),'N')}">
            <xsl:attribute name="jcr:primaryType">cpp:Element</xsl:attribute>
            <xsl:attribute name="sling:resourceType">composum/pages/components/composed/table/cell</xsl:attribute>
            <xsl:attribute name="head">{Boolean}true</xsl:attribute>
            <xsl:attribute name="text">
                <xsl:value-of select="normalize-space(string(.))"/>
            </xsl:attribute>
        </xsl:element>
    </xsl:template>

    <xsl:template match="xhtml:pre">
        <xsl:element name="column_{substring-after(generate-id(),'N')}">
            <xsl:attribute name="jcr:primaryType">cpp:Element</xsl:attribute>
            <xsl:attribute name="sling:resourceType">composum/pages/components/element/codeblock</xsl:attribute>
            <xsl:attribute name="code">
                <xsl:value-of select="string(.)"/>
            </xsl:attribute>
        </xsl:element>
    </xsl:template>

    <xsl:template match="xhtml:ul|xhtml:ol">
        <xsl:element name="text_{substring-after(generate-id(),'N')}">
            <xsl:variable name="element" select="local-name()"/>
            <xsl:attribute name="jcr:primaryType">cpp:Element</xsl:attribute>
            <xsl:attribute name="sling:resourceType">composum/pages/components/element/text</xsl:attribute>
            <xsl:attribute name="textAlignment">left</xsl:attribute>
            <xsl:attribute name="text">
                &lt;<xsl:value-of select="$element"/>&gt;
                <xsl:for-each select="xhtml:li">
                    &lt;li&gt;
                    <xsl:value-of select="normalize-space(string(.))"/>
                    &lt;/li&gt;
                </xsl:for-each>
                &lt;/<xsl:value-of select="$element"/>&gt;
            </xsl:attribute>
        </xsl:element>
    </xsl:template>

    <xsl:template match="text()">
        <XXX>
            <xsl:copy/>
        </XXX>
    </xsl:template>

    <xsl:template match="*">
        XXX(<xsl:value-of select="name()"/>)
        <xsl:apply-templates/>
    </xsl:template>

</xsl:stylesheet>
