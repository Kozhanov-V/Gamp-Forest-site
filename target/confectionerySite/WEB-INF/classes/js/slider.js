'use strict'
$(function () {
    $("#slider-range").slider({
        range: true,
        min: 0,
        max: 3000,
        values: [0, 3000],
        slide: function (event, ui) {
            $("#amount").val("₽" + ui.values[0] + " - ₽" + ui.values[1]);
        },
    });
    $("#amount").val(
        "₽" +
        $("#slider-range").slider("values", 0) +
        " - ₽" +
        $("#slider-range").slider("values", 1)
    );
    setCurrentPrice();
});


function setCurrentPrice(){
    const priceElement = document.getElementById('price');
    const price = priceElement.getAttribute('data-price');
    if (price) {
        const minPrice = parseFloat(price.split("-")[0]);
        const maxPrice = parseFloat(price.split("-")[1]);
        $("#slider-range").slider("values", 0, minPrice);
        $("#slider-range").slider("values", 1, maxPrice);
        $("#amount").val(minPrice + " ₽ - " + maxPrice + " ₽");
    }
};









