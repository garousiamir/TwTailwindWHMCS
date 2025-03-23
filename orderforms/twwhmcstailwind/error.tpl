{include file="orderforms/twwhmcstailwind/common.tpl"}

<div id="order-standard_cart">

    <div class="row">
        <div class="cart-sidebar">
            {include file="orderforms/twwhmcstailwind/sidebar-categories.tpl"}
        </div>
        <div class="cart-body">
            <div class="header-lined">
                <h1 class="font-size-36">
                    {$LANG.thereisaproblem}
                </h1>
            </div>
            {include file="orderforms/twwhmcstailwind/sidebar-categories-collapsed.tpl"}

            <div class="alert alert-danger error-heading">
                <i class="fas fa-exclamation-triangle"></i>
                {$errortitle}
            </div>

            <div class="row">
                <div class="col-sm-8 col-sm-offset-2 offset-sm-2">

                    <p class="margin-bottom">{$errormsg}</p>

                    <div class="text-center">
                        <a href="javascript:history.go(-1)" class="btn btn-default">
                            <i class="fas fa-arrow-left"></i>&nbsp;
                            {$LANG.problemgoback}
                        </a>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
