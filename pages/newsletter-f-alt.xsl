<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />

<xsl:template match="/">
	<table style="font-family: Helvetica, Arial, sans-serif; font-size: 14px; width: 700px; color: #363636; margin-left: auto; margin-right: auto; margin-top: 20px; margin-bottom: 40px;">
		<tbody>
			<td><a href="{$root}" target="_blank" style="color: inherit; text-decoration: none;"><img src="{$workspace}/images/logo-fa_sml.png" alt="Fundacja Alternativa" /></a></td>
			<td style="padding-left: 20px"><a href="https://www.facebook.com/alternativafundacja" target="_blank"><img src="{$workspace}/images/nl_fb.png" alt="https://www.facebook.com/alternativafundacja" style="margin-left: 5px; float: right;" /></a><a href="https://instagram.com/fundacja_alternativa/" target="_blank"><img src="{$workspace}/images/nl_insta.png" alt="https://instagram.com/fundacja_alternativa/" style="margin-left: 5px; float: right;" /></a><a href="https://twitter.com/Fundacja_Alt" target="_blank"><img src="{$workspace}/images/nl_tweeter.png" alt="https://twitter.com/Fundacja_Alt" style="margin-left: 5px; float: right;" /></a></td>
		</tbody>
	</table>

	<table style="font-family: Helvetica, Arial, sans-serif; font-size: 14px; width: 700px; color: #363636; margin-left: auto; margin-right: auto;">
		<tbody>
			<tr>
				<td><img src="{$workspace}/images/f-alt_zaprasza_slogan.png" alt="Fundacja Alternativa" style="margin-bottom: 4px;" /></td>
			</tr>
			<tr>
				<td><h1 style="margin-top: 0; margin-bottom: 20px; font-size: 32px;">Fundacja Alternativa zaprasza</h1></td>
			</tr>
			<tr>
				<td><h2 style="font-size: 18px; font-weight: bold; line-hight: 1.2em; margin-top: 0; margin-bottom: 20px;"><xsl:value-of select="data/f-aktualnosci/entry/title" /></h2></td>
			</tr>
		</tbody>
	</table>

	<table style="font-family: Helvetica, Arial, sans-serif; font-size: 16px; line-height: 22px; width: 720px; color: #363636; margin-left: auto; margin-right: auto; margin-bottom: 20px;">
		<tbody>
			<xsl:apply-templates select="//entry/linked/item[position() mod 2 = 1]"/>
		</tbody>
	</table>

	<xsl:call-template name="footer" />

</xsl:template>

<xsl:template match="linked/item">
	<tr>
		<xsl:apply-templates mode="proc" select=".|following-sibling::item[not(position() > 1)]" />
	</tr>
</xsl:template>

<xsl:template match="linked/item[not(position() mod 2 = 1)]" />

<xsl:template match="linked/item" mode="proc">
	<xsl:variable name="id" select="@id"/>

	<td style="vertical-align: top; padding-left: 10px; padding-right: 10px; width: 50%;">
		<xsl:choose>
			<xsl:when test="@section-handle = 'post'">
				<xsl:apply-templates select="//data/linked-posty/entry[@id = $id]" />
			</xsl:when>
			<xsl:when test="@section-handle = 'team'">
				<xsl:apply-templates select="//data/linked-zatrudnieni/entry[@id = $id]" />
			</xsl:when>
			<xsl:when test="@section-handle = 'coworkers'">
				<xsl:apply-templates select="//data/linked-wspolpracownicy/entry[@id = $id]" />
			</xsl:when>
		</xsl:choose>
	</td>

</xsl:template>

<xsl:template match="linked-posty/entry">

	<xsl:if test="cover">
		<img src="{$workspace}{cover/@path}/{cover/filename}" alt="{title[@lang = 'pl']}" style="width: 100%; margin-bottom: 20px" />
	</xsl:if>

	<xsl:if test="series">
		<h2 style="display: inline-block; padding: 3px 9px 6px; font-size: 14px; line-height: normal; margin-top: 0; margin-bottom: 20px; border: 2px solid;"><xsl:value-of select="series[@lang = 'pl']"/></h2>
	</xsl:if>

	<h1 style="margin-top: 0; margin-bottom: 10px; font-size: 28px; line-height: 1.2;"><a href="{$root}/pl/post/{title[@lang = 'pl']/@handle}" target="_blank" style="color: inherit; text-decoration: none;"><xsl:value-of select="title[@lang = 'pl']"/></a></h1>

	<xsl:if test="subtitle">
		<h2 style="font-size: 18px; font-weight: bold; margin-top: 0; margin-bottom: 20px;"><xsl:value-of select="subtitle[@lang = 'pl']"/></h2>
	</xsl:if>

	<xsl:if test="date-place">
		<p style="margin-top: 0; margin-bottom: 20px; font-size: 16px; font-weight: bold;"><xsl:value-of select="date-place[@lang = 'pl']"/></p>
	</xsl:if>

	<xsl:copy-of select="lead[@lang = 'pl']/node()"/>

	<p style="margin-top: 20px; margin-bottom: 40px;"><strong><a style="width: 160px; display: inline-block; margin-right: 20px; text-decoration: none; color: #343434;" href="{$root}/pl/post/{title[@lang = 'pl']/@handle}">Czytaj dalej</a><!--<a style=" text-decoration: none; color: #343434;" href="{$root}/en/post/{title[@lang = 'en']/@handle}">Read more</a>--></strong></p>

</xsl:template>


<xsl:template match="linked-zatrudnieni/entry">

	<xsl:if test="image">
		<img src="{$workspace}{image/@path}/{image/filename}" alt="{name[@lang = 'pl']}" style="width: 100%; margin-bottom: 20px" />
	</xsl:if>


	<h1 style="margin-top: 0; margin-bottom: 10px; font-size: 28px; line-height: 1.2;"><a href="{$root}/pl/people/{name[@lang = 'pl']/@handle}" target="_blank" style="color: inherit; text-decoration: none;"><xsl:value-of select="name[@lang = 'pl']"/></a></h1>

	<xsl:if test="job">
		<h2 style="font-size: 18px; font-weight: bold; margin-top: 0; margin-bottom: 20px;"><xsl:value-of select="job[@lang = 'pl']"/></h2>
	</xsl:if>

	<p style="margin-top: 0; margin-bottom: 20px;"><xsl:value-of select="category/item"/></p>

	<xsl:copy-of select="lead[@lang = 'pl']/node()"/>

	<p style="margin-top: 20px; margin-bottom: 40px;"><strong><a style="width: 160px; display: inline-block; margin-right: 20px; text-decoration: none; color: #343434;" href="{$root}/pl/people/{name[@lang = 'pl']/@handle}">Czytaj dalej</a><a style=" text-decoration: none; color: #343434;" href="{$root}/en/people/{name[@lang = 'pl']/@handle}">Read more</a></strong></p>

</xsl:template>

<xsl:template match="linked-wspolpracownicy/entry">

	<xsl:if test="image">
		<img src="{$workspace}{image/@path}/{image/filename}" alt="{name[@lang = 'pl']}" style="width: 100%; margin-bottom: 20px" />
	</xsl:if>

	<h1 style="margin-top: 0; margin-bottom: 10px; font-size: 28px; line-height: 1.2;"><a href="{$root}/pl/people/{name[@lang = 'pl']/@handle}" target="_blank" style="color: inherit; text-decoration: none;"><xsl:value-of select="name[@lang = 'pl']"/></a></h1>

	<xsl:if test="job">
		<h2 style="font-size: 18px; font-weight: bold; margin-top: 0; margin-bottom: 20px;"><xsl:value-of select="job[@lang = 'pl']"/></h2>
	</xsl:if>

	<p style="margin-top: 0; margin-bottom: 20px;"><xsl:value-of select="category/item"/></p>

	<xsl:copy-of select="lead[@lang = 'pl']/node()"/>

	<p style="margin-top: 20px; margin-bottom: 40px;"><strong><a style="width: 160px; display: inline-block; margin-right: 20px; text-decoration: none; color: #343434;" href="{$root}/pl/people/{name[@lang = 'pl']/@handle}">Czytaj dalej</a><a style=" text-decoration: none; color: #343434;" href="{$root}/en/people/{name[@lang = 'en']/@handle}">Read more</a></strong></p>

</xsl:template>

<xsl:template name="footer">

	<table style="font-family: Helvetica, Arial, sans-serif; font-size: 14px; width: 720px; color: #363636; margin-left: auto; margin-right: auto; margin-bottom: 20px;">
		<tbody>
			<tr style="vertical-align: top;">
				<td style="width: 220px; padding-left: 10px; padding-right: 10px;">
					<a href="{$root}" target="_blank" style="color: inherit; text-decoration: none;"><img src="{$workspace}/images/logo-fa_sml.png" alt="Fundacja Alternativa" style="margin-bottom: 10px;" /></a>
					<p><strong><a href="{$root}" style="color: #363636; text-decoration: none;">www.f-alt.org</a></strong><br />
					<a href="mailto:fundacja.alternativa@gmail.com" style="color: #363636; text-decoration: none;">fundacja.alternativa@gmail.com</a><br />
					+48 58 354 33 41</p>
				</td>
				<td style="width: 240px; padding-left: 10px; padding-right: 10px; padding-top: 55px;">
					<p><strong>zarząd</strong><br />
					Aneta Szyłak, Prezes<br />
					Maksymilian Bochenek, Wiceprezes</p>
				</td>
				<td style="width: 200px; padding-left: 10px; padding-right: 10px; padding-top: 56px;">
					<a href="https://www.facebook.com/alternativafundacja" target="_blank"><img src="{$workspace}/images/nl_fb.png" alt="https://www.facebook.com/alternativafundacja" style="margin-left: 5px; float: right;" /></a><a href="https://instagram.com/fundacja_alternativa/" target="_blank"><img src="{$workspace}/images/nl_insta.png" alt="https://instagram.com/fundacja_alternativa/" style="margin-left: 5px; float: right;" /></a><a href="https://twitter.com/Fundacja_Alt" target="_blank"><img src="{$workspace}/images/nl_tweeter.png" alt="https://twitter.com/Fundacja_Alt" style="margin-left: 5px; float: right;" /></a>
				</td>
			</tr>
		</tbody>
	</table>

	<table style="font-family: Helvetica, Arial, sans-serif; font-size: 14px; width: 700px; color: #363636; margin-left: auto; margin-right: auto; margin-bottom: 40px;">
		<tbody>
			<tr>
				<td><p>Ten email został do Ciebie wysłany ponieważ jesteś zapisany na listę odbiorców newslettera Fundacji Alternativa. Jeżeli
					chcesz zrezygnować z jego subskrypcji kliknij ten <a style="color: #363636;" href="{$root}/pl/newsletter/unsubscribe/">link</a>.</p>
				</td>
			</tr>
		</tbody>
	</table>

</xsl:template>

</xsl:stylesheet>
