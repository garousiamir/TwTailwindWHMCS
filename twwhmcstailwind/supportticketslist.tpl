{include file="$template/includes/tablelist.tpl" tableName="TicketsList" filterColumn="2"}

<script>
    jQuery(document).ready(function () {
        var table = jQuery('#tableTicketsList').show().DataTable();
        {if $orderby == 'did' || $orderby == 'dept'}
            table.order(0, '{$sort}');
        {elseif $orderby == 'subject' || $orderby == 'title'}
            table.order(1, '{$sort}');
        {elseif $orderby == 'status'}
            table.order(2, '{$sort}');
        {elseif $orderby == 'lastreply'}
            table.order(3, '{$sort}');
        {/if}
        table.draw();
        jQuery('#tableLoading').hide();
    });
</script>

<div class="table-container clearfix">
    <table id="tableTicketsList" class="min-w-full divide-y divide-gray-200 hidden">
        <thead class="bg-gray-50">
            <tr>
                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                    {lang key='supportticketsdepartment'}
                </th>
                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                    {lang key='supportticketssubject'}
                </th>
                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                    {lang key='supportticketsstatus'}
                </th>
                <th scope="col" class="px-6 py-3 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">
                    {lang key='supportticketsticketlastupdated'}
                </th>
            </tr>
        </thead>
        <tbody class="bg-white divide-y divide-gray-200">
            {foreach $tickets as $ticket}
                <tr onclick="window.location='viewticket.php?tid={$ticket.tid}&amp;c={$ticket.c}'" class="cursor-pointer">
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                        {$ticket.department}
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                        <a href="viewticket.php?tid={$ticket.tid}&amp;c={$ticket.c}" class="border-l-2 border-transparent hover:border-blue-500">
                            <span class="ticket-number">#{$ticket.tid}</span>
                            <span class="ticket-subject{if $ticket.unread} unread{/if}">{$ticket.subject}</span>
                        </a>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                        <span class="label status {if is_null($ticket.statusColor)}status-{$ticket.statusClass}"{else}status-custom" style="background-color:{$ticket.statusColor}"{/if}">
                            {$ticket.status|strip_tags}
                        </span>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500 text-center">
                        <span class="hidden">{$ticket.normalisedLastReply}</span>
                        {$ticket.lastreply}
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