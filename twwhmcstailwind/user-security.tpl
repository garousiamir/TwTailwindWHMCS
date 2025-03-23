{include file="$template/includes/flashmessage.tpl"}

<p class="mb-4">{lang key='userManagement.settings'}</p>

{if $linkableProviders}
    <div class="bg-white shadow-md rounded-lg mb-6">
        <div class="p-6">
            <h3 class="text-xl font-semibold mb-4">{lang key='remoteAuthn.titleLinkedAccounts'}</h3>

            {include file="$template/includes/linkedaccounts.tpl" linkContext="clientsecurity" }

            <div class="my-4"></div>

            {include file="$template/includes/linkedaccounts.tpl" linkContext="linktable" }

            <div class="my-4"></div>
        </div>
    </div>
{/if}

{if $securityQuestions->count() > 0}
    <div class="bg-white shadow-md rounded-lg mb-6">
        <div class="p-6">
            <h3 class="text-xl font-semibold mb-4">{lang key='clientareanavsecurityquestions'}</h3>

            <form method="post" action="{routePath('user-security-question')}">
                {if $user->hasSecurityQuestion()}
                    <div class="mb-4">
                        <label for="inputCurrentAns" class="block text-gray-700 mb-1">{$user->getSecurityQuestion()}</label>
                        <input type="password" name="currentsecurityqans" id="inputCurrentAns" class="w-full p-2 border rounded focus:ring-2 focus:ring-blue-500" autocomplete="off" />
                    </div>
                {/if}

                <div class="mb-4">
                    <label for="inputSecurityQid" class="block text-gray-700 mb-1">{lang key='clientareasecurityquestion'}</label>
                    <select name="securityqid" id="inputSecurityQid" class="w-full p-2 border rounded focus:ring-2 focus:ring-blue-500">
                        {foreach $securityQuestions as $question}
                            <option value="{$question->id}">
                                {$question->question}
                            </option>
                        {/foreach}
                    </select>
                </div>

                <div class="grid md:grid-cols-2 gap-4 mb-4">
                    <div>
                        <label for="inputSecurityAns1" class="block text-gray-700 mb-1">{lang key='clientareasecurityanswer'}</label>
                        <input type="password" name="securityqans" id="inputSecurityAns1" class="w-full p-2 border rounded focus:ring-2 focus:ring-blue-500" autocomplete="off" />
                    </div>
                    <div>
                        <label for="inputSecurityAns2" class="block text-gray-700 mb-1">{lang key='clientareasecurityconfanswer'}</label>
                        <input type="password" name="securityqans2" id="inputSecurityAns2" class="w-full p-2 border rounded focus:ring-2 focus:ring-blue-500" autocomplete="off" />
                    </div>
                </div>

                <div class="flex gap-4">
                    <input class="bg-blue-600 hover:bg-blue-700 text-white py-2 px-6 rounded transition-colors cursor-pointer" type="submit" name="submit" value="{lang key='clientareasavechanges'}" />
                    <input class="bg-gray-200 hover:bg-gray-300 text-gray-800 py-2 px-6 rounded transition-colors cursor-pointer" type="reset" value="{lang key='cancel'}" />
                </div>
            </form>
        </div>
    </div>
{/if}

{if $twoFactorAuthAvailable}
    <div class="bg-white shadow-md rounded-lg">
        <div class="p-6">
            <h3 class="text-xl font-semibold mb-4">{lang key='twofactorauth'}</h3>

            <p class="twofa-config-link disable{if !$twoFactorAuthEnabled} hidden{/if} mb-2">
                {lang key='twofacurrently'} <strong>{lang key='enabled'|strtolower}</strong>
            </p>
            <p class="twofa-config-link enable{if $twoFactorAuthEnabled} hidden{/if} mb-2">
                {lang key='twofacurrently'} <strong>{lang key='disabled'|strtolower}</strong>
            </p>

            {if $twoFactorAuthRequired}
                {include file="$template/includes/alert.tpl" type="warning" msg="{lang key="clientAreaSecurityTwoFactorAuthRequired"}"}
            {else}
                {include file="$template/includes/alert.tpl" type="warning" msg="{lang key="clientAreaSecurityTwoFactorAuthRecommendation"}"}
            {/if}

            <div class="flex gap-4 mt-4">
                <a href="{routePath('account-security-two-factor-disable')}" class="twofa-config-link disable{if !$twoFactorAuthEnabled} hidden{/if} bg-red-600 hover:bg-red-700 text-white py-2 px-4 rounded transition-colors open-modal" data-modal-title="{lang key='twofadisable'}" data-modal-class="twofa-setup" data-btn-submit-label="{lang key='twofadisable'}" data-btn-submit-color="danger" data-btn-submit-id="btnDisable2FA">
                    {lang key='twofadisableclickhere'}
                </a>
                <a href="{routePath('account-security-two-factor-enable')}" class="twofa-config-link enable{if $twoFactorAuthEnabled} hidden{/if} bg-green-600 hover:bg-green-700 text-white py-2 px-4 rounded transition-colors open-modal" data-modal-title="{lang key='twofaenable'}" data-modal-class="twofa-setup" data-btn-submit-id="btnEnable2FA">
                    {lang key='twofaenableclickhere'}
                </a>
            </div>
        </div>
    </div>
{/if}