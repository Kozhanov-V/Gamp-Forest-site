$(document).ready(function() {
    $('.add-to-cart').on('click', function() {
        const productId = $(this).data('product-id');
        const button = $(this); // Сохраняем ссылку на элемент

        // отправка запроса на сервер для добавления товара в корзину
        $.ajax({
            url: '/user/cart/add',
            type: 'POST',
            data: {
                productId: productId
            },
            success: function() {
                console.log("fsdfsdfs");
                // После успешного добавления товара:
                button.hide(); // Используем сохраненную ссылку
                $(`.cart-item-controls[data-product-id="${productId}"]`).show().find('.item-quantity').text(1);
            },
            error: function() {
                console.log("ne fsdfsdfs");
                // Обработка ошибки добавления товара в корзину
                window.location.href = '/user/login';
            }
        });
    });




    $('.increase-quantity').on('click', function() {
        const productId = $(this).parent().data('product-id');
        // Здесь вы можете отправить запрос на сервер для увеличения количества товара в корзине
        // После успешного увеличения количества товара:
        const currentQuantity = parseInt($(this).siblings('.item-quantity').text());
        $(this).siblings('.item-quantity').text(currentQuantity + 1);
    });

    $('.decrease-quantity').on('click', function() {
        const productId = $(this).parent().data('product-id');
        // Здесь вы можете отправить запрос на сервер для уменьшения количества товара в корзине
        // После успешного уменьшения количества товара:
        const currentQuantity = parseInt($(this).siblings('.item-quantity').text());
        const newQuantity = currentQuantity - 1;
        $(this).siblings('.item-quantity').text(newQuantity);

        if (newQuantity === 0) {
            $(this).parent().hide();
            $(`.add-to-cart[data-product-id="${productId}"]`).show();
        }
    });
});