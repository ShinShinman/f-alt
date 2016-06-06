<?php

if(!defined('__IN_SYMPHONY__')) die('<h2>Symphony Error</h2><p>You cannot directly access this file</p>');

require_once(EXTENSIONS . '/email_newsletter_manager/lib/class.recipientsourcesection.php');

class recipientgroupOdbiorcy_tylko_do_testow extends RecipientSourceSection{

	public $dsParamROOTELEMENT = 'odbiorcy-tylko-do-testow';
	public $dsParamFILTERS = array (
  215 => 'yes',
  229 => 'yes',
);
	public $emailField = 'email';
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
			'name' => 'Odbiorcy-tylko do testów'
		);
	}

	public function getSource(){
		return '34';
	}
}