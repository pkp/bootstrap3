{**
 * templates/frontend/objects/announcement_full.tpl
 *
 * Copyright (c) 2014-2024 Simon Fraser University
 * Copyright (c) 2003-2024 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display the full view of an announcement, when the announcement is
 *  the primary element on the page.
 *
 * @uses $announcement Announcement The announcement to display
 *}

<article class="announcement-full">
	<header class="page-header">
		<h1>
			{$announcement->getLocalizedData('title')|escape}
		</h1>
		<small class="date">
			<span class="glyphicon glyphicon-calendar"></span>
			{translate key="announcement.postedOn" postDate=$announcement->datePosted|escape}
		</small>
	</header>
	<div class="description">
		{if $announcement->getLocalizedData('description')}
			{$announcement->getLocalizedData('description')|strip_unsafe_html}
		{else}
			{$announcement->getLocalizedData('descriptionShort')|strip_unsafe_html}
		{/if}
	</div>
</article><!-- .announcement-full" -->
