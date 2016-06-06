<?php

if(!defined('__IN_SYMPHONY__')) die('<h2>Symphony Error</h2><p>You cannot directly access this file</p>');

require_once(EXTENSIONS . '/email_newsletter_manager/lib/class.newslettersender.php');

class senderNadawca_fundacja_alternativa extends NewsletterSender{

	// You can set custom headers here.
	// Saving the sender in the GUI will not overwrite this value.
	public $additional_headers = NULL;

	function about(){
		return array(
			'name' => 'Nadawca - Fundacja Alternativa',

			'sendmail' => array (
  'from_name' => 'Fundacja Alternativa',
  'from_address' => 'newsletter@f-alt.org',
),

			'reply-to-name' => '',
			'reply-to-email' => '',
			'throttle-emails' => 10,
			'throttle-time' => 10
		);
	}
}