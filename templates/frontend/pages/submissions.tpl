{**
 * templates/frontend/pages/submissions.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University Library
 * Copyright (c) 2003-2017 John Willinsky
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
	{if $isUserLoggedIn}
		{capture assign="newSubmission"}<a href="{url page="submission" op="wizard"}">{translate key="about.onlineSubmissions.newSubmission"}</a>{/capture}
		{capture assign="viewSubmissions"}<a href="{url page="submissions"}">{translate key="about.onlineSubmissions.viewSubmissions"}</a>{/capture}
		<div class="alert alert-info">
			{translate key="about.onlineSubmissions.submissionActions" newSubmission=$newSubmission viewSubmissions=$viewSubmissions}
		</div>
	{else}
		{capture assign="login"}<a href="{url page="login"}">{translate key="about.onlineSubmissions.login"}</a>{/capture}
		{capture assign="register"}<a href="{url page="user" op="register"}">{translate key="about.onlineSubmissions.register"}</a>{/capture}
		<div class="alert alert-info">
			{translate key="about.onlineSubmissions.registrationRequired" login=$login register=$register}
		</div>
	{/if}

	{* Submission Checklist *}
	{if $submissionChecklist}
		<div class="submission_checklist">
			<div class="page-header">
				<h2>
					{translate key="about.submissionPreparationChecklist"}
					{include file="frontend/components/editLink.tpl" page="management" op="settings" path="workflow" anchor="submission" sectionTitleKey="about.submissionPreparationChecklist"}
				</h2>
			</div>
			<p class="lead description">
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

	{* Author Guidelines *}
	{if $currentJournal->getLocalizedData('authorGuidelines')}
		<div class="author_guidelines">
			<h2 class="page-header">
				{translate key="about.authorGuidelines"}
				{include file="frontend/components/editLink.tpl" page="management" op="settings" path="workflow" anchor="submission" sectionTitleKey="about.authorGuidelines"}
			</h2>
			{$currentJournal->getLocalizedData('authorGuidelines')}
		</div>
	{/if}
	{* /Author Guidelines *}

	{* Copyright Notice *}
	{if $currentJournal->getLocalizedData('copyrightNotice')}
		<div class="copyright-notice">
			<h2 class="page-header">
				{translate key="about.copyrightNotice"}
				{include file="frontend/components/editLink.tpl" page="management" op="settings" path="distribution" anchor="license" sectionTitleKey="about.copyrightNotice"}
			</h2>
			{$currentJournal->getLocalizedData('copyrightNotice')}
		</div>
	{/if}
	{* /Copyright Notice *}

</div><!-- .page -->

{include file="common/frontend/footer.tpl"}
