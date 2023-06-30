{**
 * templates/frontend/pages/navigationMenuItemViewContent.tpl
 *
 * Copyright (c) 2014-2023 Simon Fraser University
 * Copyright (c) 2003-2023 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * Display NavigationMenuItem content
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$title}

<div id="main-content" class="page page_about">

	{* Page Title *}
	<div class="page-header">
		<h1>{$title|escape}</h1>
	</div>
	{* /Page Title *}

	{$content}
</div><!-- .page -->

{include file="frontend/components/footer.tpl"}
