{if $producttotals}
    <div class="flex items-center mb-2">
        <span class="product-name">
            {if $producttotals.allowqty && $producttotals.qty > 1}{$producttotals.qty} x {/if}{$producttotals.productinfo.name}
        </span>
        <span class="ml-2 product-group">{$producttotals.productinfo.groupname}</span>
    </div>

    <div class="flex justify-between mb-2">
        <span>{$producttotals.productinfo.name}</span>
        <span>{$producttotals.pricing.baseprice}</span>
    </div>

    {foreach $producttotals.configoptions as $configoption}
        {if $configoption}
            <div class="flex justify-between mb-2">
                <span>&nbsp;&raquo; {$configoption.name}: {$configoption.optionname}</span>
                <span>{$configoption.recurring}{if $configoption.setup} + {$configoption.setup} {$LANG.ordersetupfee}{/if}</span>
            </div>
        {/if}
    {/foreach}

    {foreach $producttotals.addons as $addon}
        <div class="flex justify-between mb-2">
            <span>+ {$addon.name}</span>
            <span>{$addon.recurring}</span>
        </div>
    {/foreach}

    {if $producttotals.pricing.setup || $producttotals.pricing.recurring || $producttotals.pricing.addons}
        <div class="summary-totals">
            {if $producttotals.pricing.setup}
                <div class="flex justify-between mb-2">
                    <span>{$LANG.cartsetupfees}:</span>
                    <span>{$producttotals.pricing.setup}</span>
                </div>
            {/if}
            {foreach from=$producttotals.pricing.recurringexcltax key=cycle item=recurring}
                <div class="flex justify-between mb-2">
                    <span>{$cycle}:</span>
                    <span>{$recurring}</span>
                </div>
            {/foreach}
            {if $producttotals.pricing.tax1}
                <div class="flex justify-between mb-2">
                    <span>{$carttotals.taxname} @ {$carttotals.taxrate}%:</span>
                    <span>{$producttotals.pricing.tax1}</span>
                </div>
            {/if}
            {if $producttotals.pricing.tax2}
                <div class="flex justify-between mb-2">
                    <span>{$carttotals.taxname2} @ {$carttotals.taxrate2}%:</span>
                    <span>{$producttotals.pricing.tax2}</span>
                </div>
            {/if}
        </div>
    {/if}

    <div class="flex justify-between total-due-today mt-4">
        <span class="amt">{$producttotals.pricing.totaltoday}</span>
        <span>{$LANG.ordertotalduetoday}</span>
    </div>
{elseif !empty($renewals) || !empty($serviceRenewals)}
    {if !empty($serviceRenewals)}
        {if !empty($carttotals.renewalsByType.services)}
            <span class="product-name">{lang key='renewService.titleAltPlural'}</span>
            {foreach $carttotals.renewalsByType.services as $serviceId => $serviceRenewal}
                <div class="flex justify-between mb-2" id="cartServiceRenewal{$serviceId}">
                    <div>
                        <div>{$serviceRenewal.name}</div>
                        <div>{$serviceRenewal.domainName}</div>
                    </div>
                    <div>
                        <div>{$serviceRenewal.billingCycle}</div>
                        <div>
                            {$serviceRenewal.recurringBeforeTax}
                            <a onclick="removeItem('r','{$serviceId}','service'); return false;" href="#" id="linkCartRemoveServiceRenewal{$serviceId}">
                                <i class="fas fa-fw fa-trash-alt"></i>
                            </a>
                        </div>
                    </div>
                </div>
            {/foreach}
        {/if}
        {if !empty($carttotals.renewalsByType.addons)}
            <span class="product-name">{lang key='renewServiceAddon.titleAltPlural'}</span>
            {foreach $carttotals.renewalsByType.addons as $serviceAddonId => $serviceAddonRenewal}
                <div class="flex justify-between mb-2" id="cartServiceAddonRenewal{$serviceAddonId}">
                    <div>
                        <div>{$serviceAddonRenewal.name}</div>
                        <div>{$serviceAddonRenewal.domainName}</div>
                    </div>
                    <div>
                        <div>{$serviceAddonRenewal.billingCycle}</div>
                        <div>
                            {$serviceAddonRenewal.recurringBeforeTax}
                            <a onclick="removeItem('r','{$serviceAddonId}','addon'); return false;" href="#" id="linkCartRemoveServiceAddonRenewal{$serviceAddonId}">
                                <i class="fas fa-fw fa-trash-alt"></i>
                            </a>
                        </div>
                    </div>
                </div>
            {/foreach}
        {/if}
    {elseif !empty($renewals) && !empty($carttotals.renewalsByType.domains)}
        <span class="product-name">{lang key='domainrenewals'}</span>
        {foreach $carttotals.renewalsByType.domains as $domainId => $renewal}
            <div class="flex justify-between mb-2" id="cartDomainRenewal{$domainId}">
                <span>
                    {$renewal.domain} - {$renewal.regperiod} {if $renewal.regperiod == 1}{lang key='orderForm.year'}{else}{lang key='orderForm.years'}{/if}
                </span>
                <span>
                    {$renewal.priceBeforeTax}
                    <a onclick="removeItem('r','{$domainId}','domain'); return false;" href="#" id="linkCartRemoveDomainRenewal{$domainId}">
                        <i class="fas fa-fw fa-trash-alt"></i>
                    </a>
                </span>
            </div>
            {if $renewal.dnsmanagement}
                <div class="flex justify-between mb-2">
                    <span>+ {lang key='domaindnsmanagement'}</span>
                </div>
            {/if}
            {if $renewal.emailforwarding}
                <div class="flex justify-between mb-2">
                    <span>+ {lang key='domainemailforwarding'}</span>
                </div>
            {/if}
            {if $renewal.idprotection}
                <div class="flex justify-between mb-2">
                    <span>+ {lang key='domainidprotection'}</span>
                </div>
            {/if}
            {if $renewal.hasGracePeriodFee}
                <div class="flex justify-between mb-2">
                    <span>+ {lang key='domainRenewal.graceFee'}</span>
                </div>
            {/if}
            {if $renewal.hasRedemptionGracePeriodFee}
                <div class="flex justify-between mb-2">
                    <span>+ {lang key='domainRenewal.redemptionFee'}</span>
                </div>
            {/if}
        {/foreach}
    {/if}
    <div class="summary-totals mt-4">
        <div class="flex justify-between mb-2">
            <span>{lang key='ordersubtotal'}:</span>
            <span>{$carttotals.subtotal}</span>
        </div>
        {if ($carttotals.taxrate && $carttotals.taxtotal) || ($carttotals.taxrate2 && $carttotals.taxtotal2)}
            {if $carttotals.taxrate}
                <div class="flex justify-between mb-2">
                    <span>{$carttotals.taxname} @ {$carttotals.taxrate}%:</span>
                    <span>{$carttotals.taxtotal}</span>
                </div>
            {/if}
            {if $carttotals.taxrate2}
                <div class="flex justify-between mb-2">
                    <span>{$carttotals.taxname2} @ {$carttotals.taxrate2}%:</span>
                    <span>{$carttotals.taxtotal2}</span>
                </div>
            {/if}
        {/if}
    </div>
    <div class="flex justify-between total-due-today mt-4">
        <span class="amt">{$carttotals.total}</span>
        <span>{lang key='ordertotalduetoday'}</span>
    </div>
{/if}