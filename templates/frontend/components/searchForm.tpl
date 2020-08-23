{**
 * templates/frontend/components/searchForm.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University Library
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Simple display of a search form with just text input and search button
 *
 * @uses $searchQuery string Previously input search query
 *}
<form class="input-group" action="{url page="search" op="search"}" method="post" role="search">
  <input type="hidden" name="csrfToken" value="af146c4b4483858347ff568928d1ced9">
  <input type="search" name="query" value="" class="search-input-tag form-control" placeholder="{translate|escape key="uasd.header-search.placeholder"}" aria-label="Search">
  <span class="input-group-btn">
    <button class="btn btn-default" type="submit" aria-label="Name"> <i class="fas fa-search" aria-hidden="true"></i></button>
  </span>
</form>

