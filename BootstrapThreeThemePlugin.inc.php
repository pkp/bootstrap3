<?php

/**
 * @file plugins/themes/default/BootstrapThreeThemePlugin.inc.php
 *
 * Copyright (c) 2014-2017 Simon Fraser University Library
 * Copyright (c) 2003-2017 John Willinsky
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
	 * @return null
	 */
	public function init() {

		// Register option for bootstrap themes
		$this->addOption('bootstrapTheme', 'radio', array(
			'label' => 'plugins.themes.bootstrap3.options.bootstrapTheme.label',
			'description' => 'plugins.themes.bootstrap3.options.bootstrapTheme.description',
			'options' => array(
				'bootstrap3' => 'plugins.themes.bootstrap3.options.bootstrapTheme.bootstrap3',
				'cerulean'   => 'plugins.themes.bootstrap3.options.bootstrapTheme.cerulean',
				'cleanblog'  => 'plugins.themes.bootstrap3.options.bootstrapTheme.cleanblog',
				'cosmo'      => 'plugins.themes.bootstrap3.options.bootstrapTheme.cosmo',
				'cyborg'     => 'plugins.themes.bootstrap3.options.bootstrapTheme.cyborg',
				'darkly'     => 'plugins.themes.bootstrap3.options.bootstrapTheme.darkly',
				'flatly'     => 'plugins.themes.bootstrap3.options.bootstrapTheme.flatly',
				'journal'    => 'plugins.themes.bootstrap3.options.bootstrapTheme.journal',
				'lumen'      => 'plugins.themes.bootstrap3.options.bootstrapTheme.lumen',
				'paper'      => 'plugins.themes.bootstrap3.options.bootstrapTheme.paper',
				'readable'   => 'plugins.themes.bootstrap3.options.bootstrapTheme.readable',
				'sandstone'  => 'plugins.themes.bootstrap3.options.bootstrapTheme.sandstone',
				'simplex'    => 'plugins.themes.bootstrap3.options.bootstrapTheme.simplex',
				'slate'      => 'plugins.themes.bootstrap3.options.bootstrapTheme.slate',
				'spacelab'   => 'plugins.themes.bootstrap3.options.bootstrapTheme.spacelab',
				'superhero'  => 'plugins.themes.bootstrap3.options.bootstrapTheme.superhero',
				'united'     => 'plugins.themes.bootstrap3.options.bootstrapTheme.united',
				'yeti'       => 'plugins.themes.bootstrap3.options.bootstrapTheme.yeti',
			)
		));

		$bootstrapTheme = $this->getOption('bootstrapTheme');
		if (empty($bootstrapTheme) || $bootstrapTheme === 'bootstrap3') {
			$this->addStyle('bootstrap', 'styles/bootstrap.less');
		} else {
			$this->addStyle('bootstrapTheme-' . $bootstrapTheme, 'styles/' . $bootstrapTheme . '.less');
		}

		$locale = AppLocale::getLocale();
		if (AppLocale::getLocaleDirection($locale) === 'rtl') {
			if (Config::getVar('general', 'enable_cdn')) {
				$this->addStyle('bootstrap-rtl', '//cdn.rawgit.com/morteza/bootstrap-rtl/v3.3.4/dist/css/bootstrap-rtl.min.css', array('baseUrl' => ''));
			} else {
				$this->addStyle('bootstrap-rtl', 'styles/bootstrap-rtl.min.css');
			}
		}

		// Load jQuery from a CDN or, if CDNs are disabled, from a local copy.
		$min = Config::getVar('general', 'enable_minified') ? '.min' : '';
		$request = Application::getRequest();
		if (Config::getVar('general', 'enable_cdn')) {
			$jquery = '//ajax.googleapis.com/ajax/libs/jquery/' . CDN_JQUERY_VERSION . '/jquery' . $min . '.js';
			$jqueryUI = '//ajax.googleapis.com/ajax/libs/jqueryui/' . CDN_JQUERY_UI_VERSION . '/jquery-ui' . $min . '.js';
		} else {
			// Use OJS's built-in jQuery files
			$jquery = $request->getBaseUrl() . '/lib/pkp/lib/vendor/components/jquery/jquery' . $min . '.js';
			$jqueryUI = $request->getBaseUrl() . '/lib/pkp/lib/vendor/components/jqueryui/jquery-ui' . $min . '.js';
		}
		// Use an empty `baseUrl` argument to prevent the theme from looking for
		// the files within the theme directory
		$this->addScript('jQuery', $jquery, array('baseUrl' => ''));
		$this->addScript('jQueryUI', $jqueryUI, array('baseUrl' => ''));
		$this->addScript('jQueryTagIt', $request->getBaseUrl() . '/lib/pkp/js/lib/jquery/plugins/jquery.tag-it.js', array('baseUrl' => ''));

		// Load Bootstrap
		$this->addScript('bootstrap', 'bootstrap/js/bootstrap.min.js');

		// Add navigation menu areas for this theme
		$this->addMenuArea(array('primary', 'user'));
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
