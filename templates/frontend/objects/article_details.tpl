{**
 * templates/frontend/objects/article_details.tpl
 *
 * Copyright (c) 2014-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief View of an Article which displays all details about the article.
 *  Expected to be primary object on the page.
 *
 * Many journals will want to add custom data to this object, either through
 * plugins which attach to hooks on the page or by editing the template
 * themselves. In order to facilitate this, a flexible layout markup pattern has
 * been implemented. If followed, plugins and other content can provide markup
 * in a way that will render consistently with other items on the page. This
 * pattern is used in the .main_entry column and the .entry_details column. It
 * consists of the following:
 *
 * <!-- Wrapper class which provides proper spacing between components -->
 * <div class="item">
 *     <!-- Title/value combination -->
 *     <div class="label">Abstract</div>
 *     <div class="value">Value</div>
 * </div>
 *
 * All styling should be applied by class name, so that titles may use heading
 * elements (eg, <h3>) or any element required.
 *
 * <!-- Example: component with multiple title/value combinations -->
 * <div class="item">
 *     <div class="sub_item">
 *         <div class="label">DOI</div>
 *         <div class="value">12345678</div>
 *     </div>
 *     <div class="sub_item">
 *         <div class="label">Published Date</div>
 *         <div class="value">2015-01-01</div>
 *     </div>
 * </div>
 *
 * <!-- Example: component with no title -->
 * <div class="item">
 *     <div class="value">Whatever you'd like</div>
 * </div>
 *
 * Core components are produced manually below, but can also be added via
 * plugins using the hooks provided:
 *
 * Templates::Article::Main
 * Templates::Article::Details
 *
 * @uses $article Article This article
 * @uses $issue Issue The issue this article is assigned to
 * @uses $section Section The journal section this article is assigned to
 * @uses $keywords array List of keywords assigned to this article
 * @uses $citationFactory @todo
 * @uses $pubIdPlugins @todo
 *}
<article class="obj_article_details">
	<h1 class="page_title">
		{$article->getLocalizedTitle()|escape}
	</h1>

	{if $article->getLocalizedSubtitle()}
		<h2 class="subtitle">
			{$article->getLocalizedSubtitle()|escape}
		</h2>
	{/if}

	<div class="row">
		<div class="col-sm-12 col-md-12">
			<div class="main_entry">

				{if $article->getAuthors()}
					<div class="authors">
						{foreach from=$article->getAuthors() item=author}
							<strong>{$author->getFullName()|escape}</strong>
							{if $author->getLocalizedAffiliation()}
								<div class="affilitation">
									{$author->getLocalizedAffiliation()|escape}
								</div>
							{/if}
						{/foreach}
					</div>
				{/if}

				<ul class="nav nav-tabs">
					{if $article->getLocalizedAbstract()}
						<li class="active">
							<a href="#summary" data-toggle="tab">
								{translate key="submission.summary"}
							</a>
						</li>
					{/if}
	        		<li>
						<a href="#details" data-toggle="tab">
							{translate key="article.details"}
						</a>
					</li>

					{if $article->getGalleys()}
						<li>
							<a href="#download" data-toggle="tab">
								{translate key="common.download"}
							</a>
						</li>
					{/if}
				</ul>

	 			<div id="tab-content" class="tab-content">

					<!-- Abstract  -->
					{if $article->getLocalizedAbstract()}
						<div class="tab-pane active" id="summary">
							<h2>{translate key="article.abstract"}</h2>
							<div class="abstract">
								{$article->getLocalizedAbstract()|strip_unsafe_html|nl2br}
							</div>

							{call_hook name="Templates::Article::Main"}
						</div>

					{/if}

				 	<div class="tab-pane" id="details">
						<h2 class="label">{translate key="article.details"}</h2>

						{* Keywords *}
						{* @todo keywords not yet implemented *}

						{* Article Subject *}
						{if $article->getLocalizedSubject()}
							<div class="panel panel-default">
								<h3 class="panel-heading">
									{translate key="article.subject"}
								</h3>
								<div class="panel-body">
									{$article->getLocalizedSubject()|escape}
								</div>
							</div>
						{/if}

						{* Issue article appears in *}
						<div class="panel panel-default">
							<div class="panel-heading">
								{translate key="issue.issue"}
							</div>
							<div class="panel-body">
								<a class="title" href="{url page="issue" op="view" path=$issue->getBestIssueId($currentJournal)}">
									{$issue->getIssueIdentification()}
								</a>
							</div>
						</div>

						{if $section}
							<div class="panel panel-default">
								<div class="panel-heading">
									{translate key="section.section"}
								</div>
								<div class="panel-body">
									{$section->getLocalizedTitle()|escape}
								</div>
							</div>
						{/if}

						{* Citations *}
						{* @todo this hasn't been tested or styled *}
						{if $citationFactory->getCount()}
							<div class="panel panel-default">
								<h3 class="panel-heading">
									{translate key="submission.citations"}
								</h3>
								<div class="panel-body">
									<ul>
										{iterate from=citationFactory item=citation}
											<li>
												{$citation->getRawCitation()|strip_unsafe_html}
											</li>
										{/iterate}
									</ul>
								</div>
							</div>
						{/if}

						{* PubIds (requires plugins) *}
						{* @todo this hasn't been tested or styled *}
						{foreach from=$pubIdPlugins item=pubIdPlugin}
							{if $issue->getPublished()}
								{assign var=pubId value=$pubIdPlugin->getPubId($pubObject)}
							{else}
								{assign var=pubId value=$pubIdPlugin->getPubId($pubObject, true)}{* Preview rather than assign a pubId *}
							{/if}
							{if $pubId}
								<div class="item pubid">
									<div class="label">
										{$pubIdPlugin->getPubIdDisplayType()|escape}
									</div>
									<div class="value">
										{if $pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}
											<a id="pub-id::{$pubIdPlugin->getPubIdType()|escape}" href="{$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}">
												{$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}
											</a>
										{else}
											{$pubId|escape}
										{/if}
									</div>
								</div>
							{/if}
						{/foreach}

						{call_hook name="Templates::Article::Details"}

					</div>
					<div class="tab-pane" id="download">

						{* Article Galleys *}
						{if $article->getGalleys()}
							<ul class="list-unstyled">
								{foreach from=$article->getGalleys() item=galley}
								<li>
									{include file="frontend/objects/galley_link.tpl" parent=$article}
								</li>
								{/foreach}
							</ul>
						{/if}
					</div>
				</div> <!-- end .tab-content -->

			</div><!-- .main_entry -->
		</div><!-- .col -->
	</div><!-- .row -->

</article>
