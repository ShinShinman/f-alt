<?php

class Newsletter_f_altEmailTemplate extends EmailTemplate
{
    public $datasources = Array(
 			'linked_posty',
 			'linked_wspolpracownicy',
 			'linked_zatrudnieni',
 			'newsletter_f_alt',);
    public $layouts = Array(
 			'html' => 'template.html.xsl',);
    public $subject = '{/data/f-aktualnosci/entry/title}';
    public $reply_to_name = '';
    public $reply_to_email_address = '';
    public $recipients = '';

    public $editable = true;

    public $about = Array(
        'name' => 'Newsletter F-Alt',
        'version' => '1.0',
        'author' => array(
            'name' => 'Olaf Schindler',
            'website' => 'http://f-alt.org',
            'email' => 'studio@orkana39.pl'
        ),
        'release-date' => '2015-12-15T19:50:16+00:00'
    );
}
