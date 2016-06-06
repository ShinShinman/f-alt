<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="data/entry">
    <data>
        <xsl:element name="cover">
            <!-- Image thumbnail will only created if an image is present in the current entry -->
            <xsl:if test="cover/filename">
                <!-- in order to make HTML-output work here wen need to warp the code elements in CDATA tags (thanks John :) -->
                <xsl:text><![CDATA[<img src=']]></xsl:text>
                <!-- I’m using a fork with a root-pseudo-parameter here. See https://github.com/animaux/reflectionfield/commit/2d10a65c5f9d0ed59f8c211863808471b90a3376 -->
                <xsl:value-of select="//params/root"/>
                <xsl:text>/cover/2/35/35/5</xsl:text>
                <xsl:value-of select="cover/@path"/>
                <xsl:text>/</xsl:text>
                <xsl:value-of select="cover/filename"/>
                <xsl:text><![CDATA['/>]]></xsl:text>
            </xsl:if>
        </xsl:element>
    </data>
</xsl:template>

</xsl:stylesheet>