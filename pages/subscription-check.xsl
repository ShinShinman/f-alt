<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="text" />

<xsl:template match="/">

	<!--
		Dopisac test związany z Eventem!
	-->

	<xsl:variable name="mail" select="//events/subscription-check/post-values/mail" />
	<xsl:variable name="name" select="//events/subscription-check/post-values/name" />
		<xsl:choose>
			<xsl:when test="data/odbiorcy/entry[mail = $mail]">
			{ 
				"status": "subscribed",
				"id": "<xsl:value-of select="data/odbiorcy/entry[mail = $mail]/@id" />"
			}
		</xsl:when>
		<xsl:otherwise>
			{ 
				"status": "ready",
				"message": "Requersted email address has not been subscribed yet.",
				"email": "<xsl:value-of select='$mail' />",
				"name": "<xsl:value-of select='$name' />"
			}
		</xsl:otherwise>
	</xsl:choose>

</xsl:template>



</xsl:stylesheet>