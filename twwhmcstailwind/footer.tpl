                   </div>
            </div>
        </div>
    </section>

    <footer id="footer" class="bg-gray-800 text-white py-8">
        <div class="container mx-auto px-4">
            <div class="flex flex-wrap justify-between">
                <ul class="list-inline mb-7 text-center flex items-center">
                    {include file="$template/includes/social-accounts.tpl"}

                    {if $languagechangeenabled && count($locales) > 1 || $currencies}
                        <li class="list-inline-item">
                            <button type="button" class="flex items-center bg-gray-700 text-white px-4 py-2 rounded hover:bg-gray-600" data-toggle="modal" data-target="#modalChooseLanguage">
                                <div class="d-inline-block align-middle">
                                    <div class="iti-flag {if $activeLocale.countryCode === '001'}us{else}{$activeLocale.countryCode|lower}{/if}"></div>
                                </div>
                                <span class="ml-2">
                                    {$activeLocale.localisedName}
                                    /
                                    {$activeCurrency.prefix}
                                    {$activeCurrency.code}
                                </span>
                            </button>
                        </li>
                    {/if}
                </ul>

                <ul class="nav flex items-center mb-7">
                    <li class="nav-item">
                        <a class="nav-link text-white hover:text-gray-300" href="{$WEB_ROOT}/contact.php">
                            {lang key='contactus'}
                        </a>
                    </li>
                    {if $acceptTOS}
                        <li class="nav-item">
                            <a class="nav-link text-white hover:text-gray-300" href="{$tosURL}" target="_blank">{lang key='ordertos'}</a>
                        </li>
                    {/if}
                </ul>
            </div>

            <p class="copyright mb-0 text-center text-gray-400">
                {lang key="copyrightFooterNotice" year=$date_year company=$companyname}
            </p>
        </div>
    </footer>


    <div class="modal system-modal fade" id="modalAjax" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content bg-white rounded-lg shadow-md">
                <div class="modal-header border-b border-gray-200">
                    <h5 class="modal-title text-gray-800"></h5>
                    <button type="button" class="close text-gray-600" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span>
                        <span class="sr-only">{lang key='close'}</span>
                    </button>
                </div>
                <div class="modal-body text-gray-800">
                    {lang key='loading'}
                </div>
                <div class="modal-footer border-t border-gray-200">
                    <div class="flex items-center">
                        <div class="loader mr-2">
                            <i class="fas fa-circle-notch fa-spin"></i>
                            {lang key='loading'}
                        </div>
                        <button type="button" class="btn bg-gray-200 text-gray-600 px-4 py-2 rounded hover:bg-gray-300" data-dismiss="modal">
                            {lang key='close'}
                        </button>
                        <button type="button" class="btn bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 modal-submit">
                            {lang key='submit'}
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <form method="get" action="{$currentpagelinkback}">
        <div class="modal modal-localisation fade" id="modalChooseLanguage" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-lg">
                <div class="modal-content bg-white rounded-lg shadow-md">
                    <div class="modal-body p-6">
                        <button type="button" class="close text-gray-600 absolute top-0 right-0 mt-4 mr-4" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>

                        {if $languagechangeenabled && count($locales) > 1}
                            <h5 class="h5 pt-5 pb-3 text-gray-800">{lang key='chooselanguage'}</h5>
                            <div class="row item-selector">
                                <input type="hidden" name="language" data-current="{$language}" value="{$language}" />
                                {foreach $locales as $locale}
                                    <div class="col-4">
                                        <a href="#" class="item block px-4 py-2 rounded hover:bg-gray-100 text-gray-800{if $language == $locale.language} bg-gray-200 text-gray-600{/if}" data-value="{$locale.language}">
                                            {$locale.localisedName}
                                        </a>
                                    </div>
                                {/foreach}
                            </div>
                        {/if}
                        {if !$loggedin && $currencies}
                            <p class="h5 pt-5 pb-3 text-gray-800">{lang key='choosecurrency'}</p>
                            <div class="row item-selector">
                                <input type="hidden" name="currency" data-current="{$activeCurrency.id}" value="">
                                {foreach $currencies as $selectCurrency}
                                    <div class="col-4">
                                        <a href="#" class="item block px-4 py-2 rounded hover:bg-gray-100 text-gray-800{if $activeCurrency.id == $selectCurrency.id} bg-gray-200 text-gray-600{/if}" data-value="{$selectCurrency.id}">
                                            {$selectCurrency.prefix} {$selectCurrency.code}
                                        </a>
                                    </div>
                                {/foreach}
                            </div>
                        {/if}
                    </div>
                    <div class="modal-footer border-t border-gray-200 p-4">
                        <button type="submit" class="btn bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">
                            {lang key='apply'}
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </form>

    {if !$loggedin && $adminLoggedIn}
        <a href="{$WEB_ROOT}/logout.php?returntoadmin=1" class="fixed bottom-4 right-4 bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600" data-toggle="tooltip" data-placement="bottom" title="{if $adminMasqueradingAsClient}{lang key='adminmasqueradingasclient'} {lang key='logoutandreturntoadminarea'}{else}{lang key='adminloggedin'} {lang key='returntoadminarea'}{/if}">
            <i class="fas fa-redo-alt"></i>
            <span class="ml-2 hidden md:inline-block">{lang key="admin.returnToAdmin"}</span>
        </a>
    {/if}

    {include file="$template/includes/generate-password.tpl"}

    
</body>
</html>