$(function() {
    const LIMIT = 10;

    $('#expedition_description').on('keyup', function(e) {
        if (!$(this).siblings('.invalid-feedback').length)
            $(this).after('<div class="invalid-feedback"></div>');
        if ($(this).val().trim().length > LIMIT) {
            $(this).siblings('.invalid-feedback').html(`Превышено кол-во символов на ${$(this).val().trim().length - LIMIT }`).show();
        } else {
            $(this).siblings('.invalid-feedback').hide();
        }
    });
});