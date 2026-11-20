{**
 * templates/frontend/pages/editorialMastheadDisabled.tpl
 *
 * Copyright (c) 2026 Simon Fraser University
 * Copyright (c) 2026 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display context's editorial masthead page when the enrollment-based masthead is disabled.
 *
 *}
{include file="frontend/components/header.tpl" pageTitle="common.editorialMasthead"}

<div id="main-content" class="page page_masthead">
	{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="common.editorialMasthead"}

	{* Page Title *}
	<div class="page-header">
		<h1>{translate key="common.editorialMasthead"}</h1>
		{include file="frontend/components/editLink.tpl" page="management" op="settings" path="context" anchor="masthead" sectionTitleKey="common.editorialMasthead"}
	</div>
	{* /Page Title *}

	{$currentContext->getLocalizedData('editorialHistory')}
</div><!-- .page -->

{include file="common/frontend/footer.tpl"}
