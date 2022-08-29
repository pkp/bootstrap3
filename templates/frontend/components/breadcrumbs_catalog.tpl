{**
 * templates/frontend/components/breadcrumbs_catalog.tpl
 *
 * Copyright (c) 2014-2019 Simon Fraser University
 * Copyright (c) 2003-2019 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display a breadcrumb nav item showing the location in the catalog.
 *  This only supports one-level of nesting, as does the category hierarchy data.
 *
 * @uses $type string What kind of page should we use to construct urls
 *       (category, series, new)?
 * @uses $parent Category A parent category if one exists
 * @uses $currentTitle string The title to use for the current page.
 * @uses $currentTitleKey string Translation key for title of current page.
 *}

<nav class="cmp_breadcrumbs cmp_breadcrumbs_catalog" role="navigation" aria-label="{translate key="navigation.breadcrumbLabel"}">
	<ol class="breadcrumb">
		<li>
			<a href="{url page="index" router=\PKP\core\PKPApplication::ROUTE_PAGE}">
				{translate key="common.homepageNavigationLabel"}
			</a>
		</li>
		{if $parent}
			<li>
				<a href="{url op=$type path=$parent->getPath()}">
					{$parent->getLocalizedTitle()|escape}
				</a>
			</li>
		{/if}
		<li class="active">
			{if $currentTitleKey}
				{translate key=$currentTitleKey}
			{else}
				{$currentTitle|escape}
			{/if}
		</li>
	</ol>
</nav>
