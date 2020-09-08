{**
 * templates/frontend/objects/article_summary.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University Library
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief View of an Article summary which is shown within a list of articles.
 *
 * @uses $article Article The article
 * @uses $hasAccess bool Can this user access galleys for this context? The
 *       context may be an issue or an article
 * @uses $showGalleyLinks bool Show galley links to users without access?
 * @uses $hideGalleys bool Hide the article galleys for this article?
 * @uses $primaryGenreIds array List of file genre ids for primary file types
 *}
{assign var=articlePath value=$article->getBestId($currentJournal)}
{if (!$section.hideAuthor && $article->getHideAuthor() == $smarty.const.AUTHOR_TOC_DEFAULT) || $article->getHideAuthor() == $smarty.const.AUTHOR_TOC_SHOW}
	{assign var="showAuthor" value=true}
{/if}

<div class="article-summary media">
	{if $article->getLocalizedCoverImage()}
		<div class="cover media-left">
			<a href="{if $journal}{url journal=$journal->getPath() page="article" op="view" path=$articlePath}{else}{url page="article" op="view" path=$articlePath}{/if}class="file">
				<img class="media-object" src="{$article->getLocalizedCoverImageUrl()|escape}" alt="{$article->getLocalizedCoverImageAltText()|escape|default:''}">
			</a>
		</div>
	{/if}

	<div class="media-body">
		<h3 class="media-heading">
            <a href="{if $journal}{url journal=$journal->getPath() page="article" op="view" path=$articlePath}{else}{url page="article" op="view" path=$articlePath}{/if}">
				{$article->getLocalizedTitle()|strip_unsafe_html}
				{if $article->getLocalizedSubtitle()}
					<p>
						<small>{$article->getLocalizedSubtitle()|escape}</small>
					</p>
				{/if}
			</a>
		</h3>

		{if $showAuthor || $article->getPages()}

			{if $showAuthor}
				<div class="meta">
					{if $showAuthor}
						<div class="authors">
							{$article->getAuthorString()|escape}
						</div>
					{/if}
				</div>
			{/if}

			{* Page numbers for this article *}
			{if $article->getPages()}
				<p class="pages">
					{$article->getPages()|escape}
				</p>
			{/if}

		{/if}

		{if !$hideGalleys && $article->getGalleys()}
			<div class="btn-group" role="group">
				{foreach from=$article->getGalleys() item=galley}
					{if $primaryGenreIds}
						{assign var="file" value=$galley->getFile()}
						{if !$galley->getRemoteUrl() && !($file && in_array($file->getGenreId(), $primaryGenreIds))}
							{continue}
						{/if}
					{/if}
					{assign var=publication value=$article->getCurrentPublication()}
					{assign var="hasArticleAccess" value=$hasAccess}
					{if $currentContext->getSetting('publishingMode') == $smarty.const.PUBLISHING_MODE_OPEN || $publication->getData('accessStatus') == $smarty.const.ARTICLE_ACCESS_OPEN}
						{assign var="hasArticleAccess" value=1}
					{/if}
					{include file="frontend/objects/galley_link.tpl" parent=$article hasAccess=$hasArticleAccess}
				{/foreach}
			</div>
		{/if}
	</div>

	{call_hook name="Templates::Issue::Issue::Article"}
</div><!-- .article-summary -->
