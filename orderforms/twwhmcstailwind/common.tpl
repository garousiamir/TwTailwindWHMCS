{if ($language == 'arabic' || $language == 'hebrew' || $language == 'farsi')}
<link rel="stylesheet" type="text/css" href="{assetPath file='all.min.rtl.css'}?v={$versionHash}" />
{else}
<link rel="stylesheet" type="text/css" href="{assetPath file='all.min.css'}?v={$versionHash}" />
{/if}

{assetExists file="custom.css"}
<link rel="stylesheet" type="text/css" href="{$__assetPath__}?v={$versionHash}" />
{/assetExists}
<script type="text/javascript" src="{assetPath file='scripts.min.js'}?v={$versionHash}"></script>