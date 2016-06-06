<?php

class eventsubscription_check extends SectionEvent
{
    public $ROOTELEMENT = 'subscription-check';

    public $eParamFILTERS = array(
        
    );

    public static function about()
    {
        return array(
            'name' => 'Subscription check',
            'author' => array(
                'name' => 'Olaf Schindler',
                'website' => 'http://orkana39.pl/clients/alternativa',
                'email' => 'studio@orkana39.pl'),
            'version' => 'Symphony 2.6.1',
            'release-date' => '2015-08-21T10:56:03+00:00',
            'trigger-condition' => 'action[subscription-check]'
        );
    }

    public static function getSource()
    {
        return '29';
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
                <pre class="XML"><code>&lt;subscription-check result="success" type="create | edit">
    &lt;message>Entry [created | edited] successfully.&lt;/message>
&lt;/subscription-check></code></pre>
                <p>When an error occurs during saving, due to either missing or invalid fields, the following XML will be returned.</p>
                <pre class="XML"><code>&lt;subscription-check result="error">
    &lt;message>Entry encountered errors when saving.&lt;/message>
    &lt;field-name type="invalid | missing" />
...&lt;/subscription-check></code></pre>
                <h3>Example Front-end Form Markup</h3>
                <p>This is an example of the form markup you can use on your frontend:</p>
                <pre class="XML"><code>&lt;form method="post" action="{$current-url}/" enctype="multipart/form-data">
    &lt;input name="MAX_FILE_SIZE" type="hidden" value="10485760" />
    &lt;label>dump
        &lt;input name="fields[dump]" type="text" />
    &lt;/label>
    &lt;input name="action[subscription-check]" type="submit" value="Submit" />
&lt;/form></code></pre>
                <p>To edit an existing entry, include the entry ID value of the entry in the form. This is best as a hidden field like so:</p>
                <pre class="XML"><code>&lt;input name="id" type="hidden" value="23" /></code></pre>
                <p>To redirect to a different location upon a successful save, include the redirect location in the form. This is best as a hidden field like so, where the value is the URL to redirect to:</p>
                <pre class="XML"><code>&lt;input name="redirect" type="hidden" value="http://orkana39.pl/clients/alternativa/success/" /></code></pre>';
    }

    public function load()
    {
        if (isset($_POST['action']['subscription-check'])) {
            return $this->__trigger();
        }
    }

}
