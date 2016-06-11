{**
 * templates/frontend/pages/userLostPassword.tpl
 *
 * Copyright (c) 2014-2016 Simon Fraser University Library
 * Copyright (c) 2000-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Password reset form.
 *
 *}
{include file="frontend/components/header.tpl" pageTitle="user.login.resetPassword"}


<div id="main-content" class="page page_lost_password">

	{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="user.login"}

	<p class="bg-info">{translate key="user.login.resetPasswordInstructions"}</p>

	<script>
		$(function() {ldelim}
			// Attach the form handler.
			$('#lostPasswordForm').pkpHandler('$.pkp.controllers.form.FormHandler');
		{rdelim});
	</script>

	<form class="pkp_form lost_password" id="lostPasswordForm" action="{url page="login" op="requestResetPassword"}" method="post">
		{if $error}
			<p class="bg-warning">
				{translate key=$error}
			</p>
		{/if}

    <div class="form-group">
      <label for="login-email">{translate key="user.login.registeredEmail"}</label>
      <input type="email" class="form-control" id="login-email" placeholder="{translate key='user.login.registeredEmail'}" value="{$email|escape}" maxlenght="32" required>
    </div>

    <p>
      <button type="submit" class="btn btn-primary">{translate key="user.login.resetPassword"}</button>
      {if !$disableUserReg}
      {url|assign:registerUrl page="user" op="register" source=$source}
      <a class="btn btn-default register-button" href="{$registerUrl}" role="button">{translate key="user.login.registerNewAccount"}</a>
      {/if}
    </p>

	</form>

</div><!-- .page -->

{include file="common/frontend/footer.tpl"}
