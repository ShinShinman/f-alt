<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="../utilities/master.xsl"/>

<xsl:template match="data">
	<section class="post bio">
			<xsl:choose>
				<xsl:when test="people-zatrudnieni/entry">
					<xsl:apply-templates select="people-zatrudnieni/entry"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="people-wspolpracownicy/entry"/>
				</xsl:otherwise>
			</xsl:choose>
	</section>
</xsl:template>

<xsl:template match="entry">

	<nav class="breadcrumbs donthyphenate"><a href="{$root}">Home</a><a href="{$root}/{$language}/about/manifest-programowy/"><xsl:value-of select="//dictionary/o-nas[@lang = $language]" /></a><a href="{$root}/{$language}/about/ludzie/"><xsl:value-of select="//dictionary/ludzie[@lang = $language]" /></a><a href="javascript:void()" class="current"><xsl:value-of select="name[@lang = $language]" /></a></nav>

	<header>
		<h1 class="slogan"><xsl:value-of select="name[@lang = $language]"/></h1>
		<h1><xsl:value-of select="name[@lang = $language]"/></h1>
		<p class="job"><xsl:value-of select="job[@lang = $language]"/></p>
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
	</header>

	<article>
		<p class="image"><img class="grey-filter" src="{$root}/image/2/0/450/5{image/@path}/{image/filename}" srcset="{$root}/image/2/0/450/5{image/@path}/{image/filename} 1x, {$root}/image/2/0/900/5{image/@path}/{image/filename} 2x" alt=""/></p>
		<p class="bio"><xsl:copy-of select="bio[@lang = $language]/node()"/></p>
	</article>

	<xsl:if test="linked">
		<footer class="linked">
			<h2 class="slogan">Powiązane</h2>
			<h2>Powiązane</h2>
			<div class="container">
				<xsl:apply-templates select="linked/item"/>
			</div>
		</footer>
	</xsl:if>
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

<xsl:template match="linked/entry">
	<xsl:choose>
		<xsl:when test="@section-handle = 'coworkers' or @section-handle = 'team'">
			<xsl:call-template name="get-name-brick"/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:call-template name="get-brick"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>


<xsl:template match="partners/entry">
	<!--<p><xsl:value-of select="name[@lang = $language]"/></p>-->
	<li><img src="{$workspace}{logo/@path}/{logo/filename}" alt=""/></li>
</xsl:template>

<xsl:template match="category/item">
  <li><a href="javascript:void(0);"><xsl:value-of select="."/></a></li>
</xsl:template>

<xsl:template match="data" mode="js">
	<script src="{$workspace}/js/vendor/isotope.pkgd.min.js"></script>
	<script>
		$(function() {
			var as = $(".post-body a[title]"),
					trg = $(".post-body header nav");

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

			var headers = $(".post-body article:not(.brick) h2");

			headers.each(function() {
				var txt = $(this).text();
				$(this).after("<h2>" + txt + "</h2>").addClass("slogan");
			});

		});

		$(window).load(function() {
			$(".container").isotope({
				itemSelector: (".container article")
			});
		});
	</script>
</xsl:template>

</xsl:stylesheet>
