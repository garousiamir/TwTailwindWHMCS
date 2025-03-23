<ol class="flex flex-wrap items-center space-x-2 text-sm font-medium text-gray-500">
    {foreach $breadcrumb as $item}
        <li class="flex items-center {if $item@last} text-gray-700 {else} hover:text-gray-900 {/if}" {if $item@last} aria-current="page" {/if}>
            {if !$item@last}
                <a href="{$item.link}" class="hover:underline">
                    {$item.label}
                </a>
                <span class="mx-2">/</span>
            {else}
                {$item.label}
            {/if}
        </li>
    {/foreach}
</ol>