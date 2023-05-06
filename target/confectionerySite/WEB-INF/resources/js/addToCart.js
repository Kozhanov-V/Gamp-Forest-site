$(document).ready(function() {
    $('.add-to-cart').on('click', function() {
        const productId = $(this).data('product-id');
        // Здесь вы можете отправить запрос на сервер для добавления товара в корзину
        console.log("ahahahah")
        updateCart(productId,1)
        console.log("2ahahahah2")
        // После успешного добавления товара:
        $(this).hide();
        $(`.cart-item-controls[data-product-id="${productId}"]`).show().find('.item-quantity').text(1);
    });


    $('.increase-quantity').on('click', function() {

        // Здесь вы можете отправить запрос на сервер для увеличения количества товара в корзине
        const productId = $(this).parent().data('product-id');
        const clientId = $(this).data('client-id');

        updateCart(productId, 1);
        // После успешного увеличения количества товара:
        const currentQuantity = parseInt($(this).siblings('.item-quantity').text());
        $(this).siblings('.item-quantity').text(currentQuantity + 1);
    });

    $('.decrease-quantity').on('click', function() {

        // Здесь вы можете отправить запрос на сервер для уменьшения количества товара в корзине
        const productId = $(this).parent().data('product-id');
        const clientId = $(this).data('client-id');
        updateCart(productId, -1);

        // После успешного уменьшения количества товара:
        const currentQuantity = parseInt($(this).siblings('.item-quantity').text());
        const newQuantity = currentQuantity - 1;
        $(this).siblings('.item-quantity').text(newQuantity);

        if (newQuantity === 0) {
            $(this).parent().hide();
            $(`.add-to-cart[data-product-id="${productId}"]`).show();
        }
    });



    function updateCart(productId, quantity) {

        console.log("1.3ahahahah1.3")
        $.ajax({
            url: '/user/cart/save',
            type: 'POST',
            data: {
                productId: productId,
                quantity: quantity
            },
            success: function() {
                console.log("ашибка жок")
            },
            error: function() {
                console.log("ошибка")
            }
        });
        console.log("1.6ahahahah1.6")
    }

});