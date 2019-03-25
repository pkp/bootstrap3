{**
 * templates/frontend/pages/issueArchive.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University Library
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display a list of recent issues.
 *
 * @uses $issues Array Collection of issues to display
 * @uses $prevPage int The previous page number
 * @uses $nextPage int The next page number
 * @uses $showingStart int The number of the first item on this page
 * @uses $showingEnd int The number of the last item on this page
 * @uses $total int Count of all published monographs
 *}
{capture assign="pageTitle"}
	{if $prevPage}
		{translate key="archive.archivesPageNumber" pageNumber=$prevPage+1}
	{else}
		{translate key="archive.archives"}
	{/if}
{/capture}
{include file="frontend/components/header.tpl" pageTitleTranslated=$pageTitle}

<div id="main-content" class="page page_issue_archive">
	{include file="frontend/components/breadcrumbs.tpl" currentTitle=$pageTitle}

	{* No issues have been published *}
	{if empty($issues)}
		<div class="alert alert-info" role="alert">
			{translate key="current.noCurrentIssueDesc"}
		</div>
	{else}

		{* List issues *}
		<div class="issues media-list">
			{foreach from=$issues item="issue"}
				{include file="frontend/objects/issue_summary.tpl"}
			{/foreach}
		</div>

		{* Pagination *}
		{capture assign="prevUrl"}
			{if $prevPage > 1}
				{url router=$smarty.const.ROUTE_PAGE page="issue" op="archive" path=$prevPage}
			{elseif $prevPage === 1}
				{url router=$smarty.const.ROUTE_PAGE page="issue" op="archive"}
			{/if}
		{/capture}
		{capture assign="nextUrl"}
			{if $nextPage}
				{url router=$smarty.const.ROUTE_PAGE page="issue" op="archive" path=$nextPage}
			{/if}
		{/capture}
		{include
			file="frontend/components/pagination.tpl"
			prevUrl=$prevUrl
			nextUrl=$nextUrl
			showingStart=$showingStart
			showingEnd=$showingEnd
			total=$total
		}
	{/if}
</div>

{include file="common/frontend/footer.tpl"}
