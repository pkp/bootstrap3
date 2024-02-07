{**
 * templates/frontend/pages/editorialTeam.tpl
 *
 * Copyright (c) 2014-2024 Simon Fraser University
 * Copyright (c) 2003-2024 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view the editorial team.
 *
 * @uses $currentJournal Journal The current journal
 *}
{include file="frontend/components/header.tpl" pageTitle="about.editorialTeam"}

<div id="main-content" class="page page_editorial_team">

	{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="about.editorialTeam"}

	{* Page Title *}
	<div class="page-header">
		<h1>{translate key="about.editorialTeam"}</h1>
	</div>
	{* /Page Title *}

	{$currentJournal->getLocalizedData('editorialTeam')}
</div><!-- .page -->

{include file="common/frontend/footer.tpl"}
