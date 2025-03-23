{include file="orderforms/twwhmcstailwind/common.tpl"}

<div id="order-standard_cart" class="w-full">

    <div class="flex flex-col md:flex-row">
        <div class="cart-sidebar w-full md:w-1/4">
            {include file="orderforms/twwhmcstailwind/sidebar-categories.tpl"}
        </div>
        <div class="cart-body w-full md:w-3/4">
            <div class="mb-6">
                <h1 class="text-4xl font-semibold">
                    {$LANG.registerdomain}
                </h1>
            </div>
            {include file="orderforms/twwhmcstailwind/sidebar-categories-collapsed.tpl"}

            <p class="mb-4">{$LANG.orderForm.findNewDomain}</p>

            <div class="bg-white rounded-lg shadow-md p-6 mb-8">
                <div class="bg-gray-50 rounded-lg p-8">
                    <form method="post" action="{$WEB_ROOT}/cart.php" id="frmDomainChecker">
                        <input type="hidden" name="a" value="checkDomain">
                        <div class="flex flex-col items-center">
                            <div class="w-full md:w-3/4 mx-auto">
                                <div class="flex flex-col md:flex-row items-center">
                                    <input type="text" name="domain" class="bg-white shadow w-full rounded-l-lg border-none p-3 text-lg focus:outline-none focus:ring-2 focus:ring-blue-500" placeholder="{$LANG.findyourdomain}" value="{$lookupTerm}" id="inputDomain" data-toggle="tooltip" data-placement="left" data-trigger="manual" title="{lang key='orderForm.domainOrKeyword'}" />
                                    <button type="submit" id="btnCheckAvailability" class="w-full md:w-auto mt-3 md:mt-0 rounded-lg md:rounded-l-none rounded-r-lg bg-blue-600 hover:bg-blue-700 text-white py-3 px-6 text-lg font-medium transition duration-300 {$captcha->getButtonClass($captchaForm)}">{$LANG.search}</button>
                                </div>
                            </div>

                            {if $captcha->isEnabled() && $captcha->isEnabledForForm($captchaForm) && !$captcha->recaptcha->isInvisible()}
                                <div class="w-full md:w-3/4 mx-auto mt-4">
                                    <div id="captchaContainer">
                                        {if $captcha->recaptcha->isEnabled()}
                                            <div class="text-center mt-4">
                                                <div class="recaptcha-container"></div>
                                            </div>
                                        {else}
                                            <div class="mt-4">
                                                <p class="mb-2">{lang key="cartSimpleCaptcha"}</p>
                                                <div class="flex flex-col md:flex-row items-center">
                                                    <img id="inputCaptchaImage" src="{$systemurl}includes/verifyimage.php" class="mr-4" />
                                                    <input id="inputCaptcha" type="text" name="code" maxlength="6" class="w-full mt-2 md:mt-0 md:w-1/3 rounded border-gray-300 p-2 focus:outline-none focus:ring-2 focus:ring-blue-500" data-toggle="tooltip" data-placement="right" data-trigger="manual" title="{lang key='orderForm.required'}" />
                                                </div>
                                            </div>
                                        {/if}
                                    </div>
                                </div>
                            {/if}
                        </div>
                    </form>
                </div>
            </div>

            <div id="DomainSearchResults" class="hidden">
                <div id="searchDomainInfo" class="mb-6">
                    <p id="primaryLookupSearching" class="text-center"><i class="fas fa-spinner fa-spin mr-2"></i> {lang key='orderForm.searching'}...</p>
                    <div id="primaryLookupResult" class="hidden">
                        <p class="domain-invalid text-red-600 text-center">{lang key='orderForm.domainLetterOrNumber'}<span class="domain-length-restrictions">{lang key='orderForm.domainLengthRequirements'}</span></p>
                        <p class="domain-unavailable text-red-600 text-center">{lang key='orderForm.domainIsUnavailable'}</p>
                        <p class="domain-tld-unavailable text-red-600 text-center">{lang key='orderForm.domainHasUnavailableTld'}</p>
                        <p class="domain-available text-green-600 text-center">{$LANG.domainavailablemessage}</p>
                        <div class="text-center">
                            <a class="domain-contact-support bg-blue-600 hover:bg-blue-700 text-white py-2 px-4 rounded inline-block">{$LANG.domainContactUs}</a>
                        </div>
                        <div id="idnLanguageSelector" class="hidden mt-6">
                            <div class="text-center mb-4">
                                <p>{lang key='cart.idnLanguageDescription'}</p>
                            </div>
                            <div class="flex justify-center">
                                <div class="w-full md:w-2/3 lg:w-1/2">
                                    <select name="idnlanguage" class="w-full rounded border-gray-300 p-2 focus:outline-none focus:ring-2 focus:ring-blue-500">
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
                        <div class="domain-price text-center mt-4">
                            <span class="price text-lg font-bold"></span>
                            <button class="btn-add-to-cart ml-4 bg-blue-600 hover:bg-blue-700 text-white py-2 px-4 rounded inline-block transition duration-300" data-whois="0" data-domain="">
                                <span class="to-add">{$LANG.addtocart}</span>
                                <span class="loading hidden">
                                    <i class="fas fa-spinner fa-spin mr-1"></i> {lang key='loading'}
                                </span>
                                <span class="added hidden"><i class="far fa-shopping-cart mr-1"></i> {lang key='checkout'}</span>
                                <span class="unavailable hidden">{$LANG.domaincheckertaken}</span>
                            </button>
                        </div>
                        <p class="domain-error text-red-600 text-center mt-2"></p>
                    </div>
                </div>

                {if $spotlightTlds}
                    <div id="spotlightTlds" class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-8">
                        {foreach $spotlightTlds as $key => $data}
                            <div class="spotlight-tld-container">
                                <div id="spotlight{$data.tldNoDots}" class="border rounded-lg p-4 text-center">
                                    {if $data.group}
                                        <div class="text-sm font-medium text-blue-600 mb-1">{$data.groupDisplayName}</div>
                                    {/if}
                                    <div class="text-2xl font-bold">{$data.tld}</div>
                                    <span class="domain-lookup-loader hidden mt-2">
                                        <i class="fas fa-spinner fa-spin"></i>
                                    </span>
                                    <div class="domain-lookup-result mt-3">
                                        <button type="button" class="unavailable hidden w-full bg-gray-300 text-gray-600 py-2 px-4 rounded cursor-not-allowed" disabled="disabled">
                                            {lang key='domainunavailable'}
                                        </button>
                                        <button type="button" class="invalid hidden w-full bg-gray-300 text-gray-600 py-2 px-4 rounded cursor-not-allowed" disabled="disabled">
                                            {lang key='domainunavailable'}
                                        </button>
                                        <span class="available price hidden block text-lg font-bold text-green-600 mb-2">{$data.register}</span>
                                        <button type="button" class="btn-add-to-cart hidden w-full bg-blue-600 hover:bg-blue-700 text-white py-2 px-4 rounded transition duration-300" data-whois="0" data-domain="">
                                            <span class="to-add">{lang key='orderForm.add'}</span>
                                            <span class="loading hidden">
                                                <i class="fas fa-spinner fa-spin mr-1"></i> {lang key='loading'}
                                            </span>
                                            <span class="added hidden"><i class="far fa-shopping-cart mr-1"></i> {lang key='checkout'}</span>
                                            <span class="unavailable hidden">{$LANG.domaincheckertaken}</span>
                                        </button>
                                        <button type="button" class="domain-contact-support hidden w-full bg-blue-600 hover:bg-blue-700 text-white py-2 px-4 rounded transition duration-300">
                                            {lang key='domainChecker.contactSupport'}
                                        </button>
                                    </div>
                                </div>
                            </div>
                        {/foreach}
                    </div>
                {/if}

                <div class="suggested-domains{if !$showSuggestionsContainer} hidden{/if} border rounded-lg shadow-sm mb-8">
                    <div class="bg-gray-100 p-4 border-b font-medium text-lg">
                        {lang key='orderForm.suggestedDomains'}
                    </div>
                    <div id="suggestionsLoader" class="p-6 text-center">
                        <i class="fas fa-spinner fa-spin mr-2"></i> {lang key='orderForm.generatingSuggestions'}
                    </div>
                    <div id="domainSuggestions" class="domain-lookup-result hidden">
                        <div class="domain-suggestion hidden border-b p-4">
                            <div class="flex flex-col md:flex-row justify-between items-center">
                                <div class="text-lg mb-3 md:mb-0">
                                    <span class="domain font-medium"></span><span class="extension"></span>
                                    <span class="promo hidden ml-2">
                                        <span class="sales-group-hot hidden bg-red-500 text-white text-xs px-2 py-1 rounded">{lang key='domainCheckerSalesGroup.hot'}</span>
                                        <span class="sales-group-new hidden bg-green-500 text-white text-xs px-2 py-1 rounded">{lang key='domainCheckerSalesGroup.new'}</span>
                                        <span class="sales-group-sale hidden bg-blue-500 text-white text-xs px-2 py-1 rounded">{lang key='domainCheckerSalesGroup.sale'}</span>
                                    </span>
                                </div>
                                <div class="actions flex items-center">
                                    <span class="price font-bold mr-4"></span>
                                    <button type="button" class="btn-add-to-cart bg-blue-600 hover:bg-blue-700 text-white py-2 px-4 rounded transition duration-300" data-whois="1" data-domain="">
                                        <span class="to-add">{$LANG.addtocart}</span>
                                        <span class="loading hidden">
                                            <i class="fas fa-spinner fa-spin mr-1"></i> {lang key='loading'}
                                        </span>
                                        <span class="added hidden"><i class="far fa-shopping-cart mr-1"></i> {lang key='checkout'}</span>
                                        <span class="unavailable hidden">{$LANG.domaincheckertaken}</span>
                                    </button>
                                    <button type="button" class="domain-contact-support hidden ml-2 bg-blue-600 hover:bg-blue-700 text-white py-2 px-4 rounded transition duration-300">
                                        {lang key='domainChecker.contactSupport'}
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="bg-gray-100 p-4 border-t text-center hidden">
                        <a id="moreSuggestions" href="#" onclick="loadMoreSuggestions();return false;" class="text-blue-600 hover:text-blue-800">{lang key='domainsmoresuggestions'}</a>
                        <span id="noMoreSuggestions" class="no-more hidden text-sm text-gray-500">{lang key='domaincheckernomoresuggestions'}</span>
                    </div>
                    <div class="p-4 text-center text-gray-500 text-sm">
                        <p>{lang key='domainssuggestionswarnings'}</p>
                    </div>
                </div>

            </div>

            <div class="domain-pricing mb-8">

                {if $featuredTlds}
                    <div class="mb-8">
                        <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                            {foreach $featuredTlds as $num => $tldinfo}
                                <div class="col-span-1">
                                    <div class="border rounded-lg p-6 text-center shadow-sm hover:shadow-md transition duration-300">
                                        <div class="mb-4 h-16 flex items-center justify-center">
                                            <img src="{$BASE_PATH_IMG}/tld_logos/{$tldinfo.tldNoDots}.png" class="max-h-full">
                                        </div>
                                        <div class="text-xl font-bold text-blue-600">
                                            {if is_object($tldinfo.register)}
                                                {$tldinfo.register->toPrefixed()}{if $tldinfo.period > 1}{lang key="orderForm.shortPerYears" years={$tldinfo.period}}{else}{lang key="orderForm.shortPerYear" years=''}{/if}
                                            {else}
                                                {lang key="domainregnotavailable"}
                                            {/if}
                                        </div>
                                    </div>
                                </div>
                            {/foreach}
                        </div>
                    </div>
                {/if}

                <h4 class="text-xl font-semibold mb-4">{lang key='pricing.browseExtByCategory'}</h4>

                <div class="mb-6 flex flex-wrap gap-2">
                    {foreach $categoriesWithCounts as $category => $count}
                        <a href="#" data-category="{$category}" class="bg-gray-200 hover:bg-gray-300 text-gray-800 px-3 py-1 rounded-full text-sm transition duration-300">{lang key="domainTldCategory.$category" defaultValue=$category} ({$count})</a>
                    {/foreach}
                </div>

                <div class="bg-white rounded-lg shadow-sm">
                    <div class="bg-white grid grid-cols-12 text-center font-medium bg-gray-100 p-4">
                        <div class="col-span-4">{lang key='orderdomain'}</div>
                        <div class="col-span-8">
                            <div class="grid grid-cols-3">
                                <div>{lang key='pricing.register'}</div>
                                <div>{lang key='pricing.transfer'}</div>
                                <div>{lang key='pricing.renewal'}</div>
                            </div>
                        </div>
                    </div>
                    {foreach $pricing['pricing'] as $tld => $price}
                        <div class="grid grid-cols-12 border-b p-4 hover:bg-gray-50 transition duration-300" data-category="{foreach $price.categories as $category}|{$category}|{/foreach}">
                            <div class="col-span-4 flex items-center">
                                <div>
                                    <span class="text-lg font-medium">.{$tld}</span>
                                    {if $price.group}
                                        <span class="ml-2 inline-block px-2 py-1 text-xs font-medium rounded {if $price.group == 'hot'}bg-red-500 text-white{elseif $price.group == 'new'}bg-green-500 text-white{elseif $price.group == 'sale'}bg-blue-500 text-white{/if}">
                                            {lang key='domainCheckerSalesGroup.'|cat:$price.group}
                                        </span>
                                    {/if}
                                </div>
                            </div>
                            <div class="col-span-8">
                                <div class="grid grid-cols-3 text-center">
                                    <div>
                                        {if isset($price.register) && current($price.register) > 0}
                                            <div class="font-medium">{current($price.register)}</div>
                                            <div class="text-sm text-gray-600">{key($price.register)} {if key($price.register) > 1}{lang key="orderForm.years"}{else}{lang key="orderForm.year"}{/if}</div>
                                        {elseif isset($price.register) && current($price.register) == 0}
                                            <div class="text-sm text-gray-600">{lang key='orderfree'}</div>
                                        {else}
                                            <div class="text-sm text-gray-600">{lang key='na'}</div>
                                        {/if}
                                    </div>
                                    <div>
                                        {if isset($price.transfer) && current($price.transfer) > 0}
                                            <div class="font-medium">{current($price.transfer)}</div>
                                            <div class="text-sm text-gray-600">{key($price.transfer)} {if key($price.register) > 1}{lang key="orderForm.years"}{else}{lang key="orderForm.year"}{/if}</div>
                                        {elseif isset($price.transfer) && current($price.transfer) == 0}
                                            <div class="text-sm text-gray-600">{lang key='orderfree'}</div>
                                        {else}
                                            <div class="text-sm text-gray-600">{lang key='na'}</div>
                                        {/if}
                                    </div>
                                    <div>
                                        {if isset($price.renew) && current($price.renew) > 0}
                                            <div class="font-medium">{current($price.renew)}</div>
                                            <div class="text-sm text-gray-600">{key($price.renew)} {if key($price.register) > 1}{lang key="orderForm.years"}{else}{lang key="orderForm.year"}{/if}</div>
                                        {elseif isset($price.renew) && current($price.renew) == 0}
                                            <div class="text-sm text-gray-600">{lang key='orderfree'}</div>
                                        {else}
                                            <div class="text-sm text-gray-600">{lang key='na'}</div>
                                        {/if}
                                    </div>
                                </div>
                            </div>
                        </div>
                    {/foreach}
                    <div class="hidden py-8 text-center text-gray-500 no-tlds">
                        {lang key='pricing.selectExtCategory'}
                    </div>
                </div>

            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div class="{if !$domainTransferEnabled}md:col-start-2 md:col-span-2{/if}">
                    <div class="bg-white rounded-lg p-6 shadow-sm hover:shadow-md transition duration-300">
                        <div class="flex flex-col md:flex-row items-center md:items-start mb-4">
                            <i class="fas fa-server text-5xl text-gray-500 mx-1 md:mx-4 mb-4 md:mb-0"></i>
                            <div>
                                <h3 class="text-2xl font-semibold">{lang key='orderForm.addHosting'}</h3>
                                <p class="font-medium text-yellow-600">{lang key='orderForm.chooseFromRange'}</p>
                            </div>
                        </div>

                        <p class="mb-6">{lang key='orderForm.packagesForBudget'}</p>

                        <a href="{$WEB_ROOT}/cart.php" class="inline-block bg-yellow-500 hover:bg-yellow-600 text-white font-medium py-2 px-4 rounded transition duration-300">
                            {lang key='orderForm.exploreNow'}
                        </a>
                    </div>
                </div>
                {if $domainTransferEnabled}
                    <div>
                        <div class="bg-white rounded-lg p-6 shadow-sm hover:shadow-md transition duration-300">
                            <div class="flex flex-col md:flex-row items-center md:items-start mb-4">
                                <i class="fas fa-globe text-5xl text-gray-500 mx-1 md:mx-4 mb-4 md:mb-0"></i>
                                <div>
                                    <h3 class="text-2xl font-semibold">{lang key='orderForm.transferToUs'}</h3>
                                    <p class="font-medium text-blue-600">{lang key='orderForm.transferExtend'}*</p>
                                </div>
                            </div>

                            <div class="mb-6">
                                <a href="{$WEB_ROOT}/cart.php?a=add&domain=transfer" class="inline-block bg-blue-600 hover:bg-blue-700 text-white font-medium py-2 px-4 rounded transition duration-300">
                                    {lang key='orderForm.transferDomain'}
                                </a>
                            </div>

                            <p class="text-sm text-gray-600">* {lang key='orderForm.extendExclusions'}</p>
                        </div>
                    </div>
                {/if}
            </div>
        </div>
    </div>
</div>

<script>
jQuery(document).ready(function() {
    jQuery('.tld-filters a:first-child').click();
{if $lookupTerm && !$captchaError && !$invalid}
    jQuery('#btnCheckAvailability').click();
{/if}
{if $invalid}
    jQuery('#primaryLookupSearching').toggle();
    jQuery('#primaryLookupResult').children().toggle();
    jQuery('#primaryLookupResult').toggle();
    jQuery('#DomainSearchResults').toggle();
    jQuery('.domain-invalid').toggle();
{/if}
});
</script>