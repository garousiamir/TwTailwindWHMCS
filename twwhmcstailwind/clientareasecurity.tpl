{if $showSsoSetting}
    <div class="bg-white rounded-lg shadow-md mb-4">
        <div class="p-4">
            <h3 class="text-2xl font-bold mb-4">{lang key='sso.title'}</h3>

            {include file="$template/includes/alert.tpl" type="success" msg="{lang key='sso.summary'}"}

            <form id="frmSingleSignOn">
                <input type="hidden" name="token" value="{$token}" />
                <input type="hidden" name="action" value="security" />
                <input type="hidden" name="toggle_sso" value="1" />
                <div class="flex items-center mb-4">
                    <input type="checkbox" name="allow_sso" class="form-check-input h-4 w-4 text-indigo-600 focus:ring-indigo-500 border-gray-300 rounded mx-1" id="inputAllowSso"{if $isSsoEnabled} checked{/if}>
                    <label for="inputAllowSso" class="ml-2 text-gray-700">
                        <span id="ssoStatusTextEnabled"{if !$isSsoEnabled} class="hidden"{/if}>
                            {lang key='sso.enabled'}
                        </span>
                        <span id="ssoStatusTextDisabled"{if $isSsoEnabled} class="hidden"{/if}>
                            {lang key='sso.disabled'}
                        </span>
                    </label>
                </div>
            </form>

            <p class="text-gray-500">{lang key='sso.disablenotice'}</p>
        </div>
    </div>
{/if}