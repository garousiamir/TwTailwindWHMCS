<script>
    var stateNotRequired = true;
    jQuery(document).ready(function() {
        WHMCS.form.register();
    });
</script>
<script src="{$BASE_PATH_JS}/StatesDropdown.js"></script>

<div class="bg-blue-100 border-l-4 border-blue-500 p-4 mb-4">
    <form role="form" method="post" action="{routePath('account-contacts')}" class="flex flex-col md:flex-row items-center gap-4">
        <label for="inputContactId" class="md:w-1/4 text-gray-700">{lang key='clientareachoosecontact'}</label>
        <div class="md:w-1/2 w-full">
            <select name="contactid" id="inputContactId" onchange="submit()" class="w-full p-2 border rounded focus:ring-2 focus:ring-blue-500">
                {foreach $contacts as $contact}
                    <option value="{$contact.id}">{$contact.name} - {$contact.email}</option>
                {/foreach}
                <option value="new" selected="selected">{lang key='clientareanavaddcontact'}</option>
            </select>
        </div>
        <div class="md:w-1/6 w-full">
            <button type="submit" class="w-full bg-gray-500 hover:bg-gray-600 text-white py-2 px-4 rounded transition-colors">
                {lang key='go'}
            </button>
        </div>
    </form>
</div>

<div class="bg-white shadow-md rounded-lg mb-4">
    <div class="p-6">
        <h3 class="text-xl font-semibold mb-4">{lang key='clientareanavaddcontact'}</h3>

        <form role="form" method="post" action="{routePath('account-contacts-new')}" class="grid md:grid-cols-2 gap-6">
            <div>
                <div class="mb-4">
                    <label for="inputFirstName" class="block text-gray-700 mb-1">{lang key='clientareafirstname'}</label>
                    <input type="text" name="firstname" id="inputFirstName" value="{$formdata.firstname}" class="w-full p-2 border rounded focus:ring-2 focus:ring-blue-500" />
                </div>

                <div class="mb-4">
                    <label for="inputLastName" class="block text-gray-700 mb-1">{lang key='clientarealastname'}</label>
                    <input type="text" name="lastname" id="inputLastName" value="{$formdata.lastname}" class="w-full p-2 border rounded focus:ring-2 focus:ring-blue-500" />
                </div>

                <div class="mb-4">
                    <label for="inputCompanyName" class="block text-gray-700 mb-1">{lang key='clientareacompanyname'}</label>
                    <input type="text" name="companyname" id="inputCompanyName" value="{$formdata.companyname}" class="w-full p-2 border rounded focus:ring-2 focus:ring-blue-500" />
                </div>

                <div class="mb-4">
                    <label for="inputEmail" class="block text-gray-700 mb-1">{lang key='clientareaemail'}</label>
                    <input type="email" name="email" id="inputEmail" value="{$formdata.email}" class="w-full p-2 border rounded focus:ring-2 focus:ring-blue-500" />
                </div>

                <div class="mb-4">
                    <label for="inputPhone" class="block text-gray-700 mb-1">{lang key='clientareaphonenumber'}</label>
                    <input type="tel" name="phonenumber" id="inputPhone" value="{$formdata.phonenumber}" class="w-full p-2 border rounded focus:ring-2 focus:ring-blue-500" />
                </div>

                {if $showTaxIdField}
                    <div class="mb-4">
                        <label for="inputTaxId" class="block text-gray-700 mb-1">{lang key=$taxIdLabel}</label>
                        <input type="text" name="tax_id" id="inputTaxId" class="w-full p-2 border rounded focus:ring-2 focus:ring-blue-500" value="{$formdata.tax_id}" />
                    </div>
                {/if}
            </div>

            <div>
                <div class="mb-4">
                    <label for="inputAddress1" class="block text-gray-700 mb-1">{lang key='clientareaaddress1'}</label>
                    <input type="text" name="address1" id="inputAddress1" value="{$formdata.address1}" class="w-full p-2 border rounded focus:ring-2 focus:ring-blue-500" />
                </div>

                <div class="mb-4">
                    <label for="inputAddress2" class="block text-gray-700 mb-1">{lang key='clientareaaddress2'}</label>
                    <input type="text" name="address2" id="inputAddress2" value="{$formdata.address2}" class="w-full p-2 border rounded focus:ring-2 focus:ring-blue-500" />
                </div>

                <div class="mb-4">
                    <label for="inputCity" class="block text-gray-700 mb-1">{lang key='clientareacity'}</label>
                    <input type="text" name="city" id="inputCity" value="{$formdata.city}" class="w-full p-2 border rounded focus:ring-2 focus:ring-blue-500" />
                </div>

                <div class="mb-4">
                    <label for="inputState" class="block text-gray-700 mb-1">{lang key='clientareastate'}</label>
                    <input type="text" name="state" id="inputState" value="{$formdata.state}" class="w-full p-2 border rounded focus:ring-2 focus:ring-blue-500" />
                </div>

                <div class="mb-4">
                    <label for="inputPostcode" class="block text-gray-700 mb-1">{lang key='clientareapostcode'}</label>
                    <input type="text" name="postcode" id="inputPostcode" value="{$formdata.postcode}" class="w-full p-2 border rounded focus:ring-2 focus:ring-blue-500" />
                </div>

                <div class="mb-4">
                    <label class="block text-gray-700 mb-1" for="country">{lang key='clientareacountry'}</label>
                    {$countriesdropdown}
                </div>
            </div>
        </form>
    </div>
</div>

<div class="bg-white shadow-md rounded-lg mb-4">
    <div class="p-6">
        <h3 class="text-xl font-semibold mb-4">{lang key='clientareacontactsemails'}</h3>
        <div class="space-y-2">
            {foreach $formdata.emailPreferences as $emailType => $value}
                <label class="flex items-center">
                    <input type="hidden" name="email_preferences[{$emailType}]" value="0">
                    <input type="checkbox" class="mx-2 rounded border-gray-300 text-blue-600 focus:ring-blue-500" name="email_preferences[{$emailType}]" id="{$emailType}emails" value="1"{if $value} checked="checked"{/if} />
                    {lang key="clientareacontactsemails"|cat:$emailType}
                </label>
            {/foreach}
        </div>
    </div>
</div>

<div class="flex justify-center gap-4 mt-6">
    <input class="bg-blue-600 hover:bg-blue-700 text-white py-2 px-6 rounded transition-colors cursor-pointer" type="submit" name="save" value="{lang key='clientareasavechanges'}" />
    <input class="bg-gray-200 hover:bg-gray-300 text-gray-800 py-2 px-6 rounded transition-colors cursor-pointer" type="reset" value="{lang key='cancel'}" />
</div>