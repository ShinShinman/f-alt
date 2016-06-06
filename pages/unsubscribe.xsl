<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="text" />

<xsl:template match="/">

		<xsl:choose>
		<xsl:when test="$language = 'pl'">
			<xsl:call-template name="unsubscribe-pl"/>
		</xsl:when>
		<xsl:when test="$language = 'en'">
			<xsl:call-template name="unsubscribe-en"/>
		</xsl:when>
	</xsl:choose>

</xsl:template>

<xsl:template name="unsubscribe-pl">
	
	<xsl:variable name="result" select="//events/unsubscribe-pl/@result" />
	<!--
		<xsl:choose>
			<xsl:when test="data/odbiorcy/entry[mail = $mail]">
			{ "status": "subscribed" }
		</xsl:when>
		<xsl:otherwise>
			{ "status": "ready"}
		</xsl:otherwise>
	</xsl:choose>
	-->
	{
		"status": "<xsl:value-of select='$result'/>",
		"type": "<xsl:value-of select='//events/unsubscribe-pl/@type' />",
		"id": "<xsl:value-of select='//events/unsubscribe-pl/@id' />"
	}
</xsl:template>

<xsl:template name="unsubscribe-en">
	
<xsl:variable name="result" select="//events/unsubscribe-en/@result" />
	{
		"status": "<xsl:value-of select='$result'/>",
		"type": "<xsl:value-of select='//events/unsubscribe-en/@type' />",
		"id": "<xsl:value-of select='//events/unsubscribe-en/@id' />"
	}
</xsl:template>

</xsl:stylesheet>