<form action="#" id="frmGeneratePassword">
    <div class="modal fade" id="modalGeneratePassword">
        <div class="modal-dialog">
            <div class="bg-white rounded-lg shadow-lg overflow-hidden">
                <div class="bg-blue-600 text-white px-4 py-3 flex justify-between items-center">
                    <h4 class="text-lg font-medium">
                        {lang key='generatePassword.title'}
                    </h4>
                    <button type="button" class="text-white hover:text-gray-200" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="p-4">
                    <div class="hidden bg-red-100 text-red-700 p-3 rounded mb-4" id="generatePwLengthError">
                        {lang key='generatePassword.lengthValidationError'}
                    </div>
                    <div class="mb-4 flex items-center">
                        <label for="generatePwLength" class="w-1/3 text-gray-700">{lang key='generatePassword.pwLength'}</label>
                        <div class="w-2/3">
                            <input type="number" min="8" max="64" value="12" step="1" class="w-24 px-3 py-2 border border-gray-300 rounded" id="inputGeneratePasswordLength">
                        </div>
                    </div>
                    <div class="mb-4 flex items-center">
                        <label for="generatePwOutput" class="w-1/3 text-gray-700">{lang key='generatePassword.generatedPw'}</label>
                        <div class="w-2/3">
                            <input type="text" class="w-full px-3 py-2 border border-gray-300 rounded" id="inputGeneratePasswordOutput">
                        </div>
                    </div>
                    <div class="flex">
                        <div class="w-2/3 ml-auto">
                            <button type="submit" class="px-3 py-1 bg-gray-200 hover:bg-gray-300 rounded text-sm mr-2">
                                <i class="fas fa-plus fa-fw"></i>
                                {lang key='generatePassword.generateNew'}
                            </button>
                            <button type="button" class="px-3 py-1 bg-gray-200 hover:bg-gray-300 rounded text-sm copy-to-clipboard" data-clipboard-target="#inputGeneratePasswordOutput">
                                <img src="{$WEB_ROOT}/assets/img/clippy.svg" alt="Copy to clipboard" class="w-4 inline-block">
                                {lang key='copy'}
                            </button>
                        </div>
                    </div>
                </div>
                <div class="bg-gray-100 px-4 py-3 flex justify-end">
                    <button type="button" class="px-4 py-2 bg-gray-200 hover:bg-gray-300 rounded mr-2" data-dismiss="modal">
                        {lang key='close'}
                    </button>
                    <button type="button" class="px-4 py-2 bg-blue-600 hover:bg-blue-700 text-white rounded" id="btnGeneratePasswordInsert" data-clipboard-target="#inputGeneratePasswordOutput">
                        {lang key='generatePassword.copyAndInsert'}
                    </button>
                </div>
            </div>
        </div>
    </div>
</form>
