<?php
	include_once(TOOLKIT . '/class.textformattermanager.php');

	// Template class name must be constructed as: formatter___[type]ttf_sieroty
	// where [type] is name of type of formatter, e.g., "markdown", "chain", etc...
	// That way editor can use it at the same time as other templated formatters and 
	// formatters generated from them.
	// When saving, ___[type]ttf_sieroty will be replaced by class name entered in editor.
	Class formatterttf_sieroty extends TextFormatter {

		private $_patterns;

		public function __construct() {
			$this->_patterns = array (
				'/(\\b)(a|i|o|u|w|z|A|I|O|U|W|Z)(\\b )/' => '$2&nbsp;',
			);;
		}
		
		public function about() {
			return array(
				'name' => 'Sieroty', // required
				'author' => array(
					'name' => 'Olaf Schindler',
					'website' => 'http://orkana39.pl/clients/alternativa',
					'email' => 'studio@orkana39.pl'
				),
				'version' => '1.3',
				'release-date' => '2015-05-15T10:39:27+00:00',
				'description' => 'Usuwa sieroty',
				'templatedtextformatters-version' => '1.10', // required
				'templatedtextformatters-type' => 'regex' // required
			);
		}
				
		public function run($string) {
			if (strlen(trim($string)) < 1) return $string;

			if (count($this->_patterns) < 1) return stripslashes($string);

			return stripslashes(preg_replace(array_keys($this->_patterns), array_values($this->_patterns), $string));
		}

		// Hook for driver to call when generating edit form
		// Add form fields to $form
		public function ttf_form(&$form, &$page) {
			$p = new XMLElement('p', __('Wrap patterns with slashes, e.g., "/pattern_here/". You can use backreferences in replacement. Syntax for pattern and replacement is exactly the same as in <a href="http://www.php.net/manual/en/function.preg-replace.php" target="_blank">preg_replace()</a> PHP function.'));
			$p->setAttribute('class', 'help');
			$form->appendChild($p);

			$subsection = new XMLElement('div');
			$subsection->setAttribute('class', 'frame templatedtextformatter-duplicator');

			$ol = new XMLElement('ol');
			$ol->setAttribute('data-add', __('Add regex'));
			$ol->setAttribute('data-remove', __('Remove regex'));

			$temp = $this->_patterns;
			$temp[''] = '';
			foreach ($temp as $pattern => $replacement) {
				$li = new XMLElement('li');
				$li->setAttribute('class', ($pattern ? 'field-regex' : 'template field-regex'));
				$li->setAttribute('data-type', 'regex');

				$header = new XMLElement('header');
				$header->appendChild(new XMLElement('h4', '<strong>' . __('Replace') . '</strong> <span class="type">' . __('regex') . '</span>'));
				$li->appendChild($header);

				$div = new XMLElement('div');
				$div->setAttribute('class', 'two columns');

				$label = Widget::Label(__('Find with pattern'));
				$label->setAttribute('class', 'column');
				$label->appendChild(Widget::Input('fields[patterns][]', htmlentities($pattern, ENT_QUOTES, 'UTF-8')));
				$div->appendChild($label);

				$label = Widget::Label(__('Replace with'));
				$label->setAttribute('class', 'column');
				$label->appendChild(Widget::Input('fields[replacements][]', htmlentities($replacement, ENT_QUOTES, 'UTF-8')));
				$div->appendChild($label);

				$li->appendChild($div);
				$ol->appendChild($li);
			}

			$subsection->appendChild($ol);
			$form->appendChild($subsection);
		}

		// Hook called by TemplatedTextFormatters when generating formatter
		// Update internal data from $_POST only when $update == true.
		// @return array where each key is a string which will be replaced in this template, and value is what key will be replaced with.
		public function ttf_tokens($update = true) {
			if ($update) {
				// Reconstruct our current patterns array and description, so they are up-to-date when form is viewed right after save, without refresh/redirect
				$this->_patterns = array();

				$index = 0;
				$code = '';
				if (!empty($_POST['fields']['patterns']) && count($_POST['fields']['patterns']) == count($_POST['fields']['replacements'])) {
					$this->_patterns = array_combine($_POST['fields']['patterns'], $_POST['fields']['replacements']);
					unset($this->_patterns['']);
				}
			}

			return array(
				'/*'.' PATTERNS */' => '$this->_patterns = '.preg_replace(array("/\n  /", "/\n\)\s*$/"), array("\n\t\t\t\t", "\n\t\t\t);"), var_export($this->_patterns, true)),
			);
		}
	}

