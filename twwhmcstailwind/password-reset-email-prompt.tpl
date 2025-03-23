<div class="mb-4">
    <h6 class="text-2xl font-bold">{lang key='pwreset'}</h6>
    <p class="text-gray-500 mb-0">{lang key='pwresetemailneeded'}</p>
</div>

{if $errorMessage}
    {include file="$template/includes/alert.tpl" type="error" msg=$errorMessage textcenter=true}
{/if}

<form method="post" action="{routePath('password-reset-validate-email')}" role="form">
    <input type="hidden" name="action" value="reset" />

    <div class="mb-4">
        <label for="inputEmail" class="block text-sm font-medium text-gray-700">{lang key='loginemail'}</label>
        <div class="relative rounded-md shadow-sm">
            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                <span class="text-gray-500 sm:text-sm">
                    <i class="fas fa-user"></i>
                </span>
            </div>
            <input type="email" class="focus:ring-indigo-500 focus:border-indigo-500 block w-full px-[35px] py-[15px] sm:text-sm border-gray-300 rounded-md" name="email" id="inputEmail" placeholder="name@example.com" autofocus>
        </div>
    </div>

    {if $captcha->isEnabled()}
        <div class="text-center mb-4">
            {include file="$template/includes/captcha.tpl"}
        </div>
    {/if}

    <div class="text-center">
        <button type="submit" class="inline-block px-4 py-2 bg-blue-500 text-white font-semibold rounded hover:bg-blue-600{$captcha->getButtonClass($captchaForm)}">
            {lang key='pwresetsubmit'}
        </button>
    </div>
</form>