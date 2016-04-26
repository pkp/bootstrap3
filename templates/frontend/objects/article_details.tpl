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

	<div class="row">
    <section class="article-download col-md-4">

      <div id="cover-image">
        {* Article or issue cover *}
        {* @todo less cat more article *}
        <img src="http://lorempixel.com/500/700/cats/" class="img-responsive"/>
      </div>

      <div id="download">
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

    </section>
		<div class="col-md-8">
			<section class="article-main">

        <header>
          <h1 class="page-title">
            {$article->getLocalizedTitle()|escape}
          </h1>
          {if $article->getLocalizedSubtitle()}
          <h2 class="page-subtitle">
            {$article->getLocalizedSubtitle()|escape}
          </h2>
          {/if}
        </header>

        <div class="row">
  				{if $article->getAuthors()}
  				<div class="col-sm-6 article-authors">
  					{foreach from=$article->getAuthors() item=author}
  					<strong>{$author->getFullName()|escape}</strong>
  					{if $author->getLocalizedAffiliation()}
  						<div class="article-author-affilitation">
  							{$author->getLocalizedAffiliation()|escape}
  						</div>
  					{/if}
  					{/foreach}
  				</div>
  				{/if}
          <div class="col-sm-6 article-meta">
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
          </div>
        </div>

        {* Article abstract *}
        {if $article->getLocalizedAbstract()}
          <div class="article-summary" id="summary">
            <h2>{translate key="article.abstract"}</h2>
            <div class="article-abstract">
              {$article->getLocalizedAbstract()|strip_unsafe_html|nl2br}
            </div>
            {call_hook name="Templates::Article::Main"}
          </div>
        {/if}

        <div class="article-details" id="details">
          <h2>{translate key="article.details"}</h2>

          {* Issue article appears in *}
          <div class="panel panel-default">
            <h3 class="panel-heading">
              {translate key="issue.issue"}
            </h3>
            <div class="panel-body">
              <a class="title" href="{url page="issue" op="view" path=$issue->getBestIssueId($currentJournal)}">
                {$issue->getIssueIdentification()}
              </a>
            </div>
          </div>

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

          {if $section}
            <div class="panel panel-default">
              <h3 class="panel-heading">
                {translate key="section.section"}
              </h3>
              <div class="panel-body">
                {$section->getLocalizedTitle()|escape}
              </div>
            </div>
          {/if}

          {call_hook name="Templates::Article::Details"}

        </div>
			</section><!-- .article-main -->
		</div><!-- .col -->
	</div><!-- .row -->

</article>
