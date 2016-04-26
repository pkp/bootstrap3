{**
 * lib/pkp/templates/frontend/components/header.tpl
 *
 * Copyright (c) 2014-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Common frontend site header.
 *
 * @uses $isFullWidth bool Should this page be displayed without sidebars? This
 *       represents a page-level override, and doesn't indicate whether or not
 *       sidebars have been configured for thesite.
 *}

{* Determine whether a logo or title string is being displayed *}
{assign var="showingLogo" value=true}
{if $displayPageHeaderTitle && !$displayPageHeaderLogo && is_string($displayPageHeaderTitle)}
	{assign var="showingLogo" value=false}
{/if}

<!DOCTYPE html>
<html lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}">
{if !$pageTitleTranslated}{translate|assign:"pageTitleTranslated" key=$pageTitle}{/if}
{include file="core:frontend/components/headerHead.tpl"}
<body class="pkp_page_{$requestedPage|escape|default:"index"} pkp_op_{$requestedOp|escape|default:"index"}{if $showingLogo} has_site_logo{/if}">
	<script type="text/javascript">
		// Initialise JS handler.
		$(function() {ldelim}
			$('body').pkpHandler(
				'$.pkp.controllers.SiteHandler',
				{ldelim}
					{if $isUserLoggedIn}
						inlineHelpState: {$initialHelpState},
					{/if}
					toggleHelpUrl: {url|json_encode page="user" op="toggleHelp" escape=false},
					toggleHelpOnText: {$toggleHelpOnText|json_encode},
					toggleHelpOffText: {$toggleHelpOffText|json_encode},
					{include file="core:controllers/notification/notificationOptions.tpl"}
				{rdelim});
		{rdelim});
	</script>
	<div class="pkp_structure_page">

	    <nav id="accessibility-nav" class="sr-only" role="navigation" aria-labelled-by="accessible-menu-label">
			<h2 id="accessible-menu-label">
				{translate|escape key="plugins.themes.bootstrap3.accessible_menu.label"}
			</h2>
	        <ul>
	          <li><a href="#main-navigation">{translate|escape key="plugins.themes.bootstrap3.accessible_menu.main_navigation"}</a></li>
	          <li><a href="#main-content">{translate|escape key="plugins.themes.bootstrap3.accessible_menu.main_content"}</a></li>
	          <li><a href="#sidebar">{translate|escape key="plugins.themes.bootstrap3.accessible_menu.sidebar"}</a></li>
	        </ul>
	    </nav>

		{* Header *}
		<header class="navbar navbar-default" id="headerNavigationContainer" role="banner">

      {* User-specific login, settings and task management *}
      {url|assign:fetchHeaderUrl router=$smarty.const.ROUTE_COMPONENT component="page.PageHandler" op="userNav" escape=false}
      {load_url_in_div class="pkp_navigation_user_wrapper" id="navigationUserWrapper" url=$fetchHeaderUrl}

			<div class="container-fluid">

				<div class="navbar-header">

          {* Mobile hamburger menu *}
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#nav-menu" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>

					{* Logo or site title. Only use <h1> heading on the homepage.
					   Otherwise that should go to the page title. *}
					{if $requestedOp == 'index'}
						<h1 class="site-name">
					{else}
						<div class="site-name">
					{/if}
						{if $currentJournal && $multipleContexts}
							{url|assign:"homeUrl" journal="index" router=$smarty.const.ROUTE_PAGE}
						{else}
							{url|assign:"homeUrl" page="index" router=$smarty.const.ROUTE_PAGE}
						{/if}
						{if $displayPageHeaderLogo && is_array($displayPageHeaderLogo)}
							<a href="{$homeUrl}" class="navbar-brand">
								<img src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}" width="{$displayPageHeaderLogo.width|escape}" height="{$displayPageHeaderLogo.height|escape}" {if $displayPageHeaderLogo.altText != ''}alt="{$displayPageHeaderLogo.altText|escape}"{else}alt="{translate key="common.pageHeaderLogo.altText"}"{/if} />
							</a>
						{elseif $displayPageHeaderTitle && !$displayPageHeaderLogo && is_string($displayPageHeaderTitle)}
							<a href="{$homeUrl}" class="navbar-brand">{$displayPageHeaderTitle}</a>
						{elseif $displayPageHeaderTitle && !$displayPageHeaderLogo && is_array($displayPageHeaderTitle)}
							<a href="{$homeUrl}" class="navbar-brand">
								<img src="{$publicFilesDir}/{$displayPageHeaderTitle.uploadName|escape:"url"}" alt="{$displayPageHeaderTitle.altText|escape}" width="{$displayPageHeaderTitle.width|escape}" height="{$displayPageHeaderTitle.height|escape}" />
							</a>
						{else}
							<a href="{$homeUrl}" class="navbar-brand">
								<img src="{$baseUrl}/templates/images/structure/logo.png" alt="{$applicationName|escape}" title="{$applicationName|escape}" width="180" height="90" />
							</a>
						{/if}
					{if $requestedOp == 'index'}
						</h1>
					{else}
						</div>
					{/if}

				</div>

				{* Primary site navigation *}
				<script type="text/javascript">
					// Attach the JS file tab handler.
					$(function() {ldelim}
						$('#navigationPrimary').pkpHandler(
							'$.pkp.controllers.MenuHandler');
					{rdelim});
				</script>
				<nav id="nav-menu" class="navbar-collapse collapse" aria-label="{translate|escape key="common.navigation.site"}">
					{* Primary navigation menu for current application *}
					{include file="frontend/components/primaryNavMenu.tpl"}

					{* Search form *}
					{if !$noContextsConfigured}
						<div class="pull-right">
							{include file="frontend/components/searchForm_simple.tpl"}
						</div>
					{/if}
				</nav>

			</div><!-- .pkp_head_wrapper -->
		</header><!-- .pkp_structure_head -->

		{* Wrapper for page content and sidebars *}
		{if $isFullWidth}
			{assign var=hasLeftSidebar value=0}
		{/if}
		<div class="pkp_structure_content{if $hasLeftSidebar} has_left_sidebar{/if} container">

			<script type="text/javascript">
				// Attach the JS page handler to the main content wrapper.
				$(function() {ldelim}
					$('div.pkp_structure_main').pkpHandler('$.pkp.controllers.PageHandler');
				{rdelim});
			</script>

			<main class="pkp_structure_main col-xs-12 col-sm-10 col-md-8" role="main">
