<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="../utilities/master.xsl"/>

<xsl:template match="data">

	<section class="indeks-osob">
		<header>
			<xsl:choose>
				<xsl:when test="$language = 'pl'">
					<h1 class="slogan">Indeks osoób</h1>
					<h1>Indeks osoób</h1>
				</xsl:when>
				<xsl:otherwise>
					<h1 class="slogan">Index of people</h1>
					<h1>Index of people</h1>
				</xsl:otherwise>
			</xsl:choose>
		</header>
		<div class="container">
			<xsl:apply-templates select="index-osob-wspolpracownicy/entry"/>
			<xsl:apply-templates select="index-osob-zatrudnieni/entry"/>
		</div>
	</section>

</xsl:template>

<xsl:template match="index-osob-wspolpracownicy/entry">
	<xsl:call-template name="get-name-brick"/>
</xsl:template>

<xsl:template match="index-osob-zatrudnieni/entry">
	<xsl:call-template name="get-name-brick"/>
</xsl:template>

<xsl:template match="data" mode="js">
	<script src="{$workspace}/js/vendor/isotope.pkgd.min.js"></script>
	<script>
		$(window).load(function() {
			$(".container").isotope({
				itemSelector: (".container article")
			});
		})
	</script>
</xsl:template>

</xsl:stylesheet>