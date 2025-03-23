{include file="$template/includes/tablelist.tpl" tableName="InvoicesList" filterColumn="4"}

<script>
    jQuery(document).ready(function() {
        var table = jQuery('#tableInvoicesList').show().DataTable();

        {if $orderby == 'default'}
            table.order([4, 'desc'], [2, 'asc']);
        {elseif $orderby == 'invoicenum'}
            table.order(0, '{$sort}');
        {elseif $orderby == 'date'}
            table.order(1, '{$sort}');
        {elseif $orderby == 'duedate'}
            table.order(2, '{$sort}');
        {elseif $orderby == 'total'}
            table.order(3, '{$sort}');
        {elseif $orderby == 'status'}
            table.order(4, '{$sort}');
        {/if}
        table.draw();
        jQuery('#tableLoading').hide();
    });
</script>

<div class="table-container clearfix">
    <table id="tableInvoicesList" class="min-w-full divide-y divide-gray-200 hidden">
        <thead class="bg-gray-50">
            <tr>
                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                    {lang key='invoicestitle'}
                </th>
                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                    {lang key='invoicesdatecreated'}
                </th>
                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                    {lang key='invoicesdatedue'}
                </th>
                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                    {lang key='invoicestotal'}
                </th>
                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                    {lang key='invoicesstatus'}
                </th>
            </tr>
        </thead>
        <tbody class="bg-white divide-y divide-gray-200">
            {foreach $invoices as $invoice}
                <tr onclick="clickableSafeRedirect(event, 'viewinvoice.php?id={$invoice.id}', false)" class="cursor-pointer">
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                        {$invoice.invoicenum}
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                        <span class="hidden">{$invoice.normalisedDateCreated}</span>{$invoice.datecreated}
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                        <span class="hidden">{$invoice.normalisedDateDue}</span>{$invoice.datedue}
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500" data-order="{$invoice.totalnum}">
                        {$invoice.total}
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                        <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-{$invoice.statusClass}-100 text-{$invoice.statusClass}-800">
                            {$invoice.status}
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