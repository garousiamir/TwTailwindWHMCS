{if $warnings}
    {include file="$template/includes/alert.tpl" type="warning" msg=$warnings textcenter=true}
{/if}
<div class="tab-content">
    <div class="tab-pane fade show active" id="tabOverview">
        {include file="$template/includes/tablelist.tpl" tableName="DomainsList" noSortColumns="0, 1" startOrderCol="2" filterColumn="5"}
        <script>
            jQuery(document).ready(function () {
                var table = jQuery('#tableDomainsList').show().DataTable();

                {if $orderby == 'domain'}
                    table.order(2, '{$sort}');
                {elseif $orderby == 'regdate' || $orderby == 'registrationdate'}
                    table.order(3, '{$sort}');
                {elseif $orderby == 'nextduedate'}
                    table.order(4, '{$sort}');
                {elseif $orderby == 'autorenew'}
                    table.order(5, '{$sort}');
                {elseif $orderby == 'status'}
                    table.order(6, '{$sort}');
                {/if}
                table.draw();
                jQuery('#tableLoading').hide();
            });
        </script>
        <form id="domainForm" method="post" action="clientarea.php?action=bulkdomain">
            <input id="bulkaction" name="update" type="hidden" />

            <div class="flex space-x-2 mb-3">
                <button type="button" class="px-4 py-2 bg-gray-100 text-gray-800 text-sm font-medium rounded-md hover:bg-gray-200 focus:outline-none focus:ring-2 focus:ring-gray-500 setBulkAction" id="nameservers">
                    <i class="fas fa-globe fa-fw"></i>
                    {lang key='domainmanagens'}
                </button>
                <button type="button" class="px-4 py-2 bg-gray-100 text-gray-800 text-sm font-medium rounded-md hover:bg-gray-200 focus:outline-none focus:ring-2 focus:ring-gray-500 setBulkAction" id="contactinfo">
                    <i class="fas fa-user"></i>
                    {lang key='domaincontactinfoedit'}
                </button>
                {if $allowrenew}
                    <button type="button" class="px-4 py-2 bg-gray-100 text-gray-800 text-sm font-medium rounded-md hover:bg-gray-200 focus:outline-none focus:ring-2 focus:ring-gray-500 setBulkAction" id="renewDomains">
                        <i class="fas fa-sync"></i>
                        {lang key='domainmassrenew'}
                    </button>
                {/if}
                <button type="button" class="px-4 py-2 bg-gray-100 text-gray-800 text-sm font-medium rounded-md hover:bg-gray-200 focus:outline-none focus:ring-2 focus:ring-gray-500 setBulkAction" id="renewDomains">
                    <a class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 setBulkAction" href="#" id="autorenew"><i class="fas fa-sync"></i> {lang key='domainautorenewstatus'}</a>
                </button>
                <button type="button" class="px-4 py-2 bg-gray-100 text-gray-800 text-sm font-medium rounded-md hover:bg-gray-200 focus:outline-none focus:ring-2 focus:ring-gray-500 setBulkAction" id="renewDomains">
                    <a class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 setBulkAction" href="#" id="autorenew"><i class="fas fa-sync"></i> {lang key='domainautorenewstatus'}</a>
                </button>
      
            </div>

            <div class="table-container clearfix">
                <table id="tableDomainsList" class="min-w-full divide-y divide-gray-200 hidden">
                    <thead class="bg-gray-50">
                        <tr>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                &nbsp;
                            </th>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                &nbsp;
                            </th>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                {lang key='orderdomain'}
                            </th>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                {lang key='clientareahostingregdate'}
                            </th>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                {lang key='clientareahostingnextduedate'}
                            </th>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                {lang key='domainstatus'}
                            </th>
                        </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200">
                        {foreach $domains as $domain}
                            <tr onclick="clickableSafeRedirect(event, 'clientarea.php?action=domaindetails&amp;id={$domain.id}', false)" class="cursor-pointer">
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                                    <input type="checkbox" name="domids[]" class="domids stopEventBubble" value="{$domain.id}" />
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500 text-center ssl-info" data-element-id="{$domain.id}" data-type="domain" data-domain="{$domain.domain}">
                                    {if $domain.sslStatus}
                                        <img src="{$domain.sslStatus->getImagePath()}" width="25" data-toggle="tooltip" title="{$domain.sslStatus->getTooltipContent()}" class="{$domain.sslStatus->getClass()}" width="25">
                                    {elseif !$domain.isActive}
                                        <img src="{$BASE_PATH_IMG}/ssl/ssl-inactive-domain.png" width="25" data-toggle="tooltip" title="{lang key='sslState.sslInactiveDomain'}" width="25">
                                    {/if}
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                    <a href="http://{$domain.domain}" target="_blank" class="text-blue-500 hover:text-blue-700">{$domain.domain}</a>
                                    <br>
                                    <small class="text-gray-500">
                                        {if $domain.autorenew}
                                            <i class="fas fa-fw fa-check text-green-500"></i>
                                            {lang key='domainsautorenew'}
                                        {else}
                                            <i class="fas fa-fw fa-times text-red-500"></i>
                                            {lang key='domainsautorenew'}
                                        {/if}
                                    </small>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                                    <span class="hidden">{$domain.normalisedRegistrationDate}</span>{$domain.registrationdate}
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                                    <span class="hidden">{$domain.normalisedNextDueDate}</span>{$domain.nextduedate}
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                                    <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-{$domain.statusClass}-100 text-{$domain.statusClass}-800">
                                        {$domain.statustext}
                                    </span>
                                    <span class="hidden">
                                        {if $domain.expiringSoon}<span>{lang key="domainsExpiringSoon"}</span>{/if}
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
        </form>
    </div>
</div>