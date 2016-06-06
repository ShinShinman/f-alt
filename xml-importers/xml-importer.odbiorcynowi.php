<?php

	require_once(EXTENSIONS . '/xmlimporter/lib/class.xmlimporter.php');

	class XMLImporterOdbiorcyNowi extends XMLImporter {
		public function about() {
			return array(
				'name'			=> 'Odbiorcy nowi',
				'author'		=> array(
					'name'			=> 'Olaf Schindler',
					'email'			=> 'studio@orkana39.pl'
				),
				'description'	=> '',
				'file'			=> __FILE__,
				'created'		=> '2015-05-16T10:31:14+00:00',
				'updated'		=> '2015-12-15T21:26:11+00:00'
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
  2 => 
  array (
    'field' => '219',
    'xpath' => 'active/text()',
    'php' => '',
  ),
),
				'included-elements'	=> '//entry',
				'namespaces'		=> NULL,
				'source'			=> '{$root}/contacts-new.xml',
				'timeout'			=> '60',
				'section'			=> '20',
				'unique-field'		=> '126'
			);
		}

		public function allowEditorToParse() {
			return true;
		}
	}

