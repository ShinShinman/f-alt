<?php

class datasourcelinked_zatrudnieni extends SectionDatasource
{
    public $dsParamROOTELEMENT = 'linked-zatrudnieni';
    public $dsParamORDER = 'asc';
    public $dsParamPAGINATERESULTS = 'no';
    public $dsParamLIMIT = '20';
    public $dsParamSTARTPAGE = '1';
    public $dsParamREDIRECTONEMPTY = 'no';
    public $dsParamREDIRECTONFORBIDDEN = 'no';
    public $dsParamREDIRECTONREQUIRED = 'no';
    public $dsParamSORT = 'sort-by-pl';
    public $dsParamHTMLENCODE = 'no';
    public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

    public $dsParamFILTERS = array(
        'system:id' => '{$ds-people-zatrudnieni.linked}, {$ds-people-wspolpracownicy.linked}, {$ds-post.linked}, {$ds-newsletter-f-alt.linked}',
    );

    public $dsParamINCLUDEDELEMENTS = array(
        'name-pl',
        'name-en',
        'image',
        'lead-pl: formatted',
        'lead-en: formatted',
        'job-pl',
        'job-en',
        'category'
    );

    public function __construct($env = null, $process_params = true)
    {
        parent::__construct($env, $process_params);
        $this->_dependencies = array('$ds-people-zatrudnieni.linked', '$ds-people-wspolpracownicy.linked', '$ds-post.linked', '$ds-newsletter-f-alt.linked');
    }

    public function about()
    {
        return array(
            'name' => 'Linked - zatrudnieni',
            'author' => array(
                'name' => 'Olaf Schindler',
                'website' => 'http://f-alt.org',
                'email' => 'studio@orkana39.pl'),
            'version' => 'Symphony 2.6.1',
            'release-date' => '2015-12-15T19:53:43+00:00'
        );
    }

    public function getSource()
    {
        return '3';
    }

    public function allowEditorToParse()
    {
        return true;
    }

    public function execute(array &$param_pool = null)
    {
        $result = new XMLElement($this->dsParamROOTELEMENT);

        try{
            $result = parent::execute($param_pool);
        } catch (FrontendPageNotFoundException $e) {
            // Work around. This ensures the 404 page is displayed and
            // is not picked up by the default catch() statement below
            FrontendPageNotFoundExceptionHandler::render($e);
        } catch (Exception $e) {
            $result->appendChild(new XMLElement('error', $e->getMessage() . ' on ' . $e->getLine() . ' of file ' . $e->getFile()));
            return $result;
        }

        if ($this->_force_empty_result) {
            $result = $this->emptyXMLSet();
        }

        if ($this->_negate_result) {
            $result = $this->negateXMLSet();
        }

        return $result;
    }
}