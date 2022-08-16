{**
 * templates/frontend/pages/search.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University Library
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to search and view search results.
 *
 * @uses $query Value of the primary search query
 * @uses $authors Value of the authors search filter
 * @uses $dateFrom Value of the date from search filter (published after).
 *  Value is a single string: YYYY-MM-DD HH:MM:SS
 * @uses $dateTo Value of the date to search filter (published before).
 *  Value is a single string: YYYY-MM-DD HH:MM:SS
 * @uses $yearStart Earliest year that can be used in from/to filters
 * @uses $yearEnd Latest year that can be used in from/to filters
 *}
{include file="frontend/components/header.tpl" pageTitle="common.search"}

<div  id="main-content" class="page page_search">

	<div class="page-header">
		<h1>{translate key="common.search"}</h1>
	</div>

	{* Main Search From *}
	<form method="post" id="search-form" class="search-form" action="{url op="search"}" role="search">
		{csrf}

		<div class="form-group">
			{* Repeat the label text just so that screen readers have a clear
			   label/input relationship *}
			<label class="sr-only" for="query">
				{translate key="search.searchFor"}
			</label>

			<div class="input-group">
				<input type="search" id="query" name="query" value="{$query|escape}" class="query form-control" placeholder="{translate key="common.search"}">
				<span class="input-group-btn">
					<input type="submit" value="{translate key="common.search"}" class="btn btn-default">
				</span>
			</div>
		</div>

		<fieldset class="search-advanced">
			<legend>
				{translate key="search.advancedFilters"}
			</legend>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label for="dateFromYear">
							{translate key="search.dateFrom"}
						</label>
						<div class="form-inline">
							<div class="form-group">
								{html_select_date prefix="dateFrom" time=$dateFrom start_year=$yearStart end_year=$yearEnd year_empty="" month_empty="" day_empty="" field_order="YMD"}
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="dateToYear">
							{translate key="search.dateTo"}
						</label>
						<div class="form-inline">
							<div class="form-group">
								{html_select_date prefix="dateTo" time=$dateTo start_year=$yearStart end_year=$yearEnd year_empty="" month_empty="" day_empty="" field_order="YMD"}
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="authors">
							{translate key="search.author"}
						</label>
						<input class="form-control" type="text" for="authors" name="authors" value="{$authors|escape}">
					</div>
				</div>
			</div>
		</fieldset>

		{* Search results *}
		<div class="search-results">
			<h2>
				{translate key="search.searchResults"}
			</h2>
			{iterate from=results item=result}
				{include file="frontend/objects/article_summary.tpl" article=$result.publishedSubmission journal=$result.journal showDatePublished=true hideGalleys=true}
			{/iterate}
		</div>

		{* No results found *}
		{if $results->wasEmpty()}
			{if $error}
				{include file="frontend/components/notification.tpl" type="error" message=$error|escape}
			{else}
				{include file="frontend/components/notification.tpl" type="notice" messageKey="search.noResults"}
			{/if}

		{* Results pagination *}
		{else}
			<div class="cmp_pagination">
				{page_info iterator=$results}
				{page_links anchor="results" iterator=$results name="search" query=$query searchJournal=$searchJournal authors=$authors title=$title abstract=$abstract galleyFullText=$galleyFullText discipline=$discipline subject=$subject type=$type coverage=$coverage indexTerms=$indexTerms dateFromMonth=$dateFromMonth dateFromDay=$dateFromDay dateFromYear=$dateFromYear dateToMonth=$dateToMonth dateToDay=$dateToDay dateToYear=$dateToYear orderBy=$orderBy orderDir=$orderDir}
			</div>
		{/if}

	</form>
</div><!-- .page -->

{include file="common/frontend/footer.tpl"}
