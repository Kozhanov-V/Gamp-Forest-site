$(document).ready(function() {

    var totalPrice = parseFloat($('#totalPrice').text()); // Получаем текущую общую стоимость

    $('.minus--item').click(function() {

        var price = parseFloat($(this).closest('.cart--item').find('.product-price').text()); // Получаем цену товара
        var quantity = parseInt($(this).closest('.cart--item').find('.number--item--in--cart h3').text()); // Получаем количество товара
        const productId = $(this).parent().data('product-id');
        console.log(productId);
        if (quantity > 1) { // Если количество товара больше 1
            quantity -= 1; // Уменьшаем количество на 1
            totalPrice -= price; // Уменьшаем общую стоимость на цену товара

            $(this).closest('.cart--item').find('.number--item--in--cart h3').text(quantity); // Обновляем количество товара

            $('#totalPrice').text(totalPrice.toFixed(2)); // Обновляем общую стоимость

            // Здесь отправьте запрос к серверу для обновления количества товара в корзине пользователя
            updateCart(productId,-1);
        }
    });

    $('.plus--item').click(function() {
        const productId = $(this).parent().data('product-id');
        console.log(productId);
        var price = parseFloat($(this).closest('.cart--item').find('.product-price').text()); // Получаем цену товара
        var quantity = parseInt($(this).closest('.cart--item').find('.number--item--in--cart h3').text()); // Получаем количество товара

        quantity += 1; // Увеличиваем количество на 1
        totalPrice += price; // Увеличиваем общую стоимость на цену товара

        $(this).closest('.cart--item').find('.number--item--in--cart h3').text(quantity); // Обновляем количество товара
        $('#totalPrice').text(totalPrice.toFixed(2)); // Обновляем общую стоимость

        updateCart(productId,1);
        // Здесь отправьте запрос к серверу для обновления количества товара в корзине пользователя
    });

    $('.delete--cart--item').click(function() {
        var price = parseFloat($(this).closest('.cart--item').find('.product-price').text()); // Получаем цену товара
        var quantity = parseInt($(this).closest('.cart--item').find('.number--item--in--cart h3').text()); // Получаем количество товара
        const productId = $(this).data('product-id');
        totalPrice -= price * quantity; // Уменьшаем общую стоимость на стоимость этого товара

        $(this).closest('.cart--item').remove(); // Удаляем товар из корзины
        $('#totalPrice').text(totalPrice.toFixed(2)); // Обновляем общую стоимость

        updateCart(productId,-quantity);
    });



    function updateCart(productId, quantity) {
        return new Promise((resolve, reject) => {
            $.ajax({
                url: '/api/cart/save',
                type: 'POST',
                data: {
                    productId: productId,
                    quantity: quantity
                },
                success: function() {
                    resolve(true);
                },
                error: function(jqXHR) {
                    if (jqXHR.status === 403) {
                        window.location.href = "/user/login";
                    }
                    resolve(false);
                }
            });
        });
    }


});
