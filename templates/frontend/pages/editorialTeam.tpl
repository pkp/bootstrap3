{**
 * templates/frontend/pages/editorialTeam.tpl
 *
 * Copyright (c) 2014-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view the editorial team.
 *
 * @uses $currentJournal Journal The current journal
 *}
{include file="frontend/components/header.tpl" pageTitle="about.editorialTeam"}

<div class="page page_editorial_team">
	{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="about.editorialTeam"}
<div class="page-header">
<h1>{translate key="about.editorialTeam"}</h1>
</div>
<div class="panel panel-default">
<div class="panel-body">
	{$currentJournal->getLocalizedSetting('masthead')}
</div>
</div>
</div>

</div><!-- .page -->

{include file="common/frontend/footer.tpl"}
