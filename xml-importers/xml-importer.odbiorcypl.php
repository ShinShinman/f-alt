<?php

	require_once(EXTENSIONS . '/xmlimporter/lib/class.xmlimporter.php');

	class XMLImporterOdbiorcyPl extends XMLImporter {
		public function about() {
			return array(
				'name'			=> 'Odbiorcy PL',
				'author'		=> array(
					'name'			=> 'Olaf Schindler',
					'email'			=> 'studio@orkana39.pl'
				),
				'description'	=> 'Imports newsletter recipients',
				'file'			=> __FILE__,
				'created'		=> '2015-05-16T10:31:14+00:00',
				'updated'		=> '2016-06-22T15:56:44+00:00'
			);
		}

		public function options() {
			return array(
				'can-update'		=> 'no',
				'fields'			=> array (
  0 => 
  array (
    'field' => '227',
    'xpath' => 'name/text()',
    'php' => '',
  ),
  1 => 
  array (
    'field' => '228',
    'xpath' => 'email/text()',
    'php' => '',
  ),
),
				'included-elements'	=> '//entry',
				'namespaces'		=> NULL,
				'source'			=> '{$root}/nowe-adresy-email.xml',
				'timeout'			=> '60',
				'section'			=> '34',
				'unique-field'		=> NULL
			);
		}

		public function allowEditorToParse() {
			return true;
		}
	}

