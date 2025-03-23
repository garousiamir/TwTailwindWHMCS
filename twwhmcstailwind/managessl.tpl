{include file="$template/includes/tablelist.tpl" tableName="SslList" startOrderCol="3" filterColumn="0" noSortColumns="4"}

<div class="alert alert-table-ssl-manage w-hidden"></div>

<div class="table-container clearfix">
    <table id="tableSslList" class="min-w-full divide-y divide-gray-200">
        <thead class="bg-gray-50">
            <tr>
                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                    {lang key='ssldomain'}
                </th>
                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                    {lang key='sslproduct'}
                </th>
                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                    {lang key='sslorderdate'}
                </th>
                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                    {lang key='sslrenewaldate'}
                </th>
                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                    {lang key='actions'}
                </th>
            </tr>
        </thead>
        <tbody class="bg-white divide-y divide-gray-200">
            {foreach $sslProducts as $sslProduct}
                <tr>
                    {if $sslProduct->addonId && $sslProduct->addonId > 0}
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                            {if $sslProduct->status == $sslStatusAwaitingConfiguration}
                                <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-blue-100 text-blue-800">
                                    {lang key='sslawaitingconfig'}
                                </span>
                            {else}
                                {if $sslProduct->addon->service->domain}{$sslProduct->addon->service->domain}{else}-{/if}
                                {if $sslProduct->addon->nextDueDateProperties['isPast']}
                                    <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-gray-100 text-gray-800">
                                        {lang key='clientareaexpired'}
                                    </span>
                                {elseif $sslProduct->addon->nextDueDateProperties['daysTillExpiry'] < 60}
                                    <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-red-100 text-red-800">
                                        {lang key='expiringsoon'}
                                    </span>
                                {else}
                                    {if $sslProduct->wasInstantIssuanceAttempted() && $sslProduct->wasInstantIssuanceSuccessful()}&nbsp;<i class="fas fa-bolt text-yellow-500" title="{lang key='sslinstantissuancebenefit'}"></i>{/if}
                                {/if}
                            {/if}
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                            {$sslProduct->addon->productAddon->name}
                            <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium 
                                {if $sslProduct->validationType == 'DV'}bg-gray-100 text-gray-800
                                {elseif $sslProduct->validationType == 'OV'}bg-yellow-100 text-yellow-800
                                {elseif $sslProduct->validationType == 'EV'}bg-green-100 text-green-800{/if}">
                                {$sslProduct->validationType}
                            </span>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                            <span class="hidden">{$sslProduct->addon->registrationDate}</span>{$sslProduct->addon->registrationDateFormatted}
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                            <span class="hidden">{$sslProduct->addon->nextDueDate}</span>{$sslProduct->addon->nextDueDateFormatted}
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                            {if $sslProduct->status == $sslStatusAwaitingIssuance}
                                <button class="px-4 py-2 bg-gray-100 text-gray-800 text-sm font-medium rounded-md hover:bg-gray-200 focus:outline-none focus:ring-2 focus:ring-gray-500" data-url="{routePath('clientarea-ssl-certificates-resend-approver-email')}" data-addonid="{$sslProduct->addonId}">
                                    {lang key='sslresendmail'}
                                </button>
                            {/if}
                            {if $sslProduct->status == $sslStatusAwaitingConfiguration}
                                <a href="{$sslProduct->getConfigurationUrl()}" class="px-4 py-2 bg-blue-100 text-blue-800 text-sm font-medium rounded-md hover:bg-blue-200 focus:outline-none focus:ring-2 focus:ring-blue-500">
                                    {lang key='sslconfigure'}
                                </a>
                            {/if}
                            {if $sslProduct->addon->nextDueDateProperties['isFuture']}
                                <form action="{$sslProduct->getUpgradeUrl()}" method="post" class="inline">
                                    <input type="hidden" name="id" value="{$sslProduct->id}">
                                    <button type="submit" class="px-4 py-2 bg-gray-100 text-gray-800 text-sm font-medium rounded-md hover:bg-gray-200 focus:outline-none focus:ring-2 focus:ring-gray-500"{if $sslProduct->validationType == 'EV'} disabled{/if}>
                                        {lang key='upgrade'}
                                    </button>
                                </form>
                            {/if}
                        </td>
                    {else}
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                            {if $sslProduct->status == $sslStatusAwaitingConfiguration}
                                <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-blue-100 text-blue-800">
                                    {lang key='sslawaitingconfig'}
                                </span>
                            {else}
                                {if $sslProduct->service->domain}{$sslProduct->service->domain}{else}-{/if}
                                {if $sslProduct->service->nextDueDateProperties['isPast']}
                                    <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-gray-100 text-gray-800">
                                        {lang key='clientareaexpired'}
                                    </span>
                                {elseif $sslProduct->service->nextDueDateProperties['daysTillExpiry'] < 60}
                                    <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-red-100 text-red-800">
                                        {lang key='expiringsoon'}
                                    </span>
                                {/if}
                            {/if}
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                            {$sslProduct->service->product->name}
                            <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium 
                                {if $sslProduct->validationType == 'DV'}bg-gray-100 text-gray-800
                                {elseif $sslProduct->validationType == 'OV'}bg-yellow-100 text-yellow-800
                                {elseif $sslProduct->validationType == 'EV'}bg-green-100 text-green-800{/if}">
                                {$sslProduct->validationType}
                            </span>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                            <span class="hidden">{$sslProduct->service->registrationDate}</span>{$sslProduct->service->registrationDateFormatted}
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                            <span class="hidden">{$sslProduct->service->nextDueDate}</span>{$sslProduct->service->nextDueDateFormatted}
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                            {if $sslProduct->status == $sslStatusAwaitingIssuance}
                                <button class="px-4 py-2 bg-gray-100 text-gray-800 text-sm font-medium rounded-md hover:bg-gray-200 focus:outline-none focus:ring-2 focus:ring-gray-500" data-url="{routePath('clientarea-ssl-certificates-resend-approver-email')}" data-serviceid="{$sslProduct->serviceId}">
                                    {lang key='sslresendmail'}
                                </button>
                            {/if}
                            {if $sslProduct->status == $sslStatusAwaitingConfiguration}
                                <a href="{$sslProduct->getConfigurationUrl()}" class="px-4 py-2 bg-blue-100 text-blue-800 text-sm font-medium rounded-md hover:bg-blue-200 focus:outline-none focus:ring-2 focus:ring-blue-500">
                                    {lang key='sslconfigure'}
                                </a>
                            {/if}
                        </td>
                    {/if}
                </tr>
            {/foreach}
        </tbody>
    </table>
</div>