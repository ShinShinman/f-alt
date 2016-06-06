<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE xsl:stylesheet [
    <!ENTITY nbsp "&#x00A0;">
	<!ENTITY copy   "&#169;">
	<!ENTITY ndash "&#8211;">
	<!ENTITY thinsp "&#8201;">
	<!ENTITY amp "&#038;">
	<!ENTITY hellip "&#8230;">
	<!ENTITY bull "&#8226;">
]>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="get-about-header">
  <header>
    <h1 class="slogan"><xsl:value-of select="title[@lang = $language]"/></h1>
    <h1><xsl:value-of select="title[@lang = $language]"/></h1>
  </header>
</xsl:template>

</xsl:stylesheet>