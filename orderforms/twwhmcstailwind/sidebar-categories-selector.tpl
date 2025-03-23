{if $panel}
    <div class="m-0 panel-heading card-header bg-gray-50 px-4 py-3 border-b border-gray-200">
        <h3 class="panel-title text-base font-medium text-gray-700">
            {if $panel->hasIcon()}
                <i class="{$panel->getIcon()} mr-2"></i>
            {/if}
            {$panel->getLabel()}
            {if $panel->hasBadge()}
                <span class="badge ml-2 px-2 py-1 text-xs rounded-full bg-blue-100 text-blue-800">{$panel->getBadge()}</span>
            {/if}
        </h3>
    </div>
    <div class="panel-body card-body p-4">
        <form role="form">
            <select class="form-control custom-select w-full px-3 py-2 border border-gray-300 rounded text-gray-700 bg-white focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500" onchange="selectChangeNavigate(this)">
                {assign var='hasCurrent' value=false}
                {foreach $panel->getChildren() as $child}
                    <option menuItemName="{$child->getName()}" value="{$child->getUri()}" class="list-group-item" {if $child->isCurrent()}selected="selected"{/if}>
                        {$child->getLabel()}
                        {if $child->hasBadge()}
                            ({$child->getBadge()})
                        {/if}
                    </option>
                    {if !$hasCurrent and $child->isCurrent()}
                        {assign var='hasCurrent' value=true}
                    {/if}
                {/foreach}
                {if !$hasCurrent}
                    <option value="" class="list-group-item" selected=""selected>- {lang key="cartchooseanothercategory"} -</option>
                {/if}
            </select>
        </form>
    </div>
    {if $panel->hasFooterHtml()}
        <div class="panel-footer card-footer bg-gray-50 px-4 py-3 border-t border-gray-200">
            {$panel->getFooterHtml()}
        </div>
    {/if}
{/if}