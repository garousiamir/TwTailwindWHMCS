<!doctype html>
<html lang="en">
<head>
    <meta charset="{$charset}" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>{if $kbarticle.title}{$kbarticle.title} - {/if}{$pagetitle} - {$companyname}</title>
    {include file="$template/includes/head.tpl"}
    {$headoutput}
</head>
<body class="bg-gray-100" data-phone-cc-input="{$phoneNumberInputStyle}">
    {if $captcha}{$captcha->getMarkup()}{/if}
    {$headeroutput}

    <header id="header" class="bg-white">
        {if $loggedin}
            <div class="bg-gray-50 py-2">
                <div class="container mx-auto px-4">
                    <div class="flex justify-between items-center">
                        <div>
                            <button type="button" class="flex items-center text-gray-500 hover:text-gray-700 focus:outline-none" data-toggle="popover" id="accountNotifications" data-placement="bottom">
                                <i class="far fa-flag"></i>
                                {if count($clientAlerts) > 0}
                                    <span class="ml-1">
                                        {count($clientAlerts)}
                                        <span class="hidden sm:inline">{lang key='notifications'}</span>
                                    </span>
                                {else}
                                    <span class="ml-1 hidden sm:inline">0</span>
                                    <span class="ml-1 hidden sm:inline">{lang key='nonotifications'}</span>
                                {/if}
                            </button>
                            <div id="accountNotificationsContent" class="hidden">
                                <ul class="client-alerts">
                                {foreach $clientAlerts as $alert}
                                    <li>
                                        <a href="{$alert->getLink()}" class="block px-4 py-2 text-gray-700 hover:bg-gray-100">
                                            <i class="fas fa-fw fa-{if $alert->getSeverity() == 'danger'}exclamation-circle{elseif $alert->getSeverity() == 'warning'}exclamation-triangle{elseif $alert->getSeverity() == 'info'}info-circle{else}check-circle{/if}"></i>
                                            <div class="message">{$alert->getMessage()}</div>
                                        </a>
                                    </li>
                                {foreachelse}
                                    <li class="none">
                                        {lang key='notificationsnone'}
                                    </li>
                                {/foreach}
                                </ul>
                            </div>
                        </div>

                        <div>
                            <div class="flex items-center">
                                <div class="hidden md:inline">
                                    <span class="text-gray-500">{lang key='loggedInAs'}:</span>
                                </div>
                                <div class="ml-2">
                                    <a href="{$WEB_ROOT}/clientarea.php?action=details" class="text-gray-700 hover:text-gray-900">
                                        <span>
                                            {if $client.companyname}
                                                {$client.companyname}
                                            {else}
                                                {$client.fullName}
                                            {/if}
                                        </span>
                                    </a>
                                    <a href="{routePath('user-accounts')}" class="ml-2 text-gray-500 hover:text-gray-700" data-toggle="tooltip" data-placement="bottom" title="Switch Account">
                                        <i class="fad fa-random"></i>
                                    </a>
                                    {if $adminMasqueradingAsClient || $adminLoggedIn}
                                        <a href="{$WEB_ROOT}/logout.php?returntoadmin=1" class="ml-2 text-gray-500 hover:text-gray-700" data-toggle="tooltip" data-placement="bottom" title="{if $adminMasqueradingAsClient}{lang key='adminmasqueradingasclient'} {lang key='logoutandreturntoadminarea'}{else}{lang key='adminloggedin'} {lang key='returntoadminarea'}{/if}">
                                            <i class="fas fa-redo-alt"></i>
                                            <span class="hidden md:inline-block">{lang key="admin.returnToAdmin"}</span>
                                        </a>
                                    {/if}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        {/if}

        <div class="bg-white">
            <div class="container mx-auto px-4">
                <div class="flex items-center justify-between py-4">
                    <a class="flex items-center text-gray-800" href="{$WEB_ROOT}/index.php">
                        {if $assetLogoPath}
                            <img src="{$assetLogoPath}" alt="{$companyname}" class="h-8 mr-3">
                        {else}
                            <span class="text-2xl font-bold">{$companyname}</span>
                        {/if}
                    </a>

                    <form method="post" action="{routePath('knowledgebase-search')}" class="hidden md:flex items-center">
                        <div class="relative">
                            <button class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <i class="fas fa-search text-gray-400"></i>
                            </button>
                            <input class="pl-10 pr-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 min-w-[400px]" type="text" name="search" placeholder="{lang key="searchOurKnowledgebase"}...">
                        </div>
                    </form>

                    <ul class="flex items-center">
                        <li class="ml-3">
                            <a class="flex items-center text-gray-500 hover:text-gray-700" href="{$WEB_ROOT}/cart.php?a=view">
                                <i class="far fa-shopping-cart fa-fw"></i>
                                <span id="cartItemCount" class="ml-1 bg-blue-100 text-blue-800 text-xs font-medium mr-2 px-2.5 py-0.5 rounded-full">{{$cartitemcount}}</span>
                                <span class="sr-only">{lang key="carttitle"}</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
		<div class="bg-white">
			<div class="container mx-auto px-4 pb-2">
				<nav>
					<div class="flex justify-between">
						<ul id="nav" class="flex">
							{include file="$template/includes/navbar.tpl" navbar=$primaryNavbar}
						</ul>
						<ul class="flex">
							{include file="$template/includes/navbar.tpl" navbar=$secondaryNavbar rightDrop=true}
						</ul>
					</div>
				</nav>
			</div>
		</div>
    </header>

    {include file="$template/includes/network-issues-notifications.tpl"}

    <nav class="py-2">
        <div class="container mx-auto px-4">
            {include file="$template/includes/breadcrumb.tpl"}
        </div>
    </nav>

    {include file="$template/includes/validateuser.tpl"}
    {include file="$template/includes/verifyemail.tpl"}

    {if $templatefile == 'homepage'}
        {if $registerdomainenabled || $transferdomainenabled}
            {include file="$template/includes/domain-search.tpl"}
        {/if}
    {/if}

    <section id="main-body" class="py-8">
        <div class="{if !$skipMainBodyContainer}container mx-auto px-4{/if}">
            <div class="flex flex-wrap">

            {if !$inShoppingCart && ($primarySidebar->hasChildren() || $secondarySidebar->hasChildren())}
                <div class="w-full lg:w-1/3 xl:w-1/4 lg:px-3">
                    <div class="sidebar">
                        {include file="$template/includes/sidebar.tpl" sidebar=$primarySidebar}
                    </div>
                    {if !$inShoppingCart && $secondarySidebar->hasChildren()}
                        <div class="block sidebar">
                            {include file="$template/includes/sidebar.tpl" sidebar=$secondarySidebar}
                        </div>
                    {/if}
                </div>
            {/if}
            <div class="{if !$inShoppingCart && ($primarySidebar->hasChildren() || $secondarySidebar->hasChildren())}w-full lg:w-2/3 xl:w-3/4{else}w-full{/if} primary-content">