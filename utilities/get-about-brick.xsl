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

<xsl:template name="get-about-brick">
  <article class="about brick">
    <a href="{$root}/{$language}/about/{title[@lang = $language]/@handle}">
      <h2 class="cykl donthyphenate"><xsl:value-of select="//dictionary/o-nas[@lang = $language]"/></h2>
      <h1 class="slogan donthyphenate"><xsl:value-of select="title[@lang = $language]"/></h1>
      <h1 class="donthyphenate"><xsl:value-of select="title[@lang = $language]"/></h1>
      <div class="lead">
        <xsl:copy-of select="content[@lang = $language]/node()"/>
      </div>
    </a>
  </article>
</xsl:template>

</xsl:stylesheet>