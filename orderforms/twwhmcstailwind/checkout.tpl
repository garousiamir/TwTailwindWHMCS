<script>
    // Define state tab index value
    var statesTab = 10;
    // Do not enforce state input client side
    var stateNotRequired = true;
</script>
{include file="orderforms/twwhmcstailwind/common.tpl"}
<script type="text/javascript" src="{$BASE_PATH_JS}/StatesDropdown.js"></script>
<script type="text/javascript" src="{$BASE_PATH_JS}/PasswordStrength.js"></script>
<script>
    window.langPasswordStrength = "{$LANG.pwstrength}";
    window.langPasswordWeak = "{$LANG.pwstrengthweak}";
    window.langPasswordModerate = "{$LANG.pwstrengthmoderate}";
    window.langPasswordStrong = "{$LANG.pwstrengthstrong}";
</script>
<div id="order-standard_cart" class="container mx-auto px-4">
    <div class="flex flex-col md:flex-row gap-6">
        <div class="cart-sidebar md:w-1/4">
            {include file="orderforms/twwhmcstailwind/sidebar-categories.tpl"}
        </div>
        <div class="cart-body md:w-3/4 p-8 bg-white shadow">
            <div class="border-b-2 pb-4 mb-6">
                <h1 class="text-4xl font-bold">{$LANG.orderForm.checkout}</h1>
            </div>
            {include file="orderforms/twwhmcstailwind/sidebar-categories-collapsed.tpl"}

            <div class="flex justify-between items-center mb-6">
                <p class="text-sm">{$LANG.orderForm.enterPersonalDetails}</p>
                <div class="space-x-2">
                    <button type="button" class="btn btn-info{if $loggedin || !$loggedin && $custtype eq "existing"} hidden{/if}" id="btnAlreadyRegistered">
                        {$LANG.orderForm.alreadyRegistered}
                    </button>
                    <button type="button" class="btn btn-warning{if $loggedin || $custtype neq "existing"} hidden{/if}" id="btnNewUserSignup">
                        {$LANG.orderForm.createAccount}
                    </button>
                </div>
            </div>

            {if $errormessage}
                <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded mb-6" role="alert">
                    <p>{$LANG.orderForm.correctErrors}:</p>
                    <ul class="list-disc ml-6">
                        {$errormessage}
                    </ul>
                </div>
            {/if}

            <form method="post" action="{$smarty.server.PHP_SELF}?a=checkout" name="orderfrm" id="frmCheckout" class="space-y-6">
                <input type="hidden" name="checkout" value="true" />
                <input type="hidden" name="custtype" id="inputCustType" value="{$custtype}" />

                {if $custtype neq "new" && $loggedin}
                    <div class="bg-gray-100 p-4 rounded">
                        <h2 class="text-lg font-semibold bg-primary px-4 py-2 -mx-4 -mt-4 rounded-t">
                            {lang key='switchAccount.title'}
                        </h2>
                        <div id="containerExistingAccountSelect" class="grid grid-cols-1 sm:grid-cols-2 gap-4 mt-4">
                            {foreach $accounts as $account}
                                <div class="account{if $selectedAccountId == $account->id} border-2 border-primary{/if} p-4 rounded bg-white shadow">
                                    <label class="flex items-start space-x-2 cursor-pointer">
                                        <input id="account{$account->id}" 
                                               class="account-select{if $account->isClosed || $account->noPermission || $inExpressCheckout} cursor-not-allowed{/if} mt-1" 
                                               type="radio" 
                                               name="account_id" 
                                               value="{$account->id}"
                                               {if $account->isClosed || $account->noPermission || $inExpressCheckout} disabled="disabled"{/if}
                                               {if $selectedAccountId == $account->id} checked="checked"{/if}>
                                        <span class="flex-1">
                                            <strong class="block">
                                                {if $account->company}{$account->company}{else}{$account->fullName}{/if}
                                            </strong>
                                            {if $account->isClosed || $account->noPermission}
                                                <span class="inline-block bg-gray-200 text-gray-700 text-xs px-2 py-1 rounded mt-1">
                                                    {if $account->isClosed}{lang key='closed'}{else}{lang key='noPermission'}{/if}
                                                </span>
                                            {elseif $account->currencyCode}
                                                <span class="inline-block bg-info text-white text-xs px-2 py-1 rounded mt-1">
                                                    {$account->currencyCode}
                                                </span>
                                            {/if}
                                            <br>
                                            <span class="text-sm text-gray-600 block mt-1">
                                                {$account->address1}{if $account->address2}, {$account->address2}{/if}<br>
                                                {if $account->city}{$account->city},{/if}
                                                {if $account->state} {$account->state},{/if}
                                                {if $account->postcode} {$account->postcode},{/if}
                                                {$account->countryName}
                                            </span>
                                        </span>
                                    </label>
                                </div>
                            {/foreach}
                            <div class="account border-b{if !$selectedAccountId || !is_numeric($selectedAccountId)} border-2 border-primary{/if} p-4 rounded bg-white shadow">
                                <label class="flex items-center space-x-2 cursor-pointer">
                                    <input class="account-select mt-1" 
                                           type="radio" 
                                           name="account_id" 
                                           value="new"
                                           {if !$selectedAccountId || !is_numeric($selectedAccountId)} checked="checked"{/if}
                                           {if $inExpressCheckout} disabled="disabled" class="cursor-not-allowed"{/if}>
                                    <span>{lang key='orderForm.createAccount'}</span>
                                </label>
                            </div>
                        </div>
                    </div>
                {/if}

                <div id="containerExistingUserSignin"{if $loggedin || $custtype neq "existing"} class="hidden{/if}">
                    <div class="bg-gray-100 p-4 rounded">
                        <h2 class="text-lg font-semibold bg-primary px-4 py-2 -mx-4 -mt-4 rounded-t">
                            {$LANG.orderForm.existingCustomerLogin}
                        </h2>
                        <div class="alert alert-danger hidden mt-4" id="existingLoginMessage"></div>
                        <div class="grid grid-cols-1 sm:grid-cols-2 gap-4 mt-4">
                            <div class="relative">
                                <span class="absolute inset-y-0 left-0 flex items-center pl-3">
                                    <i class="fas fa-envelope text-gray-400"></i>
                                </span>
                                <input type="text" 
                                       name="loginemail" 
                                       id="inputLoginEmail" 
                                       class="w-full pl-10 pr-4 py-2 border border-[#99a1af] rounded focus:ring-2 focus:ring-primary focus:border-primary" 
                                       placeholder="{$LANG.orderForm.emailAddress}" 
                                       value="{$loginemail}">
                            </div>
                            <div class="relative">
                                <span class="absolute inset-y-0 left-0 flex items-center pl-3">
                                    <i class="fas fa-lock text-gray-400"></i>
                                </span>
                                <input type="password" 
                                       name="loginpassword" 
                                       id="inputLoginPassword" 
                                       class="w-full pl-10 pr-4 py-2 border border-[#99a1af] rounded focus:ring-2 focus:ring-primary focus:border-primary" 
                                       placeholder="{$LANG.clientareapassword}">
                            </div>
                        </div>
                        <div class="text-center mt-4">
                            <button type="button" 
                                    id="btnExistingLogin" 
                                    class="btn btn-primary bg-[#1447e6] text-white p-[12px]">
                                <span id="existingLoginButton">{lang key='login'}</span>
                                <span id="existingLoginPleaseWait" class="hidden">{lang key='pleasewait'}</span>
                            </button>
                        </div>
                        {include file="orderforms/twwhmcstailwind/linkedaccounts.tpl" linkContext="checkout-existing"}
                    </div>
                </div>

                <div id="containerNewUserSignup"{if $custtype === 'existing' || (is_numeric($selectedAccountId) && $selectedAccountId > 0) || ($loggedin && $accounts->count() > 0 && $selectedAccountId !== 'new')} class="hidden"{/if}>
                    <div{if $loggedin} class="hidden"{/if}>
                        {include file="orderforms/twwhmcstailwind/linkedaccounts.tpl" linkContext="checkout-new"}
                    </div>

                    <div class="bg-gray-100 p-4 rounded">
                        <h2 class="text-lg font-semibold bg-primary px-4 py-2 -mx-4 -mt-4 rounded-t">
                            {$LANG.orderForm.personalInformation}
                        </h2>
                        <div class="grid grid-cols-1 sm:grid-cols-2 gap-4 mt-4">
                            <div class="relative">
                                <span class="absolute inset-y-0 left-0 flex items-center pl-3">
                                    <i class="fas fa-user text-gray-400"></i>
                                </span>
                                <input type="text" 
                                       name="firstname" 
                                       id="inputFirstName" 
                                       class="w-full pl-10 pr-4 py-2 border border-[#99a1af] rounded focus:ring-2 focus:ring-primary focus:border-primary" 
                                       placeholder="{$LANG.orderForm.firstName}" 
                                       value="{$clientsdetails.firstname}" 
                                       autofocus>
                            </div>
                            <div class="relative">
                                <span class="absolute inset-y-0 left-0 flex items-center pl-3">
                                    <i class="fas fa-user text-gray-400"></i>
                                </span>
                                <input type="text" 
                                       name="lastname" 
                                       id="inputLastName" 
                                       class="w-full pl-10 pr-4 py-2 border border-[#99a1af] rounded focus:ring-2 focus:ring-primary focus:border-primary" 
                                       placeholder="{$LANG.orderForm.lastName}" 
                                       value="{$clientsdetails.lastname}">
                            </div>
                            <div class="relative">
                                <span class="absolute inset-y-0 left-0 flex items-center pl-3">
                                    <i class="fas fa-envelope text-gray-400"></i>
                                </span>
                                <input type="email" 
                                       name="email" 
                                       id="inputEmail" 
                                       class="w-full pl-10 pr-4 py-2 border border-[#99a1af] rounded focus:ring-2 focus:ring-primary focus:border-primary" 
                                       placeholder="{$LANG.orderForm.emailAddress}" 
                                       value="{$clientsdetails.email}">
                            </div>
                            <div class="relative">
                                <span class="absolute inset-y-0 left-0 flex items-center pl-3">
                                    <i class="fas fa-phone text-gray-400"></i>
                                </span>
                                <input type="tel" 
                                       name="phonenumber" 
                                       id="inputPhone" 
                                       class="w-full pl-10 pr-4 py-2 border border-[#99a1af] rounded focus:ring-2 focus:ring-primary focus:border-primary" 
                                       placeholder="{$LANG.orderForm.phoneNumber}" 
                                       value="{$clientsdetails.phonenumber}">
                            </div>
                        </div>
                    </div>

                    <div class="bg-gray-100 p-4 rounded mt-6">
                        <h2 class="text-lg font-semibold bg-primary px-4 py-2 -mx-4 -mt-4 rounded-t">
                            {$LANG.orderForm.billingAddress}
                        </h2>
                        <div class="space-y-4 mt-4">
                            <div class="relative">
                                <span class="absolute inset-y-0 left-0 flex items-center pl-3">
                                    <i class="fas fa-building text-gray-400"></i>
                                </span>
                                <input type="text" 
                                       name="companyname" 
                                       id="inputCompanyName" 
                                       class="w-full pl-10 pr-4 py-2 border border-[#99a1af] rounded focus:ring-2 focus:ring-primary focus:border-primary" 
                                       placeholder="{$LANG.orderForm.companyName} ({$LANG.orderForm.optional})" 
                                       value="{$clientsdetails.companyname}">
                            </div>
                            <div class="relative">
                                <span class="absolute inset-y-0 left-0 flex items-center pl-3">
                                    <i class="far fa-building text-gray-400"></i>
                                </span>
                                <input type="text" 
                                       name="address1" 
                                       id="inputAddress1" 
                                       class="w-full pl-10 pr-4 py-2 border border-[#99a1af] rounded focus:ring-2 focus:ring-primary focus:border-primary" 
                                       placeholder="{$LANG.orderForm.streetAddress}" 
                                       value="{$clientsdetails.address1}">
                            </div>
                            <div class="relative">
                                <span class="absolute inset-y-0 left-0 flex items-center pl-3">
                                    <i class="fas fa-map-marker-alt text-gray-400"></i>
                                </span>
                                <input type="text" 
                                       name="address2" 
                                       id="inputAddress2" 
                                       class="w-full pl-10 pr-4 py-2 border border-[#99a1af] rounded focus:ring-2 focus:ring-primary focus:border-primary" 
                                       placeholder="{$LANG.orderForm.streetAddress2}" 
                                       value="{$clientsdetails.address2}">
                            </div>
                            <div class="grid grid-cols-1 sm:grid-cols-12 gap-4">
                                <div class="sm:col-span-4 relative">
                                    <span class="absolute inset-y-0 left-0 flex items-center pl-3">
                                        <i class="far fa-building text-gray-400"></i>
                                    </span>
                                    <input type="text" 
                                           name="city" 
                                           id="inputCity" 
                                           class="w-full pl-10 pr-4 py-2 border border-[#99a1af] rounded focus:ring-2 focus:ring-primary focus:border-primary" 
                                           placeholder="{$LANG.orderForm.city}" 
                                           value="{$clientsdetails.city}">
                                </div>
                                <div class="sm:col-span-5 relative">
                                    <span class="absolute inset-y-0 left-0 flex items-center pl-3">
                                        <i class="fas fa-map-signs text-gray-400"></i>
                                    </span>
                                    <input type="text" 
                                           name="state" 
                                           id="inputState" 
                                           class="w-full pl-10 pr-4 py-2 border border-[#99a1af] rounded focus:ring-2 focus:ring-primary focus:border-primary" 
                                           placeholder="{$LANG.orderForm.state}" 
                                           value="{$clientsdetails.state}">
                                </div>
                                <div class="sm:col-span-3 relative">
                                    <span class="absolute inset-y-0 left-0 flex items-center pl-3">
                                        <i class="fas fa-certificate text-gray-400"></i>
                                    </span>
                                    <input type="text" 
                                           name="postcode" 
                                           id="inputPostcode" 
                                           class="w-full pl-10 pr-4 py-2 border border-[#99a1af] rounded focus:ring-2 focus:ring-primary focus:border-primary" 
                                           placeholder="{$LANG.orderForm.postcode}" 
                                           value="{$clientsdetails.postcode}">
                                </div>
                            </div>
                            <div class="relative">
                                <span class="absolute inset-y-0 left-0 flex items-center pl-3">
                                    <i class="fas fa-globe text-gray-400"></i>
                                </span>
                                <select name="country" 
                                        id="inputCountry" 
                                        class="w-full pl-10 pr-4 py-2 border border-[#99a1af] rounded focus:ring-2 focus:ring-primary focus:border-primary appearance-none">
                                    {foreach $countries as $countrycode => $countrylabel}
                                        <option value="{$countrycode}"{if (!$country && $countrycode == $defaultcountry) || $countrycode eq $country} selected{/if}>
                                            {$countrylabel}
                                        </option>
                                    {/foreach}
                                </select>
                            </div>
                            {if $showTaxIdField}
                                <div class="relative">
                                    <span class="absolute inset-y-0 left-0 flex items-center pl-3">
                                        <i class="fas fa-building text-gray-400"></i>
                                    </span>
                                    <input type="text" 
                                           name="tax_id" 
                                           id="inputTaxId" 
                                           class="w-full pl-10 pr-4 py-2 border border-[#99a1af] rounded focus:ring-2 focus:ring-primary focus:border-primary" 
                                           placeholder="{$taxLabel} ({$LANG.orderForm.optional})" 
                                           value="{$clientsdetails.tax_id}">
                                </div>
                            {/if}
                        </div>
                    </div>

                    {if $customfields}
                        <div class="bg-gray-100 p-4 rounded mt-6">
                            <h2 class="text-lg font-semibold bg-primary px-4 py-2 -mx-4 -mt-4 rounded-t">
                                {$LANG.orderadditionalrequiredinfo}<br><i class="text-sm">{$LANG.orderForm.requiredField}</i>
                            </h2>
                            <div class="grid grid-cols-1 sm:grid-cols-2 gap-4 mt-4">
                                {foreach $customfields as $customfield}
                                    <div>
                                        <label for="customfield{$customfield.id}" class="block text-sm font-medium text-gray-700">
                                            {$customfield.name} {$customfield.required}
                                        </label>
                                        {$customfield.input}
                                        {if $customfield.description}
                                            <span class="text-sm text-gray-500 block mt-1">
                                                {$customfield.description}
                                            </span>
                                        {/if}
                                    </div>
                                {/foreach}
                            </div>
                        </div>
                    {/if}
                </div>

                {if $domainsinorder}
                    <div class="bg-gray-100 p-4 rounded mt-6">
                        <h2 class="text-lg font-semibold bg-primary px-4 py-2 -mx-4 -mt-4 rounded-t">
                            {$LANG.domainregistrantinfo}
                        </h2>
                        <p class="text-sm text-gray-600 mt-4">{$LANG.orderForm.domainAlternativeContact}</p>
                        <div class="mt-4 max-w-md mx-auto">
                            <select name="contact" 
                                    id="inputDomainContact" 
                                    class="w-full border rounded py-2 px-3 focus:ring-2 focus:ring-primary focus:border-primary">
                                <option value="">{$LANG.usedefaultcontact}</option>
                                {foreach $domaincontacts as $domcontact}
                                    <option value="{$domcontact.id}"{if $contact == $domcontact.id} selected{/if}>
                                        {$domcontact.name}
                                    </option>
                                {/foreach}
                                <option value="addingnew"{if $contact == "addingnew"} selected{/if}>
                                    {$LANG.clientareanavaddcontact}...
                                </option>
                            </select>
                        </div>

                        <div{if $contact neq "addingnew"} class="hidden{/if} id="domainRegistrantInputFields" class="mt-4 space-y-4">
                            <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                                <div class="relative">
                                    <span class="absolute inset-y-0 left-0 flex items-center pl-3">
                                        <i class="fas fa-user text-gray-400"></i>
                                    </span>
                                    <input type="text" 
                                           name="domaincontactfirstname" 
                                           id="inputDCFirstName" 
                                           class="w-full pl-10 pr-4 py-2 border border-[#99a1af] rounded focus:ring-2 focus:ring-primary focus:border-primary" 
                                           placeholder="{$LANG.orderForm.firstName}" 
                                           value="{$domaincontact.firstname}">
                                </div>
                                <div class="relative">
                                    <span class="absolute inset-y-0 left-0 flex items-center pl-3">
                                        <i class="fas fa-user text-gray-400"></i>
                                    </span>
                                    <input type="text" 
                                           name="domaincontactlastname" 
                                           id="inputDCLastName" 
                                           class="w-full pl-10 pr-4 py-2 border border-[#99a1af] rounded focus:ring-2 focus:ring-primary focus:border-primary" 
                                           placeholder="{$LANG.orderForm.lastName}" 
                                           value="{$domaincontact.lastname}">
                                </div>
                                <div class="relative">
                                    <span class="absolute inset-y-0 left-0 flex items-center pl-3">
                                        <i class="fas fa-envelope text-gray-400"></i>
                                    </span>
                                    <input type="email" 
                                           name="domaincontactemail" 
                                           id="inputDCEmail" 
                                           class="w-full pl-10 pr-4 py-2 border border-[#99a1af] rounded focus:ring-2 focus:ring-primary focus:border-primary" 
                                           placeholder="{$LANG.orderForm.emailAddress}" 
                                           value="{$domaincontact.email}">
                                </div>
                                <div class="relative">
                                    <span class="absolute inset-y-0 left-0 flex items-center pl-3">
                                        <i class="fas fa-phone text-gray-400"></i>
                                    </span>
                                    <input type="tel" 
                                           name="domaincontactphonenumber" 
                                           id="inputDCPhone" 
                                           class="w-full pl-10 pr-4 py-2 border border-[#99a1af] rounded focus:ring-2 focus:ring-primary focus:border-primary" 
                                           placeholder="{$LANG.orderForm.phoneNumber}" 
                                           value="{$domaincontact.phonenumber}">
                                </div>
                            </div>
                            <div class="relative">
                                <span class="absolute inset-y-0 left-0 flex items-center pl-3">
                                    <i class="fas fa-building text-gray-400"></i>
                                </span>
                                <input type="text" 
                                       name="domaincontactcompanyname" 
                                       id="inputDCCompanyName" 
                                       class="w-full pl-10 pr-4 py-2 border border-[#99a1af] rounded focus:ring-2 focus:ring-primary focus:border-primary" 
                                       placeholder="{$LANG.orderForm.companyName} ({$LANG.orderForm.optional})" 
                                       value="{$domaincontact.companyname}">
                            </div>
                            <div class="relative">
                                <span class="absolute inset-y-0 left-0 flex items-center pl-3">
                                    <i class="far fa-building text-gray-400"></i>
                                </span>
                                <input type="text" 
                                       name="domaincontactaddress1" 
                                       id="inputDCAddress1" 
                                       class="w-full pl-10 pr-4 py-2 border border-[#99a1af] rounded focus:ring-2 focus:ring-primary focus:border-primary" 
                                       placeholder="{$LANG.orderForm.streetAddress}" 
                                       value="{$domaincontact.address1}">
                            </div>
                            <div class="relative">
                                <span class="absolute inset-y-0 left-0 flex items-center pl-3">
                                    <i class="fas fa-map-marker-alt text-gray-400"></i>
                                </span>
                                <input type="text" 
                                       name="domaincontactaddress2" 
                                       id="inputDCAddress2" 
                                       class="w-full pl-10 pr-4 py-2 border border-[#99a1af] rounded focus:ring-2 focus:ring-primary focus:border-primary" 
                                       placeholder="{$LANG.orderForm.streetAddress2}" 
                                       value="{$domaincontact.address2}">
                            </div>
                            <div class="grid grid-cols-1 sm:grid-cols-12 gap-4">
                                <div class="sm:col-span-4 relative">
                                    <span class="absolute inset-y-0 left-0 flex items-center pl-3">
                                        <i class="far fa-building text-gray-400"></i>
                                    </span>
                                    <input type="text" 
                                           name="domaincontactcity" 
                                           id="inputDCCity" 
                                           class="w-full pl-10 pr-4 py-2 border border-[#99a1af] rounded focus:ring-2 focus:ring-primary focus:border-primary" 
                                           placeholder="{$LANG.orderForm.city}" 
                                           value="{$domaincontact.city}">
                                </div>
                                <div class="sm:col-span-5 relative">
                                    <span class="absolute inset-y-0 left-0 flex items-center pl-3">
                                        <i class="fas fa-map-signs text-gray-400"></i>
                                    </span>
                                    <input type="text" 
                                           name="domaincontactstate" 
                                           id="inputDCState" 
                                           class="w-full pl-10 pr-4 py-2 border border-[#99a1af] rounded focus:ring-2 focus:ring-primary focus:border-primary" 
                                           placeholder="{$LANG.orderForm.state}" 
                                           value="{$domaincontact.state}">
                                </div>
                                <div class="sm:col-span-3 relative">
                                    <span class="absolute inset-y-0 left-0 flex items-center pl-3">
                                        <i class="fas fa-certificate text-gray-400"></i>
                                    </span>
                                    <input type="text" 
                                           name="domaincontactpostcode" 
                                           id="inputDCPostcode" 
                                           class="w-full pl-10 pr-4 py-2 border border-[#99a1af] rounded focus:ring-2 focus:ring-primary focus:border-primary" 
                                           placeholder="{$LANG.orderForm.postcode}" 
                                           value="{$domaincontact.postcode}">
                                </div>
                            </div>
                            <div class="relative">
                                <span class="absolute inset-y-0 left-0 flex items-center pl-3">
                                    <i class="fas fa-globe text-gray-400"></i>
                                </span>
                                <select name="domaincontactcountry" 
                                        id="inputDCCountry" 
                                        class="w-full pl-10 pr-4 py-2 border border-[#99a1af] rounded focus:ring-2 focus:ring-primary focus:border-primary appearance-none">
                                    {foreach $countries as $countrycode => $countrylabel}
                                        <option value="{$countrycode}"{if (!$domaincontact.country && $countrycode == $defaultcountry) || $countrycode eq $domaincontact.country} selected{/if}>
                                            {$countrylabel}
                                        </option>
                                    {/foreach}
                                </select>
                            </div>
                            <div class="relative">
                                <span class="absolute inset-y-0 left-0 flex items-center pl-3">
                                    <i class="fas fa-building text-gray-400"></i>
                                </span>
                                <input type="text" 
                                       name="domaincontacttax_id" 
                                       id="inputDCTaxId" 
                                       class="w-full pl-10 pr-4 py-2 border border-[#99a1af] rounded focus:ring-2 focus:ring-primary focus:border-primary" 
                                       placeholder="{$taxLabel} ({$LANG.orderForm.optional})" 
                                       value="{$domaincontact.tax_id}">
                            </div>
                        </div>
                    </div>
                {/if}

                {if !$loggedin}
                    <div id="containerNewUserSecurity"{if (!$loggedin && $custtype eq "existing") || ($remote_auth_prelinked && !$securityquestions)} class="hidden{/if} class="bg-gray-100 p-4 rounded mt-6">
                        <h2 class="text-lg font-semibold bg-primary px-4 py-2 -mx-4 -mt-4 rounded-t">
                            {$LANG.orderForm.accountSecurity}
                        </h2>
                        <div id="containerPassword" class="space-y-4 mt-4{if $remote_auth_prelinked && $securityquestions} hidden{/if}">
                            <div id="passwdFeedback" class="bg-blue-100 text-blue-700 px-4 py-3 rounded text-center hidden"></div>
                            <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                                <div class="relative">
                                    <span class="absolute inset-y-0 left-0 flex items-center pl-3">
                                        <i class="fas fa-lock text-gray-400"></i>
                                    </span>
                                    <input type="password" 
                                           name="password" 
                                           id="inputNewPassword1" 
                                           data-error-threshold="{$pwStrengthErrorThreshold}" 
                                           data-warning-threshold="{$pwStrengthWarningThreshold}" 
                                           class="w-full pl-10 pr-4 py-2 border border-[#99a1af] rounded focus:ring-2 focus:ring-primary focus:border-primary" 
                                           placeholder="{$LANG.clientareapassword}"
                                           {if $remote_auth_prelinked} value="{$password}"{/if}>
                                </div>
                                <div class="relative">
                                    <span class="absolute inset-y-0 left-0 flex items-center pl-3">
                                        <i class="fas fa-lock text-gray-400"></i>
                                    </span>
                                    <input type="password" 
                                           name="password2" 
                                           id="inputNewPassword2" 
                                           class="w-full pl-10 pr-4 py-2 border border-[#99a1af] rounded focus:ring-2 focus:ring-primary focus:border-primary" 
                                           placeholder="{$LANG.clientareaconfirmpassword}"
                                           {if $remote_auth_prelinked} value="{$password}"{/if}>
                                </div>
                                <div>
                                    <button type="button" 
                                            class="btn btn-default btn-sm generate-password" 
                                            data-targetfields="inputNewPassword1,inputNewPassword2">
                                        {$LANG.generatePassword.btnLabel}
                                    </button>
                                </div>
                                <div>
                                    <div class="space-y-2">
                                        <div class="w-full bg-gray-200 rounded h-2">
                                            <div class="bg-green-500 h-2 rounded progress-bar" 
                                                 role="progressbar" 
                                                 aria-valuenow="0" 
                                                 aria-valuemin="0" 
                                                 aria-valuemax="100" 
                                                 id="passwordStrengthMeterBar">
                                            </div>
                                        </div>
                                        <p class="text-center text-sm text-gray-600" id="passwordStrengthTextLabel">
                                            {$LANG.pwstrength}: {$LANG.pwstrengthenter}
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        {if $securityquestions}
                            <div class="grid grid-cols-1 sm:grid-cols-2 gap-4 mt-4">
                                <select name="securityqid" 
                                        id="inputSecurityQId" 
                                        class="w-full border rounded py-2 px-3 focus:ring-2 focus:ring-primary focus:border-primary">
                                    <option value="">{$LANG.clientareasecurityquestion}</option>
                                    {foreach $securityquestions as $question}
                                        <option value="{$question.id}"{if $question.id eq $securityqid} selected{/if}>
                                            {$question.question}
                                        </option>
                                    {/foreach}
                                </select>
                                <div class="relative">
                                    <span class="absolute inset-y-0 left-0 flex items-center pl-3">
                                        <i class="fas fa-lock text-gray-400"></i>
                                    </span>
                                    <input type="password" 
                                           name="securityqans" 
                                           id="inputSecurityQAns" 
                                           class="w-full pl-10 pr-4 py-2 border border-[#99a1af] rounded focus:ring-2 focus:ring-primary focus:border-primary" 
                                           placeholder="{$LANG.clientareasecurityanswer}">
                                </div>
                            </div>
                        {/if}
                    </div>
                {/if}

                {foreach $hookOutput as $output}
                    <div class="mt-6">
                        {$output}
                    </div>
                {/foreach}

                <div class="bg-gray-100 p-4 rounded mt-6">
                    <h2 class="text-lg font-semibold bg-primary px-4 py-2 -mx-4 -mt-4 rounded-t">
                        {$LANG.orderForm.paymentDetails}
                    </h2>
                    <div class="bg-green-100 text-green-700 px-4 py-3 rounded text-center text-lg mt-4" 
                         role="alert" 
                         id="totalDueToday">
                        {$LANG.ordertotalduetoday}: <strong id="totalCartPrice">{$total}</strong>
                    </div>

                    <div id="applyCreditContainer" 
                         class="mt-4{if !$canUseCreditOnCheckout} hidden{/if}" 
                         data-apply-credit="{$applyCredit}">
                        <p class="text-center">{$LANG.cart.availableCreditBalance|replace:'$amount':$creditBalance}</p>
                        <div class="space-y-2 mt-2">
                            <label class="flex items-center space-x-2 cursor-pointer">
                                <input id="useCreditOnCheckout" 
                                       type="radio" 
                                       name="applycredit" 
                                       value="1"{if $applyCredit} checked{/if} 
                                       class="form-radio">
                                <span id="spanFullCredit"{if !($creditBalance->toNumeric() >= $total->toNumeric())} class="hidden"{/if}>
                                    {$LANG.cart.applyCreditAmountNoFurtherPayment|replace:'$amount':$total}
                                </span>
                                <span id="spanUseCredit"{if $creditBalance->toNumeric() >= $total->toNumeric()} class="hidden"{/if}>
                                    {$LANG.cart.applyCreditAmount|replace:'$amount':$creditBalance}
                                </span>
                            </label>
                            <label class="flex items-center space-x-2 cursor-pointer">
                                <input id="skipCreditOnCheckout" 
                                       type="radio" 
                                       name="applycredit" 
                                       value="0"{if !$applyCredit} checked{/if} 
                                       class="form-radio">
                                <span>{$LANG.cart.applyCreditSkip|replace:'$amount':$creditBalance}</span>
                            </label>
                        </div>
                    </div>

                    {if !$inExpressCheckout}
                        <div id="paymentGatewaysContainer" class="mt-4">
                            <p class="text-sm text-gray-600 text-center">{$LANG.orderForm.preferredPaymentMethod}</p>
                            <div class="flex flex-wrap justify-center gap-4 mt-2">
                                {foreach $gateways as $gateway}
                                    <label class="flex items-center space-x-2 cursor-pointer">
                                        <input type="radio"
                                               name="paymentmethod"
                                               value="{$gateway.sysname}"
                                               data-payment-type="{$gateway.payment_type}"
                                               data-show-local="{$gateway.show_local_cards}"
                                               data-remote-inputs="{$gateway.uses_remote_inputs}"
                                               class="form-radio payment-methods{if $gateway.type eq "CC"} is-credit-card{/if}"
                                               {if $selectedgateway eq $gateway.sysname} checked{/if}>
                                        <span>{$gateway.name}</span>
                                    </label>
                                {/foreach}
                            </div>
                        </div>

                        <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded mt-4 hidden" 
                             id="gateway-errors">
                        </div>

                        <div id="paymentGatewayInput" class="mt-4"></div>

                        <div class="cc-input-container mt-4{if $selectedgatewaytype neq "CC"} hidden{/if}" 
                             id="creditCardInputFields">
                            {if $client}
                                <div id="existingCardsContainer" class="grid grid-cols-1 sm:grid-cols-2 gap-4 mb-4">
                                    {include file="orderforms/twwhmcstailwind/includes/existing-paymethods.tpl"}
                                </div>
                            {/if}
                            <div class="cvv-input" id="existingCardInfo">
                                <div class="max-w-xs">
                                    <div class="relative">
                                        <span class="absolute inset-y-0 left-0 flex items-center pl-3">
                                            <i class="fas fa-barcode text-gray-400"></i>
                                        </span>
                                        <div class="flex">
                                            <input type="tel" 
                                                   name="cccvv" 
                                                   id="inputCardCVV2" 
                                                   class="flex-1 pl-10 pr-4 py-2 border rounded-l focus:ring-2 focus:ring-primary focus:border-primary" 
                                                   placeholder="{$LANG.creditcardcvvnumbershort}" 
                                                   autocomplete="cc-cvc">
                                            <button type="button" 
                                                    class="btn btn-default rounded-l-none" 
                                                    data-toggle="popover" 
                                                    data-placement="bottom" 
                                                    data-content="<img src='{$BASE_PATH_IMG}/ccv.gif' width='210' />">
                                                ?
                                            </button>
                                        </div>
                                        <span class="field-error-msg text-red-600 text-sm mt-1 block">
                                            {lang key="paymentMethodsManage.cvcNumberNotValid"}
                                        </span>
                                    </div>
                                </div>
                            </div>

                            <ul class="mt-4">
                                <li>
                                    <label class="flex items-center space-x-2 cursor-pointer">
                                        <input type="radio" 
                                               name="ccinfo" 
                                               value="new" 
                                               id="new" 
                                               {if !$client || $client->payMethods->count() === 0} checked="checked"{/if} 
                                               class="form-radio">
                                        <span>{lang key='creditcardenternewcard'}</span>
                                    </label>
                                </li>
                            </ul>

                            <div class="grid grid-cols-1 sm:grid-cols-12 gap-4 mt-4" id="newCardInfo">
                                <div class="sm:col-span-6 relative new-card-container">
                                    <span class="absolute inset-y-0 left-0 flex items-center pl-3">
                                        <i class="fas fa-credit-card text-gray-400"></i>
                                    </span>
                                    <input type="tel" 
                                           name="ccnumber" 
                                           id="inputCardNumber" 
                                           class="w-full pl-10 pr-4 py-2 border rounded cc-number-field focus:ring-2 focus:ring-primary focus:border-primary" 
                                           placeholder="{$LANG.orderForm.cardNumber}" 
                                           autocomplete="cc-number" 
                                           data-message-unsupported="{lang key='paymentMethodsManage.unsupportedCardType'}" 
                                           data-message-invalid="{lang key='paymentMethodsManage.cardNumberNotValid'}" 
                                           data-supported-cards="{$supportedCardTypes}">
                                    <span class="field-error-msg text-red-600 text-sm mt-1 block"></span>
                                </div>
                                <div class="sm:col-span-3 relative new-card-container">
                                    <span class="absolute inset-y-0 left-0 flex items-center pl-3">
                                        <i class="fas fa-calendar-alt text-gray-400"></i>
                                    </span>
                                    <input type="tel" 
                                           name="ccexpirydate" 
                                           id="inputCardExpiry" 
                                           class="w-full pl-10 pr-4 py-2 border border-[#99a1af] rounded focus:ring-2 focus:ring-primary focus:border-primary" 
                                           placeholder="MM / YY{if $showccissuestart} ({$LANG.creditcardcardexpires}){/if}" 
                                           autocomplete="cc-exp">
                                    <span class="field-error-msg text-red-600 text-sm mt-1 block">
                                        {lang key="paymentMethodsManage.expiryDateNotValid"}
                                    </span>
                                </div>
                                <div class="sm:col-span-3 relative" id="cvv-field-container">
                                    <span class="absolute inset-y-0 left-0 flex items-center pl-3">
                                        <i class="fas fa-barcode text-gray-400"></i>
                                    </span>
                                    <div class="flex">
                                        <input type="tel" 
                                               name="cccvv" 
                                               id="inputCardCVV" 
                                               class="flex-1 pl-10 pr-4 py-2 border rounded-l focus:ring-2 focus:ring-primary focus:border-primary" 
                                               placeholder="{$LANG.creditcardcvvnumbershort}" 
                                               autocomplete="cc-cvc">
                                        <button type="button" 
                                                class="btn btn-default rounded-l-none" 
                                                data-toggle="popover" 
                                                data-placement="bottom" 
                                                data-content="<img src='{$BASE_PATH_IMG}/ccv.gif' width='210' />">
                                            ?
                                        </button>
                                    </div>
                                    <span class="field-error-msg text-red-600 text-sm mt-1 block">
                                        {lang key="paymentMethodsManage.cvcNumberNotValid"}
                                    </span>
                                </div>
                                {if $showccissuestart}
                                    <div class="sm:col-span-3 sm:col-start-7 relative new-card-container">
                                        <span class="absolute inset-y-0 left-0 flex items-center pl-3">
                                            <i class="far fa-calendar-check text-gray-400"></i>
                                        </span>
                                        <input type="tel" 
                                               name="ccstartdate" 
                                               id="inputCardStart" 
                                               class="w-full pl-10 pr-4 py-2 border border-[#99a1af] rounded focus:ring-2 focus:ring-primary focus:border-primary" 
                                               placeholder="MM / YY ({$LANG.creditcardcardstart})" 
                                               autocomplete="cc-exp">
                                    </div>
                                    <div class="sm:col-span-3 relative new-card-container">
                                        <span class="absolute inset-y-0 left-0 flex items-center pl-3">
                                            <i class="fas fa-asterisk text-gray-400"></i>
                                        </span>
                                        <input type="tel" 
                                               name="ccissuenum" 
                                               id="inputCardIssue" 
                                               class="w-full pl-10 pr-4 py-2 border border-[#99a1af] rounded focus:ring-2 focus:ring-primary focus:border-primary" 
                                               placeholder="{$LANG.creditcardcardissuenum}">
                                    </div>
                                {/if}
                            </div>
                            <div id="newCardSaveSettings" class="mt-4">
                                <div class="grid grid-cols-1 md:grid-cols-2 gap-4 new-card-container">
                                    <div id="inputDescriptionContainer" class="relative">
                                        <span class="absolute inset-y-0 left-0 flex items-center pl-3">
                                            <i class="fas fa-pencil text-gray-400"></i>
                                        </span>
                                        <input type="text" 
                                               class="w-full pl-10 pr-4 py-2 border border-[#99a1af] rounded focus:ring-2 focus:ring-primary focus:border-primary" 
                                               id="inputDescription" 
                                               name="ccdescription" 
                                               autocomplete="off" 
                                               value="" 
                                               placeholder="{$LANG.paymentMethods.descriptionInput} {$LANG.paymentMethodsManage.optional}">
                                    </div>
                                    {if $allowClientsToRemoveCards}
                                        <div id="inputNoStoreContainer" class="flex items-center">
                                            <input type="hidden" name="nostore" value="1">
                                            <input type="checkbox" 
                                                   class="toggle-switch-success no-icheck" 
                                                   data-size="mini" 
                                                   checked="checked" 
                                                   name="nostore" 
                                                   id="inputNoStore" 
                                                   value="0" 
                                                   data-on-text="{lang key='yes'}" 
                                                   data-off-text="{lang key='no'}">
                                            <label for="inputNoStore" class="ml-2">
                                                {$LANG.creditCardStore}
                                            </label>
                                        </div>
                                    {/if}
                                </div>
                            </div>
                        </div>
                    {else}
                        {if $expressCheckoutOutput}
                            <div class="mt-4">
                                {$expressCheckoutOutput}
                            </div>
                        {else}
                            <p class="text-center mt-4">
                                {lang key='paymentPreApproved' gateway=$expressCheckoutGateway}
                            </p>
                        {/if}
                    {/if}
                </div>

                {if $shownotesfield}
                    <div class="bg-gray-100 p-4 rounded mt-6">
                        <h2 class="text-lg font-semibold bg-primary px-4 py-2 -mx-4 -mt-4 rounded-t">
                            {$LANG.orderForm.additionalNotes}
                        </h2>
                        <textarea name="notes" 
                                  class="w-full border border-[#99a1af] rounded p-3 mt-4 focus:ring-2 focus:ring-primary focus:border-primary" 
                                  rows="4" 
                                  placeholder="{$LANG.ordernotesdescription}">{$orderNotes}</textarea>
                    </div>
                {/if}

                {if $showMarketingEmailOptIn}
                    <div class="mt-6 border-t pt-4">
                        <h4 class="text-lg font-medium">{lang key='emailMarketing.joinOurMailingList'}</h4>
                        <p class="mt-2">{$marketingEmailOptInMessage}</p>
                        <input type="checkbox" 
                               name="marketingoptin" 
                               value="1"{if $marketingEmailOptIn} checked{/if} 
                               class="no-icheck toggle-switch-success" 
                               data-size="small" 
                               data-on-text="{lang key='yes'}" 
                               data-off-text="{lang key='no'}">
                    </div>
                {/if}

                <div class="text-center mt-6 space-y-4">
                    {if $accepttos}
                        <label class="flex items-center justify-center space-x-2 cursor-pointer">
                            <input type="checkbox" 
                                   name="accepttos" 
                                   id="accepttos" 
                                   class="form-checkbox">
                            <span>
                                {$LANG.ordertosagreement}
                                <a href="{$tosurl}" target="_blank" class="text-primary hover:underline">{$LANG.ordertos}</a>
                            </span>
                        </label>
                    {/if}
                    {if $captcha}
                        <div class="max-w-md mx-auto">
                            {include file="$template/includes/captcha.tpl"}
                        </div>
                    {/if}

                    <button type="submit"
                            id="btnCompleteOrder"
                            class="btn btn-primary btn-lg disable-on-click spinner-on-click bg-[#1447e6] text-white p-[12px]{if $captcha}{$captcha->getButtonClass($captchaForm)}{/if}"
                            {if $cartitems==0}disabled="disabled"{/if}>
                        {if $inExpressCheckout}{$LANG.confirmAndPay}{else}{$LANG.completeorder}{/if}
                        <i class="fas fa-arrow-circle-right ml-2"></i>
                    </button>
                </div>
            </form>

            {if $servedOverSsl}
                <div class="bg-yellow-100 border border-yellow-400 text-yellow-700 px-4 py-3 rounded mt-6 flex items-center">
                    <i class="fas fa-lock mr-2"></i>
                    <span>
                        {$LANG.ordersecure} (<strong>{$ipaddress}</strong>) {$LANG.ordersecure2}
                    </span>
                </div>
            {/if}
        </div>
    </div>
</div>

<script type="text/javascript" src="{$BASE_PATH_JS}/jquery.payment.js"></script>
<script>
    var hideCvcOnCheckoutForExistingCard = '{if $canUseCreditOnCheckout && $applyCredit && ($creditBalance->toNumeric() >= $total->toNumeric())}1{else}0{/if}';
</script>
{include file="orderforms/twwhmcstailwind/recommendations-modal.tpl"}