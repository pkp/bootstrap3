{**
 * templates/frontend/components/searchForm_simple.tpl
 *
 * Copyright (c) 2014-2023 Simon Fraser University
 * Copyright (c) 2003-2023 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Simple display of a search form with just text input and search button
 *
 * @uses $searchQuery string Previously input search query
 *}
{if !$currentJournal || $currentJournal->getData('publishingMode') != \APP\journal\Journal::PUBLISHING_MODE_NONE}
{capture name="searchFormUrl"}{url page="search" op="search" escape=false}{/capture}
{$smarty.capture.searchFormUrl|parse_url:$smarty.const.PHP_URL_QUERY|parse_str:$formUrlParameters}
<form class="navbar-form navbar-left" role="search" method="get" action="{$smarty.capture.searchFormUrl|strtok:"?"|escape}">
  {foreach from=$formUrlParameters key=paramKey item=paramValue}
    <input type="hidden" name="{$paramKey|escape}" value="{$paramValue|escape}"/>
  {/foreach}
  <div class="form-group">
    <input class="form-control" name="query" value="{$searchQuery|escape}" type="search" aria-label="{translate|escape key="common.searchQuery"}" placeholder="">
  </div>
  <button type="submit" class="btn btn-default">{translate key="common.search"}</button>
</form>
{/if}
