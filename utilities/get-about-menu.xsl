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

<xsl:template name="get-about-menu">
  <nav>
    <ul class="inline-list">
      <li>
        <xsl:choose>
          <xsl:when test="$language = 'pl'">
            <a href="{$root}/pl/about/story/">fundacja</a>
          </xsl:when>
          <xsl:otherwise>
            <a href="{$root}/en/about/story/">found</a>
          </xsl:otherwise>
        </xsl:choose>
      </li> 
      <li>
        <xsl:choose>
          <xsl:when test="$language = 'pl'">
            <a href="{$root}/pl/about/manifesto/">manifest programowy</a>
          </xsl:when>
          <xsl:otherwise>
            <a href="{$root}/en/about/manifesto/">manifesto</a>
          </xsl:otherwise>
        </xsl:choose>
      </li>
      <li>
        <xsl:choose>
          <xsl:when test="$language = 'pl'">
            <a href="{$root}/pl/about/team/">zespół</a>
          </xsl:when>
          <xsl:otherwise>
            <a href="{$root}/en/about/team/">team</a>
          </xsl:otherwise>
        </xsl:choose>
      </li>
      <li>
        <xsl:choose>
          <xsl:when test="$language = 'pl'">
            <a href="{$root}/pl/about/statute/">statut</a>
          </xsl:when>
          <xsl:otherwise>
            <a href="{$root}/en/about/statute/">statut</a>
          </xsl:otherwise>
        </xsl:choose>
      </li>
      <!--
      <li>
        <xsl:choose>
          <xsl:when test="$language = 'pl'">
            <a href="{$root}/pl/about/for-media/">dla mediów</a>
          </xsl:when>
          <xsl:otherwise>
            <a href="{$root}/en/about/for-media/">dla mediów</a>
          </xsl:otherwise>
        </xsl:choose>
      </li>
      <li>
        <xsl:choose>
          <xsl:when test="$language = 'pl'">
            <a href="{$root}/pl/about/partners-and-sponsors/">partnerzy i sponsorzy</a>
          </xsl:when>
          <xsl:otherwise>
            <a href="{$root}/en/about/partners-and-sponsors/">partnerzy i sponsorzy</a>
          </xsl:otherwise>
        </xsl:choose>
      </li>
    -->
    </ul>
  </nav>
</xsl:template>

</xsl:stylesheet>