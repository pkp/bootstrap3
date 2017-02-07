{**
 * templates/frontend/components/registrationFormContexts.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University Library
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display role selection for all of the journals/presses on this site
 *
 * @uses $contexts array List of journals/presses on this site
 * @uses $readerUserGroups array Associative array of user groups with reader
 *  permissions in each context.
 * @uses $authorUserGroups array Associative array of user groups with author
 *  permissions in each context.
 * @uses $reviewerUserGroups array Associative array of user groups with reviewer
 *  permissions in each context.
 * @uses $userGroupIds array List group IDs this user is assigned
 *}

{* Only display the context role selection when registration is taking place
   outside of the context of any one journal/press. *}
{if !$currentContext}

	{* Allow users to register for any journal/press on this site *}
	<fieldset name="contexts">
		<legend>
			{translate key="user.register.contextsPrompt"}
		</legend>
		<div class="fields">
			<div id="contextOptinGroup" class="context_optin">
				<ul class="list-group contexts">
					{foreach from=$contexts item=context}
						{assign var=contextId value=$context->getId()}
						<li class="list-group-item context">
							<h4 class="list-group-item-heading">
								{$context->getLocalizedName()}
							</h4>
							<p>
								{translate key="user.register.otherContextRoles"}
							</p>
							<div class="form-inline">
								<div class="form-group context_roles">
									{foreach from=$readerUserGroups[$contextId] item=userGroup}
										{if $userGroup->getPermitSelfRegistration()}
											{assign var="userGroupId" value=$userGroup->getId()}
											<label class="input-group">
												<span class="input-group-addon">
													<input type="checkbox" name="readerGroup[{$userGroupId}]"{if in_array($userGroupId, $userGroupIds)} checked="checked"{/if}>
												</span>
												<span class="form-control">
													{$userGroup->getLocalizedName()}
												</span>
											</label>
										{/if}
									{/foreach}
									{foreach from=$authorUserGroups[$contextId] item=userGroup}
										{if $userGroup->getPermitSelfRegistration()}
											{assign var="userGroupId" value=$userGroup->getId()}
											<label class="input-group">
												<span class="input-group-addon">
													<input type="checkbox" name="authorGroup[{$userGroupId}]"{if in_array($userGroupId, $userGroupIds)} checked="checked"{/if}>
												</span>
												<span class="form-control">
													{$userGroup->getLocalizedName()}
												</span>
											</label>
										{/if}
									{/foreach}
									{foreach from=$reviewerUserGroups[$contextId] item=userGroup}
										{if $userGroup->getPermitSelfRegistration()}
											{assign var="userGroupId" value=$userGroup->getId()}
											<label class="input-group">
												<span class="input-group-addon">
													<input type="checkbox" name="reviewerGroup[{$userGroupId}]"{if in_array($userGroupId, $userGroupIds)} checked="checked"{/if}>
												</span>
												<span class="form-control">
													{$userGroup->getLocalizedName()}
												</span>
											</label>
										{/if}
									{/foreach}
								</div>
							</div>
						</li>
					{/foreach}
				</ul>
			</div>
		</div>
	</fieldset>
{/if}
