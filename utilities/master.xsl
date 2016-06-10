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

	<xsl:output method="xml"
		doctype-public="-W3CDTD XHTML 1.0 Strict//EN"
		doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
		omit-xml-declaration="yes"
		encoding="UTF-8"
		indent="yes" />

	<xsl:include href="get-brick.xsl"/>
	<xsl:include href="date-time.xsl"/>
	<xsl:include href="get-name-brick.xsl"/>
	<xsl:include href="get-video-brick.xsl"/>
	<xsl:include href="get-about-brick.xsl"/>
	<xsl:include href="get-about-menu.xsl"/>
	<xsl:include href="get-about-header.xsl"/>

	<xsl:template match="/">

		<html class="no-js" lang="pl">

			<head>
				<meta charset="utf-8"/>
				<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
				<meta name="description" content="Fundacja Alternativa"/>
				<meta name="viewport" content="width=device-width, initial-scale=1"/>
				<meta name="author" content="Orkana39.pl"/>
				<link rel="apple-touch-icon" href="apple-touch-icon.png"/>

				<xsl:apply-templates mode="meta-tags"/>

				<link rel="stylesheet" href="{$workspace}/css/normalize.min.css"/>
				<link rel="stylesheet" href="{$workspace}/css/main.css"/>
				<link rel="stylesheet" href="{$workspace}/css/rwd.css"/>

<!--
				<link rel="stylesheet" href="{$workspace}/css/slick.css"/>
				<link rel="stylesheet" href="{$workspace}/css/slick-theme.css"/>
-->

				<script src="{$workspace}/js/vendor/modernizr-2.8.3.min.js"></script>
			</head>

			<body class="{$current-page} hyphenate">
				<!--[if lt IE 8]>
					<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
				<![endif]-->

				<div class="preloader"></div>
				<section class="top-nav donthyphenate">
					<nav class="logo">
						<a href="{$root}/{$language}">
							<h1 class="slogan">fa</h1>
							<h1><xsl:value-of select="//dictionary/fun-alt[@lang = $language]"/></h1>
						</a>
					</nav>
					
					<nav class="language">
						<ul class="inline-list">
							<xsl:apply-templates select="data/params/languages/item"/>
						</ul>
					</nav>
					
					<nav class="search-menu">
						<form id="search-form" action="{$root}/{$language}/search" method="get">
							<input type="text" name="keywords" placeholder="Wyszukaj" autocomplete="off"/>
							<input type="submit" value="s" />
							<input type="hidden" name="sections" value="post,team,coworkers,about" />
						</form>
					</nav>
					<nav class="main-menu">
						<ul class="inline-list dropdown">
							<xsl:if test="data/main-menu/entry[projects = 'Yes']">
			          <li>
			            <a href="http://alternativa-gdansk.pl/" class="alt2015 hide-text" target="_blank">Alternativa 2015</a>
			          </li>
								<li>
									<a href="javascript:void(0)"><xsl:value-of select="//dictionary/projekty[@lang = $language]" /></a>
									<ul>
										<xsl:apply-templates select="data/main-menu/entry[projects = 'Yes']"/>
									</ul>
								</li>
							</xsl:if>
							<xsl:apply-templates select="data/main-menu/entry[projects = 'No']"/>
						</ul>
					</nav>
				</section>

				<section class="top-nav mobile">
					<nav class="logo">
						<a href="{$root}">
							<h1 class="slogan">fa</h1>
							<h1>fundacja<br/>alternativa</h1>
						</a>
					</nav>

					<nav class="language">
						<ul class="inline-list">
							<xsl:apply-templates select="data/params/languages/item"/>
						</ul>
					</nav>

					<nav class="main-menu">
						<ul>
							<li class="hamburger trigger"><a href="javascript:void(0)" class="hide-text">Menu</a></li>
						</ul>

						<ul class="submenu">
							<li class="search">
								<form id="search-form" action="{$root}/{$language}/search" method="get">
									<input type="text" name="keywords" placeholder="Wyszukaj" autocomplete="off"/>
									<input type="submit" value="s" />
									<input type="hidden" name="sections" value="post,team,coworkers,about" />
								</form>
							</li>
							<xsl:if test="data/main-menu/entry[projects = 'Yes']">
								<li class="label">
									<span><xsl:value-of select="//dictionary/projekty[@lang = $language]" /></span>
									<ul>
										<xsl:apply-templates select="data/main-menu/entry[projects = 'Yes']"/>
									</ul>
								</li>
							</xsl:if>
							<xsl:apply-templates select="data/main-menu/entry[projects = 'No']"/>
						</ul>

					</nav>

				</section>

				<section id="cookie-info" class="msg">
					<div class="close"><a href="javascript:void(0)">x</a></div>
					<xsl:choose>
						<xsl:when test="$language = 'pl'">
							<p>Nasza witryna korzysta z plików cookies. Więcej informacji – <a href="http://f-alt.org/pl/privacy-policy/">polityka prywatności</a>.</p>
						</xsl:when>
						<xsl:when test="$language = 'en'">
							<p><a href="http://f-alt.org/pl/privacy-policy/">We use cookies. Privacy policy</a></p>
						</xsl:when>
					</xsl:choose>
					<!--<p><xsl:value-of select="//dictionary/cookies[@lang = $language]"/></p>-->
				</section>

				<section id="newsletter-info" class="msg">
					<div class="form-container donthyphenate">
						<div class="close"><a href="javascript:void(0)">x</a></div>
						<h2 class="slogan">Newsletter</h2>
						<h2>Newsletter</h2>
						<p>Subskrybuj nasz newletter. Raz w miesiącu informujemy o najnowszych działaniach f-alt.</p>
						<form method="post" action="{$root}/{$language}/newsletter/" enctype="multipart/form-data">
							<input name="MAX_FILE_SIZE" type="hidden" value="10485760" />
							<input name="fields[name]" type="text">	
							<xsl:attribute name="placeholder"><xsl:value-of select="//dictionary/imie-nazwisko[@lang = $language]" /></xsl:attribute>
							</input>
							<input id="email" name="fields[mail]" type="text" placeholder="Email" />
							<input name="action[fetch-data]" type="submit" class="button">
								<xsl:attribute name="value"><xsl:value-of select="//dictionary/subscribe[@lang = $language]" /></xsl:attribute>
							</input>
						</form>
					</div>
				</section>

				<xsl:apply-templates />
				
				<section class="footer">
					<header>
						<nav class="logo donthyphenate">
							<a href="{$root}">
								<h1 class="slogan">fa</h1>
								<h1><xsl:value-of select="//dictionary/fun-alt[@lang = $language]"/></h1>
							</a>
						</nav>
					</header>
					<article>
						<p class="footnote">
						<strong>email:</strong><a href="mailto:biuro@f-alt.org"> biuro@f-alt.org</a><br/>
						<strong><xsl:value-of select="//dictionary/tel[@lang = $language]" /></strong> 58 354 33 41</p>
						<!--
						<p class="footnote">
						<strong><xsl:value-of select="//dictionary/adres-do-korespondencji[@lang = $language]" /></strong><br/>
						ul. Okopowa 17a/4<br/>
						80-819 Gdańsk</p>
						-->
						<ul class="inline-list footnote">
							<li><a class="social" href="https://www.facebook.com/alternativafundacja?ref=hl" target="_blank">f</a></li>
							<li><a class="social" href="http://instagram.com/fundacja_alternativa" target="_blank">i</a></li>
							<li><a class="social" href="https://twitter.com/Fundacja_Alt" target="_blank">t</a></li>
						</ul>

						<p class="footnote"><a href="{$root}/{$language}/privacy-policy/"><xsl:value-of select="//dictionary/polityka-prywatnosci[@lang = $language]" /></a></p>
						
					</article>
					<article>

						<p class="footnote"><strong>Newsletter</strong></p>

						<form method="post" action="{$root}/{$language}/newsletter/" enctype="multipart/form-data">
							<input name="MAX_FILE_SIZE" type="hidden" value="10485760" />
							
							<input name="fields[name]" type="text">	
							<xsl:attribute name="placeholder"><xsl:value-of select="//dictionary/imie-nazwisko[@lang = $language]" /></xsl:attribute>
							</input>

							<input id="email" name="fields[mail]" type="text" placeholder="Email" />

							<input name="action[fetch-data]" type="submit" class="button">
								<xsl:attribute name="value"><xsl:value-of select="//dictionary/subscribe[@lang = $language]" /></xsl:attribute>
							</input>
						</form>

					</article>
					<article>
						<p class="footnote"><strong><xsl:value-of select="//dictionary/zarzad[@lang = $language]" /></strong><br/>
						Aneta Szyłak, Prezes<br/>
						Maksymilian Bochenek, Wiceprezes<br/></p>
						<p class="footnote"><strong><xsl:value-of select="//dictionary/krs[@lang = $language]" /></strong> 0000527184 <strong>NIP</strong> 5833171484<br/>
						<strong><xsl:value-of select="//dictionary/regon[@lang = $language]" /></strong> 222180214</p>
					</article>
					<article>
						<p class="footnote">
						<strong><xsl:value-of select="//dictionary/nr-rach[@lang = $language]" /></strong><br/>
						58 1750 0012 0000 0000 3329 7898<br/>Raiffaisen Polbank <br/>
						<!--<strong>iban:</strong> PL 80 1020 1811 0000 0802 0259 9892
						<strong>SWIFT:</strong> BPKOPLPW <br/>-->
						</p>
					</article>
				</section>
				<script src="{$workspace}/js/vendor/jquery-1.11.2.min.js"></script>
				<!--<script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.min.js"><\/script>')</script>-->
				<script src="{$workspace}/js/plugins.js"></script>
				<script src="{$workspace}/js/main.js"></script>
				<script src="{$workspace}/js/vendor/hyphenator.js"></script>
				<script src="{$workspace}/js/vendor/jquery.form.min.js"></script>
				<script src="{$workspace}/js/vendor/js.cookie.js"></script>
				<xsl:apply-templates mode="js"/>
				<script>

					$(function() {

						//COOKIES

						var cookiesInfo = $("section#cookie-info"),
								closeCookies = cookiesInfo.find(".close a"),
								allowCookies = Cookies.get('f-alt_allowCookies');

						if(allowCookies == undefined) {
							cookiesInfo.show();
							closeCookies.click(function(e) {
								e.preventDefault();
								Cookies.set('f-alt_allowCookies', 'true', {expires: 365, path: '/'});
								$(this).closest('.msg').slideUp('fast');
							});
						};

						var newslttrInfo = $('section#newsletter-info'),
								closeNewslttr = newslttrInfo.find('.close a'),
								newslttrOffered = Cookies.get('f-alt_newsletterOffered');

						if(newslttrOffered == undefined) {
							newslttrInfo.show();
							closeNewslttr.click(function(e) {
								e.preventDefault();
								Cookies.set('f-alt_newsletterOffered', 'true', {expires: 365, path: '/'});
								$(this).closest('.msg').fadeOut('fast');
							})
						}

						//FORM
						function validateEmail(email) {
							var regEx = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
							return regEx.test(email);
						}

						$(".footer form input[type = 'submit']").click(function(e) {
							var email = $(".footer form #email").val();
							if(!validateEmail(email)) {
								e.preventDefault();
								$(".footer form #email").val('').attr('placeholder', 'Podany email jest nieprawidłowy').addClass('warning');
							}
						})

						//HAMBURGER
						var trigger = $(".main-menu .trigger"),
								submenu = $(".main-menu .submenu"),
								triggerAnchor = trigger.find('a');

						trigger.click(function(e) {
							e.preventDefault();
							submenu.slideToggle(function() {
								if(submenu.css("display") == "none") {
									triggerAnchor.css("background-position", "center top");
								} else {
									triggerAnchor.css("background-position", "center -35px");
								}
							});

						})

					});

					$(window).load(function(){
						$(".preloader").fadeOut();
					})
			</script>

			</body>

		</html>

	</xsl:template>

	<xsl:template match="data/params/languages/item">
		<li>
			<xsl:choose>
				<xsl:when test="./@handle = $language">
					<a class="active">
						<xsl:attribute name="href"><xsl:value-of select="concat($root, '/', node(), substring($current-path, 4), '?', //current-query-string/text())"/></xsl:attribute>
						<xsl:value-of select="."/>
					</a>
				</xsl:when>
				<xsl:otherwise>
					<a>
						<xsl:attribute name="href"><xsl:value-of select="concat($root, '/', node(), substring($current-path, 4), '?', //current-query-string/text())"/></xsl:attribute>
						<xsl:value-of select="."/>
					</a>
				</xsl:otherwise>
			</xsl:choose>
		</li>
	</xsl:template>

	<xsl:template match="main-menu/entry">
		<li><a href="{url[@lang = $language]}"><xsl:value-of select="name[@lang = $language]"/></a></li>
	</xsl:template>

	<xsl:template match="navigation">
		<xsl:apply-templates select="page[not(types/type = 'hidden')]" />
	</xsl:template>

	<xsl:template match="data" mode="meta-tags">
		<title><xsl:value-of select="$website-name"/></title>
	</xsl:template>

	<xsl:template match="data" mode="js"/>

</xsl:stylesheet>