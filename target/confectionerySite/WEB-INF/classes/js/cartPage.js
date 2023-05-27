$(document).ready(function() {
    var cartIsEmpty = ' <div class="empty-cart-message"> '+
                       '<h2 style="font-weight: normal">Корзина пуста</h2>' +
        '<p>У вас еще нет товаров в корзине. Посетите наш каталог, чтобы добавить что-то в корзину.</p>' +
        '<a href="/catalog" class="btn btn-primary">Перейти в каталог</a>' +
        '</div>'
    var totalPrice = parseFloat($('#totalPrice').text()); // Получаем текущую общую стоимость
    var numberAllCartItem = parseFloat($('#numberAllCartItem').text()); // Получаем текущую общую стоимость

    if ($('.cart--item').length == 0) {
        $('.cart--items').append(cartIsEmpty);
        $('.go--to--order').remove();
    }


    $(document).on('click', '.minus--item', function() {

        var price = parseFloat($(this).closest('.cart--item').find('.product-price').text()); // Получаем цену товара
        var quantity = parseInt($(this).closest('.cart--item').find('.number--item--in--cart h3').text()); // Получаем количество товара

        const productId = $(this).parent().data('product-id');
        if (quantity > 1) { // Если количество товара больше 1
            // Уменьшаем количество на 1
            quantity -= 1;
            totalPrice -= price; // Уменьшаем общую стоимость на цену товара

            $(this).closest('.cart--item').find('.number--item--in--cart h3').text(quantity); // Обновляем количество товара

            $('#totalPrice').text(totalPrice.toFixed(2)); // Обновляем общую стоимость


            // Здесь отправьте запрос к серверу для обновления количества товара в корзине пользователя
            updateCart(productId,-1);
        }
        else{

            totalPrice -= price;

            $(this).closest('.cart--item').remove();
            $('#totalPrice').text(totalPrice.toFixed(2));
            numberAllCartItem=numberAllCartItem-1;
            $('#numberAllCartItem').text(numberAllCartItem.toFixed(0)); // Обновляем общую стоимость
            $('#cartItem' + productId).remove();

            if ($('.cart--item').length == 0) {
                $('.cart--items').append(cartIsEmpty);
                $('.go--to--order').remove();
            }


            updateCart(productId, -quantity);


        }

    });

    $(document).on('click', '.plus--item', function() {
        const productId = $(this).parent().data('product-id');
        var price = parseFloat($(this).closest('.cart--item').find('.product-price').text()); // Получаем цену товара
        var quantity = parseInt($(this).closest('.cart--item').find('.number--item--in--cart h3').text()); // Получаем количество товара

        quantity += 1; // Увеличиваем количество на 1
        totalPrice += price; // Увеличиваем общую стоимость на цену товара

        $(this).closest('.cart--item').find('.number--item--in--cart h3').text(quantity); // Обновляем количество товара
        $('#totalPrice').text(totalPrice.toFixed(2)); // Обновляем общую стоимость

        updateCart(productId,1);
        // Здесь отправьте запрос к серверу для обновления количества товара в корзине пользователя
    });

    $(document).on('click', '.delete--cart--item', function() {
        var price = parseFloat($(this).closest('.cart--item').find('.product-price').text());
        var quantity = parseInt($(this).closest('.cart--item').find('.number--item--in--cart h3').text());
        const productId = $(this).data('product-id');
        totalPrice -= price * quantity;
        numberAllCartItem=numberAllCartItem-1;
        $(this).closest('.cart--item').remove();
        $('#totalPrice').text(totalPrice.toFixed(2));
        $('#numberAllCartItem').text(numberAllCartItem.toFixed(0)); // Обновляем общую стоимость
        $('#cartItem' + productId).remove();

        if ($('.cart--item').length == 0) {
            $('.cart--items').append(cartIsEmpty);
            $('.go--to--order').remove();
        }


        updateCart(productId, -quantity);
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
