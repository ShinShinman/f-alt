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

<xsl:template name="get-brick">
  <article class="brick ">
    <xsl:attribute name="class">
      <xsl:text>brick </xsl:text>
      <xsl:apply-templates select="category/item" mode="class"/>
    </xsl:attribute>
    <a href="{$root}/{$language}/post/{title[@lang = $language]/@handle}">
      <xsl:if test="cover">
        <img src="{$root}/image/2/241/0/1{cover/@path}/{cover/filename}" srcset="{$root}/image/2/241/0/1{cover/@path}/{cover/filename} 1x, {$root}/image/2/482/0/1{cover/@path}/{cover/filename} 2x" alt=""/>
      </xsl:if>
      <xsl:if test="series[@lang = $language]">
        <h2 class="cykl donthyphenate"><xsl:value-of select="series[@lang = $language]"/></h2>
      </xsl:if>
      <h1 class="slogan donthyphenate"><xsl:value-of select="title[@lang = $language]"/></h1>
      <h1 class="donthyphenate"><xsl:value-of select="title[@lang = $language]"/></h1>
      <xsl:if test="subtitle[@lang = $language]">
        <h2 class="subtitle donthyphenate"><xsl:value-of select="subtitle[@lang = $language]"/></h2>
      </xsl:if>
      <xsl:if test="date-place[@lang = $language]">
        <p class="date-place"><xsl:value-of select="date-place[@lang = $language]"/></p>
      </xsl:if>
      <div class="lead">
        <xsl:copy-of select="lead[@lang = $language]/node()"/>
      </div>
      <!--
      <p class="date">
        <xsl:call-template name="format-date">
          <xsl:with-param name="date" select="calendar/date/start"/>
          <xsl:with-param name="format" select="'x M Y'"/>
        </xsl:call-template>
      </p>
      -->
    </a>
    <hr/>
    <ul class="category-list">
      <xsl:apply-templates select="category/item"/>
    </ul>
  </article>
</xsl:template>

<xsl:template match="category/item" mode="class">
  <xsl:value-of select="@handle"/><xsl:text> </xsl:text>
</xsl:template>

<xsl:template match="category/item">
  <li>
    <a href="{$root}/{$language}/news/#filter=.{@handle}">
      <xsl:choose>
        <xsl:when test="$language = 'pl'">
          <xsl:value-of select="category-pl"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="category-en"/>
        </xsl:otherwise>
      </xsl:choose>
    </a>
  </li>
</xsl:template>

</xsl:stylesheet>