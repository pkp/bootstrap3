{**
 * templates/common/formErrors.tpl
 *
 * Copyright (c) 2014-2023 Simon Fraser University Library
 * Copyright (c) 2000-2023 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief List errors that occurred during form processing.
 *
 * @uses $isError bool If an error exists
 * @uses $errors array List of error messages
 *}
{if $isError}
	<div class="alert alert-danger">
		<h4>
			{translate key="form.errorsOccurred"}
		</h4>
		<ul class="pkp_form_error_list">
			{foreach key=field item=message from=$errors}
				<li>
					<a class="alert-link" href="#{$field|escape}">{$message}</a>
				</li>
			{/foreach}
		</ul>
	</div>
	<script>{literal}
		<!--
		// Jump to form errors.
		window.location.hash="formErrors";
		// -->
	{/literal}</script>
{/if}
