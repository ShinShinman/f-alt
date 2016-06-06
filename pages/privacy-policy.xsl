<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="../utilities/master.xsl"/>

<xsl:template match="data">
	<section class="post">
		<xsl:apply-templates select="polityka-prywatnosci/entry"/>
	</section>
</xsl:template>

<xsl:template match="entry">

	<nav class="breadcrumbs donthyphenate"><a href="{$root}">Home</a><a href="javascript:void()" class="current"><xsl:value-of select="//dictionary/polityka-prywatnosci[@lang = $language]" /></a></nav>

	<header>
		<h1 class="slogan"><xsl:value-of select="title[@lang = $language]"/></h1>
		<h1><xsl:value-of select="title[@lang = $language]"/></h1>
	</header>

	<article>
		<p><xsl:copy-of select="content[@lang = $language]/node()"/></p>
	</article>

</xsl:template>

</xsl:stylesheet>