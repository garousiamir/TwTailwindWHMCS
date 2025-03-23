{foreach $sidebar as $item}
    <div menuItemName="{$item->getName()}" class="mb-3 card bg-white shadow-sm {if $item->getClass()}{$item->getClass()}{/if}{if $item->getExtra('mobileSelect') and $item->hasChildren()} hidden md:block{/if}"{if $item->getAttribute('id')} id="{$item->getAttribute('id')}"{/if}>
        <div class="card-header bg-gray-100 p-3">
            <h3 class="card-title m-0 text-lg font-semibold">
                {if $item->hasIcon()}<i class="{$item->getIcon()}"></i>&nbsp;{/if}
                {$item->getLabel()}
                {if $item->hasBadge()}&nbsp;<span class="badge float-right bg-blue-500 text-white px-2 py-1 rounded-full text-sm">{$item->getBadge()}</span>{/if}
                <i class="fas fa-chevron-up card-minimise float-right text-gray-600"></i>
            </h3>
        </div>
        <div class="collapsable-card-body">
            {if $item->hasBodyHtml()}
                <div class="card-body p-3">
                    {$item->getBodyHtml()}
                </div>
            {/if}
            {if $item->hasChildren()}
            <div class="list-group list-group-flush flex flex-col{if $item->getChildrenAttribute('class')} {$item->getChildrenAttribute('class')}{/if}" role="tablist">
                    {foreach $item->getChildren() as $childItem}
                        {if $childItem->getUri()}
                            <a menuItemName="{$childItem->getName()}"
                               href="{$childItem->getUri()}"
                               class="list-group-item list-group-item-action p-3 hover:bg-gray-50 {if $childItem->isDisabled()} opacity-50 cursor-not-allowed{/if}{if $childItem->getClass()} {$childItem->getClass()}{/if}{if $childItem->isCurrent()} bg-blue-50 text-blue-700{/if}"
                               {if $childItem->getAttribute('dataToggleTab')}
                                   data-toggle="list" role="tab"
                               {/if}
                               {assign "customActionData" $childItem->getAttribute('dataCustomAction')}
                               {if is_array($customActionData)}
                                   data-active="{$customActionData['active']}"
                                   data-identifier="{$customActionData['identifier']}"
                                   data-serviceid="{$customActionData['serviceid']}"
                               {/if}
                               {if $childItem->getAttribute('target')}
                                   target="{$childItem->getAttribute('target')}"
                               {/if}
                               id="{$childItem->getId()}"
                            >
                                <div class="sidebar-menu-item-wrapper flex items-center">
                                    {if $childItem->hasIcon()}
                                        <div class="sidebar-menu-item-icon-wrapper mr-2">
                                            {if is_array($customActionData)}
                                                <span class="loading hidden">
                                                    <i class="fas fa-spinner fa-spin fa-fw"></i>
                                                </span>
                                            {/if}
                                            <i class="{$childItem->getIcon()} sidebar-menu-item-icon text-gray-500"></i>
                                        </div>
                                    {/if}
                                    <div class="sidebar-menu-item-label flex-grow">
                                        {$childItem->getLabel()}
                                    </div>
                                    {if $childItem->hasBadge()}
                                        <div class="sidebar-menu-item-badge ml-2">
                                            <span class="badge !bg-blue-500 text-white px-2 py-1 rounded-full text-sm">{$childItem->getBadge()}</span>
                                        </div>
                                    {/if}
                                </div>
                            </a>
                        {else}
                            <div menuItemName="{$childItem->getName()}" class="list-group-item list-group-item-action p-3 {if $childItem->getClass()} {$childItem->getClass()}{/if}" id="{$childItem->getId()}">
                                {if $childItem->hasBadge()}<span class="badge float-right bg-blue-500 text-white px-2 py-1 rounded-full text-sm">{$childItem->getBadge()}</span>{/if}
                                {if $childItem->hasIcon()}<i class="{$childItem->getIcon()} text-gray-500"></i>&nbsp;{/if}
                                {$childItem->getLabel()}
                            </div>
                        {/if}
                    {/foreach}
                </div>
            {/if}
        </div>
        {if $item->hasFooterHtml()}
            <div class="card-footer clearfix p-3 bg-gray-100">
                {$item->getFooterHtml()}
            </div>
        {/if}
    </div>
    {if $item->getExtra('mobileSelect') and $item->hasChildren()}
        {* Mobile Select only supports dropdown menus *}
        <div class="card block md:hidden {if $item->getClass()}{$item->getClass()}{else}bg-gray-100{/if}"{if $item->getAttribute('id')} id="{$item->getAttribute('id')}"{/if}>
            <div class="card-header p-3">
                <h3 class="card-title text-lg font-semibold">
                    {if $item->hasIcon()}<i class="{$item->getIcon()}"></i>&nbsp;{/if}
                    {$item->getLabel()}
                    {if $item->hasBadge()}&nbsp;<span class="badge float-right bg-blue-500 text-white px-2 py-1 rounded-full text-sm">{$item->getBadge()}</span>{/if}
                </h3>
            </div>
            <div class="card-body p-3">
                <form role="form">
                    <select class="form-control w-full p-2 border border-gray-300 rounded" onchange="selectChangeNavigate(this)">
                        {foreach $item->getChildren() as $childItem}
                            <option menuItemName="{$childItem->getName()}" value="{$childItem->getUri()}" class="list-group-item list-group-item-action" {if $childItem->isCurrent()}selected="selected"{/if}>
                                {$childItem->getLabel()}
                                {if $childItem->hasBadge()}({$childItem->getBadge()}){/if}
                            </option>
                        {/foreach}
                    </select>
                </form>
            </div>
            {if $item->hasFooterHtml()}
                <div class="card-footer p-3 bg-gray-100">
                    {$item->getFooterHtml()}
                </div>
            {/if}
        </div>
    {/if}
{/foreach}