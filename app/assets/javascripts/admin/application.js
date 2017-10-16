//= require jquery.js
//= require jquery_ujs

$(function() {
    $('#file_uploader_name').on('change', function() {
        var fileName = $(this).val().split('\\').pop();
        if (fileName) {
            $('#new_file_uploader').submit();
        }
    });
});