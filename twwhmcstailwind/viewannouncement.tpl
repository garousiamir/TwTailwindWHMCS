<div class="bg-white rounded-lg shadow-md mb-4">
    <div class="p-6">
        <h1 class="text-3xl font-bold mb-4">
            {$title}
            {if $twittertweet}
                <div class="float-right">
                    <a href="https://twitter.com/share" class="twitter-share-button" data-count="vertical" data-size="large" data-via="{$twitterusername}">
                        Tweet
                    </a>
                    <script src="https://platform.twitter.com/widgets.js"></script>
                </div>
            {/if}
        </h1>

        <ul class="list-inline flex items-center text-gray-500 mb-4">
            <li class="list-inline-item pr-3">
                <i class="far fa-calendar-alt fa-fw"></i>
                {$carbon->createFromTimestamp($timestamp)->format('l, jS F, Y')}
            </li>
            <li class="list-inline-item pr-3">
                <i class="far fa-clock fa-fw"></i>
                {$carbon->createFromTimestamp($timestamp)->format('H:ia')}
            </li>
        </ul>

        <div class="py-5">
            {$text}
        </div>

        {if $facebookrecommend}
            <div id="fb-root"></div>
            <script>
                (function(d, s, id) {
                    var js, fjs = d.getElementsByTagName(s)[0];
                    if (d.getElementById(id)) {
                        return;
                    }
                    js = d.createElement(s);
                    js.id = id;
                    js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
                    fjs.parentNode.insertBefore(js, fjs);
                }(document, 'script', 'facebook-jssdk'));
            </script>
            <div class="fb-like" data-href="{fqdnRoutePath('announcement-view', $id, $urlfriendlytitle)}" data-send="true" data-width="450" data-show-faces="true" data-action="recommend">
            </div>
        {/if}
    </div>
</div>

{if $facebookcomments}
    <div class="bg-white rounded-lg shadow-md mb-4">
        <div class="p-6">
            <div id="fb-root"></div>
            <script>
                (function(d, s, id) {
                    var js, fjs = d.getElementsByTagName(s)[0];
                    if (d.getElementById(id)) {
                        return;
                    }
                    js = d.createElement(s);
                    js.id = id;
                    js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
                    fjs.parentNode.insertBefore(js, fjs);
                }(document, 'script', 'facebook-jssdk'));
            </script>
            <fb:comments href="{fqdnRoutePath('announcement-view', $id, $urlfriendlytitle)}" num_posts="5" width="100%"></fb:comments>
        </div>
    </div>
{/if}

<div class="mt-4 flex justify-between">
    <a href="{routePath('announcement-index')}" class="inline-block px-4 py-2 bg-gray-200 text-gray-600 font-semibold rounded hover:bg-gray-300">
        {lang key='clientareabacklink'}
    </a>

    {if $editLink}
        <a href="{$editLink}" class="inline-block px-4 py-2 bg-gray-200 text-gray-600 font-semibold rounded hover:bg-gray-300 float-right">
            <i class="fas fa-pencil-alt fa-fw"></i>
            {lang key='edit'}
        </a>
    {/if}
</div>