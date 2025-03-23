{include file="$template/includes/flashmessage.tpl"}

<div class="bg-white rounded-lg shadow mb-6">
    <div class="p-6">
        <h3 class="text-xl font-semibold mb-4">{lang key="navUserManagement"}</h3>

        <p class="mb-4">{lang key="userManagement.usersFound" count=$users->count()}</p>

        <div class="overflow-x-auto">
            <table class="w-full border-collapse">
                <tr class="bg-gray-100">
                    <th class="px-4 py-2 text-left">{lang key="userManagement.emailAddress"} / {lang key="userManagement.lastLogin"}</th>
                    <th class="px-4 py-2 text-left w-72">{lang key="userManagement.actions"}</th>
                </tr>
                {foreach $users as $user}
                    <tr class="border-t border-gray-200">
                        <td class="px-4 py-3">
                            {$user->email}
                            {if $user->pivot->owner}
                                <span class="ml-2 px-2 py-1 text-xs bg-blue-500 text-white rounded">{lang key="clientOwner"}</span>
                            {/if}
                            {if $user->hasTwoFactorAuthEnabled()}
                                <i class="fas fa-shield text-green-500" data-toggle="tooltip" data-placement="auto right" title="{lang key='twoFactor.enabled'}"></i>
                            {else}
                                <i class="fas fa-shield text-gray-400" data-toggle="tooltip" data-placement="auto right" title="{lang key='twoFactor.disabled'}"></i>
                            {/if}
                            <br>
                            <span class="text-sm text-gray-600">
                                {lang key="userManagement.lastLogin"}:
                                {if $user->pivot->hasLastLogin()}
                                    {$user->pivot->getLastLogin()->diffForHumans()}
                                {else}
                                    {lang key='never'}
                                {/if}
                            </span>
                        </td>
                        <td class="px-4 py-3">
                            <a href="{routePath('account-users-permissions', $user->id)}" class="inline-block px-3 py-1 mr-2 text-sm bg-gray-200 hover:bg-gray-300 rounded {if $user->pivot->owner}opacity-50 cursor-not-allowed{/if}">
                                {lang key="userManagement.managePermissions"}
                            </a>
                            <a href="#" class="inline-block px-3 py-1 text-sm bg-red-500 hover:bg-red-600 text-white rounded btn-remove-user {if $user->pivot->owner}opacity-50 cursor-not-allowed{/if}" data-id="{$user->id}">
                                {lang key="userManagement.removeAccess"}
                            </a>
                        </td>
                    </tr>
                {/foreach}
                {if $invites->count() > 0}
                    <tr>
                        <td colspan="3" class="px-4 py-3 font-semibold">
                            {lang key="userManagement.pendingInvites"}
                        </td>
                    </tr>
                    {foreach $invites as $invite}
                        <tr class="border-t border-gray-200">
                            <td class="px-4 py-3">
                                {$invite->email}
                                <br>
                                <span class="text-sm text-gray-600">
                                    {lang key="userManagement.inviteSent"}:
                                    {$invite->created_at->diffForHumans()}
                                </span>
                            </td>
                            <td class="px-4 py-3">
                                <form method="post" action="{routePath('account-users-invite-resend')}">
                                    <input type="hidden" name="inviteid" value="{$invite->id}">
                                    <button type="submit" class="inline-block px-3 py-1 mr-2 text-sm bg-gray-200 hover:bg-gray-300 rounded">
                                        {lang key="userManagement.resendInvite"}
                                    </button>
                                    <button type="button" class="inline-block px-3 py-1 text-sm bg-gray-200 hover:bg-gray-300 rounded btn-cancel-invite" data-id="{$invite->id}">
                                        {lang key="userManagement.cancelInvite"}
                                    </button>
                                </form>
                            </td>
                        </tr>
                    {/foreach}
                {/if}
            </table>
        </div>

        <p class="text-sm text-gray-600 mt-4">* {lang key="userManagement.accountOwnerPermissionsInfo"}</p>

    </div>
</div>

<div class="bg-white rounded-lg shadow">
    <div class="p-6">
        <h3 class="text-xl font-semibold mb-4">{lang key="userManagement.inviteNewUser"}</h3>

        <p class="mb-4">{lang key="userManagement.inviteNewUserDescription"}</p>

        <form method="post" action="{routePath('account-users-invite')}">
            <div class="mb-4">
                <input type="email" name="inviteemail" placeholder="name@example.com" class="w-full px-3 py-2 border border-gray-300 rounded" value="{$formdata.inviteemail}">
            </div>
            <div class="mb-4">
                <label class="inline-flex items-center mr-4">
                    <input type="radio" class="form-radio" name="permissions" value="all" checked="checked">
                    <span class="ml-2">{lang key="userManagement.allPermissions"}</span>
                </label>
                <label class="inline-flex items-center">
                    <input type="radio" class="form-radio" name="permissions" value="choose">
                    <span class="ml-2">{lang key="userManagement.choosePermissions"}</span>
                </label>
            </div>
            <div class="p-4 bg-gray-100 border border-gray-200 rounded mb-4 hidden" id="invitePermissions">
                {foreach $permissions as $permission}
                    <label class="block mb-2">
                        <input type="checkbox" class="form-checkbox" name="perms[{$permission.key}]" value="1">
                        <span class="ml-2">{$permission.title}</span>
                        <span class="hidden md:inline mx-1">-</span>
                        <br class="md:hidden">
                        <span class="text-sm text-gray-600">{$permission.description}</span>
                    </label>
                {/foreach}
            </div>
            <button type="submit" class="px-4 py-2 bg-blue-600 hover:bg-blue-700 text-white rounded">
                {lang key="userManagement.sendInvite"}
            </button>
        </form>

    </div>
</div>

<form method="post" action="{routePath('user-accounts')}">
    <input type="hidden" name="id" value="" id="inputSwitchAcctId">
</form>

<form method="post" action="{routePath('account-users-remove')}">
    <input type="hidden" name="userid" id="inputRemoveUserId">
    <div class="fixed inset-0 z-50 hidden items-center justify-center bg-black bg-opacity-50" id="modalRemoveUser">
        <div class="max-w-md w-full">
            <div class="bg-white rounded-lg shadow-lg overflow-hidden">
                <div class="bg-blue-600 text-white px-4 py-3 flex justify-between items-center">
                    <h4 class="text-lg font-medium">
                        {lang key="userManagement.removeAccess"}
                    </h4>
                    <button type="button" class="text-white hover:text-gray-200" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="p-4">
                    <p class="mb-2">{lang key="userManagement.removeAccessSure"}</p>
                    <p>{lang key="userManagement.removeAccessInfo"}</p>
                </div>
                <div class="bg-gray-100 px-4 py-3 flex justify-end">
                    <button type="button" class="px-4 py-2 bg-gray-200 hover:bg-gray-300 rounded mr-2" data-dismiss="modal">
                        {lang key="cancel"}
                    </button>
                    <button type="submit" class="px-4 py-2 bg-blue-600 hover:bg-blue-700 text-white rounded" id="btnRemoveUserConfirm">
                        {lang key="confirm"}
                    </button>
                </div>
            </div>
        </div>
    </div>
</form>

<form method="post" action="{routePath('account-users-invite-cancel')}">
    <input type="hidden" name="inviteid" id="inputCancelInviteId">
    <div class="fixed inset-0 z-50 hidden items-center justify-center bg-black bg-opacity-50" id="modalCancelInvite">
        <div class="max-w-md w-full">
            <div class="bg-white rounded-lg shadow-lg overflow-hidden">
                <div class="bg-blue-600 text-white px-4 py-3 flex justify-between items-center">
                    <h4 class="text-lg font-medium">
                        {lang key="userManagement.cancelInvite"}
                    </h4>
                    <button type="button" class="text-white hover:text-gray-200" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="p-4">
                    <p class="mb-2">{lang key="userManagement.cancelInviteSure"}</p>
                    <p>{lang key="userManagement.cancelInviteInfo"}</p>
                </div>
                <div class="bg-gray-100 px-4 py-3 flex justify-end">
                    <button type="button" class="px-4 py-2 bg-gray-200 hover:bg-gray-300 rounded mr-2" data-dismiss="modal">
                        {lang key="cancel"}
                    </button>
                    <button type="submit" class="px-4 py-2 bg-blue-600 hover:bg-blue-700 text-white rounded" id="btnCancelInviteConfirm">
                        {lang key="confirm"}
                    </button>
                </div>
            </div>
        </div>
    </div>
</form>

<script>
    jQuery(document).ready(function() {
        jQuery('input:radio[name=permissions]').change(function () {
            if (this.value === 'choose') {
                jQuery('#invitePermissions').slideDown();
            } else {
                jQuery('#invitePermissions').slideUp();
            }
        });
        jQuery('.btn-manage-permissions').click(function(e) {
            if (jQuery(this).hasClass('cursor-not-allowed')) {
                e.preventDefault();
            }
        });
        jQuery('.btn-remove-user').click(function(e) {
            e.preventDefault();
            if (jQuery(this).hasClass('cursor-not-allowed')) {
                return;
            }
            jQuery('#inputRemoveUserId').val(jQuery(this).data('id'));
            jQuery('#modalRemoveUser').modal('show');
        });
        jQuery('.btn-cancel-invite').click(function(e) {
            e.preventDefault();
            jQuery('#inputCancelInviteId').val(jQuery(this).data('id'));
            jQuery('#modalCancelInvite').modal('show');
        });
    });
</script>