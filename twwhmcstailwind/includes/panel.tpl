<div class="w-full mx-auto mb-3">
    <div class="bg-white rounded-lg shadow-md">
        {if isset($headerTitle)}
            <div class="bg-{$type} text-white font-bold py-2 px-4 rounded-t-lg">
                {$headerTitle}
            </div>
        {/if}
        {if isset($bodyContent)}
            <div class="p-4{if isset($bodyTextCenter)} text-center{/if}">
                {$bodyContent}
            </div>
        {/if}
        {if isset($footerContent)}
            <div class="bg-gray-100 p-4{if isset($footerTextCenter)} text-center{/if} rounded-b-lg">
                {$footerContent}
            </div>
        {/if}
    </div>
</div>