{**
 * templates/frontend/pages/privacy.tpl
 *
 * Copyright (c) 2014-2025 Simon Fraser University
 * Copyright (c) 2003-2025 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view the privacy policy.
 *
 * @uses $currentContext Journal|Press The current journal or press
 *}
{include file="frontend/components/header.tpl" pageTitle="manager.setup.privacyStatement"}

<div id="main-content" class="page page_privacy">

    {include file="frontend/components/breadcrumbs.tpl" currentTitleKey="manager.setup.privacyStatement"}

    {* Page Title *}
    <div class="page-header">
        <h1>
            {translate key="manager.setup.privacyStatement"}
        </h1>
        {include file="frontend/components/editLink.tpl" page="management" op="settings" path="website" anchor="setup/privacy" sectionTitleKey="about.aboutContext"}
    </div>
    {* /Page Title *}

    {$privacyStatement}
</div><!-- .page -->

{include file="frontend/components/footer.tpl"}
