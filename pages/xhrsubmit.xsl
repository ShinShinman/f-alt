<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="text" />

<xsl:template match="/">


	<xsl:variable name="mail" select="data/events/subskrypcja-newslettera-test/post-values/mail" />
	{
		"response": "<xsl:value-of select="data/events/subskrypcja-newslettera-test/@result"/>"
		<xsl:if test="data/odbiorcy/entry[mail = $mail]">
			, "mail": "już zapisany"
		</xsl:if>
	}


</xsl:template>

<xsl:template match="search-suggestions/word">
	"<xsl:value-of select='.' />",
</xsl:template>	

<xsl:template match="search-suggestions/word" mode="last-node">
	"<xsl:value-of select='.' />"
</xsl:template>	

</xsl:stylesheet>