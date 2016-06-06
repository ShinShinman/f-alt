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
				'updated'		=> '2015-05-18T09:30:53+00:00'
			);
		}

		public function options() {
			return array(
				'can-update'		=> 'no',
				'fields'			=> array (
  0 => 
  array (
    'field' => '125',
    'xpath' => 'name/text()',
    'php' => '',
  ),
  1 => 
  array (
    'field' => '126',
    'xpath' => 'email/text()',
    'php' => '',
  ),
),
				'included-elements'	=> '//entry',
				'namespaces'		=> NULL,
				'source'			=> '{$root}/news-letter-nowy-pl.xml',
				'timeout'			=> '60',
				'section'			=> '20',
				'unique-field'		=> '126'
			);
		}

		public function allowEditorToParse() {
			return true;
		}
	}

