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

<xsl:template name="get-name-brick">
  <article class="name brick">
		 <a href="{$root}/{$language}/people/{name[@lang = $language]/@handle}">
      <xsl:if test="image">
        <img class="grey-filter" src="{$root}/image/2/241/0/1{image/@path}/{image/filename}" srcset="{$root}/image/2/241/0/1{image/@path}/{image/filename} 1x, {$root}/image/2/482/0/1{image/@path}/{image/filename} 2x" alt=""/>
      </xsl:if>
      <h1 class="slogan donthyphenate"><xsl:value-of select="name[@lang = $language]"/></h1>
      <h1 class="donthyphenate"><xsl:value-of select="name[@lang = $language]"/></h1>
      <xsl:if test="job[@lang = $language]">
        <p class="job donthyphenate"><xsl:value-of select="job[@lang = $language]"/></p>
      </xsl:if>
      <div class="lead">
        <xsl:copy-of select="lead[@lang = $language]/node()"/>
      </div>
      <hr />
      <xsl:choose>
        <xsl:when test="category">
          <p class="category"><xsl:value-of select="category/item"/></p>
        </xsl:when>
        <xsl:otherwise>
          <xsl:choose>
            <xsl:when test="$language = 'pl'">
              <p class="category">Współpracownicy</p>
            </xsl:when>
            <xsl:otherwise>
              <p class="category">--Uzupełnij--</p>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:otherwise>
      </xsl:choose>
    </a>
  </article>
</xsl:template>

</xsl:stylesheet>