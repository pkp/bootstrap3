{**
 * templates/frontend/pages/purchaseIndividualSubscription.tpl
 *
 * Copyright (c) 2013-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * User purchase individual subscription form
 *
 *}
{include file="frontend/components/header.tpl" pageTitle="user.subscriptions.purchaseIndividualSubscription"}

<div id="main-content" class="page page-individual-subscription">

	{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="user.subscriptions.purchaseIndividualSubscription"}

	<div class="page-header">
		<h1>{translate key="user.subscriptions.purchaseIndividualSubscription"}</h1>
	</div>

	<form class="cmp_form purchase-subscription" method="post" id="subscriptionForm" action="{url op="payPurchaseSubscription" path="individual"|to_array:$subscriptionId}">
		{csrf}

		<div class="form-group">
			<label for="subscription-type">
				{translate key="user.subscriptions.form.typeId"}
			</label>
			<select name="typeId" id="typeId" class="form-control">
				{foreach name=types from=$subscriptionTypes key=thisTypeId item=subscriptionType}
					<option value="{$thisTypeId|escape}"{if $typeId == $thisTypeId} selected{/if}>{$subscriptionType|escape}</option>
				{/foreach}
			</select>
		</div>

		<div class="form-group">
			<label for="subscription-membership">
				{translate key="user.subscriptions.form.membership"}
			</label>
			<input type="text" class="form-control" name="membership" id="membership" value="{$membership|escape}">
		</div>

		<div class="buttons">
			<button class="btn btn-default" type="submit">
				{translate key="common.save"}
			</button>
		</div>
	</form>
</div>

{include file="frontend/components/footer.tpl"}
