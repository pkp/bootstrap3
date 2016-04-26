{**
 * templates/frontend/pages/issueArchive.tpl
 *
 * Copyright (c) 2014-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display a list of recent issues.
 *
 * @uses $issues Array Collection of issues to display
 *}
{capture assign="pageTitle"}
	{if $issues->getPageCount() > 0 && $issues->getPage() > 1}
		{translate key="archive.archivesPageNumber" pageNumber=$issues->getPage()}
	{else}
		{translate key="archive.archives"}
	{/if}
{/capture}
{include file="frontend/components/header.tpl" pageTitleTranslated=$pageTitle}

<div class="page page_issue_archive">
	{include file="frontend/components/breadcrumbs.tpl" currentTitle=$pageTitle}

	{* No issues have been published *}
	{if !$issues}
		<div class="alert alert-info" role="alert">
			{translate key="current.noCurrentIssueDesc"}
		</div>
	{else}
		<div class="panel">
			<div class="panel-body">
				{* List issues *}
				<ul class="list-group">
				{iterate from=issues item=issue}
					<li class="list-group-item">
						{include file="frontend/objects/issue_summary.tpl"}
					</li>
				{/iterate}
				</ul>
			</div>
		</div>

		{if $issues->getPageCount() > 0}
		<nav>
			<ul class="pagination">
				{page_info iterator=$issues}
				{page_links anchor="issues" name="issues" iterator=$issues}
			</ul>
		</nav>
		{/if}
	{/if}
</div>

{include file="common/frontend/footer.tpl"}
