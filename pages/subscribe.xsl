<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="text" />

<xsl:template match="/">

	<xsl:choose>
		<xsl:when test="$language = 'pl'">
			<xsl:call-template name="subscribe-pl"/>
		</xsl:when>
		<xsl:when test="$language = 'en'">
			<xsl:call-template name="subscribe-en"/>
		</xsl:when>
	</xsl:choose>

</xsl:template>

<xsl:template name="subscribe-pl">

		<xsl:choose>
			<xsl:when test="//events/subscribe-pl/@result = 'success'">
			{ 
				"status": "subscribed",
				"id": "<xsl:value-of select="//events/subscribe-pl/@id" />",
				"type": "<xsl:value-of select="//events/subscribe-pl/@type" />"
			}
		</xsl:when>
		<xsl:otherwise>
			{ 
				"status": "error"
			}
		</xsl:otherwise>
	</xsl:choose>

</xsl:template>

<xsl:template name="subscribe-en">

		<xsl:choose>
			<xsl:when test="//events/subscribe-en/@result = 'success'">
			{ 
				"status": "subscribed",
				"id": "<xsl:value-of select="//events/subscribe-en/@id" />",
				"type": "<xsl:value-of select="//events/subscribe-en/@type" />"
			}
		</xsl:when>
		<xsl:otherwise>
			{ 
				"status": "error"
			}
		</xsl:otherwise>
	</xsl:choose>

</xsl:template>

</xsl:stylesheet>