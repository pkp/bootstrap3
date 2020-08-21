<?php

/**
 * @file plugins/themes/bootstrap3/UasdThemePlugin.inc.php
 *
 * Copyright (c) 2014-2017 Simon Fraser University Library
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class UasdThemePlugin
 * @ingroup plugins_themes_bootstrap3
 *
 * @brief Default theme
 */

import('BootstrapThreeThemePlugin');
class UasdThemePlugin extends BootstrapThreeThemePlugin {
	/**
	 * Initialize the theme
	 *
	 * @return null
		 */
		public function init() {
			$this->setParent('bootstrapthreethemeplugin');
		}	
}