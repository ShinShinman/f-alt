<?php

if(!defined('__IN_SYMPHONY__')) die('<h2>Symphony Error</h2><p>You cannot directly access this file</p>');

require_once(EXTENSIONS . '/email_newsletter_manager/lib/class.recipientsourcesection.php');

class recipientgroupOdbiorcy_pl extends RecipientSourceSection{

	public $dsParamROOTELEMENT = 'odbiorcy-pl';
	public $dsParamFILTERS = array (
  219 => 'yes',
);
	public $emailField = 'mail';
	public $nameFields = array (
  0 => 'name',
);
	public $nameXslt = '<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="text" />

<xsl:template match="/entry">
	<xsl:value-of select="name"/>
</xsl:template>

</xsl:stylesheet>';

	public $_dependencies = array (
);

	function about(){
		return array(
			'name' => 'Odbiorcy PL'
		);
	}

	public function getSource(){
		return '20';
	}
}