{include file="orderforms/twwhmcstailwind/common.tpl"}

<div id="order-standard_cart">

    <div class="flex flex-col md:flex-row">
        <div class="cart-sidebar">
            {include file="orderforms/twwhmcstailwind/sidebar-categories.tpl"}
        </div>
        <div class="cart-body flex-grow">
            <div class="mb-6">
                <h1 class="text-4xl font-bold">
                    {$LANG.transferdomain}
                </h1>
            </div>
            {include file="orderforms/twwhmcstailwind/sidebar-categories-collapsed.tpl"}

            <div class="text-center">
                <h2 class="text-3xl font-semibold">{lang key='orderForm.transferToUs'}</h2>
                <p>{lang key='orderForm.transferExtend'}*</p>
            </div>
            <div class="my-6"></div>

            <form method="post" action="{$WEB_ROOT}/cart.php" id="frmDomainTransfer">
                <input type="hidden" name="a" value="addDomainTransfer">

                <div class="flex justify-center">
                    <div class="w-full md:w-2/3 lg:w-2/3">
                        <div class="bg-white rounded-lg shadow-md overflow-hidden">
                            <div class="px-6 pt-6 pb-0">
                                <h3 class="text-2xl font-medium mb-2">{lang key='orderForm.singleTransfer'}</h3>
                            </div>
                            <div class="p-6">
                                <div class="mb-4">
                                    <label for="inputTransferDomain" class="block text-gray-700 mb-2">{lang key='domainname'}</label>
                                    <input type="text" class="w-full px-4 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-500" name="domain" id="inputTransferDomain" value="{$lookupTerm}" placeholder="{lang key='yourdomainplaceholder'}.{lang key='yourtldplaceholder'}" data-toggle="tooltip" data-placement="left" data-trigger="manual" title="{lang key='orderForm.enterDomain'}" />
                                </div>
                                <div class="mb-4">
                                    <div class="flex justify-between items-center mb-2">
                                        <label for="inputAuthCode" class="block text-gray-700">{lang key='orderForm.authCode'}</label>
                                        <a data-toggle="tooltip" data-placement="left" title="{lang key='orderForm.authCodeTooltip'}" class="text-blue-500">
                                            <i class="fas fa-question-circle"></i> {lang key='orderForm.help'}
                                        </a>
                                    </div>
                                    <input type="text" class="w-full px-4 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-500" name="epp" id="inputAuthCode" placeholder="{lang key='orderForm.authCodePlaceholder'}" data-toggle="tooltip" data-placement="left" data-trigger="manual" title="{lang key='orderForm.required'}" />
                                </div>
                                <div id="transferUnavailable" class="bg-yellow-100 text-yellow-800 px-4 py-3 rounded hidden text-center"></div>
                                {if $captcha->isEnabled() && !$captcha->recaptcha->isEnabled()}
                                    <div class="mt-4" id="captchaContainer">
                                        <div class="default-captcha">
                                            <p>{lang key="cartSimpleCaptcha"}</p>
                                            <div class="flex items-center space-x-4">
                                                <img id="inputCaptchaImage" src="{$systemurl}includes/verifyimage.php" />
                                                <input id="inputCaptcha" type="text" name="code" maxlength="6" class="px-4 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-500" data-toggle="tooltip" data-placement="right" data-trigger="manual" title="{lang key='orderForm.required'}" />
                                            </div>
                                        </div>
                                    </div>
                                {elseif $captcha->isEnabled() && $captcha->recaptcha->isEnabled() && !$captcha->recaptcha->isInvisible()}
                                    <div class="text-center mt-4">
                                        <div class="recaptcha-container" id="captchaContainer"></div>
                                    </div>
                                {/if}
                            </div>

                            <div class="px-6 py-4 bg-gray-50 text-right">
                                <button type="submit" id="btnTransferDomain" class="bg-blue-500 hover:bg-blue-600 text-white font-medium py-2 px-6 rounded transition duration-300{$captcha->getButtonClass($captchaForm)}">
                                    <span class="hidden" id="addTransferLoader">
                                        <i class="fas fa-fw fa-spinner fa-spin"></i>
                                    </span>
                                    <span id="addToCart">{lang key="orderForm.addToCart"}</span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

            </form>

            <p class="text-center text-sm text-gray-600 mt-6">* {lang key='orderForm.extendExclusions'}</p>
        </div>
    </div>
</div>