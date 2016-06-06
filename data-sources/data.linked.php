<?php

	require_once(EXTENSIONS . '/uniondatasource/data-sources/datasource.union.php');

	Class datasourcelinked extends UnionDatasource{

		public $dsParamROOTELEMENT = 'linked';
		public $dsParamPAGINATERESULTS = 'no';
		public $dsParamSTARTPAGE = '1';
		public $dsParamLIMIT = '20';
		public $dsParamREDIRECTONEMPTY = 'yes';
		public $dsParamREQUIREDPARAM = '';
		public $dsParamREDIRECTONREQUIRED = 'yes';
		public $dsParamNEGATEPARAM = '';
		public $dsParamREDIRECTONFORBIDDEN = 'yes';

		public $dsParamUNION = array(
			'linked-zatrudnieni',
			'linked-wspolpracownicy',
		);

		public $dsParamINCLUDEDELEMENTS = array(
			'system:pagination'
		);

		public function __construct($env=NULL, $process_params=true){
			parent::__construct($env, $process_params);
			$this->_dependencies = array('$ds-people-zatrudnieni.linked', '$ds-people-wspolpracownicy.linked');
		}

		public function about(){
			return array(
				'name' => 'Linked',
				'author' => array(
					'name' => 'Olaf Schindler',
					'website' => 'http://orkana39.pl/clients/alternativa',
					'email' => 'studio@orkana39.pl'),
				'version' => 'Union Datasource Symphony 2.6.1',
				'release-date' => '2015-05-22T20:04:17+00:00'
			);
		}

		public function allowEditorToParse(){
			return true;
		}

	}