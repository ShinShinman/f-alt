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
	<!ENTITY lsaquo "&#8249;">
	<!ENTITY rsaquo "&#8250;">
	<!ENTITY percent "&#37;">
	<!ENTITY gt "&#37;">
]>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="../utilities/master.xsl"/>

<xsl:template match="data">
<div class="ff">
	<p><a href="javascript:void(0);">→</a></p>
</div>
	<xsl:if test="banner/entry">
		<section class="banner">
			<a href="{banner/entry/link}">
				<div>
					<h1 class="slogan donthyphenate">
						<xsl:value-of select="banner/entry/title[@lang = $language]"/>
					</h1>
				</div>
				<div>
					<xsl:copy-of select="banner/entry/discr[@lang = $language]/node()"/>
				</div>
			</a>
		</section>
	</xsl:if>

	<section class="slider donthyphenate">
		<div class="gallery">
			<xsl:apply-templates select="slider/entry/linked/item"/>
		</div>
	</section>
<!--
	<section class="calendar">
		<header>
			<h1 class="slogan"><xsl:value-of select="//dictionary/kalendarz[@lang = $language]" /></h1>
			<h1><xsl:value-of select="//dictionary/kalendarz[@lang = $language]" /></h1>
		</header>
		<div class="clndr">
			<div class="clndr-controls">
				<div class="clndr-previous-button">&lsaquo;</div>
				<div class="month"><xsl:text disable-output-escaping="yes">&lt;&#37;= month &gt;</xsl:text></div>
				<div class="clndr-next-button">&rsaquo;</div>
			</div>
			<div class="clndr-grid">
				<div class="days-of-the-week">
					<div class="days"></div>
				</div>
			</div>
		</div>
	</section>
-->
	<section class="news">
		<h1 class="slogan"><xsl:value-of select="//dictionary/dzialamy[@lang = $language]" /></h1>
		<h1><xsl:value-of select="//dictionary/dzialamy[@lang = $language]" /></h1>
		<!--
		<nav class="categories">
			<ul class="inline-list">
				<xsl:apply-templates select="post-categories/entry"/>
				<li><a href="javascript:void(0);" data-filter="*" class="filterButton">Wszystkie</a></li>
			</ul>
		</nav>
		-->

		<div class="container">
			<article class="grid-sizer brick"></article>
			<article class="double calendar brick">
				<div class="event-info">
					<div class="close">x</div>
					<div class="screen">
						<p class="date"><span>29.</span>08.2015</p>
						<p>12:00 – Okrągły stół ekonomii społecznej</p>
					</div>
				</div>
				<h1 class="slogan"><xsl:value-of select="//dictionary/kalendarz[@lang = $language]" /></h1>
				<h1><xsl:value-of select="//dictionary/kalendarz[@lang = $language]" /></h1>
				<div class="clndr">
					<div class="clndr-controls">
						<div class="clndr-previous-button">&lsaquo;</div>
						<div class="month"><xsl:text disable-output-escaping="yes">&lt;&#37;= month &gt;</xsl:text></div>
						<div class="clndr-next-button">&rsaquo;</div>
					</div>
					<div class="clndr-grid">
						<div class="days-of-the-week">
							<div class="days"></div>
						</div>
					</div>
				</div>
			</article>
			<xsl:apply-templates select="news/entry[position() &lt; 7]"/>
		</div>

		<xsl:if test="count(news/entry) > 6">
			<div class="button-wrapper"><div class="button">
				<a href="{$root}/{$language}/news"><xsl:value-of select="//dictionary/wiecej-dzialan[@lang = $language]" /></a>
			</div></div>
		</xsl:if>

	</section>

</xsl:template>

<xsl:template match="slider/entry/linked/item">
	<xsl:variable name="id" select="@id"/>
	<xsl:apply-templates select="//slider-linked/entry[@id = $id]"/>
</xsl:template>

<xsl:template match="slider-linked/entry">
	<a href="{$root}/{$language}/post/{title[@lang = $language]/@handle}">
		<div class="item">
			<xsl:if test="cover">
				<div class="cover grey-filter" style="background-image: url({$workspace}{cover/@path}/{cover/filename});"></div>
			</xsl:if>
			<div class="text">
			  <xsl:if test="series[@lang = $language]">
			    <h2 class="cykl"><xsl:value-of select="series[@lang = $language]"/></h2>
			  </xsl:if>
				<h1 class="slogan"><xsl:value-of select="title[@lang = $language]"/></h1>
				<h1><xsl:value-of select="title[@lang = $language]"/></h1>
				<xsl:if test="subtitle[@lang = $language]">
					<h2 class="subtitle"><xsl:value-of select="subtitle[@lang = $language]"/></h2>
				</xsl:if>
				<xsl:if test="date-place[@lang = $language]">
					<p class="date-place"><xsl:value-of select="date-place[@lang = $language]"/></p>
				</xsl:if>
			</div>
		</div>
	</a>
</xsl:template>

<xsl:template match="post-categories/entry">
	<xsl:variable name="cat" select="category[@lang = 'pl']/@handle" />
	<xsl:if test="count(//news/entry/category/item[@handle = $cat]) > 0">
		<li><a href="javascript:void(0);" data-filter=".{category[@lang = $language]/@handle}" class="filterButton"><xsl:value-of select="category[@lang = $language]" /></a></li>
	</xsl:if>
</xsl:template>

<xsl:template match="news/entry">
	<xsl:call-template name="get-brick"/>
</xsl:template>

<xsl:template match="data" mode="js">
	<script src="{$workspace}/js/vendor/isotope.pkgd.min.js"></script>
	<script src="{$workspace}/js/vendor/owl.carousel.min.js"></script>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.5.2/underscore-min.js"></script>
	<script src="{$workspace}/js/vendor/moment-2.8.3.js"></script>
	<script src="{$workspace}/js/vendor/clndr.js"></script>
	<script src="{$workspace}/js/vendor/perfect-scrollbar.jquery.min.js"></script>

	<script>

		//Calendar
		var eventsArray = [];
		<xsl:apply-templates select="events/entry"/>

		var updateCalendar = function() {
			$(".events-container").each(function(i) {
				$(this).perfectScrollbar({
					suppressScrollX: true
				});
			});
		}

		//Filtrowanie isotope
		function getHashFilter() {
			var hash = location.hash;
			// get filter=filterName
			var matches = location.hash.match( /filter=([^<xsl:value-of disable-output-escaping="yes" select="string('&amp;')"/>]+)/i );
			var hashFilter = matches <xsl:value-of disable-output-escaping="yes" select="string('&amp;&amp;')"/> matches[1];
			return hashFilter <xsl:value-of disable-output-escaping="yes" select="string('&amp;&amp;')"/> decodeURIComponent( hashFilter );
		}

		$(function() {

			//FF button
			if($('body').scrollTop() == 0) {
				$(".ff").fadeIn('slow');
				$(".ff a").click(function(e) {
					e.preventDefault();
					$(".ff").hide();
					$("body, html").animate({
						scrollTop: $(".news").offset().top
					}, 'slow')
				});
				if($(".ff").css("display") !== "none") {
					$(window).scroll(function() {
						$(".ff").fadeOut();
					})
					
				}
			}

			//Slider
			$(".slider .gallery").owlCarousel({
				items : 3, //10 items above 1000px browser width
				itemsDesktop : [1080,2], //5 items between 1000px and 901px
				itemsDesktopSmall : [800,1], // betweem 900px and 601px
				itemsTablet: [600,1], //2 items between 600 and 0
				navigation: true,
				navigationText: ["&larr;", "&rarr;"],
				slideSpeed: 1000,
				paginationSpeed: 1000,
				scrollPerPage: true
			});

			//Calendar CLNDR
			//close
			var panel = $(".calendar.brick .event-info"),
					scrn = panel.find('.screen'),
					closeBtn = panel.find('.close');

			panel.mouseleave(function(e) {
				e.preventDefault();
				$(this).animate({
					top: '100%'
				})
			});

			closeBtn.click(function(e) {
				e.preventDefault();
				panel.animate({
					top: '100%'
				})
			});

			//print events
			var printEvents = function(target) {
				if (target.events.length<xsl:text disable-output-escaping="yes">&gt;</xsl:text> 0) {
					scrn.empty();
					panel.animate({
						top: '120px'
					});

					scrn.append("<p><span>" + target.date.format('D') + "</span>." + target.date.format('MM.YYYY') + "</p>");

					$.each(target.events, function(i, event){
						var date = (event.date == undefined) ? event.start : event.date;
						scrn.append("<p><a href=" + event.handle + "><strong>" + event.hour + "</strong> " + event.title + "</a></p>");
						});
				}
			}

			moment.locale('pl');

			$(".clndr").clndr({
				constraints: {
			    startDate: '2015-04-01'
			  },
				weekOffset: 0,
			  events: eventsArray,
			  multiDayEvents: {
					startDate: 'start',
					endDate: 'end',
					singleDay: 'date'
				},
			  clickEvents: {
			    click: function(target) {
			    	printEvents(target);
			    },
			    onMonthChange: function(month) {
			      console.log('you just went to ' + month.format('MMMM, YYYY'));
			      //updateCalendar();
			      $('.container').isotope();
			    }
			  },
			  doneRendering: function() {
			    console.log('this would be a fine place to attach custom event handlers.');
			  }
			});

		});

		$(window).load(function() {

			//Calendar
			//updateCalendar();

			//Isotope
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

		    // set selected class on button
		    if ( hashFilter ) {
		      $filters.find('.is-checked').removeClass('is-checked');
		      $filters.find('[data-filter="' + hashFilter + '"]').addClass('is-checked');
		    }
		  }

		  $(window).on( 'hashchange', onHashchange );
			// trigger event handler to init Isotope
			onHashchange();
		});
	</script>
</xsl:template>

<xsl:template match="events/entry">
	if('<xsl:value-of select="calendar/date/@type" />' == 'exact') {
		<xsl:apply-templates select="calendar/date" mode="exact" />
	}
	else if ('<xsl:value-of select="calendar/date/@type" />' == 'range') {
		<xsl:apply-templates select="calendar/date" mode="range" />
	}
</xsl:template>

<xsl:template match="calendar/date" mode="exact">
	eventsArray.push({
		date: "<xsl:value-of select="start" />",
		hour: "<xsl:value-of select="start/@time" />",
		title: "<xsl:value-of select="../../title[@lang = $language]" />",
		handle: "<xsl:value-of select='concat($root, "/", $language, "/post/", ../../title[@lang = $language]/@handle)' />"
	});
</xsl:template>

<xsl:template match="calendar/date" mode="range">
	eventsArray.push({
		start: "<xsl:value-of select="start" />",
		end: "<xsl:value-of select="end" />",
		hour: "<xsl:value-of select="start/@time" />",
		title: "<xsl:value-of select="../../title[@lang = $language]" />",
		handle: "<xsl:value-of select='concat($root, "/", $language, "/post/", ../../title[@lang = $language]/@handle)' />"
	});
</xsl:template>

<xsl:template match="data" mode="meta-tags">
	<link rel="stylesheet" href="{$workspace}/css/owl.carousel.css"/>
	<link rel="stylesheet" href="{$workspace}/css/owl.theme.css"/>
	<link rel="stylesheet" href="{$workspace}/css/perfect-scrollbar.min.css"/>
</xsl:template>

</xsl:stylesheet>