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

    <div class="container-fluid">
      <div class="row">
        <div class="col-lg-4 offset-lg-3 col-md-4 offset-md-3 col-sm-6 offset-md-3 col-12 ">
        <a href="https://uasd.edu.do/" class="is_img journal-name navbar-brand-logo" target="_blank">
          <img class="img-responsive" src="{$baseUrl}/plugins/themes/bootstrap3/templates/images/logo_uasd.png" alt="common.openJournalSystems">
        </a>
        </div>
      </div>
      </div>
    </div>

</div>			
