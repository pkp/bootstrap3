{**
 * templates/frontend/pages/userLostPassword.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University Library
 * Copyright (c) 2000-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Password reset form.
 *
 *}
{include file="frontend/components/header.tpl" pageTitle="user.login.resetPassword"}

<div id="main-content" class="page page_lost_password">

	{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="user.login"}

	<div class="alert alert-info" role="alert">
		{translate key="user.login.resetPasswordInstructions"}
	</div>

	<form class="pkp_form lost_password" id="lostPasswordForm" action="{url page="login" op="requestResetPassword"}" method="post">
		{csrf}

		{if $error}
			<div class="alert alert-error" role="alert">
				{translate key=$error}
			</div>
		{/if}

		<div class="form-group">
			<label for="login-email">
				{translate key="user.login.registeredEmail"}
			</label>
			<input type="email" name="email" class="form-control" id="login-email" placeholder="{translate key='user.login.registeredEmail'}" value="{$email|escape}" maxlenght="32" required>
		</div>

		<div class="buttons">
			<button type="submit" class="btn btn-primary">
				{translate key="user.login.resetPassword"}
			</button>

			{if !$disableUserReg}
				{capture assign="registerUrl"}{url page="user" op="register" source=$source}{/capture}
				<a class="btn btn-default register-button" href="{$registerUrl}" role="button">
					{translate key="user.login.registerNewAccount"}
				</a>
			{/if}
		</div>
	</form>

</div><!-- .page -->

{include file="common/frontend/footer.tpl"}
