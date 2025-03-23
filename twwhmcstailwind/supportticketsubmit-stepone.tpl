<div class="bg-white shadow-sm rounded-lg">
    <div class="p-6">

        <div class="mb-6">
            <h3 class="text-xl font-semibold">{lang key="createNewSupportRequest"}</h3>
            <p class="text-gray-500 mb-0">{lang key='supportticketsheader'}</p>
        </div>

        <div class="flex flex-col items-center">
            <div class="w-full sm:w-10/12">
                {foreach $departments as $num => $department}
                    <p class="text-lg font-semibold">
                        <a href="{$smarty.server.PHP_SELF}?step=2&amp;deptid={$department.id}" class="text-blue-600 hover:text-blue-800">
                            <i class="fas fa-envelope"></i>
                            &nbsp;{$department.name}
                        </a>
                    </p>
                    {if $department.description}
                        <p class="text-gray-500">{$department.description}</p>
                    {/if}
                {foreachelse}
                    {include file="$template/includes/alert.tpl" type="info" msg="{lang key='nosupportdepartments'}" textcenter=true}
                {/foreach}
            </div>
        </div>

    </div>
</div>