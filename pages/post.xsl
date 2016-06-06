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
]>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="../utilities/master.xsl"/>

<xsl:template match="data">
	<section>
		<xsl:attribute name="class">
      <xsl:text>post-body post regular </xsl:text><xsl:value-of select="post/entry/title/@handle"/>
      <xsl:apply-templates select="post/entry/category/item" mode="class"/>
    </xsl:attribute>

    <nav class="breadcrumbs donthyphenate"><a href="{$root}">Home</a><a href="{$root}/{$language}/news/"><xsl:value-of select="//dictionary/aktualnosci[@lang = $language]" /></a><a href="javascript:void()" class="current"><xsl:value-of select="post/entry/title[@lang = $language]" /></a></nav>
    
		<header class="donthyphenate">
			<xsl:if test="post/entry/series[@lang = $language]">
				<h2 class="cykl"><xsl:value-of select="post/entry/series[@lang = $language]"/></h2>
			</xsl:if>
			<h1 class="slogan"><xsl:value-of select="post/entry/title[@lang = $language]"/></h1>
			<h1><xsl:value-of select="post/entry/title[@lang = $language]"/></h1>
			<xsl:if test="post/entry/subtitle[@lang = $language]">
				<h2><xsl:value-of select="post/entry/subtitle[@lang = $language]"/></h2>
			</xsl:if>
			<!--
			<xsl:call-template name="format-date">
        <xsl:with-param name="date" select="post/entry/calendar/date/start"/>
        <xsl:with-param name="format" select="'x M Y'"/>
      </xsl:call-template>
      -->
			<ul class="category-list inline-list">
				<li class="label"><xsl:value-of select="//dictionary/kategorie[@lang = $language]"/>:</li>
	      <xsl:apply-templates select="post/entry/category/item"/>
	    </ul>
	    <xsl:if test="post/entry/date-place[@lang = $language]">
	    	<p class="date-place"><xsl:value-of select="post/entry/date-place[@lang = $language]"/></p>
	    </xsl:if>
			<nav></nav>
		</header>

		<article>
			
			<xsl:if test="post/entry/gallery">
				<div class="gallery">
					<xsl:apply-templates select="post/entry/gallery/item"/>
				</div>
			</xsl:if>

			<xsl:if test="post/entry/embed">
				<div class="video">
					<xsl:apply-templates select="post/entry/embed"/>
				</div>
			</xsl:if>

			<xsl:if test="post/entry/audio">
				<div class="audio">
					<xsl:apply-templates select="post/entry/audio"/>
				</div>
			</xsl:if>

			<xsl:copy-of select="post/entry/content[@lang = $language]/node()"/>

			<xsl:if test="post/entry/show-map = 'Yes'">
				<h2><xsl:value-of select="//dictionary/mapa[@lang = $language]"/></h2>
				<p><a href="#" title="mapa"></a></p>
				<div id="googleMap"></div>
				<script src="http://maps.googleapis.com/maps/api/js"></script>
				<script>
					function initializeMap() {
						var mapProp = {
							center: new google.maps.LatLng(<xsl:value-of select="post/entry/map/map/@centre"/>),
							zoom: <xsl:value-of select="post/entry/map/map/@zoom"/>,
							mapTypeId: google.maps.MapTypeId.ROADMAP
						};
						var map = new google.maps.Map(document.getElementById("googleMap"), mapProp);
						var marker = new google.maps.Marker({
							position: new google.maps.LatLng(<xsl:value-of select="post/entry/map/@latitude"/>, <xsl:value-of select="post/entry/map/@longitude"/>),
						});
						marker.setMap(map);
					}
					google.maps.event.addDomListener(window, 'load', initializeMap);
				</script>
			</xsl:if>
			
		<xsl:if test="post/entry/partners">
			<footer class="partners">
				<h2><xsl:value-of select="//dictionary/partnerzy[@lang = $language]"/></h2>
				<p><a href="#" title="partnerzy"></a></p>
				<ul>
					<xsl:apply-templates select="post/entry/partners/item" />
				</ul>
			</footer>
		</xsl:if>

		<!--
		<xsl:if test="post/entry/linked">
				<footer class="linked">-->
					<!--<h2 class="slogan"><xsl:value-of select="//dictionary/powiazane[@lang = $language]"/></h2>-->
					<!--<h2><xsl:value-of select="//dictionary/powiazane[@lang = $language]"/></h2>
					<p><a href="#" title="powiązane"></a></p>
					<div class="container">
						<xsl:apply-templates select="post/entry/linked/item"/>
					</div>
				</footer>
		</xsl:if>
		-->

		</article>

		<aside class="linkedTmp">
			
			<xsl:if test="post/entry/linked">
				<footer class="linked">
					<!--<h2 class="slogan"><xsl:value-of select="//dictionary/powiazane[@lang = $language]"/></h2>-->
					<h2><xsl:value-of select="//dictionary/powiazane[@lang = $language]"/></h2>
					<p><a href="#" title="powiązane"></a></p>
					<div class="container">
						<xsl:apply-templates select="post/entry/linked/item"/>
					</div>
				</footer>
		</xsl:if>

		</aside>


		<!--
		<aside>

			<xsl:if test="post/entry/gallery">
				<h2>Galeria</h2>
				<div class="gallery">
					<xsl:apply-templates select="post/entry/gallery/item"/>
				</div>
			</xsl:if>

			<xsl:if test="post/entry/embed">
				<h2>Wideo</h2>
				<div class="video">
					<xsl:apply-templates select="post/entry/embed"/>
				</div>
			</xsl:if>

			<xsl:if test="post/entry/audio">
				<h2>Audio</h2>
				<div class="audio">
					<xsl:apply-templates select="post/entry/audio"/>
				</div>
			</xsl:if>

			<xsl:if test="post/entry/show-map = 'Yes'">
				<h2><xsl:value-of select="//dictionary/mapa[@lang = $language]"/></h2>
				<div id="googleMap"></div>
				<script src="http://maps.googleapis.com/maps/api/js"></script>
				<script>
					function initializeMap() {
						var mapProp = {
							center: new google.maps.LatLng(<xsl:value-of select="post/entry/map/map/@centre"/>),
							zoom: <xsl:value-of select="post/entry/map/map/@zoom"/>,
							mapTypeId: google.maps.MapTypeId.ROADMAP
						};
						var map = new google.maps.Map(document.getElementById("googleMap"), mapProp);
						var marker = new google.maps.Marker({
							position: new google.maps.LatLng(<xsl:value-of select="post/entry/map/@latitude"/>, <xsl:value-of select="post/entry/map/@longitude"/>),
						});
						marker.setMap(map);
					}
					google.maps.event.addDomListener(window, 'load', initializeMap);
				</script>
			</xsl:if>

		</aside>
		-->



	</section>
</xsl:template>

<xsl:template match="category/item">
  <li>
  	<xsl:choose>
      <xsl:when test="$language = 'pl'">
        <xsl:value-of select="category-pl"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="category-en"/>
      </xsl:otherwise>
    </xsl:choose>
  </li>
</xsl:template>

<xsl:template match="category/item" mode="class">
	<xsl:text> </xsl:text>
	<xsl:value-of select="@handle"/>
</xsl:template>

<xsl:template match="gallery/item">
	<xsl:variable name="langgg" select="concat('test-', $language)"/>
	<div class="item">
		<img src="{$root}/image/2/700/450/5{image/@path}/{image/filename}" srcset="{$root}/image/2/700/450/5{image/@path}/{image/filename} 1x, {$root}/image/2/1400/900/5{image/@path}/{image/filename} 2x" alt="{discr-pl}"/>
		<p><xsl:copy-of select="discr-pl/node()"/></p>
	</div>
</xsl:template>

<xsl:template match="embed">
	<xsl:value-of select="oembed/html" disable-output-escaping="yes"/>
</xsl:template>

<xsl:template match="audio">
	<audio controls="">
		<source src="{$workspace}{item/audio/@path}/{item/audio/filename}" type="{item/audio/@type}"/>
		<xsl:choose>
			<xsl:when test="@language = 'pl'">
				Twoja przeglądarka nie obsługuje plików audio.
			</xsl:when>
			<xsl:otherwise>
				Your browser does not support the audio.
			</xsl:otherwise>
		</xsl:choose>
	</audio>
</xsl:template>

<xsl:template match="partners/item">
	<!--<p><xsl:value-of select="name[@lang = $language]"/></p>-->
	<li><img src="{$workspace}{logo/@path}/{logo/filename}" alt=""/></li>
</xsl:template>

<xsl:template match="linked/item">
	<xsl:variable name="id" select="@id"/>
	<xsl:choose>
		<xsl:when test="@section-handle = 'team'">
			<xsl:apply-templates select="//data/linked-zatrudnieni/entry[@id = $id]"/>
		</xsl:when>
		<xsl:when test="@section-handle = 'coworkers'">
			<xsl:apply-templates select="//data/linked-wspolpracownicy/entry[@id = $id]"/>
		</xsl:when>
		<xsl:when test="@section-handle = 'post'">
			<xsl:apply-templates select="//data/linked-posty/entry[@id = $id]"/>
		</xsl:when>
	</xsl:choose>
</xsl:template>

<xsl:template match="linked-zatrudnieni/entry">
	<xsl:call-template name="get-name-brick"/>
</xsl:template>

<xsl:template match="linked-wspolpracownicy/entry">
	<xsl:call-template name="get-name-brick"/>
</xsl:template>

<xsl:template match="linked-posty/entry">
	<xsl:call-template name="get-brick"/>
</xsl:template>

<xsl:template match="data" mode="js">
	<script src="{$workspace}/js/vendor/isotope.pkgd.min.js"></script>
	<script src="{$workspace}/js/vendor/owl.carousel.min.js"></script>
	<script>
		$(function() {
			var as = $(".post.regular a[title]"),
					trg = $(".post.regular header nav:not(.breadcrumbs)");

			trg.append('<ul class="inline-list"></ul>');
			
			as.each(function(index, el) {
				trg.find('ul').append('<li><a href="javascript:void(0);">' + $(this).attr('title') + '</a></li>');
			});
			
			var menuLinks = trg.find("a");

			menuLinks.each(function() {
				$(this).click(function(e) {
					e.preventDefault();
					var a = $(this).text();
					aTag = $("a[title='" + a + "']");
					$('html,body').animate({scrollTop: aTag.offset().top-194},'slow');
				});
			});

			var headers = $(".post.regular article:not(.brick) h2");

			headers.each(function() {
				var txt = $(this).text();
				$(this).after("<h2>" + txt + "</h2>").addClass("slogan");
			});

			<xsl:if test="//post/entry/gallery">
				$(".post .gallery").owlCarousel({
					slideSpeed : 1000,
					paginationSpeed : 1000,
					singleItem:true,
					navigation: true,
					navigationText: ["&larr;", "&rarr;"]
				});	
			</xsl:if>

		});

		$(window).load(function() {

			$(".container").isotope({
				itemSelector: (".container article")
			});
			//$(".partners ul").isotope();

		});
	</script>
</xsl:template>

<xsl:template match="data" mode="meta-tags">
	<link rel="stylesheet" href="{$workspace}/css/owl.carousel.css"/>
	<link rel="stylesheet" href="{$workspace}/css/owl.theme.css"/>
</xsl:template>

</xsl:stylesheet>
