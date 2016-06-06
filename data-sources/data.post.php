<?php

class datasourcepost extends SectionDatasource
{
    public $dsParamROOTELEMENT = 'post';
    public $dsParamORDER = 'asc';
    public $dsParamPAGINATERESULTS = 'no';
    public $dsParamLIMIT = '20';
    public $dsParamSTARTPAGE = '1';
    public $dsParamREDIRECTONEMPTY = 'no';
    public $dsParamREDIRECTONFORBIDDEN = 'no';
    public $dsParamREDIRECTONREQUIRED = 'no';
    public $dsParamREQUIREDPARAM = '$title';
    public $dsParamPARAMOUTPUT = array(
        'linked'
        );
    public $dsParamSORT = 'order';
    public $dsParamHTMLENCODE = 'no';
    public $dsParamASSOCIATEDENTRYCOUNTS = 'yes';

    public $dsParamFILTERS = array(
        '7' => '{$title}',
    );

    public $dsParamINCLUDEDELEMENTS = array(
        'title-pl',
        'title-en',
        'subtitle-pl',
        'subtitle-en',
        'series-pl',
        'series-en',
        'content-pl: formatted',
        'content-en: formatted',
        'show-map',
        'map',
        'publish',
        'date-place-en',
        'date-place-pl',
        'category',
        'cover',
        'text-images',
        'gallery',
        'embed',
        'audio',
        'calendar',
        'partners',
        'linked'
    );
    
    public $dsParamINCLUDEDASSOCIATIONS = array(
        'gallery' => array(
            'section_id' => '14',
            'field_id' => '87',
            'elements' => array(
                'image',
                'discr-pl',
                'discr-en'
            )
        ),
        'partners' => array(
            'section_id' => '15',
            'field_id' => '93',
            'elements' => array(
                'name-pl',
                'name-en',
                'logo'
            )
        ),
        'category' => array(
            'section_id' => '25',
            'field_id' => '191',
            'elements' => array(
                'category-pl',
                'category-en'
            )
        ),
        'audio' => array(
            'section_id' => '26',
            'field_id' => '201',
            'elements' => array(
                'audio'
            )
        )
    );

    public function __construct($env = null, $process_params = true)
    {
        parent::__construct($env, $process_params);
        $this->_dependencies = array();
    }

    public function about()
    {
        return array(
            'name' => 'Post',
            'author' => array(
                'name' => 'Olaf Schindler',
                'website' => 'http://orkana39.pl/clients/alternativa',
                'email' => 'studio@orkana39.pl'),
            'version' => 'Symphony 2.6.1',
            'release-date' => '2015-07-14T14:58:13+00:00'
        );
    }

    public function getSource()
    {
        return '2';
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