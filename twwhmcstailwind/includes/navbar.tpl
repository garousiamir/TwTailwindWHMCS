<div x-data="{ open: false, mobileMenuOpen: false }" class="relative">
    <!-- Desktop Menu -->
    <nav class="hidden md:flex space-x-4">
        {foreach $navbar as $item}
            <div x-data="{ openDropdown: false }" class="relative">
                <a
                    href="{if !$item->hasChildren()}{$item->getUri()}{else}#{/if}"
                    class="flex items-center px-4 py-2 text-sm hover:bg-gray-100"
                    {if $item->getAttribute('target')} target="{$item->getAttribute('target')}"{/if}
                    {if $item->hasChildren()} @click="openDropdown = !openDropdown" @click.away="openDropdown = false"{/if}
                >
                    {if $item->hasIcon()}<i class="{$item->getIcon()}"></i>&nbsp;{/if}
                    {$item->getLabel()}
                    {if $item->hasBadge()}&nbsp;<span class="inline-flex items-center justify-center px-2 py-1 text-xs font-bold leading-none text-white bg-blue-500 rounded-full">{$item->getBadge()}</span>{/if}
                    {if $item->hasChildren()}
                        <svg class="w-4 h-4 ml-1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                            <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd" />
                        </svg>
                    {/if}
                </a>
                {if $item->hasChildren()}
                    <div
                        x-show="openDropdown"
                        x-transition:enter="transition ease-out duration-200"
                        x-transition:enter-start="opacity-0 scale-95"
                        x-transition:enter-end="opacity-100 scale-100"
                        x-transition:leave="transition ease-in duration-150"
                        x-transition:leave-start="opacity-100 scale-100"
                        x-transition:leave-end="opacity-0 scale-95"
                        class="absolute z-10 mt-2 w-48 bg-white rounded-md shadow-lg"
                    >
                        <ul class="py-2">
                            {foreach $item->getChildren() as $childItem}
                                {if $childItem->getClass() && in_array($childItem->getClass(), ['dropdown-divider', 'nav-divider'])}
                                    <div class="border-t border-gray-200 my-1"></div>
                                {else}
                                    <li>
                                        <a
                                            href="{$childItem->getUri()}"
                                            class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100"
                                            {if $childItem->getAttribute('target')} target="{$childItem->getAttribute('target')}"{/if}
                                        >
                                            {if $childItem->hasIcon()}<i class="{$childItem->getIcon()}"></i>&nbsp;{/if}
                                            {$childItem->getLabel()}
                                            {if $childItem->hasBadge()}&nbsp;<span class="inline-flex items-center justify-center px-2 py-1 text-xs font-bold leading-none text-white bg-blue-500 rounded-full">{$childItem->getBadge()}</span>{/if}
                                        </a>
                                    </li>
                                {/if}
                            {/foreach}
                        </ul>
                    </div>
                {/if}
            </div>
        {/foreach}
    </nav>

    <!-- Mobile Menu Toggle Button -->
    <div class="md:hidden">
        <button
            @click="mobileMenuOpen = !mobileMenuOpen"
            :aria-expanded="mobileMenuOpen"
            aria-controls="mobile-menu"
            class="p-2 focus:outline-none focus:ring-2 focus:ring-blue-500 rounded-md"
        >
            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16m-7 6h7"></path>
            </svg>
        </button>
    </div>

    <!-- Mobile Menu -->
    <div
        x-show="mobileMenuOpen"
        x-transition:enter="transition ease-out duration-300"
        x-transition:enter-start="opacity-0 translate-x-full"
        x-transition:enter-end="opacity-100 translate-x-0"
        x-transition:leave="transition ease-in duration-200"
        x-transition:leave-start="opacity-100 translate-x-0"
        x-transition:leave-end="opacity-0 translate-x-full"
        id="mobile-menu"
        class="fixed inset-0 z-50 bg-white overflow-y-auto"
    >
        <div class="flex justify-end p-4">
            <button
                @click="mobileMenuOpen = false"
                class="p-2 focus:outline-none focus:ring-2 focus:ring-blue-500 rounded-md"
            >
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
                </svg>
            </button>
        </div>
        <ul class="py-4 space-y-2">
            {foreach $navbar as $item}
                <li>
                    <a
                        href="{if !$item->hasChildren()}{$item->getUri()}{else}#{/if}"
                        class="block px-6 py-3 text-lg font-medium text-gray-700 hover:bg-gray-100"
                        {if $item->getAttribute('target')} target="{$item->getAttribute('target')}"{/if}
                    >
                        {if $item->hasIcon()}<i class="{$item->getIcon()}"></i>&nbsp;{/if}
                        {$item->getLabel()}
                        {if $item->hasBadge()}&nbsp;<span class="inline-flex items-center justify-center px-2 py-1 text-xs font-bold leading-none text-white bg-blue-500 rounded-full">{$item->getBadge()}</span>{/if}
                    </a>
                    {if $item->hasChildren()}
                        <ul class="pl-6 mt-2 space-y-2">
                            {foreach $item->getChildren() as $childItem}
                                {if $childItem->getClass() && in_array($childItem->getClass(), ['dropdown-divider', 'nav-divider'])}
                                    <div class="border-t border-gray-200 my-1"></div>
                                {else}
                                    <li>
                                        <a
                                            href="{$childItem->getUri()}"
                                            class="block px-4 py-2 text-base text-gray-700 hover:bg-gray-100"
                                            {if $childItem->getAttribute('target')} target="{$childItem->getAttribute('target')}"{/if}
                                        >
                                            {if $childItem->hasIcon()}<i class="{$childItem->getIcon()}"></i>&nbsp;{/if}
                                            {$childItem->getLabel()}
                                            {if $childItem->hasBadge()}&nbsp;<span class="inline-flex items-center justify-center px-2 py-1 text-xs font-bold leading-none text-white bg-blue-500 rounded-full">{$childItem->getBadge()}</span>{/if}
                                        </a>
                                    </li>
                                {/if}
                            {/foreach}
                        </ul>
                    {/if}
                </li>
            {/foreach}
        </ul>
    </div>
</div>