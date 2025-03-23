{include file="$template/includes/tablelist.tpl" tableName="QuotesList" noSortColumns="5" filterColumn="4"}

<script>
    jQuery(document).ready(function() {
        var table = jQuery('#tableQuotesList').show().DataTable();

        {if $orderby == 'id'}
            table.order(0, '{$sort}');
        {elseif $orderby == 'date'}
            table.order(2, '{$sort}');
        {elseif $orderby == 'validuntil'}
            table.order(3, '{$sort}');
        {elseif $orderby == 'stage'}
            table.order(4, '{$sort}');
        {/if}
        table.draw();
        jQuery('#tableLoading').hide();
    });
</script>

<div class="table-container clearfix">
    <table id="tableQuotesList" class="min-w-full divide-y divide-gray-200 hidden">
        <thead class="bg-gray-50">
            <tr>
                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                    {lang key='quotenumber'}
                </th>
                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                    {lang key='quotesubject'}
                </th>
                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                    {lang key='quotedatecreated'}
                </th>
                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                    {lang key='quotevaliduntil'}
                </th>
                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                    {lang key='quotestage'}
                </th>
                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                    &nbsp;
                </th>
            </tr>
        </thead>
        <tbody class="bg-white divide-y divide-gray-200">
            {foreach $quotes as $quote}
                <tr onclick="clickableSafeRedirect(event, 'viewquote.php?id={$quote.id}', true)" class="cursor-pointer">
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                        {$quote.id}
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                        {$quote.subject}
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                        <span class="hidden">{$quote.normalisedDateCreated}</span>{$quote.datecreated}
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                        <span class="hidden">{$quote.normalisedValidUntil}</span>{$quote.validuntil}
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                        <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-{$quote.stageClass}-100 text-{$quote.stageClass}-800">
                            {$quote.stage}
                        </span>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500 text-center">
                        <form method="post" action="dl.php" class="inline">
                            <input type="hidden" name="type" value="q" />
                            <input type="hidden" name="id" value="{$quote.id}" />
                            <button type="submit" class="px-4 py-2 bg-gray-100 text-gray-800 text-sm font-medium rounded-md hover:bg-gray-200 focus:outline-none focus:ring-2 focus:ring-gray-500">
                                <i class="fas fa-download"></i> {lang key='quotedownload'}
                            </button>
                        </form>
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