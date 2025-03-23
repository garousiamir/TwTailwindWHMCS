<!-- Styling -->
{if ($language == 'arabic' || $language == 'hebrew' || $language == 'farsi')}
<link href="{assetPath file='all.min.rtl.css'}?v={$versionHash}" rel="stylesheet">
<link href="{assetPath file='theme.min.rtl.css'}?v={$versionHash}" rel="stylesheet">
{else}
<link href="{assetPath file='all.min.css'}?v={$versionHash}" rel="stylesheet">
<link href="{assetPath file='theme.min.css'}?v={$versionHash}" rel="stylesheet">
{/if}
<link href="{$WEB_ROOT}/assets/css/fontawesome-all.min.css" rel="stylesheet">
{assetExists file="custom.css"}
<link href="{$__assetPath__}" rel="stylesheet">
{/assetExists}
<script src="https://unpkg.com/@tailwindcss/browser@4"></script>
{if ($language == 'arabic' || $language == 'hebrew' || $language == 'farsi')}
{else}
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:ital,wght@0,200..800;1,200..800&display=swap" rel="stylesheet">
	<style>
	body,h1, h2, h3, h4, h5, h6,input, textarea,a,ul,li,button,form,p,label {
	  font-family: "Plus Jakarta Sans" !important;
	}
	html,body{
	overflow-x:hidden;
	}
	</style>
{/if}
<script>
    var csrfToken = '{$token}',
        markdownGuide = '{lang|addslashes key="markdown.title"}',
        locale = '{if !empty($mdeLocale)}{$mdeLocale}{else}en{/if}',
        saved = '{lang|addslashes key="markdown.saved"}',
        saving = '{lang|addslashes key="markdown.saving"}',
        whmcsBaseUrl = "{\WHMCS\Utility\Environment\WebHelper::getBaseUrl()}";
    {if $captcha}{$captcha->getPageJs()}{/if}
</script>
<script src="{assetPath file='scripts.min.js'}?v={$versionHash}"></script>
<script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>
{if $templatefile == "viewticket" && !$loggedin}
  <meta name="robots" content="noindex" />
{/if}
