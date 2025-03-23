<div class="domain-pricing">

    {if $featuredTlds}
        <div class="featured-tlds-container">
            <div class="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 gap-4">
                {foreach $featuredTlds as $num => $tldinfo}
                    <div class="col-span-1">
                        <div class="featured-tld bg-white shadow-sm rounded-lg p-4 text-center">
                            <div class="img-container mb-4">
                                <img src="{$BASE_PATH_IMG}/tld_logos/{$tldinfo.tldNoDots}.png" class="mx-auto" alt="{$tldinfo.tldNoDots}">
                            </div>
                            <div class="price text-lg font-semibold text-gray-800">
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

    {if !$loggedin && $currencies}
        <form method="post" action="" class="float-right">
            <select name="currency" class="form-select currency-selector bg-white border border-gray-300 rounded-md shadow-sm py-2 px-3 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500" onchange="submit()">
                <option>
                    {lang key="changeCurrency"} ({$activeCurrency.prefix} {$activeCurrency.code})
                </option>
                {foreach $currencies as $currency}
                    <option value="{$currency['id']}">
                        {$currency['prefix']} {$currency['code']}
                    </option>
                {/foreach}
            </select>
        </form>
    {/if}

    <h4 class="text-xl font-semibold mt-8 mb-4">{lang key='pricing.browseExtByCategory'}</h4>

    <div class="tld-filters flex flex-wrap gap-2 mb-6">
        {foreach $tldCategories as $category => $count}
            <a href="#" data-category="{$category}" class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-gray-200 text-gray-800 hover:bg-gray-300">
                {lang key="domainTldCategory.$category" defaultValue=$category} ({$count})
            </a>
        {/foreach}
    </div>

    {include file="$template/includes/tablelist.tpl" tableName="DomainPricing" noOrdering=true}
    <script>
        jQuery(document).ready(function() {
            var table = jQuery('#tableDomainPricing').show().DataTable();

            {if $orderby == 'date'}
                table.order(0, '{$sort}');
            {elseif $orderby == 'subject'}
                table.order(1, '{$sort}');
            {/if}
            table.draw();
            jQuery('#tableLoading').hide();
            jQuery('.tld-filters a').unbind();
            jQuery('.tld-filters a').click(function(e) {
                e.preventDefault();
                if (jQuery(this).hasClass('bg-blue-500')) {
                    jQuery('#tableDomainPricing_wrapper input[type="search"]').val('').trigger('keyup');
                    jQuery('.tld-filters a').removeClass('bg-blue-500 text-white');
                } else {
                    jQuery('#tableDomainPricing_wrapper input[type="search"]').val(jQuery(this)
                        .data('category'))
                        .trigger('keyup');
                    jQuery('.tld-filters a').removeClass('bg-blue-500 text-white');
                    jQuery(this).addClass('bg-blue-500 text-white');
                }
            });
        });
    </script>

    <div class="table-container clearfix overflow-auto">
        <table class="min-w-full divide-y divide-gray-200 hidden" id="tableDomainPricing">
            <thead class="bg-gray-50">
                <tr>
                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        {lang key='domaintld'}
                    </th>
                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        {lang key='category'}
                    </th>
                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        {lang key='pricing.register'}
                    </th>
                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        {lang key='pricing.transfer'}
                    </th>
                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        {lang key='pricing.renewal'}
                    </th>
                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        {lang key='gracePeriod'}
                    </th>
                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        {lang key='redemptionPeriod'}
                    </th>
                </tr>
            </thead>
            <tbody class="bg-white divide-y divide-gray-200">
                {foreach $pricing as $extension => $data}
                    <tr>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                            {$extension}
                            {if $data.group}
                                <span class="inline-flex items-center px-2 py-1 rounded-full text-xs font-medium bg-yellow-100 text-yellow-800">
                                    {$data.group}!
                                </span>
                            {/if}
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                            {$data.categories[0]}
                            <span class="hidden">
                                {foreach $data.categories as $category}
                                    {$category}
                                {/foreach}
                            </span>
                        </td>
                        {foreach $data.register as $years => $price}
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                                {if $price >= 0}
                                    {$price}<br>
                                    <small class="text-gray-400">{$years} {if $years > 1}{lang key="orderForm.years"}{else}{lang key="orderForm.year"}{/if}</small>
                                {else}
                                    <small class="text-gray-400">{lang key="domainregnotavailable"}</small>
                                {/if}
                            </td>
                            {break}
                        {foreachelse}
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">-</td>
                        {/foreach}
                        {foreach $data.transfer as $years => $price}
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                                {if $price >= 0}
                                    {$price}<br>
                                    <small class="text-gray-400">{$years} {if $years > 1}{lang key="orderForm.years"}{else}{lang key="orderForm.year"}{/if}</small>
                                {else}
                                    <small class="text-gray-400">{lang key="domainregnotavailable"}</small>
                                {/if}
                            </td>
                            {break}
                        {foreachelse}
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">-</td>
                        {/foreach}
                        {foreach $data.renew as $years => $price}
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                                {if $price >= 0}
                                    {$price}<br>
                                    <small class="text-gray-400">{$years} {if $years > 1}{lang key="orderForm.years"}{else}{lang key="orderForm.year"}{/if}</small>
                                {else}
                                    <small class="text-gray-400">{lang key="domainregnotavailable"}</small>
                                {/if}
                            </td>
                            {break}
                        {foreachelse}
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">-</td>
                        {/foreach}
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                            {if is_null($data.grace_period)}
                                -
                            {else}
                                {$data.grace_period.days} {lang key='domainrenewalsdays'}<br>
                                <small class="text-gray-400">({$data.grace_period.price})</small>
                            {/if}
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                            {if is_null($data.redemption_period)}
                                -
                            {else}
                                {$data.redemption_period.days} {lang key='domainrenewalsdays'}<br>
                                <small class="text-gray-400">({$data.redemption_period.price})</small>
                            {/if}
                        </td>
                    </tr>
                {foreachelse}
                    <tr>
                        <td colspan="7" class="px-6 py-4 whitespace-nowrap text-sm text-gray-500 text-center">{lang key="pricing.noExtensionsDefined"}</td>
                    </tr>
                {/foreach}
            </tbody>
        </table>
        <div class="text-center" id="tableLoading">
            <p class="text-gray-500">
                <i class="fas fa-spinner fa-spin"></i> {lang key='loading'}
            </p>
        </div>
    </div>

</div>