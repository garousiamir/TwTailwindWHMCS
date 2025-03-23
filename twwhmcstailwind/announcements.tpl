<div class="bg-white rounded-lg shadow-md mb-4">
    <div class="p-4">
        <h3 class="text-2xl font-bold mb-4">{lang key="announcementstitle"}</h3>

        <div class="announcements">
            {foreach $announcements as $announcement}
                <div class="py-4">
                    <h4 class="text-lg font-semibold mb-2">
                        <a href="{routePath('announcement-view', $announcement.id, $announcement.urlfriendlytitle)}" class="text-blue-500 hover:text-blue-700">
                            {$announcement.title}
                        </a>
                        {if $announcement.editLink}
                            <a href="{$announcement.editLink}" class="ml-2 inline-block px-2 py-1 bg-gray-200 text-gray-600 rounded hover:bg-gray-300">
                                <i class="fas fa-pencil-alt fa-fw"></i>
                                {lang key='edit'}
                            </a>
                        {/if}
                    </h4>

                    <ul class="list-inline flex items-center text-gray-500 mb-2">
                        <li class="list-inline-item pr-3">
                            <i class="far fa-calendar-alt fa-fw"></i>
                            {$carbon->createFromTimestamp($announcement.timestamp)->format('jS F Y')}
                        </li>
                    </ul>

                    <article>
                        {if $announcement.text|strip_tags|strlen < 350}
                            {$announcement.text}
                        {else}
                            {$announcement.summary}
                        {/if}
                    </article>

                    <a href="{routePath('announcement-view', $announcement.id, $announcement.urlfriendlytitle)}" class="inline-block px-4 py-2 font-semibold rounded border border-[#369] text-[#369] hover:bg-[#369] hover:text-[#fff] mt-4">
                        {lang key="announcementscontinue"}
                        <i class="far fa-arrow-right"></i>
                    </a>
                </div>
            {foreachelse}
                {include file="$template/includes/alert.tpl" type="info" msg="{lang key='noannouncements'}" textcenter=true}
            {/foreach}
        </div>
    </div>
</div>

{if $prevpage || $nextpage}
    <nav aria-label="Announcements navigation" class="mt-4">
        <ul class="flex items-center justify-center space-x-2">
            {foreach $pagination as $item}
                <li class="page-item{if $item.disabled} opacity-50 cursor-not-allowed{/if}{if $item.active} bg-blue-500 text-white{/if} rounded px-3 py-2">
                    <a href="{$item.link}" class="block">
                        {$item.text}
                    </a>
                </li>
            {/foreach}
        </ul>
    </nav>
{/if}

{if $announcementsFbRecommend}
    <script>
        (function(d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) {
                return;
            }
            js = d.createElement(s); js.id = id;
            js.src = "//connect.facebook.net/{lang key='locale'}/all.js#xfbml=1";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
    </script>
{/if}