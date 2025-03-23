{if $invalidTicketId}
    {include file="$template/includes/alert.tpl" type="danger" title="{lang key='thereisaproblem'}" msg="{lang key='supportticketinvalid'}" textcenter=true}
{else}
    {if $closedticket}
        {include file="$template/includes/alert.tpl" type="warning" msg="{lang key='supportticketclosedmsg'}" textcenter=true}
    {/if}
    {if $errormessage}
        {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
    {/if}
{/if}
{if !$invalidTicketId}
    <div class="bg-white rounded-lg shadow-md mb-4 view-ticket">
        <div class="p-3">
            <h3 class="text-2xl font-bold mb-2">
                {lang key='supportticketsviewticket'} #{$tid}
                <div class="ticket-actions float-right mt-3 mt-sm-0">
                    <button id="ticketReply" type="button" class="inline-block px-3 py-2 bg-gray-200 text-gray-600 font-semibold rounded hover:bg-gray-300 text-[14px]" onclick="smoothScroll('#ticketReplyContainer')">
                        <i class="fas fa-pencil-alt fa-fw"></i>
                        {lang key='supportticketsreply'}
                    </button>
                    {if $showCloseButton}
                        {if $closedticket}
                            <button class="inline-block px-3 py-2 bg-red-500 text-white text-[14px] font-semibold rounded hover:bg-red-600" disabled="disabled">
                                <i class="fas fa-times fa-fw"></i>
                                {lang key='supportticketsstatusclosed'}
                            </button>
                        {else}
                            <button class="inline-block px-3 py-2 bg-red-500 text-white text-[14px] font-semibold rounded hover:bg-red-600" onclick="window.location='?tid={$tid}&amp;c={$c}&amp;closeticket=true'">
                                <i class="fas fa-times fa-fw"></i>
                                {lang key='supportticketsclose'}
                            </button>
                        {/if}
                    {/if}
                </div>
            </h3>
            <p class="text-gray-500">
                {lang key='supportticketssubject'}:
                <strong>{$subject}</strong>
            </p>
        </div>
        {foreach $descreplies as $reply}
            <div class="p-3 border-t border-gray-200">
                <div class="ticket-reply markdown-content{if $reply.admin} staff{/if}">
                    <div class="posted-by flex items-center justify-between mb-2">
                        <span>
                            {lang key="support.postedBy" name="<span class=\"posted-by-name font-semibold\">{$reply.requestor.name}</span>" date="<span class=\"posted-on text-gray-500\">{$reply.date}</span>" requestorType="<span class=\"label requestor-badge requestor-type-{$reply.requestor.type_normalised} float-right\">{lang key='support.requestor.'|cat:$reply.requestor.type_normalised}</span>"}
                        </span>
                    </div>
                    <div class="message p-3 bg-gray-100 rounded-lg">
                        {$reply.message}
                        {if $reply.ipaddress}
                            <hr class="my-2">
                            <p class="text-gray-500">
                                {lang key='support.ipAddress'}: {$reply.ipaddress}
                            </p>
                        {/if}
                        {if $reply.id && $reply.admin && $ratingenabled}
                            <div class="clearfix mt-2">
                                {if $reply.rating}
                                    <div class="rating-done flex items-center">
                                        {for $rating=1 to 5}
                                            <span class="star{if (5 - $reply.rating) < $rating} active{/if}"></span>
                                        {/for}
                                        <div class="rated ml-2 text-gray-500">
                                            {lang key='ticketreatinggiven'}
                                        </div>
                                    </div>
                                {else}
                                    <div class="rating flex items-center" ticketid="{$tid}" ticketkey="{$c}" ticketreplyid="{$reply.id}">
                                        <span class="star" rate="5"></span>
                                        <span class="star" rate="4"></span>
                                        <span class="star" rate="3"></span>
                                        <span class="star" rate="2"></span>
                                        <span class="star" rate="1"></span>
                                    </div>
                                {/if}
                            </div>
                        {/if}
                    </div>
                    {if $reply.attachments}
                        <div class="attachments p-3 mt-2">
                            <strong class="flex items-center">
                                <i class="far fa-paperclip fa-fw mr-2"></i>
                                {lang key='supportticketsticketattachments'} ({$reply.attachments|count})
                            </strong>
                            {if $reply.attachments_removed} - <span class="text-gray-500">{lang key='support.attachmentsRemoved'}</span>{/if}
                            <ul class="attachment-list list-unstyled">
                                {foreach $reply.attachments as $num => $attachment}
                                    <li class="flex items-center mt-2">
                                        {if $reply.attachments_removed}
                                            <span class="flex items-center">
                                                <figure class="mr-2">
                                                    <i class="far fa-file-minus"></i>
                                                </figure>
                                                <div class="caption">
                                                    {$attachment}
                                                </div>
                                            </span>
                                        {else}
                                            <a href="dl.php?type={if $reply.id}ar&id={$reply.id}{else}a&id={$id}{/if}&i={$num}" class="flex items-center">
                                                <span class="flex items-center">
                                                    <figure class="mr-2">
                                                        <i class="far fa-file"></i>
                                                    </figure>
                                                    <div class="caption">
                                                        {$attachment}
                                                    </div>
                                                </span>
                                            </a>
                                        {/if}
                                    </li>
                                {/foreach}
                            </ul>
                        </div>
                    {/if}
                </div>
            </div>
        {/foreach}
    </div>
    <div class="bg-white rounded-lg shadow-md mb-4 d-print-none" id="ticketReplyContainer">
        <div class="p-3">
            <h3 class="text-2xl font-bold mb-4">{lang key='supportticketsreply'}</h3>
            <form method="post" action="{$smarty.server.PHP_SELF}?tid={$tid}&amp;c={$c}&amp;postreply=true" enctype="multipart/form-data" role="form" id="frmReply">
                <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                    <div>
                        <label for="inputName" class="block text-sm font-medium text-gray-700">
                            {lang key='supportticketsclientname'}
                        </label>
                        <input class="form-control block w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500" type="text" name="replyname" id="inputName" value="{$replyname}" {if $loggedin} disabled="disabled"{/if}>
                    </div>
                    <div>
                        <label for="inputEmail" class="block text-sm font-medium text-gray-700">
                            {lang key='supportticketsclientemail'}
                        </label>
                        <input class="form-control block w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500" type="text" name="replyemail" id="inputEmail" value="{$replyemail}" {if $loggedin} disabled="disabled"{/if}>
                    </div>
                </div>
                <div class="mt-4">
                    <label for="inputMessage" class="block text-sm font-medium text-gray-700">
                        {lang key='contactmessage'}
                    </label>
                    <textarea name="replymessage" id="inputMessage" rows="12" class="form-control block w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 markdown-editor" data-auto-save-name="ctr{$tid}">{$replymessage}</textarea>
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
                <div class="mt-4 text-center">
                    <input class="inline-block px-4 py-2 bg-blue-500 text-white font-semibold rounded hover:bg-blue-600" type="submit" name="save" value="{lang key='supportticketsticketsubmit'}" />
                    <input class="inline-block px-4 py-2 bg-gray-200 text-gray-600 font-semibold rounded hover:bg-gray-300" type="reset" value="{lang key='cancel'}" onclick="jQuery('#ticketReply').click()" />
                </div>
            </form>
        </div>
    </div>
{/if}