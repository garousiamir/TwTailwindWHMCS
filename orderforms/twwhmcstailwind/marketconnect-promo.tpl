<div class="mc-promo {$promotion->getClass()}" id="promo_{$product->productKey}">
    <div class="header">
        <div class="cta">
            <div class="price">
                {if $product->isFree()}
                    {lang key="orderfree"}
                {elseif $product->pricing()->first()}
                    {$product->pricing()->setQuantity($cartItem.qty)->first()->breakdownPrice()}
                {/if}
            </div>
            <button type="button" class="btn btn-sm btn-add" data-product-key="{$product->productKey}" data-upsell-from="{$cartItem.productKey}">
                <span class="text">
                    {lang key="addtocart"}
                </span>
                <span class="arrow">
                    <i class="fas fa-chevron-right"></i>
                </span>
            </button>
        </div>
        <div class="expander">
            <i class="fas fa-chevron-right rotate" data-toggle="tooltip" data-placement="right" title="Click to learn more"></i>
        </div>
        <div class="icon">
            <img src="{$promotion->getImagePath()}">
        </div>
        <div class="content">
            <div class="headline truncate">{$promotion->getHeadline()}</div>
            <div class="tagline truncate">{$promotion->getTagline()}</div>
        </div>
    </div>
    <div class="body clearfix">
        {if $promotion->hasFeatures()}
            <ul>
                {assign "promotionFeatures" $promotion->getFeatures()}
                {foreach $promotionFeatures as $key=>$feature}
                    <li class="{if $key < ($promotionFeatures|@count / 2)}left{else}right{/if}">
                        <i class="fas fa-check"></i> {$feature}
                    </li>
                {/foreach}
            </ul>
        {/if}
    </div>
</div>
