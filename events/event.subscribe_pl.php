<?php

class eventsubscribe_pl extends SectionEvent
{
    public $ROOTELEMENT = 'subscribe-pl';

    public $eParamFILTERS = array(
        
    );

    public static function about()
    {
        return array(
            'name' => 'Subscribe-PL',
            'author' => array(
                'name' => 'Olaf Schindler',
                'website' => 'http://f-alt.org',
                'email' => 'studio@orkana39.pl'),
            'version' => 'Symphony 2.6.1',
            'release-date' => '2015-12-15T21:28:25+00:00',
            'trigger-condition' => 'action[subscribe-pl]'
        );
    }

    public static function getSource()
    {
        return '20';
    }

    public static function allowEditorToParse()
    {
        return true;
    }

    public static function documentation()
    {
        return '
                <h3>Success and Failure XML Examples</h3>
                <p>When saved successfully, the following XML will be returned:</p>
                <pre class="XML"><code>&lt;subscribe-pl result="success" type="create | edit">
    &lt;message>Entry [created | edited] successfully.&lt;/message>
&lt;/subscribe-pl></code></pre>
                <p>When an error occurs during saving, due to either missing or invalid fields, the following XML will be returned.</p>
                <pre class="XML"><code>&lt;subscribe-pl result="error">
    &lt;message>Entry encountered errors when saving.&lt;/message>
    &lt;field-name type="invalid | missing" />
...&lt;/subscribe-pl></code></pre>
                <h3>Example Front-end Form Markup</h3>
                <p>This is an example of the form markup you can use on your frontend:</p>
                <pre class="XML"><code>&lt;form method="post" action="{$current-url}/" enctype="multipart/form-data">
    &lt;input name="MAX_FILE_SIZE" type="hidden" value="20971520" />
    &lt;label>Name
        &lt;input name="fields[name]" type="text" />
    &lt;/label>
    &lt;label>Email
        &lt;input name="fields[mail]" type="text" />
    &lt;/label>
    &lt;label>Active
        &lt;input name="fields[active]" type="checkbox" value="yes" checked="checked" />
    &lt;/label>
    &lt;input name="action[subscribe-pl]" type="submit" value="Submit" />
&lt;/form></code></pre>
                <p>To edit an existing entry, include the entry ID value of the entry in the form. This is best as a hidden field like so:</p>
                <pre class="XML"><code>&lt;input name="id" type="hidden" value="23" /></code></pre>
                <p>To redirect to a different location upon a successful save, include the redirect location in the form. This is best as a hidden field like so, where the value is the URL to redirect to:</p>
                <pre class="XML"><code>&lt;input name="redirect" type="hidden" value="http://f-alt.org/success/" /></code></pre>';
    }

    public function load()
    {
        if (isset($_POST['action']['subscribe-pl'])) {
            return $this->__trigger();
        }
    }

}
