<div class="providerLinkingFeedback"></div>

<form method="post" action="{routePath('login-validate')}" class="login-form" role="form">
    <div class="max-w-md mx-auto my-8 bg-white rounded-lg shadow-md">
        <div class="px-6 py-8">
            <div class="mb-4">
                <h6 class="text-3xl font-bold">{lang key='loginbutton'}</h6>
                <p class="text-gray-500 mb-0">{lang key='userLogin.signInToContinue'}</p>
            </div>
            {include file="$template/includes/flashmessage.tpl"}
            <div class="mb-4">
                <label for="inputEmail" class="block text-sm font-medium text-gray-700">{lang key='clientareaemail'}</label>
                <div class="mt-1 relative rounded-md shadow-sm">
                    <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                        <span class="text-gray-500 sm:text-sm">
                            <i class="fas fa-user"></i>
                        </span>
                    </div>
                    <input type="email" class="focus:ring-indigo-500 focus:border-indigo-500 block w-full px-[35px] py-[15px] sm:text-sm border-gray-300 rounded-md" name="username" id="inputEmail" placeholder="name@example.com" autofocus>
                </div>
            </div>
            <div class="mb-4">
                <div class="flex justify-between items-center">
                    <label for="inputPassword" class="block text-sm font-medium text-gray-700">{lang key='clientareapassword'}</label>
                    <div class="text-sm">
                        <a href="{routePath('password-reset-begin')}" class="font-medium text-indigo-600 hover:text-indigo-500" tabindex="-1">{lang key='forgotpw'}</a>
                    </div>
                </div>
                <div class="mt-1 relative rounded-md shadow-sm">
                    <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                        <span class="text-gray-500 sm:text-sm">
                            <i class="fas fa-key"></i>
                        </span>
                    </div>
                    <input type="password" class="focus:ring-indigo-500 focus:border-indigo-500 block w-full px-[35px] py-[15px] sm:text-sm border-gray-300 rounded-md pw-input" name="password" id="inputPassword" placeholder="{lang key='clientareapassword'}" autocomplete="off">
                    <div class="absolute inset-y-0 right-0 pr-3 flex items-center text-sm leading-5">
                        <button class="text-gray-400 hover:text-gray-500 focus:outline-none focus:shadow-outline-blue transition ease-in-out duration-150" type="button" tabindex="-1">
                            <i class="fas fa-eye"></i>
                        </button>
                    </div>
                </div>
            </div>
            {if $captcha->isEnabled()}
                {include file="$template/includes/captcha.tpl"}
            {/if}
            <div class="flex justify-between items-center">
                <button id="login" type="submit" class="inline-flex justify-center py-2 px-4 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500{$captcha->getButtonClass($captchaForm)}">
                    {lang key='loginbutton'}
                </button>
                <div class="flex items-center">
                    <input id="remember-me" type="checkbox" class="h-4 w-4 text-indigo-600 focus:ring-indigo-500 border-gray-300 rounded" name="rememberme">
                    <label for="remember-me" class="ml-2 block text-sm text-gray-900">
                        {lang key='loginrememberme'}
                    </label>
                </div>
            </div>
        </div>
        <div class="px-6 py-4 bg-gray-50 border-t border-gray-200">
            <p class="text-sm text-gray-500">
                {lang key='userLogin.notRegistered'}
                <a href="{$WEB_ROOT}/register.php" class="font-medium text-indigo-600 hover:text-indigo-500">
                    {lang key='userLogin.createAccount'}
                </a>
            </p>
        </div>
    </div>
</form>

{include file="$template/includes/linkedaccounts.tpl" linkContext="login" customFeedback=true}