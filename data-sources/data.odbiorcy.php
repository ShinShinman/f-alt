<?php

	require_once(EXTENSIONS . '/uniondatasource/data-sources/datasource.union.php');

	Class datasourceodbiorcy extends UnionDatasource{

		public $dsParamROOTELEMENT = 'odbiorcy';
		public $dsParamPAGINATERESULTS = 'no';
		public $dsParamSTARTPAGE = '1';
		public $dsParamLIMIT = '20';
		public $dsParamREDIRECTONEMPTY = 'yes';
		public $dsParamREQUIREDPARAM = '';
		public $dsParamREDIRECTONREQUIRED = 'yes';
		public $dsParamNEGATEPARAM = '';
		public $dsParamREDIRECTONFORBIDDEN = 'yes';

		public $dsParamUNION = array(
			'odbiorcy-en',
			'odbiorcy-pl',
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
				'name' => 'Odbiorcy',
				'author' => array(
					'name' => 'Olaf Schindler',
					'website' => 'http://f-alt.org',
					'email' => 'studio@orkana39.pl'),
				'version' => 'Union Datasource Symphony 2.6.1',
				'release-date' => '2015-12-15T21:34:32+00:00'
			);
		}

		public function allowEditorToParse(){
			return true;
		}

	}