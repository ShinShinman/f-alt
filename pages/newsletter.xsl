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

<xsl:include href="../utilities/master.xsl"/>

<xsl:template match="data">

	<section class="newsletter">

		<xsl:choose>
			<xsl:when test="//events/fetch-data/@result = 'success'">
				<xsl:call-template name="fetch-data"/>
			</xsl:when>
			<xsl:when test="$param = 'unsubscribe'">
				<xsl:call-template name="unsubscribe"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="subscribe"/>
			</xsl:otherwise>
		</xsl:choose>
		
	</section>

</xsl:template>

<xsl:template name="fetch-data">

	<nav class="breadcrumbs donthyphenate"><a href="{$root}">Home</a><a href="javascript:void()" class="current">Newsletter</a></nav>

	<header>
		<h1 class="slogan">Newsletter</h1>
		<h1>Newsletter</h1>
	</header>

	<article>
		<p class="subscription-msg">&nbsp;</p>
		<div class="form-container">
			<form class="fetch-data-form" method="post" action="{$root}/{$language}/subscription-check/" enctype="multipart/form-data">
				<input name="MAX_FILE_SIZE" type="hidden" value="10485760" />
				<input name="fields[name]" type="hidden" value="{//events/fetch-data/post-values/name}" />
				<input name="fields[mail]" type="hidden" value="{//events/fetch-data/post-values/mail}" />
				<input name="action[subscription-check]" type="hidden" value="Submit" />
			</form>

			<form class="fetch-data-subscribe" method="post" action="{$root}/{$language}/subscribe/" enctype="multipart/form-data">
				<input name="MAX_FILE_SIZE" type="hidden" value="20971520" />
				<input name="fields[active]" type="hidden" value="Yes" checked="checked" />
				<!--<input id="one" name="action[subscribe]" type="hidden" value="Submit" />-->
			</form>
		</div>
	</article>

</xsl:template>

<xsl:template name="subscribe">

	<nav class="breadcrumbs donthyphenate"><a href="{$root}">Home</a><a href="javascript:void()" class="current">Newsletter</a></nav>

	<header>
		<h1 class="slogan">Newsletter</h1>
		<h1>Newsletter</h1>
	</header>

	<article>
		<p class="subscription-msg">&nbsp;</p>
		<div class="form-container">
			<h2>Subscribe</h2>
			<form class="subscribe-form check" method="post" action="{$root}/{$language}/subscription-check/" enctype="multipart/form-data">
				<input name="MAX_FILE_SIZE" type="hidden" value="10485760" />
				<input name="fields[name]" type="text">	
					<xsl:attribute name="placeholder"><xsl:value-of select="//dictionary/imie-nazwisko[@lang = $language]" /></xsl:attribute>
				</input>
				<input id="email" name="fields[mail]" type="text" placeholder="Email" />
				<input name="action[subscription-check]" type="submit" class="button">
					<xsl:attribute name="value"><xsl:value-of select="//dictionary/subscribe[@lang = $language]" /></xsl:attribute>
				</input>
			</form>

			<form class="subscribe" method="post" action="{$root}/{$language}/subscribe/" enctype="multipart/form-data">
				<input name="MAX_FILE_SIZE" type="hidden" value="20971520" />
				<input name="fields[active]" type="hidden" value="Yes" checked="checked" />
				<!--<input id="one" name="action[subscribe-pl]" type="hidden" value="Submit" />-->
			</form>
		</div>
	</article>

</xsl:template>

<xsl:template name="unsubscribe">

	<nav class="breadcrumbs donthyphenate"><a href="{$root}">Home</a><a href="{$root}/{$language}/newsletter/">Newsletter</a><a href="javascript:void(0)" class="current">Unsubscribe</a></nav>

	<header>
		<h1 class="slogan">Newsletter</h1>
		<h1>Newsletter</h1>
	</header>

	<article>
		<p class="subscription-msg">&nbsp;</p>
		<div class="form-container">
			<h2>Unsubscribe</h2>
			<form class="unsubscribe-form check" method="post" action="{$root}/{$language}/subscription-check/" enctype="multipart/form-data">
				<input name="MAX_FILE_SIZE" type="hidden" value="20971520" />
				<input id="email" name="fields[mail]" type="text" placeholder="Email" />
				<input name="action[subscription-check]" type="submit" class="button">
					<xsl:attribute name="value"><xsl:value-of select="//dictionary/subscribe[@lang = $language]" /></xsl:attribute>
				</input>
			</form>

			<form class="unsubscribe" method="post" action="{$root}/{$language}/unsubscribe/" enctype="multipart/form-data">
				<input name="MAX_FILE_SIZE" type="hidden" value="20971520" />
				<input name="fields[active]" type="hidden" value="no" />
				<!--<input id="one" name="action[unsubscribe]" type="hidden" value="Submit" />-->
			</form>
		</div>
	</article>

</xsl:template>

<xsl:template match="data" mode="js">
	<script src="{$workspace}/js/vendor/jquery.form.min.js"></script>
	<script>
		$(function(){

			//FORM
			function validateEmail(email) {
				var regEx = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
				return regEx.test(email);
			}

			var formToValidate = $('.form-container form.check');
			formToValidate.find('input[type = submit]').click(function(e) {
				var email = formToValidate.find('#email').val();
				console.log(email);
				if(!validateEmail(email)) {
					e.preventDefault();
					formToValidate.find('#email').val('').attr('placeholder', 'Podany email jest nieprawidłowy').addClass('warning');
				}
			})
			
			function printMsg(message, mode) {
				var cont = $('.form-container');
				if(mode != 'check') {
					cont.remove();
				}
				$('.subscription-msg').text(message);
			}

			<xsl:choose>
				<xsl:when test="//events/fetch-data/@result = 'success'">
					<xsl:call-template name="fetch-dataJS"/>
				</xsl:when>
				<xsl:when test="$param = 'unsubscribe'">
					<xsl:call-template name="unsubscribeJS"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="subscribeJS"/>
				</xsl:otherwise>
			</xsl:choose>

		})
	</script>
	
</xsl:template>

<xsl:template name="fetch-dataJS">

	/*** FETCH-DATA ***/
			var silentCheck = $("form.fetch-data-form"),
					silentSubscribe = $('form.fetch-data-subscribe');

			var silentCheckOpt = {
				url: '<xsl:value-of select="concat($root, '/', $language)"/>/subscription-check/',
				success: function(data) {
					data = $.parseJSON(data);
					console.log(data);
					if(data.status == 'ready') {
						silentSubscribe.append('<input name="fields[name]" type="hidden" value="' + data.name + '" /><input name="fields[mail]" type="hidden" value="' + data.email + '" /><input name="action[subscribe-{$language}]" type="hidden" value="Submit" /> ');
						silentSubscribe.submit();
					} else if (data.status == 'subscribed') {
						printMsg('Podany adres email znajduje się już na liście odbiorców.', 'check');
					}
				},
				error: function() {
					console.log('Subscription check error.');
				}
			};
			var silentSubscribeOpt = {
				url: '<xsl:value-of select="concat($root, '/', $language)"/>/subscribe/',
				clearForm: true,
				success: function(data) {
					data = $.parseJSON(data);
					console.log(data);

					if(data.status =='subscribed') {
						printMsg('Dopisaliśmy Twój adres do listy odbiorców newslettera. Wróć na stronę główną.', '');
					}
				},
				error: function() {
					console.log('Subscription error.');
				}
			};

			silentCheck.ajaxForm(silentCheckOpt);
			silentCheck.submit();
			silentSubscribe.ajaxForm(silentSubscribeOpt);

</xsl:template>

<xsl:template name="subscribeJS">

	/*** SUBSCRIBE ***/
			var subscribeCheck = $('form.subscribe-form'),
					subscribe = $('form.subscribe');

			var subscribeCheckOpt = {
				url: '<xsl:value-of select="concat($root, '/', $language)"/>/subscription-check/',
				success: function(data) {
					data = $.parseJSON(data);
					console.log(data);
					if(data.status == 'ready') {
						subscribe.append('<input name="fields[name]" type="hidden" value="' + data.name + '" /><input name="fields[mail]" type="hidden" value="' + data.email + '" /><input name="action[subscribe-{$language}]" type="hidden" value="Submit" /> ');
						subscribe.submit();
					} else if (data.status == 'subscribed') {
						printMsg('Podany adres email znajduje się już na liście odbiorców.', 'check');
					}
				},
				error: function() {
					console.log('Subscription check error.');
				}
			}			
			var subscribeOpt = {
				url: '<xsl:value-of select="concat($root, '/', $language)"/>/subscribe/',
				clearForm: true,
				success: function(data) {
					data = $.parseJSON(data);
					console.log(data);

					if(data.status == 'subscribed') {
						printMsg('Dopisaliśmy Twój adres do listy odbiorców newslettera. Wróć na stronę główną.', '');
					}
				},
				error: function() {
					console.log('Subscription error.');
				}
			}

			subscribeCheck.ajaxForm(subscribeCheckOpt);
			subscribe.ajaxForm(subscribeOpt);

</xsl:template>

<xsl:template name="unsubscribeJS">

	/*** UNSUBSCRIBE ***/
	var unsubscribeCheck = $('form.unsubscribe-form'),
			unsubscribe = $('form.unsubscribe');

	var unsubsCheckOpt = {
		url: '<xsl:value-of select="concat($root, '/', $language)"/>/subscription-check/',
		success: function(data) {
			data = $.parseJSON(data);
			console.log(data);
			if(data.status == 'subscribed') {
				$('form.unsubscribe').append('<input name="id" type="hidden" value="' + data.id + '" /><input id="one" name="action[unsubscribe-{$language}]" type="hidden" value="Submit" />');
				$('form.unsubscribe').submit();
			} else if (data.status == 'ready') {
				printMsg('Podanego adresu email nie znaleziono na liście odbiorców.', 'check');
			}
		},
		error: function() {
			console.log('Subscription check error.');
		}
	};
	var unsubscribeOpt = {
		url: '<xsl:value-of select="concat($root, '/', $language)"/>/unsubscribe/',
		clearForm: true,
		success: function(data) {
			data = $.parseJSON(data);
			console.log(data);

			if(data.status == 'success') {
				printMsg('Usunęliśmy podany adres emial z listy odbiorców. Wróć na stronę główną.', '')
			}
		},
			error: function() {
			console.log('Unsubscription error.');
		}
	}

	unsubscribeCheck.ajaxForm(unsubsCheckOpt);
	unsubscribe.ajaxForm(unsubscribeOpt);

</xsl:template>

</xsl:stylesheet>