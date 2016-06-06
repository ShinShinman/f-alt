<?php

	require_once(EXTENSIONS . '/uniondatasource/data-sources/datasource.union.php');

	Class datasourcepeople_all extends UnionDatasource{

		public $dsParamROOTELEMENT = 'people-all';
		public $dsParamPAGINATERESULTS = 'no';
		public $dsParamSTARTPAGE = '1';
		public $dsParamLIMIT = '20';
		public $dsParamREDIRECTONEMPTY = 'yes';
		public $dsParamREQUIREDPARAM = '$name';
		public $dsParamREDIRECTONREQUIRED = 'yes';
		public $dsParamNEGATEPARAM = '';
		public $dsParamREDIRECTONFORBIDDEN = 'yes';

		public $dsParamUNION = array(
			'people-wspolpracownicy',
			'people-zatrudnieni',
		);

		public $dsParamINCLUDEDELEMENTS = array(
			'system:pagination'
		);

		public function __construct($env=NULL, $process_params=true){
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'People - all',
				'author' => array(
					'name' => 'Olaf Schindler',
					'website' => 'http://orkana39.pl/clients/alternativa',
					'email' => 'studio@orkana39.pl'),
				'version' => 'Union Datasource Symphony 2.6.1',
				'release-date' => '2015-05-22T14:20:45+00:00'
			);
		}

		public function allowEditorToParse(){
			return true;
		}

	}