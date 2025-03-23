{if $captcha->isEnabled() && $captcha->isEnabledForForm($captchaForm)}
    <div class="text-center {if $containerClass}{$containerClass}{else}flex justify-center{/if}">
        {if $templatefile == 'homepage'}
            <div class="domainchecker-homepage-captcha">
        {/if}

        {if $captcha->recaptcha->isEnabled() && !$captcha->recaptcha->isInvisible()}
            <div id="google-recaptcha-domainchecker" class="form-group recaptcha-container mx-auto" data-action="{$captchaForm}"></div>
        {elseif !$captcha->recaptcha->isEnabled()}
            <div class="w-full max-w-md mx-auto mb-4 sm:mb-0">
                <div id="default-captcha-domainchecker" class="text-center">
                    <p class="text-gray-700 mb-4">{lang key="captchaverify"}</p>

                    <div class="flex items-center justify-center gap-4">
                        <div class="captchaimage">
                            <img
                                id="inputCaptchaImage"
                                data-src="{$systemurl}includes/verifyimage.php"
                                src="{$systemurl}includes/verifyimage.php"
                                alt="CAPTCHA Image"
                                class="w-32 h-12 border border-gray-300 rounded-lg"
                            />
                        </div>

                        <div class="flex-1">
                            <input
                                id="inputCaptcha"
                                type="text"
                                name="code"
                                maxlength="6"
                                class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none transition-all"
                                data-toggle="tooltip"
                                data-placement="right"
                                data-trigger="manual"
                                title="{lang key='orderForm.required'}"
                                placeholder="{lang key='enterCaptcha'}"
                            />
                        </div>
                    </div>
                </div>
            </div>
        {/if}

        {if $templatefile == 'homepage'}
            </div>
        {/if}
    </div>
{/if}