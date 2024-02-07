{**
 * templates/frontend/components/navigationMenus/dashboardMenuItem.tpl
 *
 * Copyright (c) 2014-2024 Simon Fraser University
 * Copyright (c) 2003-2024 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Dashboard menuItem Template
 *
 *}

{$navigationMenuItem->getLocalizedTitle()|escape}
<span class="badge">
	{$unreadNotificationCount}
</span>
