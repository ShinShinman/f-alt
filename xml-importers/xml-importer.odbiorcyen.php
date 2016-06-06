<?php

	require_once(EXTENSIONS . '/xmlimporter/lib/class.xmlimporter.php');

	class XMLImporterOdbiorcyEn extends XMLImporter {
		public function about() {
			return array(
				'name'			=> 'Odbiorcy EN',
				'author'		=> array(
					'name'			=> 'Olaf Schindler',
					'email'			=> 'studio@orkana39.pl'
				),
				'description'	=> '',
				'file'			=> __FILE__,
				'created'		=> '2015-08-19T10:45:38+00:00',
				'updated'		=> '2015-08-19T10:45:38+00:00'
			);
		}

		public function options() {
			return array(
				'can-update'		=> 'no',
				'fields'			=> array (
  0 => 
  array (
    'field' => '209',
    'xpath' => 'email/text()',
    'php' => '',
  ),
),
				'included-elements'	=> '//entry',
				'namespaces'		=> NULL,
				'source'			=> '{$root}/contacts-en.xml',
				'timeout'			=> '60',
				'section'			=> '28',
				'unique-field'		=> '209'
			);
		}

		public function allowEditorToParse() {
			return true;
		}
	}

