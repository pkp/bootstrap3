{**
 * templates/frontend/pages/indexJournal.tpl
 *
 *UPDATED/CHANGED/MODIFIED: Marc Behiels - marc@elemental.ca - 250416
 *
 * Copyright (c) 2014-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the index page for a journal
 *
 * @uses $currentJournal Journal This journal
 * @uses $journalDescription string Journal description from HTML text editor
 * @uses $homepageImage object Image to be displayed on the homepage
 * @uses $additionalHomeContent string Arbitrary input from HTML text editor
 * @uses $enableAnnouncementsHomepage bool Should we display announcements here?
 * @uses $issue Issue Current issue
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$currentJournal->getLocalizedName()}

<div id="main-content" class="page_index_journal" role="content">

	<!-- JOURNAL DESCRIPTION -->
	{if $journalDescription}
		<div class="journal-description">
			{$journalDescription}
		</div>
	{/if}

	{call_hook name="Templates::Index::journal"}

	<!-- HOMEPAGE IMAGE -->
	{if $homepageImage}
		<div class="homepage_image">
			<img class="img-responsive" src="{$publicFilesDir}/{$homepageImage.uploadName|escape:"url"}" width="{$homepageImage.width|escape}" height="{$homepageImage.height|escape}" {if $homepageImageAltText != ''}alt="{$homepageImageAltText|escape}"{else}alt="{translate key="common.journalHomepageImage.altText"}"{/if}>
		</div>
	{/if}

	<!-- ADDITTIONAL HOME CONTENT -->
	{if $additionalHomeContent}
		<div class="additional-home-content">
			{$additionalHomeContent}
		</div>
	{/if}

	<!--	-->
	{* Announcements *}
	{if $enableAnnouncementsHomepage}
		<div class="cmp_announcements highlight_first media">
			<div class="page-header">
				<h1>{translate key="announcement.announcements"}</h1>
			</div>
			<ul class="media-list">
				<li class="media">
					<div class="media-body">
						{foreach name=announcements from=$announcements item=announcement}
							{include file="frontend/objects/announcement_summary.tpl"}
						{/foreach}
					</div>
				</li>
			</ul>
		</div><!-- .anouncement highlight -->
	{/if}

	{if $issue && $currentJournal->getSetting('publishingMode') != $smarty.const.PUBLISHING_MODE_NONE}
		{* Display the table of contents or cover page of the current issue. *}
			<div class="page-header">
				<h1>{$issue->getIssueIdentification()|strip_unsafe_html|nl2br}</h1>
			</div>
		{include file="frontend/objects/issue_toc.tpl"}
	{/if}

</div><!-- .page -->

{include file="common/frontend/footer.tpl"}
