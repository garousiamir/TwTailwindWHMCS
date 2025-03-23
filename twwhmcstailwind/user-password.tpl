<div class="bg-white shadow-md rounded-lg">
    <div class="p-6">
        <h3 class="text-xl font-semibold mb-4">{lang key='sidebars.viewAccount.changePassword'}</h3>

        {include file="$template/includes/flashmessage.tpl"}

        <form class="using-password-strength" method="post" action="{routePath('user-password')}" role="form">
            <input type="hidden" name="submit" value="true" />
            
            <div class="flex flex-col md:flex-row md:items-center mb-4 gap-4">
                <label for="inputExistingPassword" class="md:w-1/3 text-gray-700">{lang key='existingpassword'}</label>
                <div class="md:w-2/3">
                    <input type="password" class="w-full p-2 border rounded focus:ring-2 focus:ring-blue-500" name="existingpw" id="inputExistingPassword" autocomplete="off" />
                </div>
            </div>

            <div id="newPassword1" class="flex flex-col md:flex-row md:items-center mb-4 gap-4">
                <label for="inputNewPassword1" class="md:w-1/3 text-gray-700">{lang key='newpassword'}</label>
                <div class="md:w-1/2">
                    <input type="password" class="w-full p-2 border rounded focus:ring-2 focus:ring-blue-500" name="newpw" id="inputNewPassword1" autocomplete="off" />
                    {include file="$template/includes/pwstrength.tpl"}
                </div>
                <div class="md:w-1/6">
                    <button type="button" class="w-full bg-gray-500 hover:bg-gray-600 text-white py-2 px-4 rounded transition-colors generate-password" data-targetfields="inputNewPassword1,inputNewPassword2">
                        {lang key='generatePassword.btnLabel'}
                    </button>
                </div>
            </div>

            <div id="newPassword2" class="flex flex-col md:flex-row md:items-center mb-6 gap-4">
                <label for="inputNewPassword2" class="md:w-1/3 text-gray-700">{lang key='confirmnewpassword'}</label>
                <div class="md:w-2/3">
                    <input type="password" class="w-full p-2 border rounded focus:ring-2 focus:ring-blue-500" name="confirmpw" id="inputNewPassword2" autocomplete="off" />
                    <div id="inputNewPassword2Msg"></div>
                </div>
            </div>

            <div class="flex gap-4">
                <input class="bg-blue-600 hover:bg-blue-700 text-white py-2 px-6 rounded transition-colors cursor-pointer" type="submit" value="{lang key='clientareasavechanges'}" />
                <input class="bg-gray-200 hover:bg-gray-300 text-gray-800 py-2 px-6 rounded transition-colors cursor-pointer" type="reset" value="{lang key='cancel'}" />
            </div>
        </form>
    </div>
</div>