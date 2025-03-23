<script src="{$BASE_PATH_JS}/StatesDropdown.js"></script>

<div class="bg-blue-100 border border-blue-200 p-4 mb-6 rounded">
    <form role="form" method="post" action="{routePath('account-contacts')}">
        <div class="flex flex-col md:flex-row md:items-center">
            <label for="inputContactId" class="md:w-1/4 mb-2 md:mb-0">{lang key='clientareachoosecontact'}</label>
            <div class="md:w-1/2 mb-2 md:mb-0">
                <select name="contactid" id="inputContactId" onchange="submit()" class="w-full px-3 py-2 border border-gray-300 rounded">
                    {foreach $contacts as $contact}
                        <option value="{$contact.id}"{if $contact.id eq $contactid} selected="selected"{/if}>{$contact.name} - {$contact.email}</option>
                    {/foreach}
                    <option value="new">{lang key='clientareanavaddcontact'}</option>
                </select>
            </div>
            <div class="md:w-1/6 md:ml-4">
                <button type="submit" class="w-full px-4 py-2 bg-gray-200 hover:bg-gray-300 rounded">{lang key='go'}</button>
            </div>
        </div>
    </form>
</div>

<div class="bg-white rounded-lg shadow mb-6">
    <div class="p-6">

        <h3 class="text-xl font-semibold mb-4">{lang key="contactDetails"}</h3>

        {include file="$template/includes/flashmessage.tpl"}
        {if $errorMessageHtml}
            {include file="$template/includes/alert.tpl" type="error" errorshtml=$errorMessageHtml}
        {/if}

        <form role="form" method="post" action="{routePath('account-contacts-save')}">
            <input type="hidden" name="contactid" value="{$contactid}" />

            <div class="md:flex md:flex-wrap md:-mx-3">
                <div class="md:w-1/2 md:px-3 mb-6">

                    <div class="mb-4">
                        <label for="inputFirstName" class="block mb-2">{lang key='clientareafirstname'}</label>
                        <input type="text" name="firstname" id="inputFirstName" value="{$formdata.firstname}" class="w-full px-3 py-2 border border-gray-300 rounded" />
                    </div>

                    <div class="mb-4">
                        <label for="inputLastName" class="block mb-2">{lang key='clientarealastname'}</label>
                        <input type="text" name="lastname" id="inputLastName" value="{$formdata.lastname}" class="w-full px-3 py-2 border border-gray-300 rounded" />
                    </div>

                    <div class="mb-4">
                        <label for="inputCompanyName" class="block mb-2">{lang key='clientareacompanyname'}</label>
                        <input type="text" name="companyname" id="inputCompanyName" value="{$formdata.companyname}" class="w-full px-3 py-2 border border-gray-300 rounded" />
                    </div>

                    <div class="mb-4">
                        <label for="inputEmail" class="block mb-2">{lang key='clientareaemail'}</label>
                        <input type="email" name="email" id="inputEmail" value="{$formdata.email}" class="w-full px-3 py-2 border border-gray-300 rounded" />
                    </div>

                    <div class="mb-4">
                        <label for="inputPhone" class="block mb-2">{lang key='clientareaphonenumber'}</label>
                        <input type="tel" name="phonenumber" id="inputPhone" value="{$formdata.phonenumber}" class="w-full px-3 py-2 border border-gray-300 rounded" />
                    </div>

                    <div class="mb-4">
                        <label for="inputTaxId" class="block mb-2">{lang key=$taxIdLabel}</label>
                        <input type="text" name="tax_id" id="inputTaxId" class="w-full px-3 py-2 border border-gray-300 rounded" value="{$formdata.tax_id}" />
                    </div>

                </div>
                <div class="md:w-1/2 md:px-3">

                    <div class="mb-4">
                        <label for="inputAddress1" class="block mb-2">{lang key='clientareaaddress1'}</label>
                        <input type="text" name="address1" id="inputAddress1" value="{$formdata.address1}" class="w-full px-3 py-2 border border-gray-300 rounded" />
                    </div>

                    <div class="mb-4">
                        <label for="inputAddress2" class="block mb-2">{lang key='clientareaaddress2'}</label>
                        <input type="text" name="address2" id="inputAddress2" value="{$formdata.address2}" class="w-full px-3 py-2 border border-gray-300 rounded" />
                    </div>

                    <div class="mb-4">
                        <label for="inputCity" class="block mb-2">{lang key='clientareacity'}</label>
                        <input type="text" name="city" id="inputCity" value="{$formdata.city}" class="w-full px-3 py-2 border border-gray-300 rounded" />
                    </div>

                    <div class="mb-4">
                        <label for="inputState" class="block mb-2">{lang key='clientareastate'}</label>
                        <input type="text" name="state" id="inputState" value="{$formdata.state}" class="w-full px-3 py-2 border border-gray-300 rounded" />
                    </div>

                    <div class="mb-4">
                        <label for="inputPostcode" class="block mb-2">{lang key='clientareapostcode'}</label>
                        <input type="text" name="postcode" id="inputPostcode" value="{$formdata.postcode}" class="w-full px-3 py-2 border border-gray-300 rounded" />
                    </div>

                    <div class="mb-4">
                        <label class="block mb-2" for="country">{lang key='clientareacountry'}</label>
                        {$countriesdropdown}
                    </div>

                </div>
            </div>

    </div>
</div>

<div class="bg-white rounded-lg shadow mb-6">
    <div class="p-6">

        <h3 class="text-xl font-semibold mb-4">{lang key='clientareacontactsemails'}</h3>
        <div class="mb-4">
            {foreach $formdata.emailPreferences as $emailType => $value}
                <div class="mb-2">
                    <label class="inline-flex items-center">
                        <input type="hidden" name="email_preferences[{$emailType}]" value="0">
                        <input type="checkbox" class="form-checkbox" name="email_preferences[{$emailType}]" id="{$emailType}emails" value="1"{if $value} checked="checked"{/if} />
                        <span class="ml-2">{lang key="clientareacontactsemails"|cat:$emailType}</span>
                    </label>
                </div>
            {/foreach}
        </div>

    </div>
</div>

<div class="flex justify-center space-x-4 mb-6">
    <input class="px-4 py-2 bg-blue-600 hover:bg-blue-700 text-white rounded" type="submit" name="save" value="{lang key='clientareasavechanges'}" />
    <input class="px-4 py-2 bg-gray-200 hover:bg-gray-300 rounded" type="reset" value="{lang key='cancel'}" />
    <button type="button" class="px-4 py-2 bg-red-600 hover:bg-red-700 text-white rounded" data-toggle="modal" data-target="#modalDeleteContact">{lang key='clientareadeletecontact'}</button>
</div>

</form>

<form method="post" action="{routePath('account-contacts-delete')}">
    <input type="hidden" name="contactid" value="{$contactid}">
    <div class="fixed inset-0 z-50 hidden items-center justify-center bg-black bg-opacity-50" id="modalDeleteContact">
        <div class="max-w-md w-full">
            <div class="bg-white rounded-lg shadow-lg overflow-hidden">
                <div class="px-4 py-3 border-b flex justify-between items-center">
                    <h4 class="text-lg font-medium">
                        {lang key="clientareadeletecontact"}
                    </h4>
                    <button type="button" class="text-gray-600 hover:text-gray-800" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="p-4">
                    <p>{lang key="clientareadeletecontactareyousure"}</p>
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