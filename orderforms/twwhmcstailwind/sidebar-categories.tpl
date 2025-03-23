{foreach $secondarySidebar as $panel}
    <div menuItemName="{$panel->getName()}" class="panel card card-sidebar mb-3 bg-white rounded shadow-sm {if $panel->getClass()}{$panel->getClass()}{else}panel-sidebar{/if}{if $panel->getExtra('mobileSelect') and $panel->hasChildren()} hidden-sm hidden-xs d-none d-md-block{/if}"{if $panel->getAttribute('id')} id="{$panel->getAttribute('id')}"{/if}>
        <div class="panel-heading card-header bg-gray-50 px-4 py-3 border-b border-gray-200">
            <h3 class="panel-title text-base font-medium text-gray-700">
                {if $panel->hasIcon()}
                    <i class="{$panel->getIcon()} mr-2"></i>
                {/if}
                {$panel->getLabel()}
                {if $panel->hasBadge()}
                    <span class="badge ml-2 px-2 py-1 text-xs rounded-full bg-blue-100 text-blue-800">{$panel->getBadge()}</span>
                {/if}
                <i class="fas fa-chevron-up card-minimise panel-minimise pull-right float-right text-gray-500 cursor-pointer"></i>
            </h3>
        </div>
        {if $panel->hasBodyHtml()}
            <div class="panel-body card-body collapsable-card-body p-4">
                {$panel->getBodyHtml()}
            </div>
        {/if}
        {if $panel->hasChildren()}
            <div class="list-group collapsable-card-body divide-y divide-gray-100{if $panel->getChildrenAttribute('class')} {$panel->getChildrenAttribute('class')}{/if}">
                {foreach $panel->getChildren() as $child}
                    {if $child->getUri()}
                        <a menuItemName="{$child->getName()}" href="{$child->getUri()}" class="list-group-item list-group-item-action block px-4 py-3 hover:bg-gray-50 transition duration-150{if $child->isDisabled()} disabled opacity-50 cursor-not-allowed{/if}{if $child->getClass()} {$child->getClass()}{/if}{if $child->isCurrent()} active bg-blue-50 text-blue-700{/if}"{if $child->getAttribute('dataToggleTab')} data-toggle="tab"{/if}{if $child->getAttribute('target')} target="{$child->getAttribute('target')}"{/if} id="{$child->getId()}">
                            {if $child->hasIcon()}
                                <i class="{$child->getIcon()} mr-2"></i>
                            {/if}
                            {$child->getLabel()}
                            {if $child->hasBadge()}
                                <span class="badge float-right ml-auto px-2 py-1 text-xs rounded-full bg-gray-100 text-gray-600">{$child->getBadge()}</span>
                            {/if}
                        </a>
                    {else}
                        <div menuItemName="{$child->getName()}" class="list-group-item block px-4 py-3{if $child->getClass()} {$child->getClass()}{/if}" id="{$child->getId()}">
                            {if $child->hasIcon()}
                                <i class="{$child->getIcon()} mr-2"></i>
                            {/if}
                            {$child->getLabel()}
                            {if $child->hasBadge()}
                                <span class="badge float-right ml-auto px-2 py-1 text-xs rounded-full bg-gray-100 text-gray-600">{$child->getBadge()}</span>
                            {/if}
                        </div>
                    {/if}
                {/foreach}
            </div>
        {/if}
        {if $panel->hasFooterHtml()}
            <div class="panel-footer card-footer clearfix bg-gray-50 px-4 py-3 border-t border-gray-200">
                {$panel->getFooterHtml()}
            </div>
        {/if}
    </div>
    {if $panel->getExtra('mobileSelect') and $panel->hasChildren()}
        {* Mobile Select only supports dropdown menus *}
        <div class="panel card hidden-lg hidden-md d-md-none bg-white rounded shadow-sm mb-3{if $panel->getClass()}{$panel->getClass()}{else} panel-default{/if}"{if $panel->getAttribute('id')} id="{$panel->getAttribute('id')}"{/if}>
            {include file="orderforms/standard_cart/sidebar-categories-selector.tpl"}
        </div>
    {/if}
{/foreach}