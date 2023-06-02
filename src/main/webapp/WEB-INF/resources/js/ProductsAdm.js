document.addEventListener('DOMContentLoaded', function() {
    var updateBtns = document.querySelectorAll('.updateBtn');
    var deleteBtns = document.querySelectorAll('.deleteBtn');

    updateBtns.forEach(updateButtonsMethod);
    function updateButtonsMethod(btn) {
        btn.addEventListener('click', function(e) {
            var tr = e.target.parentElement.parentElement;
            var id = tr.querySelector('.id').textContent;
            var name = tr.querySelector('.name');
            var categoryName = tr.querySelector('.categoryName');
            var description = tr.querySelector('.description');
            var price = tr.querySelector('.price');
            var stock = tr.querySelector('.stock');

            // замените текст на input
            name.innerHTML = `<input type='text' value='${name.textContent}'/>`;

            console.log(categoryList)

            // замените текст на select с категориями
            var selectHTML = "<select>";
            categoryList.forEach(function(category) {
                selectHTML += `<option value='${category.id}'${category.name === categoryName.textContent ? ' selected' : ''}>${category.name}</option>`;
            });
            selectHTML += "</select>";
            categoryName.innerHTML = selectHTML;

            description.innerHTML = `<input type='textarea' value='${description.textContent}'/>`;
            price.innerHTML = `<input type='text' value='${price.textContent}'/>`;
            stock.innerHTML = `<input type='text' value='${stock.textContent}'/>`;


            // замените кнопку "update" на "submit"
            e.target.outerHTML = '<button class="submitBtn">Подтвердить</button>';

            var submitBtn = tr.querySelector('.submitBtn');
            submitBtn.addEventListener('click', function(e) {
                // отправьте запрос AJAX на сервер для обновления данных в БД
                updateProduct(id,
                    name.querySelector('input').value,
                    categoryName.querySelector('select').value,
                    description.querySelector('input').value,
                    price.querySelector('input').value,
                    stock.querySelector('input').value,
                )



                // обновите текст в строке таблицы
                name.textContent = name.querySelector('input').value;
                categoryName.textContent = categoryName.querySelector('select').options[categoryName.querySelector('select').selectedIndex].text;
                description.textContent = description.querySelector('input').value;
                price.textContent = price.querySelector('input').value;
                stock.textContent = stock.querySelector('input').value;

                // замените кнопку "submit" на "update"
                e.target.outerHTML = '<button class="updateBtn">Обновить</button>';
                updateBtns = document.querySelectorAll('.updateBtn');
                updateBtns.forEach(updateButtonsMethod);

            });
        });
    }
    deleteBtns.forEach(function(btn) {
        btn.addEventListener('click', function(e) {
            var tr = e.target.parentElement.parentElement;
            var id = tr.querySelector('.id').textContent;

           deleteProduct(id)
            tr.parentNode.removeChild(tr);
        });
    });

    function deleteProduct(id) {
        // отправьте запрос AJAX на сервер для удаления продукта из БД
        $.ajax({
            url: '/admin/api/product/delete',
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
    }

    function updateProduct(id,name,categoryId,description,price,stock) {
        console.log(id+name+categoryId+description+price+stock)
        return new Promise((resolve, reject) => {
            $.ajax({
                url: '/admin/api/product/update',
                type: 'POST',
                data: {
                    id: id,
                    name: name,
                    categoryId: categoryId,
                    description: description,
                    price: price,
                    stock: stock,
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
