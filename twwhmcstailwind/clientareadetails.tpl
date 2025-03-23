{if $successful}
    {include file="$template/includes/alert.tpl" type="success" msg="{lang key='changessavedsuccessfully'}" textcenter=true}
{/if}

{if $errormessage}
    {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
{/if}

{if in_array('state', $optionalFields)}
    <script>
        var stateNotRequired = true;
    </script>
{/if}

<script type="text/javascript" src="{$BASE_PATH_JS}/StatesDropdown.js"></script>

<form method="post" action="?action=details" role="form">

    <div class="bg-white rounded-lg shadow-md mb-4">
        <div class="p-4">
            <h3 class="text-2xl font-bold mb-4">{lang key='clientareanavdetails'}</h3>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div>
                    <div class="form-group">
                        <label for="inputFirstName" class="block text-sm font-medium text-gray-700">
                            {lang key='clientareafirstname'}
                        </label>
                        <input type="text" name="firstname" id="inputFirstName" value="{$clientfirstname}"{if in_array('firstname', $uneditablefields)} disabled="disabled"{/if} class="form-control block w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500" />
                    </div>

                    <div class="form-group">
                        <label for="inputLastName" class="block text-sm font-medium text-gray-700">
                            {lang key='clientarealastname'}
                        </label>
                        <input type="text" name="lastname" id="inputLastName" value="{$clientlastname}"{if in_array('lastname', $uneditablefields)} disabled="disabled"{/if} class="form-control block w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500" />
                    </div>

                    <div class="form-group">
                        <label for="inputCompanyName" class="block text-sm font-medium text-gray-700">
                            {lang key='clientareacompanyname'}
                        </label>
                        <input type="text" name="companyname" id="inputCompanyName" value="{$clientcompanyname}"{if in_array('companyname', $uneditablefields)} disabled="disabled"{/if} class="form-control block w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500" />
                    </div>

                    <div class="form-group">
                        <label for="inputEmail" class="block text-sm font-medium text-gray-700">
                            {lang key='clientareaemail'}
                        </label>
                        <input type="email" name="email" id="inputEmail" value="{$clientemail}"{if in_array('email', $uneditablefields)} disabled="disabled"{/if} class="form-control block w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500" />
                    </div>
                </div>
                <div>
                    <div class="form-group">
                        <label for="inputAddress1" class="block text-sm font-medium text-gray-700">
                            {lang key='clientareaaddress1'}
                        </label>
                        <input type="text" name="address1" id="inputAddress1" value="{$clientaddress1}"{if in_array('address1', $uneditablefields)} disabled="disabled"{/if} class="form-control block w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500" />
                    </div>

                    <div class="form-group">
                        <label for="inputAddress2" class="block text-sm font-medium text-gray-700">
                            {lang key='clientareaaddress2'}
                        </label>
                        <input type="text" name="address2" id="inputAddress2" value="{$clientaddress2}"{if in_array('address2', $uneditablefields)} disabled="disabled"{/if} class="form-control block w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500" />
                    </div>

                    <div class="form-group">
                        <label for="inputCity" class="block text-sm font-medium text-gray-700">
                            {lang key='clientareacity'}
                        </label>
                        <input type="text" name="city" id="inputCity" value="{$clientcity}"{if in_array('city', $uneditablefields)} disabled="disabled"{/if} class="form-control block w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500" />
                    </div>

                    <div class="form-group">
                        <label for="inputState" class="block text-sm font-medium text-gray-700">
                            {lang key='clientareastate'}
                        </label>
                        <input type="text" name="state" id="inputState" value="{$clientstate}"{if in_array('state', $uneditablefields)} disabled="disabled"{/if} class="form-control block w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500" />
                    </div>

                    <div class="form-group">
                        <label for="inputPostcode" class="block text-sm font-medium text-gray-700">
                            {lang key='clientareapostcode'}
                        </label>
                        <input type="text" name="postcode" id="inputPostcode" value="{$clientpostcode}"{if in_array('postcode', $uneditablefields)} disabled="disabled"{/if} class="form-control block w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500" />
                    </div>

                    <div class="form-group">
                        <label class="block text-sm font-medium text-gray-700" for="country">
                            {lang key='clientareacountry'}
                        </label>
                        {$clientcountriesdropdown}
                    </div>

                    <div class="form-group">
                        <label for="inputPhone" class="block text-sm font-medium text-gray-700">
                            {lang key='clientareaphonenumber'}
                        </label>
                        <input type="tel" name="phonenumber" id="inputPhone" value="{$clientphonenumber}"{if in_array('phonenumber', $uneditablefields)} disabled="disabled"{/if} class="form-control block w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500" />
                    </div>
                </div>
                <div>
                    <div class="form-group">
                        <label for="inputPaymentMethod" class="block text-sm font-medium text-gray-700">
                            {lang key='paymentmethod'}
                        </label>
                        <select name="paymentmethod" id="inputPaymentMethod" class="form-control block w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500">
                            <option value="none">{lang key='paymentmethoddefault'}</option>
                            {foreach $paymentmethods as $method}
                                <option value="{$method.sysname}"{if $method.sysname eq $defaultpaymentmethod} selected="selected"{/if}>{$method.name}</option>
                            {/foreach}
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="inputBillingContact" class="block text-sm font-medium text-gray-700">
                            {lang key='defaultbillingcontact'}
                        </label>
                        <select name="billingcid" id="inputBillingContact" class="form-control block w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500">
                            <option value="0">{lang key='usedefaultcontact'}</option>
                            {foreach $contacts as $contact}
                                <option value="{$contact.id}"{if $contact.id eq $billingcid} selected="selected"{/if}>{$contact.name}</option>
                            {/foreach}
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="inputLanguage" class="block text-sm font-medium text-gray-700">
                            {lang key='clientarealanguage'}
                        </label>
                        <select name="accountLanguage" id="inputAccountLanguage" class="form-control block w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500"{if in_array('language', $uneditablefields)} disabled="disabled"{/if}>
                            <option value="">{lang key='default'}</option>
                            {foreach $languages as $language}
                                <option value="{$language}"{if $language eq $clientLanguage} selected="selected"{/if}>{$language|ucfirst}</option>
                            {/foreach}
                        </select>
                    </div>

                    {if $showTaxIdField}
                        <div class="form-group">
                            <label for="inputTaxId" class="block text-sm font-medium text-gray-700">
                                {lang key=$taxIdLabel}
                            </label>
                            <input type="text" name="tax_id" id="inputTaxId" class="form-control block w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500" value="{$clientTaxId}"{if in_array('tax_id', $uneditablefields)} disabled="disabled"{/if} />
                        </div>
                    {/if}

                    {if $customfields}
                        {foreach $customfields as $customfield}
                            <div class="form-group">
                                <label class="block text-sm font-medium text-gray-700" for="customfield{$customfield.id}">
                                    {$customfield.name}
                                </label>
                                <div class="control">
                                    {$customfield.input} {$customfield.description}
                                </div>
                            </div>
                        {/foreach}
                    {/if}
                </div>
            </div>
        </div>
    </div>

    {if $emailPreferencesEnabled}
        <div class="bg-white rounded-lg shadow-md mb-4">
            <div class="p-4">
                <h3 class="text-2xl font-bold mb-4">{lang key='clientareacontactsemails'}</h3>

                <div class="controls form-check">
                    {foreach $emailPreferences as $emailType => $value}
                        <label class="inline-flex items-center mb-2">
                            <input type="hidden" name="email_preferences[{$emailType}]" value="0">
                            <input type="checkbox" class="form-check-input h-4 w-4 text-indigo-600 focus:ring-indigo-500 border-gray-300 rounded mx-1" name="email_preferences[{$emailType}]" id="{$emailType}Emails" value="1"{if $value} checked="checked"{/if} />
                            <span class="ml-2 text-gray-700">
                                {lang key="emailPreferences."|cat:$emailType}
                            </span>
                        </label>
                    {/foreach}
                </div>
            </div>
        </div>
    {/if}

    {if $showMarketingEmailOptIn}
        <div class="bg-white rounded-lg shadow-md mb-4">
            <div class="p-4">
                <h3 class="text-2xl font-bold mb-4">{lang key='emailMarketing.joinOurMailingList'}</h3>
                <p>{$marketingEmailOptInMessage}</p>
                <label class="inline-flex items-center">
                    <input type="checkbox" name="marketingoptin" value="1"{if $marketingEmailOptIn} checked{/if} class="form-check-input h-4 w-4 text-indigo-600 focus:ring-indigo-500 border-gray-300 rounded mx-1" data-size="small" data-on-text="{lang key='yes'}" data-off-text="{lang key='no'}" />
                    <span class="ml-2 text-gray-700">{lang key='yes'}</span>
                </label>
            </div>
        </div>
    {/if}

    <div class="form-group text-center">
        <input class="inline-block px-4 py-2 bg-blue-500 text-white font-semibold rounded hover:bg-blue-600" type="submit" name="save" value="{lang key='clientareasavechanges'}" />
        <input class="inline-block px-4 py-2 bg-gray-200 text-gray-600 font-semibold rounded hover:bg-gray-300" type="reset" value="{lang key='cancel'}" />
    </div>

</form>