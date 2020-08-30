{**
 * templates/frontend/components/searchForm_simple.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University Library
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Simple display of a search form with just text input and search button
 *
 * @uses $searchQuery string Previously input search query
 *}
{if !$currentJournal || $currentJournal->getData('publishingMode') != $smarty.const.PUBLISHING_MODE_NONE}
<form class="navbar-form navbar-left" role="search" method="post" action="{url page="search" op="search"}">
  <div class="form-group">
    <input class="form-control" name="query" value="{$searchQuery|escape}" type="search" aria-label="{translate|escape key="common.searchQuery"}" placeholder="">
  </div>
  <button type="submit" class="btn btn-default">{translate key="common.search"}</button>
</form>
{/if}
