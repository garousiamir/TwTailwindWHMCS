{if $inactive}

    {include file="$template/includes/alert.tpl" type="danger" msg="{lang key='affiliatesdisabled'}" textcenter=true}

{else}
    {include file="$template/includes/flashmessage.tpl"}
    {if $withdrawrequestsent}
        <div class="alert alert-success">
            <i class="fas fa-check fa-fw"></i>
            {lang key='affiliateswithdrawalrequestsuccessful'}
        </div>
    {/if}

    <div class="grid grid-cols-1 md:grid-cols-3 gap-4">

        <div class="affiliate-stat bg-yellow-100 p-6 rounded-lg text-center">
            <i class="fas fa-users text-3xl text-yellow-600 mb-2"></i>
            <span class="text-2xl font-bold block">{$visitors}</span>
            {lang key='affiliatesclicks'}
        </div>

        <div class="affiliate-stat bg-blue-100 p-6 rounded-lg text-center">
            <i class="fas fa-shopping-cart text-3xl text-blue-600 mb-2"></i>
            <span class="text-2xl font-bold block">{$signups}</span>
            {lang key='affiliatessignups'}
        </div>

        <div class="affiliate-stat bg-green-100 p-6 rounded-lg text-center">
            <i class="far fa-chart-bar text-3xl text-green-600 mb-2"></i>
            <span class="text-2xl font-bold block">{$conversionrate}%</span>
            {lang key='affiliatesconversionrate'}
        </div>

    </div>

    <div class="card bg-white shadow-sm rounded-lg my-6">
        <div class="card-body p-6">
            <p class="text-xl font-semibold mb-4">{lang key='affiliatesreferallink'}</p>
            <input type="text" class="w-full px-4 py-2 border border-gray-300 rounded-md" readonly="readonly" value="{$referrallink}">
        </div>
    </div>

    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
        <div class="bg-white shadow-sm rounded-lg p-6">
            <table class="w-full">
                <tr>
                    <td class="text-right py-2">{lang key='affiliatescommissionspending'}:</td>
                    <td class="py-2"><strong>{$pendingcommissions}</strong></td>
                </tr>
                <tr>
                    <td class="text-right py-2">{lang key='affiliatescommissionsavailable'}:</td>
                    <td class="py-2"><strong>{$balance}</strong></td>
                </tr>
                <tr>
                    <td class="text-right py-2">{lang key='affiliateswithdrawn'}:</td>
                    <td class="py-2"><strong>{$withdrawn}</strong></td>
                </tr>
            </table>
        </div>
    </div>

    {if !$withdrawrequestsent}
        <div class="text-center mt-6">
            <form method="POST" action="{$smarty.server.PHP_SELF}">
                <input type="hidden" name="action" value="withdrawrequest" />
                <button type="submit" class="px-6 py-3 bg-red-600 text-white font-semibold rounded-lg hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-red-500{if !$withdrawlevel} opacity-50 cursor-not-allowed{/if}" {if !$withdrawlevel}disabled{/if}>
                    <i class="fas fa-university"></i> {lang key='affiliatesrequestwithdrawal'}
                </button>
            </form>
        </div>
        {if !$withdrawlevel}
            <p class="text-gray-600 text-center mt-4">{lang key="affiliateWithdrawalSummary" amountForWithdrawal=$affiliatePayoutMinimum}</p>
        {/if}
    {/if}

    <h2 class="text-2xl font-semibold mt-8 mb-4">{lang key='affiliatesreferals'}</h2>

    {include file="$template/includes/tablelist.tpl" tableName="AffiliatesList"}
    <script>
        jQuery(document).ready(function() {
            var table = jQuery('#tableAffiliatesList').show().DataTable();

            {if $orderby == 'regdate'}
                table.order(0, '{$sort}');
            {elseif $orderby == 'product'}
                table.order(1, '{$sort}');
            {elseif $orderby == 'amount'}
                table.order(2, '{$sort}');
            {elseif $orderby == 'status'}
                table.order(4, '{$sort}');
            {/if}
            table.draw();
            jQuery('#tableLoading').hide();
        });
    </script>
    <div class="table-container clearfix">
        <table id="tableAffiliatesList" class="min-w-full divide-y divide-gray-200 hidden">
            <thead class="bg-gray-50">
                <tr>
                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        {lang key='affiliatessignupdate'}
                    </th>
                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        {lang key='orderproduct'}
                    </th>
                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        {lang key='affiliatesamount'}
                    </th>
                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        {lang key='affiliatescommission'}
                    </th>
                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        {lang key='affiliatesstatus'}
                    </th>
                </tr>
            </thead>
            <tbody class="bg-white divide-y divide-gray-200">
                {foreach $referrals as $referral}
                    <tr class="text-center">
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                            <span class="hidden">{$referral.datets}</span>{$referral.date}
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                            {$referral.service}
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500" data-order="{$referral.amountnum}">
                            {$referral.amountdesc}
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500" data-order="{$referral.commissionnum}">
                            {$referral.commission}
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                            <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-{$referral.rawstatus|strtolower}-100 text-{$referral.rawstatus|strtolower}-800">
                                {$referral.status}
                            </span>
                        </td>
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

    {if $affiliatelinkscode}
        <h2 class="text-2xl font-semibold mt-8 mb-4">{lang key='affiliateslinktous'}</h2>
        <div class="text-center mb-8">
            {$affiliatelinkscode}
        </div>
    {/if}

{/if}