{include file="$template/includes/flashmessage.tpl"}

<div class="mb-4">
    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-2 lg:grid-cols-4 gap-4">
        <div>
            <a href="clientarea.php?action=services" class="block bg-blue-500 text-white rounded-lg shadow-md p-6 text-center hover:bg-blue-600">
                <i class="fas fa-cube text-4xl mb-2"></i>
                <div class="text-xl font-semibold mb-2">{$clientsstats.productsnumactive}</div>
                <div class="text-lg">{lang key='navservices'}</div>
            </a>
        </div>
        {if $clientsstats.numdomains || $registerdomainenabled || $transferdomainenabled}
            <div>
                <a href="clientarea.php?action=domains" class="block bg-green-500 text-white rounded-lg shadow-md p-6 text-center hover:bg-green-600">
                    <i class="fas fa-globe text-4xl mb-2"></i>
                    <div class="text-xl font-semibold mb-2">{$clientsstats.numactivedomains}</div>
                    <div class="text-lg">{lang key='navdomains'}</div>
                </a>
            </div>
        {elseif $condlinks.affiliates && $clientsstats.isAffiliate}
            <div>
                <a href="affiliates.php" class="block bg-green-500 text-white rounded-lg shadow-md p-6 text-center hover:bg-green-600">
                    <i class="fas fa-shopping-cart text-4xl mb-2"></i>
                    <div class="text-xl font-semibold mb-2">{$clientsstats.numaffiliatesignups}</div>
                    <div class="text-lg">{lang key='affiliatessignups'}</div>
                </a>
            </div>
        {else}
            <div>
                <a href="clientarea.php?action=quotes" class="block bg-green-500 text-white rounded-lg shadow-md p-6 text-center hover:bg-green-600">
                    <i class="far fa-file-alt text-4xl mb-2"></i>
                    <div class="text-xl font-semibold mb-2">{$clientsstats.numquotes}</div>
                    <div class="text-lg">{lang key='quotes'}</div>
                </a>
            </div>
        {/if}
        <div>
            <a href="supporttickets.php" class="block bg-red-500 text-white rounded-lg shadow-md p-6 text-center hover:bg-red-600">
                <i class="fas fa-comments text-4xl mb-2"></i>
                <div class="text-xl font-semibold mb-2">{$clientsstats.numactivetickets}</div>
                <div class="text-lg">{lang key='navtickets'}</div>
            </a>
        </div>
        <div>
            <a href="clientarea.php?action=invoices" class="block bg-yellow-500 text-white rounded-lg shadow-md p-6 text-center hover:bg-yellow-600">
                <i class="fas fa-credit-card text-4xl mb-2"></i>
                <div class="text-xl font-semibold mb-2">{$clientsstats.numunpaidinvoices}</div>
                <div class="text-lg">{lang key='navinvoices'}</div>
            </a>
        </div>
    </div>
</div>

{foreach $addons_html as $addon_html}
    <div>
        {$addon_html}
    </div>
{/foreach}

<div class="client-home-cards">
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-2 xl:grid-cols-2 gap-4">
        <div class="col-span-full">
            {function name=outputHomePanels}
                <div menuItemName="{$item->getName()}" class="bg-white rounded-lg shadow-md overflow-hidden mb-4">
                    <div class="bg-blue-500 text-white p-4">
                        <h3 class="text-[14px] font-semibold m-0 flex justify-between items-center">
                            {if $item->getExtra('btn-link') && $item->getExtra('btn-text')}
                                <a href="{$item->getExtra('btn-link')}" class="inline-block px-4 py-2 bg-blue-600 text-white text-[14px] rounded hover:bg-blue-700">
                                    {if $item->getExtra('btn-icon')}<i class="{$item->getExtra('btn-icon')}"></i>{/if}
                                    {$item->getExtra('btn-text')}
                                </a>
                            {/if}
                            <div>
                                {if $item->hasIcon()}<i class="{$item->getIcon()} text-2xl mr-2"></i>{/if}
                                {$item->getLabel()}
                                {if $item->hasBadge()}&nbsp;<span class="bg-gray-200 text-gray-800 px-2 py-1 rounded text-sm">{$item->getBadge()}</span>{/if}
                            </div>
                        </h3>
                    </div>
                    {if $item->hasBodyHtml()}
                        <div class="p-4">
                            {$item->getBodyHtml()}
                        </div>
                    {/if}
                    {if $item->hasChildren()}
                        <div class="divide-y divide-gray-200">
                            {foreach $item->getChildren() as $childItem}
                                {if $childItem->getUri()}
                                    <a menuItemName="{$childItem->getName()}" href="{$childItem->getUri()}" class="block px-4 py-3 hover:bg-gray-100{if $childItem->isCurrent()} bg-gray-100{/if}"{if $childItem->getAttribute('dataToggleTab')} data-toggle="tab"{/if}{if $childItem->getAttribute('target')} target="{$childItem->getAttribute('target')}"{/if} id="{$childItem->getId()}">
                                        {if $childItem->hasIcon()}<i class="{$childItem->getIcon()} text-gray-500 mr-2"></i>{/if}
                                        {$childItem->getLabel()}
                                        {if $childItem->hasBadge()}&nbsp;<span class="bg-gray-200 text-gray-800 px-2 py-1 rounded text-sm">{$childItem->getBadge()}</span>{/if}
                                    </a>
                                {else}
                                    <div menuItemName="{$childItem->getName()}" class="px-4 py-3{if $childItem->getClass()} {$childItem->getClass()}{/if}" id="{$childItem->getId()}">
                                        {if $childItem->hasIcon()}<i class="{$childItem->getIcon()} text-gray-500 mr-2"></i>{/if}
                                        {$childItem->getLabel()}
                                        {if $childItem->hasBadge()}&nbsp;<span class="bg-gray-200 text-gray-800 px-2 py-1 rounded text-sm">{$childItem->getBadge()}</span>{/if}
                                    </div>
                                {/if}
                            {/foreach}
                        </div>
                    {/if}
                    <div class="bg-gray-100 p-4">
                        {if $item->hasFooterHtml()}
                            {$item->getFooterHtml()}
                        {/if}
                    </div>
                </div>
            {/function}

            {foreach $panels as $item}
                {if $item->getExtra('colspan')}
                    {outputHomePanels}
                    {assign "panels" $panels->removeChild($item->getName())}
                {/if}
            {/foreach}

        </div>
        <div class="col-span-full md:col-span-1 lg:col-span-1 xl:col-span-1">

            {foreach $panels as $item}
                {if $item@iteration is odd}
                    {outputHomePanels}
                {/if}
            {/foreach}

        </div>
        <div class="col-span-full md:col-span-1 lg:col-span-1 xl:col-span-1">

            {foreach $panels as $item}
                {if $item@iteration is even}
                    {outputHomePanels}
                {/if}
            {/foreach}

        </div>
    </div>
</div>