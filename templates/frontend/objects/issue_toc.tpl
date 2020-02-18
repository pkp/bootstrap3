{**
 * templates/frontend/objects/issue_toc.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University Library
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief View of an Issue which displays a full table of contents.
 *
 * @uses $issue Issue The issue
 * @uses $issueTitle string Title of the issue. May be empty
 * @uses $issueSeries string Vol/No/Year string for the issue
 * @uses $issueGalleys array Galleys for the entire issue
 * @uses $hasAccess bool Can this user access galleys for this context?
 * @uses $showGalleyLinks bool Show galley links to users without access?
 *}
<div class="issue-toc">

	{* Indicate if this is only a preview *}
	{if !$issue->getPublished()}
		{include file="frontend/components/notification.tpl" type="warning" messageKey="editor.issues.preview"}
	{/if}

	{* Issue introduction area above articles *}
	<div class="heading row">
		{assign var="issueDetailsCol" value="12"}

		{* Issue cover image and description*}
		{assign var=issueCover value=$issue->getLocalizedCoverImageUrl()}
		{if $issueCover}
			{assign var="issueDetailsCol" value="8"}
			<div class="thumbnail col-md-4">
				<a class="cover" href="{url|escape op="view" page="issue" path=$issue->getBestIssueId()}">
					<img class="img-responsive" src="{$issueCover|escape}" alt="{$issue->getLocalizedCoverImageAltText()|escape|default:''}">
				</a>
			</div>
		{/if}

		<div class="issue-details col-md-{$issueDetailsCol}">

			{if $issue->hasDescription()}
				<div class="description">
					{$issue->getLocalizedDescription()|strip_unsafe_html}
				</div>
			{/if}

			{* PUb IDs (eg - DOI) *}
			{foreach from=$pubIdPlugins item=pubIdPlugin}
				{if $issue->getPublished()}
					{assign var=pubId value=$issue->getStoredPubId($pubIdPlugin->getPubIdType())}
				{else}
					{assign var=pubId value=$pubIdPlugin->getPubId($issue)}{* Preview pubId *}
				{/if}
				{if $pubId}
					{assign var="doiUrl" value=$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}
					<p class="pub_id {$pubIdPlugin->getPubIdType()|escape}">
						<strong>
							{$pubIdPlugin->getPubIdDisplayType()|escape}:
						</strong>
						{if $doiUrl}
							<a href="{$doiUrl|escape}">
								{$doiUrl}
							</a>
						{else}
							{$pubId}
						{/if}
					</p>
				{/if}
			{/foreach}

			{* Published date *}
			{if $issue->getDatePublished()}
				<p class="published">
					<strong>
						{translate key="submissions.published"}:
					</strong>
					{$issue->getDatePublished()|escape|date_format:$dateFormatShort}
				</p>
			{/if}
		</div>
	</div>

	{* Full-issue galleys *}
	{if $issueGalleys}
		<div class="galleys">
			<div class="page-header">
				<h2>
					<small>{translate key="issue.fullIssue"}</small>
				</h2>
			</div>
			<div class="btn-group" role="group">
				{foreach from=$issueGalleys item=galley}
					{include file="frontend/objects/galley_link.tpl" parent=$issue purchaseFee=$currentJournal->getData('purchaseIssueFee') purchaseCurrency=$currentJournal->getData('currency')}
				{/foreach}
			</div>
		</div>
	{/if}

	{* Articles *}
	<div class="sections">
		{foreach name=sections from=$publishedSubmissions item=section}
			<section class="section">
				{if $section.articles}
					{if $section.title}
						<div class="page-header">
							<h2>
								<small>{$section.title|escape}</small>
							</h2>
						</div>
					{/if}
					<div class="media-list">
						{foreach from=$section.articles item=article}
							{include file="frontend/objects/article_summary.tpl"}
						{/foreach}
					</div>
				{/if}
			</section>
		{/foreach}
	</div><!-- .sections -->
</div><!-- .issue-toc -->
