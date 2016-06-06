<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="../utilities/master.xsl"/>

<xsl:template match="data">

	<section class="audio-video">
		<header>
			<xsl:choose>
				<xsl:when test="$language = 'pl'">
					<h1 class="slogan">audio i wideo</h1>
					<h1>Audio i wideo</h1>
				</xsl:when>
				<xsl:otherwise>
					<h1 class="slogan">audio and video</h1>
					<h1>Audio and Video</h1>
				</xsl:otherwise>
			</xsl:choose>
		</header>
		<div class="container">
			<xsl:apply-templates select="audio-video/entry"/>
		</div>
	</section>

</xsl:template>

<xsl:template match="audio-video/entry">
	<xsl:call-template name="get-video-brick"/>
</xsl:template>

<xsl:template match="data" mode="js">
	<script src="{$workspace}/js/vendor/isotope.pkgd.min.js"></script>
	<script>
		var container = $(".container").isotope({
			itemSelector: (".container article")
		});
		container.imagesLoaded( function() {
			container.isotope('layout');
		});

	</script>
</xsl:template>

</xsl:stylesheet>