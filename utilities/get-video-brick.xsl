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

<xsl:template name="get-video-brick">
  <article class="video brick">
    <a href="{$root}/{$language}/post/{title[@lang = $language]/@handle}">
  		<img alt="" width="271px" height="auto" src="{$workspace}{cover/@path}/{cover/filename}"/>
      <h1 class="slogan"><xsl:value-of select="title[@lang = $language]"/></h1>
      <h1><xsl:value-of select="title[@lang = $language]"/></h1>
      <xsl:copy-of select="lead[@lang = $language]/node()"/>
    </a>
  </article>
</xsl:template>

</xsl:stylesheet>