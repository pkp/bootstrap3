{**
 * templates/frontend/pages/submissions.tpl
 *
 * Copyright (c) 2014-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view the editorial team.
 *
 * @uses $currentJournal Journal The current journal
 * @uses $submissionChecklist array List of requirements for submissions
 *}
{include file="frontend/components/header.tpl" pageTitle="about.submissions"}

<div id="main-content" class="page page_submissions">

	{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="about.submissions"}

	{* Page Title *}
	<div class="page-header">
		<h1>{translate key="about.submissions"}</h1>
	</div>
	{* /Page Title *}


	{* Login/register prompt *}
	{capture assign="login"}
		<a href="{url page="login"}">{translate key="about.onlineSubmissions.login"}</a>
	{/capture}
	{capture assign="register"}
		<a href="{url page="user" op="register"}">{translate key="about.onlineSubmissions.register"}</a>
	{/capture}
		<div class="alert alert-info" role="alert">
			{translate key="about.onlineSubmissions.registrationRequired" login=$login register=$register}
		</div>
	{* /Login/register prompt *}


	{* Author Guidelines *}
	{if $currentJournal->getLocalizedSetting('authorGuidelines')}
		<div class="author_guidelines">
			<h2 class="section-title">
				{translate key="about.authorGuidelines"}
				<span class="edit-link"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>{include file="frontend/components/editLink.tpl" page="management" op="settings" path="journal" anchor="guidelines" sectionTitleKey="about.authorGuidelines"}</span>
			</h2>
			{$currentJournal->getLocalizedSetting('authorGuidelines')|nl2br}
		</div>
	{/if}
	{* /Author Guidelines *}

	{* Submission Checklist *}
	{if $submissionChecklist}
		<div class="submission_checklist">
			<h2 class="section-title">
				{translate key="about.submissionPreparationChecklist"}
				<span class="edit-link"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>{include file="frontend/components/editLink.tpl" page="management" op="settings" path="publication" anchor="submissionStage" sectionTitleKey="about.submissionPreparationChecklist"}</span>
			</h2>
			<p class="description">
				{translate key="about.submissionPreparationChecklist.description"}
			</p>
			<ul class="list-group">
				{foreach from=$submissionChecklist item=checklistItem}
					<li class="list-group-item">
						<span class="glyphicon glyphicon-check" aria-hidden="true"></span>
						<span class="item-content">{$checklistItem.content|nl2br}</span>
					</li>
				{/foreach}
			</ul>

		</div>
	{/if}
	{* /Submission Checklist *}

	{* Copyright Notice *}
	{if $currentJournal->getLocalizedSetting('copyrightNotice')}
		<div class="copyright-notice">
			<h2 class="section-title">
				{translate key="about.copyrightNotice"}
				<span class="edit-link"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>{include file="frontend/components/editLink.tpl" page="management" op="settings" path="journal" anchor="policies" sectionTitleKey="about.copyrightNotice"}</span>
			</h2>
			{$currentJournal->getLocalizedSetting('copyrightNotice')|nl2br}
		</div>
	{/if}
	{* /Copyright Notice *}

	{* Privacy Statement *}
	{if $currentJournal->getLocalizedSetting('privacyStatement')}
		<div class="privacy-statement">
			<h2 class="section-title">
				{translate key="about.privacyStatement"}
				<span class="edit-link"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>{include file="frontend/components/editLink.tpl" page="management" op="settings" path="journal" anchor="policies" sectionTitleKey="about.privacyStatement"}</span>
			</h2>
			{$currentJournal->getLocalizedSetting('privacyStatement')|nl2br}
		</div>
	{/if}
	{* /Privacy Statement *}

</div><!-- .page -->

{include file="common/frontend/footer.tpl"}
