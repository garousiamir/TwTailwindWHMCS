{if $checkout}

    {include file="orderforms/twwhmcstailwind/checkout.tpl"}

{else}

<script>
    // Define state tab index value
    var statesTab = 10;
    var stateNotRequired = true;
</script>
{include file="orderforms/twwhmcstailwind/common.tpl"}
<script type="text/javascript" src="{$BASE_PATH_JS}/StatesDropdown.js"></script>

<div id="order-standard_cart">

    <div class="flex flex-wrap">
        <div class="w-full lg:w-1/4 px-3">

            {include file="orderforms/twwhmcstailwind/sidebar-categories.tpl"}

        </div>
        <div class="w-full lg:w-3/4">
            <div class="border-b pb-4 mb-6">
                <h1 class="text-4xl font-bold">{$LANG.cartreviewcheckout}</h1>
            </div>

            {include file="orderforms/twwhmcstailwind/sidebar-categories-collapsed.tpl"}

            <div class="flex flex-wrap">
                <div class="w-full lg:w-2/3 px-3">

                    {if $promoerrormessage}
                        <div class="alert alert-warning text-center bg-yellow-100 border-l-4 border-yellow-500 text-yellow-700 p-4 mb-4" role="alert">
                            {$promoerrormessage}
                        </div>
                    {elseif $errormessage}
                        <div class="alert alert-danger bg-red-100 border-l-4 border-red-500 text-red-700 p-4 mb-4" role="alert">
                            <p>{$LANG.orderForm.correctErrors}:</p>
                            <ul class="list-disc pl-5">
                                {$errormessage}
                            </ul>
                        </div>
                    {elseif $promotioncode && $rawdiscount eq "0.00"}
                        <div class="alert alert-info bg-blue-100 border-l-4 border-blue-500 text-blue-700 p-4 mb-4 text-center" role="alert">
                            {$LANG.promoappliedbutnodiscount}
                        </div>
                    {elseif $promoaddedsuccess}
                        <div class="alert alert-success bg-green-100 border-l-4 border-green-500 text-green-700 p-4 mb-4 text-center" role="alert">
                            {$LANG.orderForm.promotionAccepted}
                        </div>
                    {/if}

                    {if $bundlewarnings}
                        <div class="alert alert-warning bg-yellow-100 border-l-4 border-yellow-500 text-yellow-700 p-4 mb-4" role="alert">
                            <strong>{$LANG.bundlereqsnotmet}</strong><br />
                            <ul class="list-disc pl-5">
                                {foreach from=$bundlewarnings item=warning}
                                    <li>{$warning}</li>
                                {/foreach}
                            </ul>
                        </div>
                    {/if}

                    <form method="post" action="{$smarty.server.PHP_SELF}?a=view">

                        <div class="view-cart-items-header bg-gray-100 p-4 mb-4">
                            <div class="flex flex-wrap items-center">
                                <div class="{if $showqtyoptions}w-full sm:w-1/2{else}w-full sm:w-2/3{/if}">
                                    <span class="text-lg font-medium">{$LANG.orderForm.productOptions}</span>
                                </div>
                                {if $showqtyoptions}
                                    <div class="hidden sm:block w-1/6 text-center">
                                        <span class="text-lg font-medium">{$LANG.orderForm.qty}</span>
                                    </div>
                                {/if}
                                <div class="w-full sm:w-1/3 text-right">
                                    <span class="text-lg font-medium">{$LANG.orderForm.priceCycle}</span>
                                </div>
                            </div>
                        </div>
                        <div class="view-cart-items space-y-4">

                            {foreach $products as $num => $product}
                                <div class="item bg-white shadow rounded p-4">
                                    <div class="flex flex-wrap items-center">
                                        <div class="{if $showqtyoptions}w-full sm:w-1/2{else}w-full sm:w-2/3{/if}">
                                            <span class="block text-lg font-bold">
                                                {$product.productinfo.name}
                                                <a href="{$WEB_ROOT}/cart.php?a=confproduct&i={$num}" class="text-blue-500 text-sm">
                                                    <i class="fas fa-pencil-alt"></i>
                                                    {$LANG.orderForm.edit}
                                                </a>
                                                <span class="sm:hidden block">
                                                    <button type="button" class="text-red-500 text-sm" onclick="removeItem('p','{$num}')">
                                                        <i class="fas fa-times"></i>
                                                        {$LANG.orderForm.remove}
                                                    </button>
                                                </span>
                                            </span>
                                            <span class="block text-gray-500 text-sm">
                                                {$product.productinfo.groupname}
                                            </span>
                                            {if $product.domain}
                                                <span class="block text-gray-500 text-sm">
                                                    {$product.domain}
                                                </span>
                                            {/if}
                                            {if $product.configoptions}
                                                <small class="block text-gray-500 text-xs">
                                                    {foreach key=confnum item=configoption from=$product.configoptions}
                                                        &nbsp;&raquo; {$configoption.name}: {if $configoption.type eq 1 || $configoption.type eq 2}{$configoption.option}{elseif $configoption.type eq 3}{if $configoption.qty}{$configoption.option}{else}{$LANG.no}{/if}{elseif $configoption.type eq 4}{$configoption.qty} x {$configoption.option}{/if}<br />
                                                    {/foreach}
                                                </small>
                                            {/if}
                                        </div>
                                        {if $showqtyoptions}
                                            <div class="w-1/6 text-center">
                                                {if $product.allowqty}
                                                    <input type="number" name="qty[{$num}]" value="{$product.qty}" class="form-control text-center w-16 mx-auto" min="0" />
                                                    <button type="submit" class="btn btn-xs">
                                                        {$LANG.orderForm.update}
                                                    </button>
                                                {/if}
                                            </div>
                                        {/if}
                                        <div class="w-full sm:w-1/3 text-right">
                                            <span class="block text-lg font-medium">{$product.pricing.totalTodayExcludingTaxSetup}</span>
                                            <span class="block text-sm text-gray-500">{$product.billingcyclefriendly}</span>
                                            {if $product.pricing.productonlysetup}
                                                <span class="block text-sm text-gray-500">{$product.pricing.productonlysetup->toPrefixed()} {$LANG.ordersetupfee}</span>
                                            {/if}
                                            {if $product.proratadate}<br /><span class="block text-sm text-gray-500">({$LANG.orderprorata} {$product.proratadate})</span>{/if}
                                        </div>
                                        <div class="hidden sm:block w-1/12 text-center">
                                            <button type="button" class="text-red-500 text-sm" onclick="removeItem('p','{$num}')">
                                                <i class="fas fa-times"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                {foreach $product.addons as $addonnum => $addon}
                                    <div class="item bg-white shadow rounded p-4">
                                        <div class="flex flex-wrap items-center">
                                            <div class="{if $showAddonQtyOptions}w-full sm:w-1/2{else}w-full sm:w-2/3{/if}">
                                                <span class="block text-lg font-bold">
                                                    {$addon.name}
                                                </span>
                                                <span class="block text-gray-500 text-sm">
                                                    {$LANG.orderaddon}
                                                </span>
                                            </div>
                                            {if $showAddonQtyOptions}
                                                <div class="w-1/6 text-center">
                                                    {if $addon.allowqty === 2}
                                                        <input type="number" name="paddonqty[{$num}][{$addonnum}]" value="{$addon.qty}" class="form-control text-center w-16 mx-auto" min="0" />
                                                        <button type="submit" class="btn btn-xs">
                                                            {$LANG.orderForm.update}
                                                        </button>
                                                    {/if}
                                                </div>
                                            {/if}
                                            <div class="w-full sm:w-1/3 text-right">
                                                <span class="block text-lg font-medium">{$addon.totaltoday}</span>
                                                <span class="block text-sm text-gray-500">{$addon.billingcyclefriendly}</span>
                                                {if $addon.setup}<span class="block text-sm text-gray-500">{$addon.setup->toPrefixed()} {$LANG.ordersetupfee}</span>{/if}
                                                {if $addon.isProrated}<br /><span class="block text-sm text-gray-500">({$LANG.orderprorata} {$addon.prorataDate})</span>{/if}
                                            </div>
                                        </div>
                                    </div>
                                {/foreach}
                            {/foreach}

                            {if $cartitems == 0}
                                <div class="view-cart-empty text-center py-8">
                                    <span class="text-gray-500 text-lg">{$LANG.cartempty}</span>
                                </div>
                            {/if}

                        </div>

                        {if $cartitems > 0}
                            <div class="empty-cart text-center mt-6">
                                <button type="button" class="text-red-500 text-lg" id="btnEmptyCart">
                                    <i class="fas fa-trash-alt"></i>
                                    <span>{$LANG.emptycart}</span>
                                </button>
                            </div>
                        {/if}

                    </form>

                    {foreach $hookOutput as $output}
                        <div class="mt-6">
                            {$output}
                        </div>
                    {/foreach}

                    {foreach $gatewaysoutput as $gatewayoutput}
                        <div class="view-cart-gateway-checkout mt-6">
                            {$gatewayoutput}
                        </div>
                    {/foreach}

                    <div class="view-cart-tabs mt-6">
                        <ul class="flex border-b">
                            <li class="nav-item">
                                <a href="#applyPromo" class="nav-link block py-2 px-4 text-blue-500 border-b-2 border-blue-500" aria-controls="applyPromo" role="tab" data-toggle="tab">
                                    {$LANG.orderForm.applyPromoCode}
                                </a>
                            </li>
                            {if $taxenabled && !$loggedin}
                                <li class="nav-item">
                                    <a href="#calcTaxes" class="nav-link block py-2 px-4 text-gray-500 hover:text-blue-500" aria-controls="calcTaxes" role="tab" data-toggle="tab">
                                        {$LANG.orderForm.estimateTaxes}
                                    </a>
                                </li>
                            {/if}
                        </ul>
                        <div class="tab-content mt-6 bg-white rounded-lg shadow-md p-6">
                            <div role="tabpanel" class="tab-pane active promo">
                                {if $promotioncode}
                                    <div class="view-cart-promotion-code text-center text-green-600 font-semibold p-3 bg-green-50 rounded-md border border-green-200">
                                        {$promotioncode} - {$promotiondescription}
                                    </div>
                                    <div class="text-center mt-4">
                                        <a href="{$WEB_ROOT}/cart.php?a=removepromo" class="text-red-600 hover:text-red-800 font-medium transition duration-300 ease-in-out">
                                            <i class="fas fa-times-circle mr-1"></i> {$LANG.orderForm.removePromotionCode}
                                        </a>
                                    </div>
                                {else}
                                    <form method="post" action="{$WEB_ROOT}/cart.php?a=view" class="space-y-4">
                                        <div class="form-group relative">
                                            <label for="cardno" class="absolute inset-y-0 left-3 flex items-center">
                                                <i class="fas fa-ticket-alt text-gray-500"></i>
                                            </label>
                                            <input type="text" name="promocode" id="inputPromotionCode" class="form-control w-full py-3 pl-10 px-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition duration-200" placeholder="{lang key="orderPromoCodePlaceholder"}" required="required">
                                        </div>
                                        <button type="submit" name="validatepromo" class="btn btn-block bg-blue-600 hover:bg-blue-700 text-white font-medium py-3 px-4 rounded-lg w-full transition duration-300 ease-in-out focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-opacity-50">
                                            {$LANG.orderpromovalidatebutton}
                                        </button>
                                    </form>
                                {/if}
                                
                            </div>
                            <div role="tabpanel" class="tab-pane mt-4" id="calcTaxes">
                                <form method="post" action="{$WEB_ROOT}/cart.php?a=setstateandcountry" class="space-y-6">
                                    <div class="form-group flex flex-col md:flex-row md:items-center mb-4">
                                        <label for="inputState" class="w-full md:w-1/3 text-left md:text-right pr-0 md:pr-4 mb-2 md:mb-0 font-medium text-gray-700">{$LANG.orderForm.state}</label>
                                        <div class="w-full md:w-2/3">
                                            <input type="text" name="state" id="inputState" value="{$clientsdetails.state}" class="form-control w-full py-2 px-4 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition duration-200"{if $loggedin} disabled="disabled"{/if} />
                                        </div>
                                    </div>
                                    <div class="form-group flex flex-col md:flex-row md:items-center mb-4">
                                        <label for="inputCountry" class="w-full md:w-1/3 text-left md:text-right pr-0 md:pr-4 mb-2 md:mb-0 font-medium text-gray-700">{$LANG.orderForm.country}</label>
                                        <div class="w-full md:w-2/3">
                                            <select name="country" id="inputCountry" class="form-control w-full py-2 px-4 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition duration-200 appearance-none bg-white">
                                                {foreach $countries as $countrycode => $countrylabel}
                                                    <option value="{$countrycode}"{if (!$country && $countrycode == $defaultcountry) || $countrycode eq $country} selected{/if}>
                                                        {$countrylabel}
                                                    </option>
                                                {/foreach}
                                            </select>
                                            <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-700">
                                                <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z"/></svg>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group text-center mt-6">
                                        <button type="submit" class="btn bg-blue-600 hover:bg-blue-700 text-white font-medium py-3 px-6 rounded-lg transition duration-300 ease-in-out focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-opacity-50">
                                            {$LANG.orderForm.updateTotals}
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="w-full lg:w-1/3" id="scrollingPanelContainer">

                    <div class="order-summary bg-gray-100 p-6 rounded shadow">
                        <div class="loader hidden" id="orderSummaryLoader">
                            <i class="fas fa-fw fa-sync fa-spin"></i>
                        </div>
                        <h2 class="text-3xl font-bold">{$LANG.ordersummary}</h2>
                        <div class="summary-container space-y-4">

                            <div class="subtotal flex justify-between">
                                <span>{$LANG.ordersubtotal}</span>
                                <span id="subtotal">{$subtotal}</span>
                            </div>
                            {if $promotioncode || $taxrate || $taxrate2}
                                <div class="bordered-totals border-t pt-4">
                                    {if $promotioncode}
                                        <div class="flex justify-between">
                                            <span>{$promotiondescription}</span>
                                            <span id="discount">{$discount}</span>
                                        </div>
                                    {/if}
                                    {if $taxrate}
                                        <div class="flex justify-between">
                                            <span>{$taxname} @ {$taxrate}%</span>
                                            <span id="taxTotal1">{$taxtotal}</span>
                                        </div>
                                    {/if}
                                    {if $taxrate2}
                                        <div class="flex justify-between">
                                            <span>{$taxname2} @ {$taxrate2}%</span>
                                            <span id="taxTotal2">{$taxtotal2}</span>
                                        </div>
                                    {/if}
                                </div>
                            {/if}
                            <div class="recurring-totals">
                                <span>{$LANG.orderForm.totals}</span>
                                <span id="recurring" class="recurring-charges">
                                    <span id="recurringMonthly" {if !$totalrecurringmonthly}class="hidden"{/if}>
                                        <span class="cost">{$totalrecurringmonthly}</span> {$LANG.orderpaymenttermmonthly}<br />
                                    </span>
                                    <span id="recurringQuarterly" {if !$totalrecurringquarterly}class="hidden"{/if}>
                                        <span class="cost">{$totalrecurringquarterly}</span> {$LANG.orderpaymenttermquarterly}<br />
                                    </span>
                                    <span id="recurringSemiAnnually" {if !$totalrecurringsemiannually}class="hidden"{/if}>
                                        <span class="cost">{$totalrecurringsemiannually}</span> {$LANG.orderpaymenttermsemiannually}<br />
                                    </span>
                                    <span id="recurringAnnually" {if !$totalrecurringannually}class="hidden"{/if}>
                                        <span class="cost">{$totalrecurringannually}</span> {$LANG.orderpaymenttermannually}<br />
                                    </span>
                                    <span id="recurringBiennially" {if !$totalrecurringbiennially}class="hidden"{/if}>
                                        <span class="cost">{$totalrecurringbiennially}</span> {$LANG.orderpaymenttermbiennially}<br />
                                    </span>
                                    <span id="recurringTriennially" {if !$totalrecurringtriennially}class="hidden"{/if}>
                                        <span class="cost">{$totalrecurringtriennially}</span> {$LANG.orderpaymenttermtriennially}<br />
                                    </span>
                                </span>
                            </div>

                            <div class="total-due-today text-center py-4 border-t">
                                <span id="totalDueToday" class="text-2xl font-bold">{$total}</span>
                                <span>{$LANG.ordertotalduetoday}</span>
                            </div>

                            <div class="express-checkout-buttons space-y-4">
                                {foreach $expressCheckoutButtons as $checkoutButton}
                                    {$checkoutButton}
                                    <div class="separator text-center text-gray-500">
                                        - {$LANG.or|strtoupper} -
                                    </div>
                                {/foreach}
                            </div>

                            <div class="text-right">
                                <a href="{$WEB_ROOT}/cart.php?a=checkout&e=false" class="btn bg-green-500 text-white px-6 py-3 text-lg font-bold{if $cartitems == 0} disabled{/if}" id="checkout">
                                    {$LANG.orderForm.checkout}
                                    <i class="fas fa-arrow-right"></i>
                                </a><br />
                                <a href="{$WEB_ROOT}/cart.php" class="text-blue-500 mt-4 inline-block" id="continueShopping">
                                    {$LANG.orderForm.continueShopping}
                                </a>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <form method="post" action="{$WEB_ROOT}/cart.php">
        <input type="hidden" name="a" value="remove" />
        <input type="hidden" name="r" value="" id="inputRemoveItemType" />
        <input type="hidden" name="i" value="" id="inputRemoveItemRef" />
        <input type="hidden" name="rt" value="" id="inputRemoveItemRenewalType">
        <div class="modal fade modal-remove-item" id="modalRemoveItem" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="float-right">
                            <button type="button" class="close" data-dismiss="modal" aria-label="{lang key='orderForm.close'}">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <h4 class="modal-title margin-bottom mb-3">
                            <i class="fas fa-times fa-3x"></i>
                            <span>{lang key='orderForm.removeItem'}</span>
                        </h4>
                        {lang key='cartremoveitemconfirm'}
                    </div>
                    <div class="modal-footer justify-content-center">
                        <button type="button" class="btn btn-default" data-dismiss="modal">{lang key='no'}</button>
                        <button type="submit" class="btn btn-primary">{lang key='yes'}</button>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <form method="post" action="{$WEB_ROOT}/cart.php">
        <input type="hidden" name="a" value="empty" />
        <div class="modal fade modal-remove-item" id="modalEmptyCart" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="float-right">
                            <button type="button" class="close" data-dismiss="modal" aria-label="{$LANG.orderForm.close}">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <h4 class="modal-title margin-bottom mb-3">
                            <i class="fas fa-trash-alt fa-3x"></i>
                            <span>{$LANG.emptycart}</span>
                        </h4>
                        {$LANG.cartemptyconfirm}
                    </div>
                    <div class="modal-footer justify-content-center">
                        <button type="button" class="btn btn-default" data-dismiss="modal">{$LANG.no}</button>
                        <button type="submit" class="btn btn-primary">{$LANG.yes}</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
{include file="orderforms/twwhmcstailwind/recommendations-modal.tpl"}
{/if}