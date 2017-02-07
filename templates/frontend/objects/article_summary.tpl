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
 *}
{assign var=articlePath value=$article->getBestArticleId($currentJournal)}
{if (!$section.hideAuthor && $article->getHideAuthor() == $smarty.const.AUTHOR_TOC_DEFAULT) || $article->getHideAuthor() == $smarty.const.AUTHOR_TOC_SHOW}
	{assign var="showAuthor" value=true}
{/if}

<div class="article-summary media">
	{if $article->getLocalizedCoverImage()}
		<div class="cover media-left">
			<a href="{url page="article" op="view" path=$articlePath}" class="file">
				<img class="media-object" src="{$article->getLocalizedCoverImageUrl()|escape}">
			</a>
		</div>
	{/if}

	<div class="media-body">
		<h3 class="media-heading">
			<a href="{url page="article" op="view" path=$articlePath}">
				{$article->getLocalizedTitle()|strip_unsafe_html}
			</a>
		</h3>

		{if $showAuthor || $article->getPages() || ($article->getDatePublished() && $showDatePublished)}

			{if $showAuthor}
				<div class="meta">
					{if $showAuthor}
						<div class="authors">
							{$article->getAuthorString()}
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

			<div class="btn-group" role="group">
				{foreach from=$article->getGalleys() item=galley}
					{include file="frontend/objects/galley_link.tpl" parent=$article}
				{/foreach}
			</div>
		{/if}
	</div>

	{call_hook name="Templates::Issue::Issue::Article"}
</div><!-- .article-summary -->
