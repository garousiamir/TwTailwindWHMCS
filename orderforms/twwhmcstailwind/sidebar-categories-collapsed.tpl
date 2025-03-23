<div class="sidebar-collapsed">
    {foreach $secondarySidebar as $panel}
        <div class="panel card bg-white rounded shadow-sm mb-3{if $panel->getClass()}{$panel->getClass()}{else} panel-default{/if}">
            {include file="orderforms/twwhmcstailwind/sidebar-categories-selector.tpl"}
        </div>
    {/foreach}
    {if !$loggedin && $currencies}
        <div class="pull-right form-inline float-right text-right">
            <form method="post" action="{$WEB_ROOT}/cart.php{if $action}?a={$action}{if $domain}&domain={$domain}{/if}{elseif $gid}?gid={$gid}{/if}" class="inline-block">
                <select name="currency" onchange="submit()" class="form-control px-3 py-2 border border-gray-300 rounded text-gray-700 bg-white focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
                    <option value="">{$LANG.choosecurrency}</option>
                    {foreach from=$currencies item=listcurr}
                        <option value="{$listcurr.id}"{if $listcurr.id == $activeCurrency.id} selected{/if}>{$listcurr.code}</option>
                    {/foreach}
                </select>
            </form>
        </div>
    {/if}
</div>