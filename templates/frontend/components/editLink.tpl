{**
 * templates/frontend/components/editLink.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University Library
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view the editorial team.
 *
 * @uses $page string Page to pass to the url constructor
 * @uses $op string Op to pass to the url constructor
 * @uses $path string Path to pass to the url constructor
 * @uses $anchor string Anchor to pass to the url constructor
 * @uses $sectionTitle string Translated name of section to be edited
 * @uses SectionTitleKey string A key that must be translated to get the
 *       $sectionTitle
 *}
{if in_array(\PKP\security\Role::ROLE_ID_MANAGER, (array) $userRoles)}

	{* Render the $sectionTitle if we only have a translation key *}
	{if $sectionTitleKey}
		{capture assign="sectionTitle"}{translate key=$sectionTitleKey}{/capture}
	{/if}

	<a href="{url page=$page op=$op path=$path anchor=$anchor}" class="btn btn-default btn-xs">
		<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
		{translate key="common.edit"}

		{* Screen readers need more context *}
		<span class="sr-only">
			{translate key="help.goToEditPage" sectionTitle=$sectionTitle}
		</span>
	</a>
{/if}
