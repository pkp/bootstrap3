{**
* templates/frontend/pages/userRegister.tpl
*
* Copyright (c) 2014-2016 Simon Fraser University Library
* Copyright (c) 2003-2016 John Willinsky
* Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
*
* User registration form.
*}
{if $includeEntirePage}
{include file="frontend/components/header.tpl" pageTitle="user.register"}

<div id="main-content" class="page page_register">

  {include file="frontend/components/breadcrumbs.tpl" currentTitleKey="user.register"}

  <p>
    {translate key="user.register.completeForm"}
  </p>

  {if !$implicitAuth}
  <p class="required_label">
    {translate key="common.requiredField"}
  </p>
  {url|assign:"rolesProfileUrl" page="user" op="profile" path="roles"}
  {url|assign:"loginUrl" page="login" source=$rolesProfileUrl}
  <div class="alert alert-warning">
    {translate key="user.register.alreadyRegisteredOtherContext" registerUrl=$loginUrl}
  </div>
  {/if}
  {/if}

  <script type="text/javascript">
  $(function() {ldelim}
  // Attach the form handler.
  $('#register').pkpHandler('$.pkp.controllers.form.UserFormHandler',
  {ldelim}
  fetchUsernameSuggestionUrl: {url|json_encode router=$smarty.const.ROUTE_COMPONENT component="api.user.UserApiHandler" op="suggestUsername" firstName="FIRST_NAME_DUMMY" lastName="LAST_NAME_DUMMY" escape=false},
  usernameSuggestionTextAlert: {translate|json_encode key="grid.user.mustProvideName"},
  hideNonReviewerInterests: true
  {rdelim}
);
{rdelim});
</script>

<form class="pkp_form register" id="register" method="post" action="{url op="registerUser"}">

  {if $source}
  <input type="hidden" name="source" value="{$source|escape}" />
  {/if}

  {include file="common/formErrors.tpl"}

  <fieldset id="register-identity">
    <legend>{translate key="user.profile"}</legend>

    <div class="form-group">
      <label for="register-fname">{translate key="user.firstName"}</label>
      <input type="text" class="form-control" id="register-fname" placeholder="{translate key='user.firstName'}" value="{$firstName|escape}" maxlenght="40" required>
    </div>

    <div class="form-group">
      <label for="register-mname">{translate key="user.middleName"}</label>
      <input type="text" class="form-control" id="register-mname" placeholder="{translate key='user.middleName'}" value="{$middleName|escape}" maxlenght="40">
    </div>

    <div class="form-group">
      <label for="register-lname">{translate key="user.lastName"}</label>
      <input type="text" class="form-control" id="register-lname" placeholder="{translate key='user.lastName'}" value="{$lastName|escape}" maxlenght="40" required>
    </div>

    <div class="form-group">
      <label for="register-affiliation">{translate key="user.affiliation"}</label>
      {assign var="primaryLocale" value=$currentContext->getPrimaryLocale()}
      <input type="text" class="form-control" id="register-affiliation" placeholder="{translate key='user.affiliation'}" value="{$affiliation.$primaryLocale|escape}" required>
    </div>

    <div class="form-group">
      <label for="register-country">{translate key="common.country"}</label>
      <select name="country" id="register-country" required>
        <option></option>
        {html_options options=$countries selected=$country}
      </select>
    </div>
  </fieldset>

  <fieldset id="register-login">
    <legend>{translate key="user.login"}</legend>

    <div class="form-group">
      <label for="register-email">{translate key="user.email"}</label>
      <input type="email" class="form-control" id="register-email" placeholder="{translate key='user.email'}" value="{$email|escape}" maxlenght="32" required>
    </div>

    <div class="form-group">
      <label for="register-username">{translate key="user.username"}</label>
      <input type="text" class="form-control" id="register-username" placeholder="{translate key='user.username'}" value="{$username|escape}" maxlenght="32" required>
      <button id="suggestUsernameButton" class="suggest_username">
        {translate key="common.suggest"}
      </button>
    </div>

    <div class="form-group">
      <label for="register-password">{translate key="user.password"}</label>
      <input type="email" class="form-control" id="register-password" password="true" maxlength="32" required="$passwordRequired">
    </div>

    <div class="form-group">
      <label for="register-password-repeat">{translate key="user.repeatPassword"}</label>
      <input type="email" class="form-control" id="register-password-repeat" password="true" maxlength="32" required="$passwordRequired">
    </div>
  </fieldset>

  {* @todo Implement this without recourse to the Form Builder Vocab,
  so we don't force themers to dip into FBV at all *}
  {include file="user/userGroups.tpl"}

  {* @todo recaptcha display is untested *}
  {if $reCaptchaHtml}
  <div class="recaptcha">
    {fieldLabel name="captcha" required=true key="common.captchaField" class="desc"}
    {$reCaptchaHtml}
  </div>
  {/if}

  <button type="submit" class="btn btn-primary">{translate key="user.register"}</button>

  {if $privacyStatement}
  <section id="register-privacy">
    <h2>{translate key="user.register.privacyStatement"}</h2>
    <p>{$privacyStatement|nl2br}</p>
  </section>
  {/if}
</form>

{if $includeEntirePage}
</div><!-- .page -->

{include file="common/frontend/footer.tpl"}
{/if}
