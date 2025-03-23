<form method="post" action="domainchecker.php" id="frmDomainHomepage">
    <div class="bg-white py-10">
        <div class="container mx-auto px-4">
            <div class="p-6">
                <h2 class="text-3xl font-[800] text-center text-gray-800 mb-6">
                    {lang key="secureYourDomainShort"}
                </h2>
                <input type="hidden" name="transfer" />
                <div class="flex flex-col sm:flex-row gap-4">
                    <input
                        type="text"
                        class="w-full flex-grow px-6 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none transition-all"
                        name="domain"
                        placeholder="{lang key="exampledomain"}"
                        autocapitalize="none"
                    />
                    <div class="flex gap-2 sm:gap-4">
                        {if $registerdomainenabled}
                            <button
                                type="submit"
                                class="w-full sm:w-auto px-6 py-3 bg-blue-600 text-white font-semibold rounded-lg hover:bg-blue-700 focus:ring-2 focus:ring-blue-500 focus:ring-offset-2 transition-all{$captcha->getButtonClass($captchaForm)}"
                                id="btnDomainSearch"
                            >
                                {lang key="search"}
                            </button>
                        {/if}
                        {if $transferdomainenabled}
                            <button
                                type="submit"
                                id="btnTransfer"
                                data-domain-action="transfer"
                                class="w-full sm:w-auto px-6 py-3 bg-green-600 text-white font-semibold rounded-lg hover:bg-green-700 focus:ring-2 focus:ring-green-500 focus:ring-offset-2 transition-all{$captcha->getButtonClass($captchaForm)}"
                            >
                                {lang key="domainstransfer"}
                            </button>
                        {/if}
                    </div>
                </div>
                
                {include file="$template/includes/captcha.tpl"}

                {if $featuredTlds}
                    <div class="mt-8 flex justify-center gap-6">
                        {foreach $featuredTlds as $num => $tldinfo}
                            {if $num < 3}
                                <div class="flex flex-col items-center">
                                    <img
                                        src="{$BASE_PATH_IMG}/tld_logos/{$tldinfo.tldNoDots}.png"
                                        alt="{$tldinfo.tld}"
                                        class="w-16 h-16 mb-2"
                                    />
                                    <span class="text-sm text-gray-700 font-medium">
                                        {if is_object($tldinfo.register)}
                                            {$tldinfo.register->toFull()}
                                        {else}
                                            {lang key="domainregnotavailable"}
                                        {/if}
                                    </span>
                                </div>
                            {/if}
                        {/foreach}
                    </div>
                {/if}

                <div class="mt-8 text-center">
                    <a
                        href="{routePath('domain-pricing')}"
                        class="text-blue-600 hover:text-blue-800 font-semibold underline transition-all"
                    >
                        {lang key='viewAllPricing'}
                    </a>
                </div>
            </div>
        </div>
    </div>
</form>