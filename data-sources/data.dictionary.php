<?php

class datasourcedictionary extends StaticXMLDatasource
{
    public $dsParamROOTELEMENT = 'dictionary';
    public $dsParamSTATIC = '<adres-do-korespondencji lang=\"pl\">adres do korespondencji</adres-do-korespondencji>
<adres-do-korespondencji lang=\"en\">contact</adres-do-korespondencji>
<aktualnosci lang=\"pl\">Aktualności</aktualnosci>
<aktualnosci lang=\"en\">News</aktualnosci>
<audio-video lang=\"pl\">audio i wideo</audio-video>
<audio-video lang=\"en\">audio and video</audio-video>
<cookies lang=\"en\">TRANSLATE</cookies><dzialamy lang=\"pl\">Działamy</dzialamy>
<dzialamy lang=\"en\">Recent activities</dzialamy><fun-alt lang=\"pl\">fundacja alternativa</fun-alt>
<fun-alt lang=\"en\">alternativa foundation</fun-alt><imie-nazwisko lang=\"pl\">Imię i nazwisko</imie-nazwisko>
<imie-nazwisko lang=\"en\">Name</imie-nazwisko>
<index-osob lang=\"pl\">indeks osób</index-osob>
<index-osob lang=\"en\">TRANSLATE</index-osob><kalendarz lang=\"pl\">Kalendarz</kalendarz>
<kalendarz lang=\"en\">Calendar</kalendarz>
<kategorie lang=\"pl\">kategorie</kategorie>
<kategorie lang=\"en\">categories</kategorie>
<krs lang=\"pl\">KRS</krs>
<krs lang=\"en\">NCR no</krs><ludzie lang=\"pl\">Ludzie</ludzie>
<ludzie lang=\"en\">People</ludzie><mapa lang=\"pl\">Mapa</mapa>
<mapa lang=\"en\">Map</mapa><nr-rach lang=\"pl\">nr rachunku</nr-rach>
<nr-rach lang=\"en\">Bank Acc. No.</nr-rach><o-nas lang=\"pl\">O fundacji</o-nas>
<o-nas lang=\"en\">About us</o-nas><partnerzy lang=\"pl\">Partnerzy</partnerzy>
<partnerzy lang=\"en\">Partners</partnerzy>
<powiazane lang=\"pl\">Powiązane</powiazane>
<powiazane lang=\"en\">Related</powiazane>
<polityka-prywatnosci lang=\"pl\">Polityka prywatności</polityka-prywatnosci>
<polityka-prywatnosci lang=\"en\">Privacy policy</polityka-prywatnosci>
<projekty lang=\"pl\">Projekty</projekty>
<projekty lang=\"en\">Projects</projekty><regon lang=\"pl\">REGON</regon>
<regon lang=\"en\">REGON</regon><stacja-transformacja lang=\"pl\">Stacja Transformacja</stacja-transformacja>
<stacja-transformacja lang=\"en\">Transformation Station</stacja-transformacja>
<subscribe lang=\"pl\">Wyślij</subscribe>
<subscribe lang=\"en\">Subscribe</subscribe><tel lang=\"pl\">tel.</tel>
<tel lang=\"en\">ph.</tel><wiecej-dzialan lang=\"pl\">Więcej działań</wiecej-dzialan>
<wiecej-dzialan lang=\"en\">More activities</wiecej-dzialan>
<wszystkie lang=\"pl\">wszystkie</wszystkie>
<wszystkie lang=\"en\">all</wszystkie>
<wyszukiwarka lang=\"pl\">Wyszukiwarka</wyszukiwarka>
<wyszukiwarka lang=\"en\">Search</wyszukiwarka><search-positive lang=\"pl\">Wyniki dla wyrażenia</search-positive>
<search-positive lang=\"en\">Search results for</search-positive>
<search-negative lang=\"pl\">Spróbuj jeszcze raz skorzystać z wyszukiwarki lub przejdź do <a href=\"{$root}\">strony głównej</a>. Brak wyników dla wyrażenia</search-negative>
<search-negative lang=\"en\">Try again or go back to <a href=\"{$root}\">the home page</a>. No search results for keyword</search-negative><zarzad lang=\"pl\">zarząd</zarzad>
<zarzad lang=\"en\">board</zarzad>
<zespol lang=\"pl\">zespół</zespol>
<zespol lang=\"en\">team</zespol>';

    public function __construct($env = null, $process_params = true)
    {
        parent::__construct($env, $process_params);
        $this->_dependencies = array();
    }

    public function about()
    {
        return array(
            'name' => 'Dictionary',
            'author' => array(
                'name' => 'Olaf Schindler',
                'website' => 'http://f-alt.org',
                'email' => 'studio@orkana39.pl'),
            'version' => 'Symphony 2.6.1',
            'release-date' => '2016-01-20T21:03:30+00:00'
        );
    }

    public function getSource()
    {
        return 'static_xml';
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