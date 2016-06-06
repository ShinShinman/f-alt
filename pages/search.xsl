<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#x00A0;">
	<!ENTITY copy   "&#169;">
	<!ENTITY ndash "&#8211;">
	<!ENTITY thinsp "&#8201;">
	<!ENTITY amp "&#038;">
	<!ENTITY hellip "&#8230;">
	<!ENTITY bull "&#8226;">
	<!ENTITY lsaqua "&#8249;">
	<!ENTITY rsaqua "&#8250;">
	<!ENTITY larr "&#8592;">
	<!ENTITY rarr "&#8594;">
	<!ENTITY lt "&#60;">
	<!ENTITY gt "&#62;">
]>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="../utilities/master.xsl"/>

<xsl:template match="data">

	<section class="search">

		<nav class="breadcrumbs donthyphenate"><a href="{$root}">Home</a><a href="javascript:void()" class="current"><xsl:value-of select="//dictionary/wyszukiwarka[@lang = $language]" /></a><a href="javascript:void()" class="current"><span class="keyword"><xsl:value-of select="search/@keywords"/></span></a></nav>

		<header>
			<h1 class="slogan"><xsl:value-of select="//dictionary/wyszukiwarka[@lang = $language]"/></h1>
			<h1><xsl:value-of select="//dictionary/wyszukiwarka[@lang = $language]"/></h1>
			
			<xsl:choose>
				<xsl:when test="search/entry">
					<p><xsl:value-of select="//dictionary/search-positive[@lang = $language]" />&nbsp;<span class="keyword"><xsl:value-of select="search/@keywords"/></span>.</p>
				</xsl:when>
				<xsl:otherwise>
					<p><xsl:value-of select="//dictionary/search-negative[@lang = $language]" />&nbsp;<span class="keyword"><xsl:value-of select="search/@keywords"/></span>.</p>
				</xsl:otherwise>
			</xsl:choose>
			<!--
			<form id="search-form" action="" method="get">
				<input type="text" name="keywords" placeholder="Wyszukaj" autocomplete="off"/>
				<input type="hidden" name="sections" value="post,team,coworkers" />
				<input type="submit" value="s" />
			-->
				<!--
				<input type="hidden" name="sort" value="score-recency" />
				<input type="hidden" name="per-page" value="10" />
				<input type="hidden" name="debug" />
				-->
				<!--
			</form>
		-->
		</header>

		<div class="container">
			<xsl:apply-templates select="search/entry"/>
		</div>
	</section>

</xsl:template>
	
<xsl:template match="search/entry">
	<xsl:variable name="id" select="@id"/>
	<xsl:choose>
		<xsl:when test="@section = 'post'">
			<xsl:apply-templates select="//data/search-post/entry[@id = $id]"/>
		</xsl:when>
		<xsl:when test="@section = 'about'">
			<xsl:apply-templates select="//data/search-about/entry[@id = $id]"/>
		</xsl:when>
		<xsl:when test="@section = 'team'">
			<xsl:apply-templates select="//data/search-team/entry[@id = $id]"/>
		</xsl:when>
		<xsl:when test="@section = 'coworkers'">
			<xsl:apply-templates select="//data/search-coworkers/entry[@id = $id]"/>
		</xsl:when>
	</xsl:choose>
</xsl:template>

<xsl:template match="search-post/entry">
	<xsl:call-template name="get-brick"/>
</xsl:template>

<xsl:template match="search-about/entry">
	<xsl:call-template name="get-about-brick"/>
</xsl:template>

<xsl:template match="search-team/entry">
	<xsl:call-template name="get-name-brick"/>
</xsl:template>

<xsl:template match="search-coworkers/entry">
	<xsl:call-template name="get-name-brick"/>
</xsl:template>

<xsl:template match="data" mode="js">
	<script src="{$workspace}/js/vendor/isotope.pkgd.min.js"></script>
	<script>
		$(window).load(function() {

			var form = $("form"),
					searchField = form.find("input[name = 'keywords']"),
					searchStr = "";

			searchField.keydown(function(e) {
				if(e.keyCode == 8) {
					searchStr = searchStr.substring(0, searchStr.length - 1);
				} else if (e.keyCode == 32 || (e.keyCode <xsl:value-of disable-output-escaping="yes" select="string('&gt;')"/>= 65 <xsl:value-of disable-output-escaping="yes" select="string('&amp;&amp;')"/> e.keyCode <xsl:value-of disable-output-escaping="yes" select="string('&lt;')"/>= 90) || (e.keyCode <xsl:value-of disable-output-escaping="yes" select="string('&gt;')"/>= 48 <xsl:value-of disable-output-escaping="yes" select="string('&amp;&amp;')"/> e.keyCode <xsl:value-of disable-output-escaping="yes" select="string('&lt;')"/>= 57)) {
					searchStr += String.fromCharCode(e.keyCode);
				}
			});

			$(".container").isotope({
				itemSelector: (".container article")
			});

		});
	</script>
</xsl:template>

</xsl:stylesheet>