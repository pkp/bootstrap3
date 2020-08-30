{**
 * templates/frontend/components/navigationMenu.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Primary navigation menu list for OJS
 *
 * @uses navigationMenu array Hierarchical array of navigation menu item assignments
 * @uses id string Element ID to assign the outer <ul>
 * @uses ulClass string Class name(s) to assign the outer <ul>
 * @uses liClass string Class name(s) to assign all <li> elements
 *}

{if $navigationMenu}
	<ul id="{$id|escape}" class="{$ulClass|escape}">
		{if ($id|escape) == 'main-navigation'}
			{if $currentContext}
				<li class="{$liClass|escape}">
					<a href="{$baseUrl}">{translate|escape key="uasd.nav.item.homepage"}</a>
				</li>
				<li class="{$liClass|escape}">
					<a href="{url|escape page=$currentJournal}">{translate|escape key="uasd.nav.item.index"}</a>
				</li>
			{else}
				<li class="{$liClass|escape}">
					<a href="{$baseUrl}">{translate|escape key="uasd.nav.item.index"}</a>
				</li>
				<li class="{$liClass|escape}">
					<a href="{$baseUrl}/info">{translate|escape key="uasd.nav.item.info"}</a>
				</li>
				{assign var="hasChildren" value=count($journals) > 0}
				<li class="{$liClass|escape}{if $hasChildren} dropdown{/if}">
					<a href="#" 
						{if $hasChildren} class="dropdown-toggle" data-toggle="dropdown" 
							role="button" aria-haspopup="true" aria-expanded="false"{/if}>
						{translate|escape key="navigation.about"}
							{if $hasChildren}
								<span class="caret"></span>
							{/if}
					</a>
					{if $hasChildren}
						<ul class="dropdown-menu">

						</ul>
					{/if}
				</li>				
			{/if}
		{/if}
		
		{foreach key=field item=navigationMenuItemAssignment from=$navigationMenu->menuTree}
			{if !$navigationMenuItemAssignment->navigationMenuItem->getIsDisplayed()}
				{continue}
			{/if}
			{assign var="hasChildren" value=false}
			{if !empty($navigationMenuItemAssignment->children)}
				{assign var="hasChildren" value=true}
			{/if}
			<li class="{$liClass|escape}{if $hasChildren} dropdown{/if}">
				<a href="{$navigationMenuItemAssignment->navigationMenuItem->getUrl()}"{if $hasChildren} class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"{/if}>
					{$navigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}
					{if $hasChildren}
						<span class="caret"></span>
					{/if}
				</a>
				{if !empty($navigationMenuItemAssignment->children)}
					<ul class="dropdown-menu {if $id === 'navigationUser'}dropdown-menu-right{/if}">
						{foreach key=childField item=childNavigationMenuItemAssignment from=$navigationMenuItemAssignment->children}
							{if $childNavigationMenuItemAssignment->navigationMenuItem->getIsDisplayed()}
								<li class="{$liClass|escape}">
									<a href="{$childNavigationMenuItemAssignment->navigationMenuItem->getUrl()}">
										{$childNavigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}
									</a>
								</li>
							{/if}
						{/foreach}
					</ul>
				{/if}
			</li>
		{/foreach}
		

		{if ($id|escape) == 'main-navigation'}
			{if !$currentContext}
				<li>
					<form class="input-group" action="{url page="search" op="search"}" method="post" role="search">
          	<input type="hidden" name="csrfToken" value="af146c4b4483858347ff568928d1ced9">
            <input type="search" name="query" value="" class="search-input-tag form-control" placeholder="{translate|escape key="uasd.header-search.placeholder"}" aria-label="Search">
            <span class="input-group-btn">
              <button class="btn btn-default" type="submit" aria-label="Name"> <i class="fas fa-search" aria-hidden="true"></i></button>
            </span>
          </form>
				</li>
			{/if}\
		{/if}

	</ul>
{/if}
