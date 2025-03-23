{if !empty($productGroups) || $registerdomainenabled || $transferdomainenabled}
    <h2 class="text-center m-4 font-[900] text-[24px]">{lang key='clientHomePanels.productsAndServices'}</h2>

    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-4">
        {foreach $productGroups as $productGroup}
            <div class="bg-white rounded-lg shadow-md overflow-hidden">
                <div class="p-4 text-center">
                    <h3 class="!text-lg !font-bold mb-2">
                        {$productGroup->name}
                    </h3>
                    <p class="!text-sm mb-4">
                        {$productGroup->tagline}
                    </p>
                    <a href="{$productGroup->getRoutePath()}" class="inline-block px-4 py-2 font-semibold rounded border border-[#369] text-[#369] hover:bg-[#369] hover:text-[#fff]">
                        {lang key='browseProducts'}
                    </a>
                </div>
            </div>
        {/foreach}

        {if $registerdomainenabled}
            <div class="bg-white rounded-lg shadow-md overflow-hidden">
                <div class="p-4 text-center">
                    <h3 class="!text-lg !font-bold mb-2">
                        {lang key='orderregisterdomain'}
                    </h3>
                    <p class="!text-sm mb-4">
                        {lang key='secureYourDomain'}
                    </p>
                    <a href="{$WEB_ROOT}/cart.php?a=add&domain=register" class="inline-block px-4 py-2 font-semibold rounded border border-[#369] text-[#369] hover:bg-[#369] hover:text-[#fff]">
                        {lang key='navdomainsearch'}
                    </a>
                </div>
            </div>
        {/if}
        {if $transferdomainenabled}
            <div class="bg-white rounded-lg shadow-md overflow-hidden">
                <div class="p-4 text-center">
                    <h3 class="!text-lg !font-bold mb-2">
                        {lang key='transferYourDomain'}
                    </h3>
                    <p class="!text-sm mb-4">
                        {lang key='transferExtend'}
                    </p>
                    <a href="{$WEB_ROOT}/cart.php?a=add&domain=transfer" class="inline-block px-4 py-2 font-semibold rounded border border-[#369] text-[#369] hover:bg-[#369] hover:text-[#fff]">
                        {lang key='transferYourDomain'}
                    </a>
                </div>
            </div>
        {/if}
    </div>
{/if}

<h2 class="text-center m-4 font-[900] text-[24px]">{lang key='howCanWeHelp'}</h2>

<div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-4 my-5">
    <div>
        <a href="{routePath('announcement-index')}" class="block bg-teal-500 !text-[#fff] rounded-lg shadow-md p-4 text-center hover:bg-teal-600">
            <figure class="ico-container mb-2">
                <i class="fal fa-bullhorn text-2xl"></i>
            </figure>
            {lang key='announcementstitle'}
        </a>
    </div>
    <div>
        <a href="serverstatus.php" class="block bg-[#f43f5e] !text-[#fff] rounded-lg shadow-md p-4 text-center hover:bg-[#be123c]">
            <figure class="ico-container mb-2">
                <i class="fal fa-server text-2xl"></i>
            </figure>
            {lang key='networkstatustitle'}
        </a>
    </div>
    <div>
        <a href="{routePath('knowledgebase-index')}" class="block bg-[#eab308] !text-[#fff] rounded-lg shadow-md p-4 text-center hover:bg-[#ca8a04]">
            <figure class="ico-container mb-2">
                <i class="fal fa-book text-2xl"></i>
            </figure>
            {lang key='knowledgebasetitle'}
        </a>
    </div>
    <div>
        <a href="{routePath('download-index')}" class="block bg-[#3b82f6] !text-[#fff] rounded-lg shadow-md p-4 text-center hover:bg-[#2563eb]">
            <figure class="ico-container mb-2">
                <i class="fal fa-download text-2xl"></i>
            </figure>
            {lang key='downloadstitle'}
        </a>
    </div>
    <div>
        <a href="submitticket.php" class="block bg-green-500 !text-[#fff] rounded-lg shadow-md p-4 text-center hover:bg-green-600">
            <figure class="ico-container mb-2">
                <i class="fal fa-life-ring text-2xl"></i>
            </figure>
            {lang key='homepage.submitTicket'}
        </a>
    </div>
</div>

<h2 class="text-center m-4 font-[900] text-[24px]">{lang key='homepage.yourAccount'}</h2>

<div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-4 my-5">
    <div>
        <a href="clientarea.php" class="block bg-[#334155] !text-[#fff] rounded-lg shadow-md p-4 text-center hover:bg-[#0f172a]">
            <figure class="ico-container mb-2">
                <i class="fal fa-home text-2xl"></i>
            </figure>
            {lang key='homepage.yourAccount'}
        </a>
    </div>
    <div>
        <a href="clientarea.php?action=services" class="block bg-[#334155] !text-[#fff] rounded-lg shadow-md p-4 text-center hover:bg-[#0f172a]">
            <figure class="ico-container mb-2">
                <i class="far fa-cubes text-2xl"></i>
            </figure>
            {lang key='homepage.manageServices'}
        </a>
    </div>
    {if $registerdomainenabled || $transferdomainenabled || $numberOfDomains}
        <div>
            <a href="clientarea.php?action=domains" class="block bg-[#334155] !text-[#fff] rounded-lg shadow-md p-4 text-center hover:bg-[#0f172a]">
                <figure class="ico-container mb-2">
                    <i class="fal fa-globe text-2xl"></i>
                </figure>
                {lang key='homepage.manageDomains'}
            </a>
        </div>
    {/if}
    <div>
        <a href="supporttickets.php" class="block bg-[#334155] !text-[#fff] rounded-lg shadow-md p-4 text-center hover:bg-[#0f172a]">
            <figure class="ico-container mb-2">
                <i class="fal fa-comments text-2xl"></i>
            </figure>
            {lang key='homepage.supportRequests'}
        </a>
    </div>
    <div>
        <a href="clientarea.php?action=masspay&all=true" class="block bg-[#334155] !text-[#fff] rounded-lg shadow-md p-4 text-center hover:bg-[#0f172a]">
            <figure class="ico-container mb-2">
                <i class="fal fa-credit-card text-2xl"></i>
            </figure>
            {lang key='homepage.makeAPayment'}
        </a>
    </div>
</div>