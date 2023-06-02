document.addEventListener('DOMContentLoaded', function() {
    var updateBtns = document.querySelectorAll('.updateBtn');
    var deleteBtns = document.querySelectorAll('.deleteBtn');

    deleteBtns.forEach(function (btn){
        btn.addEventListener('click',function (e) {

            var tr = e.target.parentElement.parentElement;
            var id = tr.querySelector('.id').textContent;

            // отправьте запрос AJAX на сервер для удаления клиента из БД
            deleteCategory(id);
            tr.parentNode.removeChild(tr);

        })
    })

    updateBtns.forEach(updateButtonsMethod);

    function updateButtonsMethod(btn) {
        btn.addEventListener('click', function(e) {
            var tr = e.target.parentElement.parentElement;
            var id = tr.querySelector('.id').textContent;
            var productName = tr.querySelector('.name');
            var description = tr.querySelector('.description');

            // замените текст на input
            productName.innerHTML = `<input type='text' value='${productName.textContent}'/>`;
            description.innerHTML = `<input type='text' value='${description.textContent}'/>`;

            // замените кнопку "update" на "submit"
            e.target.outerHTML = '<button class="submitBtn">Подтвердить</button>';

            var submitBtn = tr.querySelector('.submitBtn');
            submitBtn.addEventListener('click', function(e) {

                // отправьте запрос AJAX на сервер для обновления данных в БД
                updateCategory(id,productName.querySelector('input').value,description.querySelector('input').value)

                productName.textContent = productName.querySelector('input').value;
                description.textContent = description.querySelector('input').value;

                // замените кнопку "submit" на "update"
                e.target.outerHTML = '<button class="updateBtn">Обновить</button>';
                updateBtns = document.querySelectorAll('.updateBtn');
                updateBtns.forEach(updateButtonsMethod);
            });
        });
    }
    function deleteCategory(id){
        return new Promise((resolve, reject) => {
            $.ajax({
                url: '/admin/api/category/delete',
                type: 'POST',
                data: {
                    id: id
                },
                success: function() {
                    resolve(true);
                },
                error: function(jqXHR) {
                    if (jqXHR.status === 403) {
                        window.location.href = "/admin/login";
                    }
                    resolve(false);
                }
            });
        });
    }

    function updateCategory(id, productName, description) {
        return new Promise((resolve, reject) => {
            $.ajax({
                url: '/admin/api/category/update',
                type: 'POST',
                data: {
                    id: id,
                    productName: productName,
                    description: description,
                },
                success: function() {
                    resolve(true);
                },
                error: function(jqXHR) {
                    if (jqXHR.status === 403) {
                        window.location.href = "/admin/login";
                    }
                    resolve(false);
                }
            });
        });
    }


});