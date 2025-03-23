{if in_array('state', $optionalFields)}
    <script>
        var statesTab = 10,
            stateNotRequired = true;
    </script>
{/if}
<script src="{$BASE_PATH_JS}/StatesDropdown.js"></script>
<script src="{$BASE_PATH_JS}/PasswordStrength.js"></script>
<script>
    window.langPasswordStrength = "{lang key='pwstrength'}";
    window.langPasswordWeak = "{lang key='pwstrengthweak'}";
    window.langPasswordModerate = "{lang key='pwstrengthmoderate'}";
    window.langPasswordStrong = "{lang key='pwstrengthstrong'}";
    jQuery(document).ready(function() {
        jQuery("#inputNewPassword1").keyup(registerFormPasswordStrengthFeedback);
    });
</script>
{if $registrationDisabled}
    {include file="$template/includes/alert.tpl" type="error" msg="{lang key='registerCreateAccount'}"|cat:' <strong><a href="'|cat:"$WEB_ROOT"|cat:'/cart.php" class="alert-link">'|cat:"{lang key='registerCreateAccountOrder'}"|cat:'</a></strong>'}
{/if}
{if $errormessage}
    {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
{/if}
{if !$registrationDisabled}
    <div id="registration">
        <form method="post" class="using-password-strength" action="{$smarty.server.PHP_SELF}" role="form" name="orderfrm" id="frmCheckout">
            <input type="hidden" name="register" value="true"/>
            <div id="containerNewUserSignup">
                {include file="$template/includes/linkedaccounts.tpl" linkContext="registration"}
                <div class="bg-white rounded-lg shadow-md mb-4">
                    <div class="p-4" id="personalInformation">
                        <h3 class="text-2xl font-bold mb-4">{lang key='orderForm.personalInformation'}</h3>
                        <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                            <div>
                                <div class="relative">
                                    <label for="inputFirstName" class="absolute left-3 top-3 text-gray-500 text-sm peer-placeholder-shown:text-base peer-placeholder-shown:top-2 transition-all peer-focus:-top-3 peer-focus:text-sm peer-focus:text-gray-600">
                                        {lang key='orderForm.firstName'}
                                    </label>
                                    <input type="text" name="firstname" id="inputFirstName" class="peer h-10 w-full border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500" placeholder=" " value="{$clientfirstname}" {if !in_array('firstname', $optionalFields)}required{/if} autofocus>
                                </div>
                            </div>
                            <div>
                                <div class="relative">
                                    <label for="inputLastName" class="absolute left-3 top-3 text-gray-500 text-sm peer-placeholder-shown:text-base peer-placeholder-shown:top-2 transition-all peer-focus:-top-3 peer-focus:text-sm peer-focus:text-gray-600">
                                        {lang key='orderForm.lastName'}
                                    </label>
                                    <input type="text" name="lastname" id="inputLastName" class="peer h-10 w-full border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500" placeholder=" " value="{$clientlastname}" {if !in_array('lastname', $optionalFields)}required{/if}>
                                </div>
                            </div>
                            <div>
                                <div class="relative">
                                    <label for="inputEmail" class="absolute left-3 top-3 text-gray-500 text-sm peer-placeholder-shown:text-base peer-placeholder-shown:top-2 transition-all peer-focus:-top-3 peer-focus:text-sm peer-focus:text-gray-600">
                                        {lang key='orderForm.emailAddress'}
                                    </label>
                                    <input type="email" name="email" id="inputEmail" class="peer h-10 w-full border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500" placeholder=" " value="{$clientemail}">
                                </div>
                            </div>
                            <div>
                                <div class="relative">
                                    <label for="inputPhone" class="absolute left-3 top-3 text-gray-500 text-sm peer-placeholder-shown:text-base peer-placeholder-shown:top-2 transition-all peer-focus:-top-3 peer-focus:text-sm peer-focus:text-gray-600">
                                        {lang key='orderForm.phoneNumber'}
                                    </label>
                                    <input type="tel" name="phonenumber" id="inputPhone" class="peer h-10 w-full border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500" placeholder=" " value="{$clientphonenumber}">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="bg-white rounded-lg shadow-md mb-4">
                    <div class="p-4">
                        <h3 class="text-2xl font-bold mb-4">{lang key='orderForm.billingAddress'}</h3>
                        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-4">
                            <div class="col-span-full">
                                <div class="relative">
                                    <label for="inputCompanyName" class="absolute left-3 top-3 text-gray-500 text-sm peer-placeholder-shown:text-base peer-placeholder-shown:top-2 transition-all peer-focus:-top-3 peer-focus:text-sm peer-focus:text-gray-600">
                                        {lang key='orderForm.companyName'} ({lang key='orderForm.optional'})
                                    </label>
                                    <input type="text" name="companyname" id="inputCompanyName" class="peer h-10 w-full border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500" placeholder=" " value="{$clientcompanyname}">
                                </div>
                            </div>
                            <div class="col-span-full">
                                <div class="relative">
                                    <label for="inputAddress1" class="absolute left-3 top-3 text-gray-500 text-sm peer-placeholder-shown:text-base peer-placeholder-shown:top-2 transition-all peer-focus:-top-3 peer-focus:text-sm peer-focus:text-gray-600">
                                        {lang key='orderForm.streetAddress'}
                                    </label>
                                    <input type="text" name="address1" id="inputAddress1" class="peer h-10 w-full border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500" placeholder=" " value="{$clientaddress1}" {if !in_array('address1', $optionalFields)}required{/if}>
                                </div>
                            </div>
                            <div class="col-span-full">
                                <div class="relative">
                                    <label for="inputAddress2" class="absolute left-3 top-3 text-gray-500 text-sm peer-placeholder-shown:text-base peer-placeholder-shown:top-2 transition-all peer-focus:-top-3 peer-focus:text-sm peer-focus:text-gray-600">
                                        {lang key='orderForm.streetAddress2'}
                                    </label>
                                    <input type="text" name="address2" id="inputAddress2" class="peer h-10 w-full border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500" placeholder=" " value="{$clientaddress2}">
                                </div>
                            </div>
                            <div>
                                <div class="relative">
                                    <label for="inputCity" class="absolute left-3 top-3 text-gray-500 text-sm peer-placeholder-shown:text-base peer-placeholder-shown:top-2 transition-all peer-focus:-top-3 peer-focus:text-sm peer-focus:text-gray-600">
                                        {lang key='orderForm.city'}
                                    </label>
                                    <input type="text" name="city" id="inputCity" class="peer h-10 w-full border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500" placeholder=" " value="{$clientcity}" {if !in_array('city', $optionalFields)}required{/if}>
                                </div>
                            </div>
                            <div>
                                <div class="relative">
                                    <label for="state" class="absolute left-3 top-3 text-gray-500 text-sm peer-placeholder-shown:text-base peer-placeholder-shown:top-2 transition-all peer-focus:-top-3 peer-focus:text-sm peer-focus:text-gray-600">
                                        {lang key='orderForm.state'}
                                    </label>
                                    <input type="text" name="state" id="state" class="peer h-10 w-full border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500" placeholder=" " value="{$clientstate}" {if !in_array('state', $optionalFields)}required{/if}>
                                </div>
                            </div>
                            <div>
                                <div class="relative">
                                    <label for="inputPostcode" class="absolute left-3 top-3 text-gray-500 text-sm peer-placeholder-shown:text-base peer-placeholder-shown:top-2 transition-all peer-focus:-top-3 peer-focus:text-sm peer-focus:text-gray-600">
                                        {lang key='orderForm.postcode'}
                                    </label>
                                    <input type="text" name="postcode" id="inputPostcode" class="peer h-10 w-full border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500" placeholder=" " value="{$clientpostcode}" {if !in_array('postcode', $optionalFields)}required{/if}>
                                </div>
                            </div>
                            <div class="col-span-full">
                                <div class="relative">
                                    <label for="inputCountry" class="absolute left-3 top-3 text-gray-500 text-sm peer-placeholder-shown:text-base peer-placeholder-shown:top-2 transition-all peer-focus:-top-3 peer-focus:text-sm peer-focus:text-gray-600">
                                        {lang key='orderForm.country'}
                                    </label>
                                    <select name="country" id="inputCountry" class="peer h-10 w-full border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500">
                                        {foreach $clientcountries as $countryCode => $countryName}
                                            <option value="{$countryCode}"{if (!$clientcountry && $countryCode eq $defaultCountry) || ($countryCode eq $clientcountry)} selected="selected"{/if}>
                                                {$countryName}
                                            </option>
                                        {/foreach}
                                    </select>
                                </div>
                            </div>
                            {if $showTaxIdField}
                                <div class="col-span-full">
                                    <div class="relative">
                                        <label for="inputTaxId" class="absolute left-3 top-3 text-gray-500 text-sm peer-placeholder-shown:text-base peer-placeholder-shown:top-2 transition-all peer-focus:-top-3 peer-focus:text-sm peer-focus:text-gray-600">
                                            {$taxLabel} ({lang key='orderForm.optional'})
                                        </label>
                                        <input type="text" name="tax_id" id="inputTaxId" class="peer h-10 w-full border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500" placeholder=" " value="{$clientTaxId}">
                                    </div>
                                </div>
                            {/if}
                        </div>
                    </div>
                </div>
                {if $customfields || $currencies}
                    <div class="bg-white rounded-lg shadow-md mb-4">
                        <div class="p-4">
                            <h3 class="text-2xl font-bold mb-4">{lang key='orderadditionalrequiredinfo'}<br><i><small>{lang key='orderForm.requiredField'}</small></i></h3>
                            <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                                {if $customfields}
                                    {foreach $customfields as $customfield}
                                        <div>
                                            <div class="relative">
                                                <label for="customfield{$customfield.id}" class="absolute left-3 top-3 text-gray-500 text-sm peer-placeholder-shown:text-base peer-placeholder-shown:top-2 transition-all peer-focus:-top-3 peer-focus:text-sm peer-focus:text-gray-600">
                                                    {$customfield.name} {$customfield.required}
                                                </label>
                                                <div class="control">
                                                    {$customfield.input}
                                                    {if $customfield.description}
                                                        <span class="text-gray-500 text-sm mt-1 block">{$customfield.description}</span>
                                                    {/if}
                                                </div>
                                            </div>
                                        </div>
                                    {/foreach}
                                {/if}
                                {if $currencies}
                                    <div>
                                        <div class="relative">
                                            <label for="inputCurrency" class="absolute left-3 top-3 text-gray-500 text-sm peer-placeholder-shown:text-base peer-placeholder-shown:top-2 transition-all peer-focus:-top-3 peer-focus:text-sm peer-focus:text-gray-600">
                                                {lang key='orderForm.currency'}
                                            </label>
                                            <select id="inputCurrency" name="currency" class="peer h-10 w-full border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500">
                                                {foreach $currencies as $curr}
                                                    <option value="{$curr.id}"{if !$smarty.post.currency && $curr.default || $smarty.post.currency eq $curr.id } selected{/if}>{$curr.code}</option>
                                                {/foreach}
                                            </select>
                                        </div>
                                    </div>
                                {/if}
                            </div>
                        </div>
                    </div>
                {/if}
            </div>
            <div id="containerNewUserSecurity" {if $remote_auth_prelinked && !$securityquestions } class="hidden"{/if}>
                <div class="bg-white rounded-lg shadow-md mb-4">
                    <div class="p-4">
                        <h3 class="text-2xl font-bold mb-4">{lang key='orderForm.accountSecurity'}</h3>
                        <div id="containerPassword" class="grid grid-cols-1 sm:grid-cols-2 gap-4{if $remote_auth_prelinked && $securityquestions} hidden{/if}">
                            <div class="col-span-full">
                                <div id="passwdFeedback" class="alert alert-info text-center w-hidden"></div>
                            </div>
                            <div>
                                <div class="relative">
                                    <label for="inputNewPassword1" class="absolute left-3 top-3 text-gray-500 text-sm peer-placeholder-shown:text-base peer-placeholder-shown:top-2 transition-all peer-focus:-top-3 peer-focus:text-sm peer-focus:text-gray-600">
                                        {lang key='clientareapassword'}
                                    </label>
                                    <input type="password" name="password" id="inputNewPassword1" data-error-threshold="{$pwStrengthErrorThreshold}" data-warning-threshold="{$pwStrengthWarningThreshold}" class="peer h-10 w-full border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500" placeholder=" " autocomplete="off"{if $remote_auth_prelinked} value="{$password}"{/if}>
                                </div>
                            </div>
                            <div>
                                <div class="relative">
                                    <label for="inputNewPassword2" class="absolute left-3 top-3 text-gray-500 text-sm peer-placeholder-shown:text-base peer-placeholder-shown:top-2 transition-all peer-focus:-top-3 peer-focus:text-sm peer-focus:text-gray-600">
                                        {lang key='clientareaconfirmpassword'}
                                    </label>
                                    <input type="password" name="password2" id="inputNewPassword2" class="peer h-10 w-full border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500" placeholder=" " autocomplete="off"{if $remote_auth_prelinked} value="{$password}"{/if}>
                                </div>
                            </div>
                            <div>
                                <div class="form-group">
                                    <button type="button" class="inline-block px-4 py-2 bg-gray-200 text-gray-600 font-semibold rounded hover:bg-gray-300 generate-password" data-targetfields="inputNewPassword1,inputNewPassword2">
                                        {lang key='generatePassword.btnLabel'}
                                    </button>
                                </div>
                            </div>
                            <div>
                                <div class="password-strength-meter">
                                    <div class="w-full bg-gray-200 rounded-full h-2.5">
                                        <div class="bg-success bg-striped h-2.5 rounded-full" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" id="passwordStrengthMeterBar"></div>
                                    </div>
                                    <p class="text-center text-gray-500 text-sm mt-1" id="passwordStrengthTextLabel">{lang key='pwstrength'}: {lang key='pwstrengthenter'}</p>
                                </div>
                            </div>
                        </div>
                        {if $securityquestions}
                            <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                                <div>
                                    <div class="relative">
                                        <label for="inputSecurityQId" class="absolute left-3 top-3 text-gray-500 text-sm peer-placeholder-shown:text-base peer-placeholder-shown:top-2 transition-all peer-focus:-top-3 peer-focus:text-sm peer-focus:text-gray-600">
                                            {lang key='clientareasecurityquestion'}
                                        </label>
                                        <select name="securityqid" id="inputSecurityQId" class="peer h-10 w-full border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500">
                                            <option value="">{lang key='clientareasecurityquestion'}</option>
                                            {foreach $securityquestions as $question}
                                                <option value="{$question.id}"{if $question.id eq $securityqid} selected{/if}>
                                                    {$question.question}
                                                </option>
                                            {/foreach}
                                        </select>
                                    </div>
                                </div>
                                <div>
                                    <div class="relative">
                                        <label for="inputSecurityQAns" class="absolute left-3 top-3 text-gray-500 text-sm peer-placeholder-shown:text-base peer-placeholder-shown:top-2 transition-all peer-focus:-top-3 peer-focus:text-sm peer-focus:text-gray-600">
                                            {lang key='clientareasecurityanswer'}
                                        </label>
                                        <input type="password" name="securityqans" id="inputSecurityQAns" class="peer h-10 w-full border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500" placeholder=" " autocomplete="off">
                                    </div>
                                </div>
                            </div>
                        {/if}
                    </div>
                </div>
            </div>
            {if $showMarketingEmailOptIn}
                <div class="bg-white rounded-lg shadow-md mb-4">
                    <div class="p-4">
                        <h3 class="text-2xl font-bold mb-4">{lang key='emailMarketing.joinOurMailingList'}</h3>
                        <p class="text-gray-600 mb-4">{$marketingEmailOptInMessage}</p>
                        <label class="inline-flex items-center">
                            <input type="checkbox" name="marketingoptin" value="1"{if $marketingEmailOptIn} checked{/if} class="form-checkbox h-5 w-5 text-indigo-600">
                            <span class="ml-2 text-gray-700">{lang key='yes'}</span>
                        </label>
                    </div>
                </div>
            {/if}
            {include file="$template/includes/captcha.tpl"}
            {if $accepttos}
                <p class="text-center">
                    <label class="inline-flex items-center">
                        <input type="checkbox" name="accepttos" class="form-checkbox h-5 w-5 text-indigo-600">
                        {lang key='ordertosagreement'} <a href="{$tosurl}" target="_blank" class="text-blue-500 hover:text-blue-700">{lang key='ordertos'}</a>
                    </label>
                </p>
            {/if}
            <p class="text-center mt-6">
                <input class="inline-block px-6 py-3 bg-blue-500 text-white font-semibold rounded hover:bg-blue-600{$captcha->getButtonClass($captchaForm)}" type="submit" value="{lang key='clientregistertitle'}"/>
            </p>
        </form>
    </div>
{/if}