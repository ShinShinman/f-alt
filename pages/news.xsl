<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="../utilities/master.xsl"/>

<xsl:template match="data">

	<section class="news">

		<nav class="breadcrumbs donthyphenate"><a href="{$root}">Home</a><a href="javascript:void()" class="current"><xsl:value-of select="//dictionary/aktualnosci[@lang = $language]" /></a></nav>

		<header>
			<h1 class="slogan"><xsl:value-of select="//dictionary/dzialamy[@lang = $language]" /></h1>
			<h1><xsl:value-of select="//dictionary/dzialamy[@lang = $language]" /></h1>
			<nav class="categories">
				<ul class="inline-list">
					<xsl:apply-templates select="post-categories/entry"/>
					<li><a href="javascript:void();" data-filter="*" class="filterButton"><xsl:value-of select="//dictionary/wszystkie[@lang = $language]" /></a></li>
				</ul>
			</nav>
		</header>

		<div class="container">
			<xsl:apply-templates select="news/entry"/>
		</div>
	</section>

</xsl:template>

<xsl:template match="post-categories/entry">
	<xsl:variable name="cat" select="category[@lang = 'pl']/@handle" />
	<xsl:if test="count(//news/entry/category/item[@handle = $cat]) > 0">
		<li><a href="javascript:void();" data-filter=".{category[@lang = $language]/@handle}" class="filterButton"><xsl:value-of select="category[@lang = $language]" /></a></li>
	</xsl:if>
</xsl:template>

<xsl:template match="news/entry">
	<xsl:call-template name="get-brick"/>
</xsl:template>

<xsl:template match="data" mode="js">
	<script src="{$workspace}/js/vendor/isotope.pkgd.min.js"></script>
	<script>
		function getHashFilter() {
			var hash = location.hash;
			// get filter=filterName
			var matches = location.hash.match( /filter=([^<xsl:value-of disable-output-escaping="yes" select="string('&amp;')"/>]+)/i );
			var hashFilter = matches <xsl:value-of disable-output-escaping="yes" select="string('&amp;&amp;')"/> matches[1];
			return hashFilter <xsl:value-of disable-output-escaping="yes" select="string('&amp;&amp;')"/> decodeURIComponent( hashFilter );
		}
		$(window).load(function() {
			var $container = $('.container');

			$(".filterButton").click(function(e) {
				var filterValue = $(this).attr('data-filter');
				location.hash = 'filter=' + encodeURIComponent( filterValue );
				console.log(filterValue);
			e.preventDefault();
			});

			var isIsotopeInit = false;

			function onHashchange() {
		    var hashFilter = getHashFilter();
		    if ( !hashFilter <xsl:value-of disable-output-escaping="yes" select="string('&amp;&amp;')"/> isIsotopeInit ) {
		      return;
		    }
		    isIsotopeInit = true;
		    // filter isotope
		    $container.isotope({
		      itemSelector: '.container article',
		      filter: hashFilter
		    });

				/*
		    // set selected class on button
		    if ( hashFilter ) {
		      $filters.find('.is-checked').removeClass('is-checked');
		      $filters.find('[data-filter="' + hashFilter + '"]').addClass('is-checked');
		    }
		    */
		  }

		  $(window).on( 'hashchange', onHashchange );
			// trigger event handler to init Isotope
			onHashchange();
		});
	</script>
</xsl:template>

</xsl:stylesheet>