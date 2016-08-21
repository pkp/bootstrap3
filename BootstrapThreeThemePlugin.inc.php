<?php

/**
 * @file plugins/themes/default/BootstrapThreeThemePlugin.inc.php
 *
 * Copyright (c) 2014-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class BootstrapThreeThemePlugin
 * @ingroup plugins_themes_bootstrap3
 *
 * @brief Default theme
 */

import('lib.pkp.classes.plugins.ThemePlugin');
class BootstrapThreeThemePlugin extends ThemePlugin {
	/**
	 * Initialize the theme
	 *
	 * @param $themes array list of all loaded themes
	 * @return null
	 */
	public function init($themes) {
		$this->addStyle('bootstrap', 'styles/bootstrap.less');
		$this->addScript('bootstrap', 'bootstrap/js/bootstrap.min.js');
	}

	/**
	 * Get the display name of this plugin
	 * @return string
	 */
	function getDisplayName() {
		return __('plugins.themes.bootstrap3.name');
	}

	/**
	 * Get the description of this plugin
	 * @return string
	 */
	function getDescription() {
		return __('plugins.themes.bootstrap3.description');
	}
}
