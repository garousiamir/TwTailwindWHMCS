<div class="bg-white shadow-sm rounded-lg">
    <div class="p-6">

        <h3 class="text-xl font-semibold mb-4">{lang key="createNewSupportRequest"}</h3>

        <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded text-center">
            <strong>
                {lang key='supportticketsticketcreated'}
                <a id="ticket-number" href="viewticket.php?tid={$tid}&amp;c={$c}" class="text-green-700 hover:text-green-800 underline">
                    #{$tid}
                </a>
            </strong>
        </div>

        <div class="flex justify-center mt-6">
            <div class="w-full sm:w-10/12">
                <p class="text-gray-700">{lang key='supportticketsticketcreateddesc'}</p>
            </div>
        </div>

        <br />

        <p class="text-center mt-6">
            <a href="viewticket.php?tid={$tid}&amp;c={$c}" class="bg-gray-200 text-gray-700 px-4 py-2 rounded hover:bg-gray-300 transition-colors">
                {lang key='continue'}
                <i class="fas fa-arrow-circle-right ml-2"></i>
            </a>
        </p>

    </div>
</div>