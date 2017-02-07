{**
 * templates/frontend/objects/announcement_full.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University Library
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the full view of an announcement, when the announcement is
 *  the primary element on the page.
 *
 * @uses $announcement Announcement The announcement to display
 *}

<article class="announcement-full">
	<header class="page-header">
		<h1>
			{$announcement->getLocalizedTitle()}
		</h1>
		<small class="date">
			<span class="glyphicon glyphicon-calendar"></span>
			{translate key="announcement.postedOn" postDate=$announcement->getDatePosted()}
		</small>
	</header>
	<div class="description">
		{if $announcement->getLocalizedDescription()}
			{$announcement->getLocalizedDescription()|strip_unsafe_html}
		{else}
			{$announcement->getLocalizedDescriptionShort()|strip_unsafe_html}
		{/if}
	</div>
</article><!-- .announcement-full" -->
