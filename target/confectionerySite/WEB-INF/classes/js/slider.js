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
});

document.getElementById('filter-form').addEventListener('submit', applyFilters);

function applyFilters(event) {
    event.preventDefault(); // Остановить отправку формы

    // Получить значения из полей формы
    const price = document.getElementById('amount').value;
    const chizkeik = document.getElementById('chizkeik').checked;
    const naborChizkeik = document.getElementById('naborChizkeik').checked;

    // Создать объект FormData для отправки данных формы
    const formData = new FormData();
    formData.append('price', price);
    formData.append('chizkeik', chizkeik);
    formData.append('naborChizkeik', naborChizkeik);

    // Отправить AJAX-запрос на сервер
    fetch('/filterProducts', {
        method: 'POST',
        body: formData
    })
        .then(response => response.text())
        .then(data => {
            // Заменить HTML-контент с продуктами новым содержимым
            document.getElementById('product-container').innerHTML = data;
        })
        .catch(error => {
            console.error('Error:', error);
        });
}

function setCurrentPrice() {
    const currentPrice = document.getElementById("amount").getAttribute("data-price");
    if (currentPrice) {
        const minPrice = parseFloat(currentPrice.split(" - ")[0]);
        const maxPrice = parseFloat(currentPrice.split(" - ")[1]);
        $("#slider-range").slider("values", 0, minPrice);
        $("#slider-range").slider("values", 1, maxPrice);
        $("#amount").val(minPrice + " ₽ - " + maxPrice + " ₽");
    }
}

$(function() {
    console.log("set price " + currentPrice)
    setCurrentPrice();
});






