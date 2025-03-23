{include file="$template/includes/flashmessage.tpl"}

<div class="bg-white rounded-lg shadow-md mb-4">
    <div class="p-4">
        <h3 class="text-2xl font-bold mb-4">{lang key='userProfile.profile'}</h3>

        <form method="post" action="{routePath('user-profile-save')}">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div>
                    <div class="form-group">
                        <label for="inputFirstName" class="block text-sm font-medium text-gray-700">
                            {lang key='clientareafirstname'}
                        </label>
                        <input
                            type="text"
                            name="firstname"
                            id="inputFirstName"
                            value="{$user->firstName}"
                            class="form-control block w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500"
                            {if in_array('firstname', $uneditableFields)}disabled="disabled"{/if}
                        >
                    </div>
                </div>
                <div>
                    <div class="form-group">
                        <label for="inputLastName" class="block text-sm font-medium text-gray-700">
                            {lang key='clientarealastname'}
                        </label>
                        <input
                            type="text"
                            name="lastname"
                            id="inputLastName"
                            value="{$user->lastName}"
                            class="form-control block w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500"
                            {if in_array('lastname', $uneditableFields)}disabled="disabled"{/if}
                        >
                    </div>
                </div>
            </div>
            <div class="text-center mt-4">
                <input class="inline-block px-4 py-2 bg-blue-500 text-white font-semibold rounded hover:bg-blue-600" type="submit" name="save" value="{lang key='clientareasavechanges'}" />
                <input class="inline-block px-4 py-2 bg-gray-200 text-gray-600 font-semibold rounded hover:bg-gray-300" type="reset" value="{lang key='cancel'}" />
            </div>
        </form>
    </div>
</div>

<div class="bg-white rounded-lg shadow-md mb-4">
    <div class="p-4">
        <h3 class="text-2xl font-bold mb-4">{lang key='userProfile.changeEmail'}</h3>

        <p>
            {if $user->needsToCompleteEmailVerification()}
                <span class="bg-gray-200 text-gray-800 px-2 py-1 rounded">{lang key='userProfile.notVerified'}</span>
            {elseif $user->emailVerified()}
                <span class="bg-green-200 text-green-800 px-2 py-1 rounded">{lang key='userProfile.verified'}</span>
            {/if}
        </p>

        <form method="post" action="{routePath('user-profile-email-save')}">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div>
                    <div class="form-group">
                        <label for="inputEmail" class="block text-sm font-medium text-gray-700">
                            {lang key='clientareaemail'}
                        </label>
                        <input
                            type="email"
                            name="email"
                            id="inputEmail"
                            value="{$user->email}"
                            class="form-control block w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500"
                            {if in_array('email', $uneditableFields)}disabled="disabled"{/if}
                        >
                    </div>
                </div>
            </div>
            <div class="text-center mt-4">
                <input class="inline-block px-4 py-2 bg-blue-500 text-white font-semibold rounded hover:bg-blue-600" type="submit" name="save" value="{lang key='clientareasavechanges'}" />
                <input class="inline-block px-4 py-2 bg-gray-200 text-gray-600 font-semibold rounded hover:bg-gray-300" type="reset" value="{lang key='cancel'}" />
            </div>
        </form>
    </div>
</div>