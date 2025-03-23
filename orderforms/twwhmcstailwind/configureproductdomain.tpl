{include file="orderforms/twwhmcstailwind/common.tpl"}

<div id="order-standard_cart">

    <div class="flex flex-col md:flex-row">
        <div class="md:w-1/4 cart-sidebar">
            {include file="orderforms/twwhmcstailwind/sidebar-categories.tpl"}
        </div>

        <div class="md:w-3/4 cart-body">
            <div class="mb-6">
                <h1 class="text-4xl">{$LANG.domaincheckerchoosedomain}</h1>
            </div>
            {include file="orderforms/twwhmcstailwind/sidebar-categories-collapsed.tpl"}
            <form id="frmProductDomain">
                <input type="hidden" id="frmProductDomainPid" value="{$pid}" />
                <div class="space-y-4 domain-selection-options">
                    {if $incartdomains}
                        <div class="bg-white p-4 rounded shadow-sm option">
                            <label class="flex items-center">
                                <input type="radio" name="domainoption" value="incart" id="selincart" class="mr-2" />{$LANG.cartproductdomainuseincart}
                            </label>
                            <div class="hidden domain-input-group" id="domainincart">
                                <div class="flex flex-col md:flex-row">
                                    <div class="md:ml-8 md:w-3/5">
                                        <div class="domains-row">
                                            <select id="incartsld" name="incartdomain" class="w-full p-2 border border-[#d5d5d5] rounded">
                                                {foreach key=num item=incartdomain from=$incartdomains}
                                                    <option value="{$incartdomain}">{$incartdomain}</option>
                                                {/foreach}
                                            </select>
                                        </div>
                                    </div>
                                    <div class="mt-2 md:mt-0 md:ml-4 md:w-1/6">
                                        <button type="submit" class="w-full bg-blue-600 hover:bg-blue-700 text-white p-2 rounded">
                                            {$LANG.orderForm.use}
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    {/if}
                    {if $registerdomainenabled}
                        <div class="bg-white p-4 rounded shadow-sm option">
                            <label class="flex items-center">
                                <input type="radio" name="domainoption" value="register" id="selregister"{if $domainoption eq "register"} checked{/if} class="mr-2" />{$LANG.cartregisterdomainchoice|sprintf2:$companyname}
                            </label>
                            <div class="hidden domain-input-group" id="domainregister">
                                <div class="flex flex-col md:flex-row">
                                    <div class="md:ml-8 md:w-3/5">
                                        <div class="flex domains-row">
                                            <div class="w-3/4 pr-2">
                                                <div class="flex">
                                                    <div class="bg-gray-100 flex items-center justify-center px-3 border border-[#d5d5d5] border-r-0 rounded-l">
                                                        <span>{$LANG.orderForm.www}</span>
                                                    </div>
                                                    <input type="text" id="registersld" value="{$sld}" class="w-full p-2 border border-[#d5d5d5] rounded-r" autocapitalize="none" data-toggle="tooltip" data-placement="top" data-trigger="manual" title="{lang key='orderForm.enterDomain'}" />
                                                </div>
                                            </div>
                                            <div class="w-1/4">
                                                <select id="registertld" class="w-full p-2 border border-[#d5d5d5] rounded">
                                                    {foreach from=$registertlds item=listtld}
                                                        <option value="{$listtld}"{if $listtld eq $tld} selected="selected"{/if}>{$listtld}</option>
                                                    {/foreach}
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mt-2 md:mt-0 md:ml-4 md:w-1/6">
                                        <button type="submit" class="w-full bg-blue-600 hover:bg-blue-700 text-white p-2 rounded">
                                            {$LANG.orderForm.check}
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    {/if}
                    {if $transferdomainenabled}
                        <div class="bg-white p-4 rounded shadow-sm option">
                            <label class="flex items-center">
                                <input type="radio" name="domainoption" value="transfer" id="seltransfer"{if $domainoption eq "transfer"} checked{/if} class="mr-2" />{$LANG.carttransferdomainchoice|sprintf2:$companyname}
                            </label>
                            <div class="hidden domain-input-group" id="domaintransfer">
                                <div class="flex flex-col md:flex-row">
                                    <div class="md:ml-8 md:w-3/5">
                                        <div class="flex domains-row">
                                            <div class="w-3/4 pr-2">
                                                <div class="flex">
                                                    <div class="bg-gray-100 flex items-center justify-center px-3 border border-[#d5d5d5] border-r-0 rounded-l">
                                                        <span>{$LANG.orderForm.www}</span>
                                                    </div>
                                                    <input type="text" id="transfersld" value="{$sld}" class="w-full p-2 border border-[#d5d5d5] rounded-r" autocapitalize="none" data-toggle="tooltip" data-placement="top" data-trigger="manual" title="{lang key='orderForm.enterDomain'}"/>
                                                </div>
                                            </div>
                                            <div class="w-1/4">
                                                <select id="transfertld" class="w-full p-2 border border-[#d5d5d5] rounded">
                                                    {foreach from=$transfertlds item=listtld}
                                                        <option value="{$listtld}"{if $listtld eq $tld} selected="selected"{/if}>{$listtld}</option>
                                                    {/foreach}
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mt-2 md:mt-0 md:ml-4 md:w-1/6">
                                        <button type="submit" class="w-full bg-blue-600 hover:bg-blue-700 text-white p-2 rounded">
                                            {$LANG.orderForm.transfer}
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    {/if}
                    {if $owndomainenabled}
                        <div class="bg-white p-4 rounded shadow-sm option">
                            <label class="flex items-center">
                                <input type="radio" name="domainoption" value="owndomain" id="selowndomain"{if $domainoption eq "owndomain"} checked{/if} class="mr-2" />{$LANG.cartexistingdomainchoice|sprintf2:$companyname}
                            </label>
                            <div class="hidden domain-input-group" id="domainowndomain">
                                <div class="flex flex-col md:flex-row">
                                    <div class="md:ml-8 md:w-3/5">
                                        <div class="flex domains-row">
                                            <div class="w-3/4 pr-2">
                                                <div class="flex">
                                                    <div class="bg-gray-100 flex items-center justify-center px-3 border border-[#d5d5d5] border-r-0 rounded-l">
                                                        <span>{lang key='orderForm.www'}</span>
                                                    </div>
                                                    <input type="text" id="owndomainsld" value="{$sld}" placeholder="{lang key='yourdomainplaceholder'}" class="w-full p-2 border border-[#d5d5d5] rounded-r" autocapitalize="none" data-toggle="tooltip" data-placement="top" data-trigger="manual" title="{lang key='orderForm.enterDomain'}" />
                                                </div>
                                            </div>
                                            <div class="w-1/4">
                                                <input type="text" id="owndomaintld" value="{$tld|substr:1}" placeholder="{$LANG.yourtldplaceholder}" class="w-full p-2 border border-[#d5d5d5] rounded" autocapitalize="none" data-toggle="tooltip" data-placement="top" data-trigger="manual" title="{lang key='orderForm.required'}" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mt-2 md:mt-0 md:ml-4 md:w-1/6">
                                        <button type="submit" class="w-full bg-blue-600 hover:bg-blue-700 text-white p-2 rounded" id="useOwnDomain">
                                            {$LANG.orderForm.use}
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    {/if}
                    {if $subdomains}
                        <div class="bg-white p-4 rounded shadow-sm option">
                            <label class="flex items-center">
                                <input type="radio" name="domainoption" value="subdomain" id="selsubdomain"{if $domainoption eq "subdomain"} checked{/if} class="mr-2" />{$LANG.cartsubdomainchoice|sprintf2:$companyname}
                            </label>
                            <div class="hidden domain-input-group" id="domainsubdomain">
                                <div class="flex flex-col md:flex-row">
                                    <div class="md:w-4/5">
                                        <div class="flex domains-row">
                                            <div class="w-1/6 flex items-center justify-end pr-2">
                                                <p>http://</p>
                                            </div>
                                            <div class="w-2/5 pr-2">
                                                <input type="text" id="subdomainsld" value="{$sld}" placeholder="yourname" class="w-full p-2 border border-[#d5d5d5] rounded" autocapitalize="none" data-toggle="tooltip" data-placement="top" data-trigger="manual" title="{lang key='orderForm.enterDomain'}" />
                                            </div>
                                            <div class="w-2/5">
                                                <select id="subdomaintld" class="w-full p-2 border border-[#d5d5d5] rounded">
                                                    {foreach $subdomains as $subid => $subdomain}
                                                        <option value="{$subid}">{$subdomain}</option>
                                                    {/foreach}
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mt-2 md:mt-0 md:ml-4 md:w-1/6">
                                        <button type="submit" class="w-full bg-blue-600 hover:bg-blue-700 text-white p-2 rounded">
                                            {$LANG.orderForm.check}
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    {/if}
                </div>

                {if $freedomaintlds}
                    <p class="mt-4 text-sm">* <em>{$LANG.orderfreedomainregistration} {$LANG.orderfreedomainappliesto}: {$freedomaintlds}</em></p>
                {/if}

            </form>

            <div class="clear-both"></div>
            <form method="post" action="{$WEB_ROOT}/cart.php?a=add&pid={$pid}&domainselect=1" id="frmProductDomainSelections">

                <div id="DomainSearchResults" class="hidden">

                    <div id="searchDomainInfo">
                        <p id="primaryLookupSearching" class="text-center text-lg domain-lookup-loader domain-lookup-primary-loader domain-searching domain-checker-result-headline">
                            <i class="fas fa-spinner fa-spin"></i>
                            <span class="domain-lookup-register-loader">{lang key='orderForm.checkingAvailability'}...</span>
                            <span class="domain-lookup-transfer-loader">{lang key='orderForm.verifyingTransferEligibility'}...</span>
                            <span class="domain-lookup-other-loader">{lang key='orderForm.verifyingDomain'}...</span>
                        </p>
                        <div id="primaryLookupResult" class="domain-lookup-result domain-lookup-primary-results hidden">
                            <div class="domain-unavailable domain-checker-unavailable text-xl text-center font-bold text-red-600">{lang key='orderForm.domainIsUnavailable'}</div>
                            <div class="domain-available domain-checker-available text-xl text-center font-bold text-green-600">{$LANG.domainavailablemessage}</div>
                            <div class="bg-blue-600 hover:bg-blue-700 text-white p-2 rounded text-center domain-contact-support text-xl">{$LANG.domainContactUs}</div>
                            <div class="transfer-eligible">
                                <p class="domain-checker-available text-xl text-center font-bold text-green-600">{lang key='orderForm.transferEligible'}</p>
                                <p class="text-center">{lang key='orderForm.transferUnlockBeforeContinuing'}</p>
                            </div>
                            <div class="transfer-not-eligible">
                                <p class="domain-checker-unavailable text-xl text-center font-bold text-red-600">{lang key='orderForm.transferNotEligible'}</p>
                                <p class="text-center">{lang key='orderForm.transferNotRegistered'}</p>
                                <p class="text-center">{lang key='orderForm.trasnferRecentlyRegistered'}</p>
                                <p class="text-center">{lang key='orderForm.transferAlternativelyRegister'}</p>
                            </div>
                            <div class="domain-invalid">
                                <p class="domain-checker-unavailable text-xl text-center font-bold text-red-600">{lang key='orderForm.domainInvalid'}</p>
                                <p class="text-center">
                                    {lang key='orderForm.domainLetterOrNumber'}<span class="domain-length-restrictions">{lang key='orderForm.domainLengthRequirements'}</span><br />
                                    {lang key='orderForm.domainInvalidCheckEntry'}
                                </p>
                            </div>
                            <div id="idnLanguageSelector" class="my-4 idn-language-selector idn-language hidden">
                                <div class="md:w-4/5 md:mx-auto lg:w-2/3 lg:mx-auto">
                                    <div class="my-4 text-center">
                                        {lang key='cart.idnLanguageDescription'}
                                    </div>
                                </div>
                                <div class="md:w-2/3 md:mx-auto lg:w-1/2 lg:mx-auto">
                                    <div class="mb-4">
                                        <select name="idnlanguage" class="w-full p-2 border border-[#d5d5d5] rounded">
                                            <option value="">{lang key='cart.idnLanguage'}</option>
                                            {foreach $idnLanguages as $idnLanguageKey => $idnLanguage}
                                                <option value="{$idnLanguageKey}">{lang key='idnLanguage.'|cat:$idnLanguageKey}</option>
                                            {/foreach}
                                        </select>
                                        <div class="text-red-600 text-sm mt-1">
                                            {lang key='cart.selectIdnLanguageForRegister'}
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="domain-price text-center font-bold">
                                <span class="register-price-label">{lang key='orderForm.domainPriceRegisterLabel'}</span>
                                <span class="transfer-price-label hidden">{lang key='orderForm.domainPriceTransferLabel'}</span>
                                <span class="price"></span>
                            </div>
                            <p class="domain-error domain-checker-unavailable text-xl text-center font-bold text-red-600"></p>
                            <input type="hidden" id="resultDomainOption" name="domainoption" />
                            <input type="hidden" id="resultDomain" name="domains[]" />
                            <input type="hidden" id="resultDomainPricingTerm" />
                        </div>
                    </div>

                    {if $registerdomainenabled}
                        {if $spotlightTlds}
                            <div id="spotlightTlds" class="hidden">
                                <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                                    {foreach $spotlightTlds as $key => $data}
                                        <div class="spotlight-tld-container">
                                            <div id="spotlight{$data.tldNoDots}" class="bg-white p-4 rounded shadow-sm text-center">
                                                {if $data.group}
                                                    <div class="bg-gray-100 p-1 mb-2 rounded">{$data.groupDisplayName}</div>
                                                {/if}
                                                <div class="text-xl font-bold">{$data.tld}</div>
                                                <span class="domain-lookup-loader domain-lookup-spotlight-loader">
                                                    <i class="fas fa-spinner fa-spin"></i>
                                                </span>
                                                <div class="domain-lookup-result mt-2">
                                                    <button type="button" class="w-full bg-gray-500 text-white p-2 rounded cursor-not-allowed hidden unavailable" disabled="disabled">
                                                        {lang key='domainunavailable'}
                                                    </button>
                                                    <button type="button" class="w-full bg-gray-500 text-white p-2 rounded cursor-not-allowed hidden invalid" disabled="disabled">
                                                        {lang key='domainunavailable'}
                                                    </button>
                                                    <span class="available price hidden">{$data.register}</span>
                                                    <button type="button" class="w-full bg-green-600 hover:bg-green-700 text-white p-2 rounded hidden btn-add-to-cart product-domain" data-whois="0" data-domain="">
                                                        <span class="to-add">{lang key='orderForm.add'}</span>
                                                        <span class="loading">
                                                            <i class="fas fa-spinner fa-spin"></i> {lang key='loading'}
                                                        </span>
                                                        <span class="added"><i class="far fa-shopping-cart"></i> {lang key='domaincheckeradded'}</span>
                                                        <span class="unavailable">{$LANG.domaincheckertaken}</span>
                                                    </button>
                                                    <button type="button" class="w-full bg-blue-600 hover:bg-blue-700 text-white p-2 rounded hidden domain-contact-support">
                                                        {lang key='domainChecker.contactSupport'}
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    {/foreach}
                                </div>
                            </div>
                        {/if}

                        <div class="suggested-domains hidden mt-6">
                            <div class="bg-gray-100 p-3 font-bold border-t border-x rounded-t">
                                {lang key='orderForm.suggestedDomains'}
                            </div>
                            <div id="suggestionsLoader" class="bg-white p-4-x border-b rounded-b domain-lookup-loader domain-lookup-suggestions-loader text-center">
                                <i class="fas fa-spinner fa-spin"></i> {lang key='orderForm.generatingSuggestions'}
                            </div>
                            <div id="domainSuggestions" class="domain-lookup-result hidden">
                                <div class="domain-suggestion border border-[#d5d5d5] p-4 hidden">
                                    <div class="flex justify-between items-center">
                                        <div>
                                            <span class="domain font-bold"></span><span class="extension"></span>
                                        </div>
                                        <div class="flex items-center">
                                            <button type="button" class="bg-green-600 hover:bg-green-700 text-white px-3 py-1 rounded mr-2 btn-add-to-cart product-domain" data-whois="1" data-domain="">
                                                <span class="to-add">{$LANG.addtocart}</span>
                                                <span class="loading">
                                                    <i class="fas fa-spinner fa-spin"></i> {lang key='loading'}
                                                </span>
                                                <span class="added">{lang key='domaincheckeradded'}</span>
                                                <span class="unavailable">{$LANG.domaincheckertaken}</span>
                                            </button>
                                            <button type="button" class="bg-blue-600 hover:bg-blue-700 text-white px-3 py-1 rounded mr-2 hidden domain-contact-support">{lang key='domainChecker.contactSupport'}</button>
                                            <span class="price font-bold"></span>
                                            <span class="promo hidden"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="bg-gray-100 p-3 border-x border-b rounded-b text-center hidden more-suggestions">
                                <a id="moreSuggestions" href="#" onclick="loadMoreSuggestions();return false;" class="text-blue-600 hover:text-blue-800">{lang key='domainsmoresuggestions'}</a>
                                <span id="noMoreSuggestions" class="text-sm text-gray-600 hidden">{lang key='domaincheckernomoresuggestions'}</span>
                            </div>
                            <div class="text-center text-gray-600 mt-4 domain-suggestions-warning">
                                <p>{lang key='domainssuggestionswarnings'}</p>
                            </div>
                        </div>
                    {/if}
                </div>

                <div class="text-center mt-6">
                    <button id="btnDomainContinue" type="submit" class="bg-blue-600 hover:bg-blue-700 text-white px-6 py-3 rounded-lg text-lg hidden" disabled="disabled">
                        {$LANG.continue}
                        &nbsp;<i class="fas fa-arrow-circle-right"></i>
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

{include file="orderforms/twwhmcstailwind/recommendations-modal.tpl"}