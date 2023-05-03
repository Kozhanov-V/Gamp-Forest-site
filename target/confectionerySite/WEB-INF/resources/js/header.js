$(document).ready(function() {
    $('.username-dropdown').on('click', function() {
        $('.dropdown-content').toggleClass('show');
    });

    // Закрытие выпадающего списка при клике вне его
    $(document).on('click', function(event) {
        if (!$(event.target).closest('.dropdown').length) {
            $('.dropdown-content').removeClass('show');
        }
    });
});