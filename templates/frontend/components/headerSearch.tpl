{**
 * templates/frontend/components/headerSearch.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University Library
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Simple display of a header search form with just logos, a text input and search button
 *
 * @uses $searchQuery string Previously input search query
 * @uses $publicFilesDir
 *}

<div class="header-search"> 

  <div class="container">
    <div class="container-fluid">
      <div class="row">
        <div class="col-lg-6 offset-lg-3 col-md-6 offset-md-3 col-sm-6 offset-md-3 col-12 ">
          <h3>{translate|escape key="uasd.header-search.label"}</h3>
				  <form class="input-group" action="{url page="search" op="search"}" method="post" role="search">
            <input type="hidden" name="csrfToken" value="af146c4b4483858347ff568928d1ced9">
            <input type="search" name="query" value="" class="search-input-tag form-control" placeholder="{translate|escape key="uasd.header-search.placeholder"}" aria-label="Search">
            <span class="input-group-btn">
              <button class="btn btn-default" type="submit" aria-label="Name"> <i class="fas fa-search" aria-hidden="true"></i></button>
            </span>
          </form>
        </div>
      </div>
    </div>
  </div>

  <div class="uasd-logo">
    <a href="https://uasd.edu.do/" class="is_img journal-name navbar-brand" target="_blank">
      <img src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}" alt="common.openJournalSystems" width="200">
    </a>
  </div>

</div>			
