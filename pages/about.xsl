<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="../utilities/master.xsl"/>

<xsl:template match="data">

	<section class="about">

		<nav class="breadcrumbs donthyphenate"><a href="{$root}">Home</a><a href="{$root}/{$language}/about/manifest-programowy"><xsl:value-of select="//dictionary/o-nas[@lang = $language]" /></a><a href="javascript:void()" class="current"><xsl:value-of select="about/entry/title[@lang = $language]" /></a></nav>

		<header>
			<h1 class="slogan"><xsl:value-of select="//dictionary/o-nas[@lang = $language]"/></h1>
			<h1><xsl:value-of select="//dictionary/o-nas[@lang = $language]"/></h1>
			<nav>
		    <ul class="inline-list">
		      <xsl:apply-templates select="about-nav/entry"/>
		    </ul>
		  </nav>
		</header>
		<xsl:apply-templates select="about/entry"/>
		<xsl:if test="ludzie-zatrudnieni/entry[category/item/@handle = 'zarzad']">
			<aside>
				<footer>
					<!--
					<h2 class="slogan">Ludzie</h2>
					<h2>Ludzie</h2>
				-->
					<div class="container-zarzad">
						<xsl:apply-templates select="ludzie-zatrudnieni/entry[category/item/@handle = 'zarzad']"/>
						<xsl:apply-templates select="ludzie-zatrudnieni/entry[category/item/@handle = 'zespol']"/>
					</div>
				</footer>
			<!--
			<xsl:if test="ludzie-zatrudnieni/entry[category/item/@handle = 'zespol']">
				<footer>
					<h2 class="slogan">Pracownicy</h2>
					<h2>Pracownicy</h2>
					<div class="container-pracownicy">
						<xsl:apply-templates select="ludzie-zatrudnieni/entry[category/item/@handle = 'zespol']"/>
					</div>
				</footer>
			</xsl:if>
			-->
			</aside>
		</xsl:if>
	</section>

</xsl:template>
	
<xsl:template match="about-nav/entry">
	<li><a href="{$root}/{$language}/about/{title[@lang = $language]/@handle}"><xsl:value-of select="title[@lang = $language]"/></a></li>
</xsl:template>

<xsl:template match="about/entry">
	<article>
		<header>
	    <h1 class="slogan"><xsl:value-of select="title[@lang = $language]"/></h1>
	    <h1><xsl:value-of select="title[@lang = $language]"/></h1>
	  </header>
		<xsl:copy-of select="content[@lang = $language]/node()"/>
	</article>
</xsl:template>

<xsl:template match="ludzie-zatrudnieni/entry[category/item/@handle = 'zarzad']">
	<xsl:call-template name="get-name-brick"/>
</xsl:template>

<xsl:template match="ludzie-zatrudnieni/entry[category/item/@handle = 'zespol']">
	<xsl:call-template name="get-name-brick"/>
</xsl:template>

<xsl:template match="data" mode="js">
	<script src="{$workspace}/js/vendor/isotope.pkgd.min.js"></script>
	<script src="{$workspace}/js/vendor/imagesloaded.js"></script>
	<script>

		$(window).load(function() {
			$(".container-zarzad").isotope({
				itemSelector: '.container-zarzad article'
			});
		});

	</script>
</xsl:template>

</xsl:stylesheet>
