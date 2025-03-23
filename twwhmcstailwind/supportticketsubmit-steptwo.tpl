<form method="post" action="{$smarty.server.PHP_SELF}?step=3" enctype="multipart/form-data" role="form">

    <div class="bg-white shadow-sm rounded-lg">
        <div class="p-6">
    
            <h3 class="text-xl font-semibold mb-4">{lang key="createNewSupportRequest"}</h3>
    
            {if $errormessage}
                {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
            {/if}
    
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div class="form-group">
                    <label for="inputName" class="block text-sm font-medium text-gray-700">{lang key='supportticketsclientname'}</label>
                    <input type="text" name="name" id="inputName" value="{$name}" class="mt-1 block w-full rounded-md px-[35px] py-[15px] border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500{if $loggedin} bg-gray-100 cursor-not-allowed{/if}"{if $loggedin} disabled="disabled"{/if} />
                </div>
                <div class="form-group">
                    <label for="inputEmail" class="block text-sm font-medium text-gray-700">{lang key='supportticketsclientemail'}</label>
                    <input type="email" name="email" id="inputEmail" value="{$email}" class="mt-1 block w-full rounded-md px-[35px] py-[15px] border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500{if $loggedin} bg-gray-100 cursor-not-allowed{/if}"{if $loggedin} disabled="disabled"{/if} />
                </div>
            </div>
    
            <div class="mt-6">
                <div class="form-group">
                    <label for="inputSubject" class="block text-sm font-medium text-gray-700">{lang key='supportticketsticketsubject'}</label>
                    <input type="text" name="subject" id="inputSubject" value="{$subject}" class="mt-1 block w-full rounded-md px-[35px] py-[15px] border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500" />
                </div>
            </div>
    
            <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mt-6">
                <div class="form-group">
                    <label for="inputDepartment" class="block text-sm font-medium text-gray-700">{lang key='supportticketsdepartment'}</label>
                    <select name="deptid" id="inputDepartment" class="mt-1 block w-full rounded-md px-[35px] py-[15px] border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500" onchange="refreshCustomFields(this)">
                        {foreach $departments as $department}
                            <option value="{$department.id}"{if $department.id eq $deptid} selected="selected"{/if}>
                                {$department.name}
                            </option>
                        {/foreach}
                    </select>
                </div>
                {if $relatedservices}
                    <div class="form-group">
                        <label for="inputRelatedService" class="block text-sm font-medium text-gray-700">{lang key='relatedservice'}</label>
                        <select name="relatedservice" id="inputRelatedService" class="mt-1 block w-full rounded-md px-[35px] py-[15px] border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500">
                            <option value="">{lang key='none'}</option>
                            {foreach $relatedservices as $relatedservice}
                                <option value="{$relatedservice.id}"{if $relatedservice.id eq $selectedservice} selected="selected"{/if}>
                                    {$relatedservice.name} ({$relatedservice.status})
                                </option>
                            {/foreach}
                        </select>
                    </div>
                {/if}
                <div class="form-group">
                    <label for="inputPriority" class="block text-sm font-medium text-gray-700">{lang key='supportticketspriority'}</label>
                    <select name="urgency" id="inputPriority" class="mt-1 block w-full rounded-md px-[35px] py-[15px] border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500">
                        <option value="High"{if $urgency eq "High"} selected="selected"{/if}>
                            {lang key='supportticketsticketurgencyhigh'}
                        </option>
                        <option value="Medium"{if $urgency eq "Medium" || !$urgency} selected="selected"{/if}>
                            {lang key='supportticketsticketurgencymedium'}
                        </option>
                        <option value="Low"{if $urgency eq "Low"} selected="selected"{/if}>
                            {lang key='supportticketsticketurgencylow'}
                        </option>
                    </select>
                </div>
            </div>
    
            <div class="mt-6">
                <div class="form-group">
                    <label for="inputMessage" class="block text-sm font-medium text-gray-700">{lang key='contactmessage'}</label>
                    <textarea name="message" id="inputMessage" rows="12" class="mt-1 block w-full rounded-md px-[35px] py-[15px] border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500 markdown-editor" data-auto-save-name="client_ticket_open">{$message}</textarea>
                </div>
            </div>
    
                            <div class="mt-4">
                    <label for="inputAttachments" class="block text-sm font-medium text-gray-700">
                        {lang key='supportticketsticketattachments'}
                    </label>
                    <div class="input-group mb-1 attachment-group flex items-center">
                        <div class="custom-file relative flex items-center">
                            <label class="custom-file-label text-truncate block w-full px-4 py-2 border border-gray-300 rounded-l-md focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500" for="inputAttachment1" data-default="{lang key='chooseFile'}">
                                {lang key='chooseFile'}
                            </label>
                            <input type="file" class="custom-file-input absolute inset-0 opacity-0 w-full h-full cursor-pointer" name="attachments[]" id="inputAttachment1">
                        </div>
                        <div class="input-group-append">
                            <button class="inline-block px-3 py-2 bg-gray-200 text-gray-600 font-semibold rounded-r-md hover:bg-gray-300" type="button" id="btnTicketAttachmentsAdd">
                                <i class="fas fa-plus"></i>
                                {lang key='addmore'}
                            </button>
                        </div>
                    </div>
                    <div class="file-upload w-hidden">
                        <div class="input-group mb-1 attachment-group flex items-center">
                            <div class="custom-file relative flex items-center">
                                <label class="custom-file-label text-truncate block w-full px-4 py-2 border border-gray-300 rounded-l-md focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500">
                                    {lang key='chooseFile'}
                                </label>
                                <input type="file" class="custom-file-input absolute inset-0 opacity-0 w-full h-full cursor-pointer" name="attachments[]">
                            </div>
                        </div>
                    </div>
                    <div id="fileUploadsContainer"></div>
                    <div class="text-gray-500 text-sm mt-2">
                        {lang key='supportticketsallowedextensions'}: {$allowedfiletypes} ({lang key="maxFileSize" fileSize="$uploadMaxFileSize"})
                    </div>
                </div>
    
            <div id="customFieldsContainer" class="mt-6">
                {include file="$template/supportticketsubmit-customfields.tpl"}
            </div>
    
            <div id="autoAnswerSuggestions" class="hidden"></div>
    
            <div class="mt-6 text-center">
                {include file="$template/includes/captcha.tpl"}
            </div>
    
            <div class="mt-6 text-center">
                <button type="submit" id="openTicketSubmit" class="px-4 py-2 bg-blue-600 text-white rounded-md hover:bg-blue-700 disable-on-click{$captcha->getButtonClass($captchaForm)}">
                    {lang key='supportticketsticketsubmit'}
                </button>
                <a href="supporttickets.php" class="px-4 py-2 bg-gray-200 text-gray-700 rounded-md hover:bg-gray-300 ml-2">{lang key='cancel'}</a>
            </div>
    
        </div>
    </div>
    
    </form>
    
    {if $kbsuggestions}
        <script>
            jQuery(document).ready(function() {
                getTicketSuggestions();
            });
        </script>
    {/if}