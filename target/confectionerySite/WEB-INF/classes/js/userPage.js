
function toggleEditMode(isEditMode) {
    document.getElementById("delivery-address-display").style.display = isEditMode ? "none" : "inline";
    document.getElementById("delivery-address-input").style.display = isEditMode ? "inline" : "none";

    document.getElementById("email-display").style.display = isEditMode ? "none" : "inline";
    document.getElementById("email-input").style.display = isEditMode ? "inline" : "none";

    document.getElementById("full-name-display").style.display = isEditMode ? "none" : "inline";
    document.getElementById("full-name-input").style.display = isEditMode ? "inline" : "none";

    document.getElementById("phone-display").style.display = isEditMode ? "none" : "inline";
    document.getElementById("phone-input").style.display = isEditMode ? "inline" : "none";

    document.getElementById("edit-btn").style.display = isEditMode ? "none" : "inline";
    document.getElementById("save-btn").style.display = isEditMode ? "inline" : "none";
    document.getElementById("cancel-btn").style.display = isEditMode ? "inline" : "none";
}

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




