{include file="orderforms/twwhmcstailwind/common.tpl"}

<script>
var _localLang = {
    'addToCart': '{$LANG.orderForm.addToCart|escape}',
    'addedToCartRemove': '{$LANG.orderForm.addedToCartRemove|escape}'
}
</script>

<div id="order-standard_cart">

    <div class="flex flex-col md:flex-row">
        <div class="cart-sidebar w-full md:w-1/4 p-4">
            {include file="orderforms/twwhmcstailwind/sidebar-categories.tpl"}
        </div>
        <div class="cart-body w-full md:w-3/4 p-4">

            <div class="mb-6">
                <h1 class="text-4xl font-bold">{$LANG.orderconfigure}</h1>
            </div>

            {include file="orderforms/twwhmcstailwind/sidebar-categories-collapsed.tpl"}

            <form id="frmConfigureProduct">
                <input type="hidden" name="configure" value="true" />
                <input type="hidden" name="i" value="{$i}" />

                <div class="flex flex-col lg:flex-row">
                    <div class="secondary-cart-body w-full lg:w-2/3 pr-0 lg:pr-6">

                        <p class="mb-4">{$LANG.orderForm.configureDesiredOptions}</p>

                        <div class="product-info bg-gray-50 p-4 rounded-lg mb-6">
                            <p class="text-xl font-semibold mb-2">{$productinfo.name}</p>
                            <p>{$productinfo.description}</p>
                        </div>

                        <div class="hidden bg-red-100 text-red-700 p-4 rounded-lg mb-6" role="alert" id="containerProductValidationErrors">
                            <p>{$LANG.orderForm.correctErrors}:</p>
                            <ul id="containerProductValidationErrorsList" class="list-disc pl-6"></ul>
                        </div>

                        {if $pricing.type eq "recurring"}
                            <div class="mb-6">
                                <div class="mb-4">
                                    <label for="inputBillingcycle" class="block text-sm font-medium text-gray-700 mb-1">{$LANG.cartchoosecycle}</label>
                                    <select name="billingcycle" id="inputBillingcycle" class="w-full md:w-auto px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500" onchange="updateConfigurableOptions({$i}, this.value); return false">
                                        {if $pricing.monthly}
                                            <option value="monthly"{if $billingcycle eq "monthly"} selected{/if}>
                                                {$pricing.monthly}
                                            </option>
                                        {/if}
                                        {if $pricing.quarterly}
                                            <option value="quarterly"{if $billingcycle eq "quarterly"} selected{/if}>
                                                {$pricing.quarterly}
                                            </option>
                                        {/if}
                                        {if $pricing.semiannually}
                                            <option value="semiannually"{if $billingcycle eq "semiannually"} selected{/if}>
                                                {$pricing.semiannually}
                                            </option>
                                        {/if}
                                        {if $pricing.annually}
                                            <option value="annually"{if $billingcycle eq "annually"} selected{/if}>
                                                {$pricing.annually}
                                            </option>
                                        {/if}
                                        {if $pricing.biennially}
                                            <option value="biennially"{if $billingcycle eq "biennially"} selected{/if}>
                                                {$pricing.biennially}
                                            </option>
                                        {/if}
                                        {if $pricing.triennially}
                                            <option value="triennially"{if $billingcycle eq "triennially"} selected{/if}>
                                                {$pricing.triennially}
                                            </option>
                                        {/if}
                                    </select>
                                </div>
                            </div>
                        {/if}

                        {if count($metrics) > 0}
                            <div class="mb-4">
                                <h3 class="relative py-2 px-4 inline-block text-white text-sm font-semibold bg-indigo-600 rounded">{$LANG.metrics.title}</h3>
                            </div>

                            <p class="mb-4">{$LANG.metrics.explanation}</p>

                            <ul class="list-disc pl-6 mb-6">
                                {foreach $metrics as $metric}
                                    <li class="mb-2">
                                        {$metric.displayName}
                                        -
                                        {if count($metric.pricing) > 1}
                                            {$LANG.metrics.startingFrom} {$metric.lowestPrice} / {if $metric.unitName}{$metric.unitName}{else}{$LANG.metrics.unit}{/if}
                                            <button type="button" class="ml-2 px-3 py-1 text-sm bg-gray-200 hover:bg-gray-300 rounded" data-toggle="modal" data-target="#modalMetricPricing-{$metric.systemName}">
                                                {$LANG.metrics.viewPricing}
                                            </button>
                                        {elseif count($metric.pricing) == 1}
                                            {$metric.lowestPrice} / {if $metric.unitName}{$metric.unitName}{else}{$LANG.metrics.unit}{/if}
                                            {if $metric.includedQuantity > 0} ({$metric.includedQuantity} {$LANG.metrics.includedNotCounted}){/if}
                                        {/if}
                                        {include file="$template/usagebillingpricing.tpl"}
                                    </li>
                                {/foreach}
                            </ul>
                        {/if}

                        {if $productinfo.type eq "server"}
                            <div class="mb-4">
                                <h3 class="relative py-2 px-4 inline-block text-white text-sm font-semibold bg-indigo-600 rounded">{$LANG.cartconfigserver}</h3>
                            </div>

                            <div class="mb-6">
                                <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-4">
                                    <div>
                                        <div class="mb-4">
                                            <label for="inputHostname" class="block text-sm font-medium text-gray-700 mb-1">{$LANG.serverhostname}</label>
                                            <input type="text" name="hostname" class="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500" id="inputHostname" value="{$server.hostname}" placeholder="servername.example.com">
                                        </div>
                                    </div>
                                    <div>
                                        <div class="mb-4">
                                            <label for="inputRootpw" class="block text-sm font-medium text-gray-700 mb-1">{$LANG.serverrootpw}</label>
                                            <input type="password" name="rootpw" class="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500" id="inputRootpw" value="{$server.rootpw}">
                                        </div>
                                    </div>
                                </div>

                                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                                    <div>
                                        <div class="mb-4">
                                            <label for="inputNs1prefix" class="block text-sm font-medium text-gray-700 mb-1">{$LANG.serverns1prefix}</label>
                                            <input type="text" name="ns1prefix" class="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500" id="inputNs1prefix" value="{$server.ns1prefix}" placeholder="ns1">
                                        </div>
                                    </div>
                                    <div>
                                        <div class="mb-4">
                                            <label for="inputNs2prefix" class="block text-sm font-medium text-gray-700 mb-1">{$LANG.serverns2prefix}</label>
                                            <input type="text" name="ns2prefix" class="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500" id="inputNs2prefix" value="{$server.ns2prefix}" placeholder="ns2">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        {/if}

                        {if $configurableoptions}
                            <div class="mb-4">
                                <h3 class="relative py-2 px-4 inline-block text-white text-sm font-semibold bg-indigo-600 rounded">{$LANG.orderconfigpackage}</h3>
                            </div>
                            <div class="product-configurable-options mb-6" id="productConfigurableOptions">
                                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                                    {foreach $configurableoptions as $num => $configoption}
                                    {if $configoption.optiontype eq 1}
                                        <div class="col-span-1">
                                            <div class="mb-4">
                                                <label for="inputConfigOption{$configoption.id}" class="block text-sm font-medium text-gray-700 mb-1">{$configoption.optionname}</label>
                                                <select name="configoption[{$configoption.id}]" id="inputConfigOption{$configoption.id}" class="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500">
                                                    {foreach key=num2 item=options from=$configoption.options}
                                                        <option value="{$options.id}"{if $configoption.selectedvalue eq $options.id} selected="selected"{/if}>
                                                            {$options.name}
                                                        </option>
                                                    {/foreach}
                                                </select>
                                            </div>
                                        </div>
                                    {elseif $configoption.optiontype eq 2}
                                        <div class="col-span-1">
                                            <div class="mb-4">
                                                <label class="block text-sm font-medium text-gray-700 mb-1">{$configoption.optionname}</label>
                                                {foreach key=num2 item=options from=$configoption.options}
                                                    <div class="flex items-center mb-1">
                                                        <input type="radio" name="configoption[{$configoption.id}]" value="{$options.id}" class="focus:ring-indigo-500 h-4 w-4 text-indigo-600 border-gray-300"{if $configoption.selectedvalue eq $options.id} checked="checked"{/if} />
                                                        <label class="ml-2">
                                                            {if $options.name}
                                                                {$options.name}
                                                            {else}
                                                                {$LANG.enable}
                                                            {/if}
                                                        </label>
                                                    </div>
                                                {/foreach}
                                            </div>
                                        </div>
                                    {elseif $configoption.optiontype eq 3}
                                        <div class="col-span-1">
                                            <div class="mb-4">
                                                <label class="block text-sm font-medium text-gray-700 mb-1">{$configoption.optionname}</label>
                                                <div class="flex items-center">
                                                    <input type="checkbox" name="configoption[{$configoption.id}]" id="inputConfigOption{$configoption.id}" value="1" class="focus:ring-indigo-500 h-4 w-4 text-indigo-600 border-gray-300 rounded"{if $configoption.selectedqty} checked{/if} />
                                                    <label class="ml-2">
                                                        {if $configoption.options.0.name}
                                                            {$configoption.options.0.name}
                                                        {else}
                                                            {$LANG.enable}
                                                        {/if}
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    {elseif $configoption.optiontype eq 4}
                                        <div class="col-span-2">
                                            <div class="mb-4">
                                                <label for="inputConfigOption{$configoption.id}" class="block text-sm font-medium text-gray-700 mb-1">{$configoption.optionname}</label>
                                                {if $configoption.qtymaximum}
                                                {if !$rangesliderincluded}
                                                    <script type="text/javascript" src="{$BASE_PATH_JS}/ion.rangeSlider.min.js"></script>
                                                <link href="{$BASE_PATH_CSS}/ion.rangeSlider.css" rel="stylesheet">
                                                <link href="{$BASE_PATH_CSS}/ion.rangeSlider.skinModern.css" rel="stylesheet">
                                                    {assign var='rangesliderincluded' value=true}
                                                {/if}
                                                    <input type="text" name="configoption[{$configoption.id}]" value="{if $configoption.selectedqty}{$configoption.selectedqty}{else}{$configoption.qtyminimum}{/if}" id="inputConfigOption{$configoption.id}" class="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500" />
                                                    <script>
                                                        var sliderTimeoutId = null;
                                                        var sliderRangeDifference = {$configoption.qtymaximum} - {$configoption.qtyminimum};
                                                        // The largest size that looks nice on most screens.
                                                        var sliderStepThreshold = 25;
                                                        // Check if there are too many to display individually.
                                                        var setLargerMarkers = sliderRangeDifference > sliderStepThreshold;

                                                        jQuery("#inputConfigOption{$configoption.id}").ionRangeSlider({
                                                            min: {$configoption.qtyminimum},
                                                            max: {$configoption.qtymaximum},
                                                            grid: true,
                                                            grid_snap: setLargerMarkers ? false : true,
                                                            onChange: function() {
                                                                if (sliderTimeoutId) {
                                                                    clearTimeout(sliderTimeoutId);
                                                                }

                                                                sliderTimeoutId = setTimeout(function() {
                                                                    sliderTimeoutId = null;
                                                                    recalctotals();
                                                                }, 250);
                                                            }
                                                        });
                                                    </script>
                                                {else}
                                                    <div class="flex items-center">
                                                        <input type="number" name="configoption[{$configoption.id}]" value="{if $configoption.selectedqty}{$configoption.selectedqty}{else}{$configoption.qtyminimum}{/if}" id="inputConfigOption{$configoption.id}" min="{$configoption.qtyminimum}" onchange="recalctotals()" onkeyup="recalctotals()" class="w-24 px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500" />
                                                        <span class="ml-2">
                                                            x {$configoption.options.0.name}
                                                        </span>
                                                    </div>
                                                {/if}
                                            </div>
                                        </div>
                                    {/if}
                                    {/foreach}
                                </div>
                            </div>
                        {/if}

                        {if $customfields}

                            <div class="mb-4 pb-1">
                                <h3 class="relative py-2 px-4 inline-block text-white text-sm font-semibold bg-indigo-600 rounded">{$LANG.orderadditionalrequiredinfo}<br><i><small>{lang key='orderForm.requiredField'}</small></i></h3>
                            </div>

                            <div class="mb-6">
                                {foreach $customfields as $customfield}
                                    <div class="mb-4">
                                        <label for="customfield{$customfield.id}" class="block text-sm font-medium text-gray-700 mb-1">{$customfield.name} {$customfield.required}</label>
                                        {$customfield.input}
                                        {if $customfield.description}
                                            <p class="mt-1 text-sm text-gray-500">
                                                {$customfield.description}
                                            </p>
                                        {/if}
                                    </div>
                                {/foreach}
                            </div>

                        {/if}

                        {if $addons || count($addonsPromoOutput) > 0}

                            <div id="productAddonsContainer">
                                <div class="mb-4">
                                    <h3 class="relative py-2 px-4 inline-block text-white text-sm font-semibold bg-indigo-600 rounded">{$LANG.cartavailableaddons}</h3>
                                </div>

                                {foreach $addonsPromoOutput as $output}
                                    <div class="mb-4">
                                        {$output}
                                    </div>
                                {/foreach}

                                <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-6">
                                    {foreach $addons as $addon}
                                        <div class="col-span-1 {if count($addons) <= 1}md:col-span-2{/if}">
                                            <div class="border rounded-lg overflow-hidden {if $addon.status}border-indigo-500{else}border-gray-200{/if}">
                                                <div class="p-4">
                                                    <label class="flex items-start mb-2">
                                                        <input type="checkbox" name="addons[{$addon.id}]" class="mt-1 focus:ring-indigo-500 h-4 w-4 text-indigo-600 border-gray-300 rounded"{if $addon.status} checked{/if} />
                                                        <span class="ml-2 font-medium">{$addon.name}</span>
                                                    </label>
                                                    <p class="text-gray-600 text-sm">{$addon.description}</p>
                                                </div>
                                                <div class="bg-gray-50 p-3 border-t border-gray-200 font-medium">
                                                    {$addon.pricing}
                                                </div>
                                                <div class="bg-gray-100 p-3 text-center text-sm font-medium text-gray-700 hover:bg-gray-200 cursor-pointer transition-colors">
                                                    <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 inline-block mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6" />
                                                    </svg>
                                                    {$LANG.addtocart}
                                                </div>
                                            </div>
                                        </div>
                                    {/foreach}
                                </div>
                            </div>
                        {/if}

                        <div class="bg-yellow-50 border border-yellow-200 text-yellow-800 p-4 rounded-lg mb-6">
                            <div class="flex">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mt-0.5 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8.228 9c.549-1.165 2.03-2 3.772-2 2.21 0 4 1.343 4 3 0 1.4-1.278 2.575-3.006 2.907-.542.104-.994.54-.994 1.093m0 3h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                                </svg>
                                <div class="text-sm">
                                    {$LANG.orderForm.haveQuestionsContact} <a href="{$WEB_ROOT}/contact.php" target="_blank" class="font-medium underline">{$LANG.orderForm.haveQuestionsClickHere}</a>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="secondary-cart-sidebar w-full lg:w-1/3" id="scrollingPanelContainer">

                        <div id="orderSummary" class="sticky top-4">
                            <div class="bg-white border border-gray-200 rounded-lg shadow-sm p-6 mb-4">
                                <div class="flex justify-center" id="orderSummaryLoader">
                                    <svg class="animate-spin h-6 w-6 text-indigo-600" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                                        <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                                        <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                                    </svg>
                                </div>
                                <h2 class="text-3xl font-bold mb-4">{$LANG.ordersummary}</h2>
                                <div class="summary-container" id="producttotal"></div>
                            </div>
                            <div class="text-center">
                                <button type="submit" id="btnCompleteProductConfig" class="w-full py-3 px-4 bg-indigo-600 hover:bg-indigo-700 text-white font-medium rounded-lg transition-colors">
                                    {$LANG.continue}
                                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 inline-block ml-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 9l3 3m0 0l-3 3m3-3H8m13 0a9 9 0 11-18 0 9 9 0 0118 0z" />
                                    </svg>
                                </button>
                            </div>
                        </div>

                    </div>

                </div>

            </form>
        </div>
    </div>
</div>

<script>recalctotals();</script>

{include file="orderforms/twwhmcstailwind/recommendations-modal.tpl"}