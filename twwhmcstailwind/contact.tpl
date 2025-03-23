<div class="bg-white rounded-lg shadow-md mb-4">
    <div class="p-6">

        <div class="mb-4">
            <h6 class="text-2xl font-bold">{lang key='contactus'}</h6>
            <p class="text-gray-500 mb-0">{lang key='readyforquestions'}</p>
        </div>

        {if $sent}
            {include file="$template/includes/alert.tpl" type="success" msg="{lang key='contactsent'}" textcenter=true}
        {/if}

        {if $errormessage}
            {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
        {/if}

        {if !$sent}
            <form method="post" action="contact.php" role="form">
                <input type="hidden" name="action" value="send" />

                <div class="mb-4">
                    <label for="inputName" class="block text-sm font-medium text-gray-700  sm:w-1/4 sm:pr-4">
                        {lang key='supportticketsclientname'}
                    </label>
                    <div class="">
                        <input type="text" name="name" value="{$name}" class="form-control block !w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500" id="inputName" />
                    </div>
                </div>
                <div class="mb-4">
                    <label for="inputEmail" class="block text-sm font-medium text-gray-700  sm:w-1/4 sm:pr-4">
                        {lang key='supportticketsclientemail'}
                    </label>
                    <div class="">
                        <input type="email" name="email" value="{$email}" class="form-control block !w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500" id="inputEmail" />
                    </div>
                </div>
                <div class="mb-4">
                    <label for="inputSubject" class="block text-sm font-medium text-gray-700  sm:w-1/4 sm:pr-4">
                        {lang key='supportticketsticketsubject'}
                    </label>
                    <div class="">
                        <input type="text" name="subject" value="{$subject}" class="form-control block !w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500" id="inputSubject" />
                    </div>
                </div>
                <div class="mb-4">
                    <label for="inputMessage" class="block text-sm font-medium text-gray-700  sm:w-1/4 sm:pr-4">
                        {lang key='contactmessage'}
                    </label>
                    <div class="">
                        <textarea name="message" rows="7" class="form-control block !w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500" id="inputMessage">{$message}</textarea>
                    </div>
                </div>

                {if $captcha}
                    <div class="text-center mb-4">
                        {include file="$template/includes/captcha.tpl"}
                    </div>
                {/if}

                <div class="text-center">
                    <button type="submit" class="inline-block px-4 py-2 bg-blue-500 text-white font-semibold rounded hover:bg-blue-600{$captcha->getButtonClass($captchaForm)}">
                        {lang key='contactsend'}
                    </button>
                </div>
            </form>
        {/if}

    </div>
</div>