{**
 * templates/header/frontend/usernav.tpl
 *
 * Copyright (c) 2014-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Site-Wide Navigation Bar
 *}
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<ul id="navigationUser" class="nav nav-pills tab-list pull-right" role="navigation" aria-label="{translate|escape key="common.navigation.user"}">
				{if $isUserLoggedIn}
					{include file="controllers/page/tasks.tpl"}
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
							{$loggedInUsername|escape}
							<span class="caret"></span>
						</a>
						<ul class="dropdown-menu dropdown-menu-right">
							{if array_intersect(array(ROLE_ID_MANAGER, ROLE_ID_ASSISTANT, ROLE_ID_REVIEWER, ROLE_ID_AUTHOR), $userRoles)}
								<li>
									<a href="{url router=$smarty.const.ROUTE_PAGE page="submissions"}">
										{translate key="navigation.submissions"}
									</a>
								</li>
							{/if}
							<li>
								<a href="{url router=$smarty.const.ROUTE_PAGE page="user" op="profile"}">
									{translate key="common.viewProfile"}
								</a>
							</li>
							{if array_intersect(array(ROLE_ID_SITE_ADMIN), $userRoles)}
							<li>
								<a href="{if $multipleContexts}{url router=$smarty.const.ROUTE_PAGE context="index" page="admin" op="index"}{else}{url router=$smarty.const.ROUTE_PAGE page="admin" op="index"}{/if}">
									{translate key="navigation.admin"}
								</a>
							</li>
							{/if}
							<li>
								<a href="{url router=$smarty.const.ROUTE_PAGE page="login" op="signOut"}">
									{translate key="user.logOut"}
								</a>
							</li>
							{if $isUserLoggedInAs}
								<li>
									<a href="{url router=$smarty.const.ROUTE_PAGE page="login" op="signOutAsUser"}">
										{translate key="user.logOutAs"} {$loggedInUsername|escape}
									</a>
								</li>
							{/if}
						</ul>
					</li>
				{elseif !$notInstalled}
					{if !$hideRegisterLink}
						<li><a href="{url router=$smarty.const.ROUTE_PAGE page="user" op="register"}">{translate key="navigation.register"}</a></li>
					{/if}
					<li><a href="{url router=$smarty.const.ROUTE_PAGE page="login"}">{translate key="navigation.login"}</a></li>
				{/if}
			</ul>
		</div>
	</div>
</div>
