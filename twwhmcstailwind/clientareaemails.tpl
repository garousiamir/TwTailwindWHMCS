{include file="$template/includes/tablelist.tpl" tableName="EmailsList" noSortColumns="-1"}

<script>
    jQuery(document).ready(function () {
        var table = jQuery('#tableEmailsList').show().DataTable();

        {if $orderby == 'date'}
            table.order(0, '{$sort}');
        {elseif $orderby == 'subject'}
            table.order(1, '{$sort}');
        {/if}
        table.draw();
        jQuery('#tableLoading').hide();
    });
</script>

<div class="table-container clearfix">
    <table id="tableEmailsList" class="min-w-full divide-y divide-gray-200 hidden">
        <thead class="bg-gray-50">
            <tr>
                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                    {lang key='clientareaemailsdate'}
                </th>
                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                    {lang key='clientareaemailssubject'}
                </th>
                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                    &nbsp;
                </th>
            </tr>
        </thead>
        <tbody class="bg-white divide-y divide-gray-200">
            {foreach $emails as $email}
                <tr onclick="popupWindow('viewemail.php?id={$email.id}', 'emailWin', '800', '600')" class="cursor-pointer">
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500 text-center">
                        <span class="hidden">{$email.normalisedDate}</span>{$email.date}
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                        {$email.subject}{if $email.attachmentCount > 0} <i class="fal fa-paperclip"></i>{/if}
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500 text-center">
                        <button type="button" class="px-4 py-2 bg-blue-500 text-white text-sm font-medium rounded-md hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-500" onclick="popupWindow('viewemail.php?id={$email.id}', 'emailWin', '800', '600', 'scrollbars=1,')">
                            {lang key='emailviewmessage'}
                        </button>
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