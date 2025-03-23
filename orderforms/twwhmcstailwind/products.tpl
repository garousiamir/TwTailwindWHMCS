{include file="orderforms/twwhmcstailwind/common.tpl"}

<div id="order-standard_cart">
    <div class="flex flex-col md:flex-row">
        <div class="cart-sidebar w-full md:w-1/4 md:pr-4">
            {include file="orderforms/twwhmcstailwind/sidebar-categories.tpl"}
        </div>
        <div class="cart-body w-full md:w-3/4">
            <div class="mb-6">
                <h1 class="text-4xl font-bold">
                    {if $productGroup.headline}
                        {$productGroup.headline}
                    {else}
                        {$productGroup.name}
                    {/if}
                </h1>
                {if $productGroup.tagline}
                    <p class="text-gray-600">{$productGroup.tagline}</p>
                {/if}
            </div>
            
            {if $errormessage}
                <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded mb-4">
                    {$errormessage}
                </div>
            {elseif !$productGroup}
                <div class="bg-blue-100 border border-blue-400 text-blue-700 px-4 py-3 rounded mb-4">
                    {lang key='orderForm.selectCategory'}
                </div>
            {/if}

            {include file="orderforms/twwhmcstailwind/sidebar-categories-collapsed.tpl"}

            <div class="products" id="products">
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    {foreach $products as $key => $product}
                        {$idPrefix = ($product.bid) ? ("bundle"|cat:$product.bid) : ("product"|cat:$product.pid)}
                        <div class="product bg-white rounded-lg shadow-sm border border-gray-200 overflow-hidden" id="{$idPrefix}">
                            <div class="p-4 bg-gray-50 border-b border-gray-200">
                                <h3 class="text-lg font-semibold" id="{$idPrefix}-name">{$product.name}</h3>
                                {if $product.stockControlEnabled}
                                    <span class="text-sm text-gray-600">
                                        {$product.qty} {$LANG.orderavailable}
                                    </span>
                                {/if}
                            </div>
                            <div class="p-4">
                                {if $product.featuresdesc}
                                    <p id="{$idPrefix}-description" class="text-gray-700 mb-4">
                                        {$product.featuresdesc}
                                    </p>
                                {/if}
                                <ul class="space-y-2 mb-4">
                                    {foreach $product.features as $feature => $value}
                                        <li id="{$idPrefix}-feature{$value@iteration}" class="flex">
                                            <span class="font-medium mr-2">{$value}</span>
                                            <span class="text-gray-600">{$feature}</span>
                                        </li>
                                    {/foreach}
                                </ul>
                            </div>
                            <div class="p-4 bg-gray-50 border-t border-gray-200 flex flex-col md:flex-row items-center justify-between">
                                <div class="product-pricing text-center md:text-left mb-3 md:mb-0" id="{$idPrefix}-price">
                                    {if $product.bid}
                                        <span class="block text-gray-600">{$LANG.bundledeal}</span>
                                        {if $product.displayprice}
                                            <span class="text-2xl font-bold text-gray-800">{$product.displayprice}</span>
                                        {/if}
                                    {else}
                                        {if $product.pricing.hasconfigoptions}
                                            <span class="block text-gray-600">{$LANG.startingfrom}</span>
                                        {/if}
                                        <span class="text-2xl font-bold text-gray-800">{$product.pricing.minprice.price}</span>
                                        <span class="block text-sm text-gray-600">
                                            {if $product.pricing.minprice.cycle eq "monthly"}
                                                {$LANG.orderpaymenttermmonthly}
                                            {elseif $product.pricing.minprice.cycle eq "quarterly"}
                                                {$LANG.orderpaymenttermquarterly}
                                            {elseif $product.pricing.minprice.cycle eq "semiannually"}
                                                {$LANG.orderpaymenttermsemiannually}
                                            {elseif $product.pricing.minprice.cycle eq "annually"}
                                                {$LANG.orderpaymenttermannually}
                                            {elseif $product.pricing.minprice.cycle eq "biennially"}
                                                {$LANG.orderpaymenttermbiennially}
                                            {elseif $product.pricing.minprice.cycle eq "triennially"}
                                                {$LANG.orderpaymenttermtriennially}
                                            {/if}
                                        </span>
                                        {if $product.pricing.minprice.setupFee}
                                            <span class="block text-xs text-gray-500">{$product.pricing.minprice.setupFee->toPrefixed()} {$LANG.ordersetupfee}</span>
                                        {/if}
                                    {/if}
                                </div>
                                <a href="{$product.productUrl}" class="w-full md:w-auto inline-flex items-center justify-center px-4 py-2 bg-green-500 hover:bg-green-600 text-white font-medium rounded transition-colors" id="{$idPrefix}-order-button"{if $product.hasRecommendations} data-has-recommendations="1"{/if}>
                                    <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z" />
                                    </svg>
                                    {$LANG.ordernowbutton}
                                </a>
                            </div>
                        </div>
                    {/foreach}
                </div>
            </div>
        </div>
    </div>
</div>

{include file="orderforms/twwhmcstailwind/recommendations-modal.tpl"}