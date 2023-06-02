document.addEventListener('DOMContentLoaded', function() {
    var updateBtns = document.querySelectorAll('.updateBtn');
    var deleteBtns = document.querySelectorAll('.deleteBtn');

    deleteBtns.forEach(function (btn){
        btn.addEventListener('click',function (e) {

            var tr = e.target.parentElement.parentElement;
            var id = tr.querySelector('.id').textContent;

            // отправьте запрос AJAX на сервер для удаления клиента из БД
            deleteOrder(id);
            tr.parentNode.removeChild(tr);

        })
    })

    updateBtns.forEach(updateButtonsMethod);
    function updateButtonsMethod(btn) {
        btn.addEventListener('click', function(e) {
            var tr = e.target.parentElement.parentElement;
            var id = tr.querySelector('.id').textContent;
            var clientName = tr.querySelector('.clientName').textContent;
            var products = tr.querySelector('.productList');
            var productQuantity = tr.querySelector('.productQuantity');
            var status = tr.querySelector('.status');
            var orderDate = tr.querySelector('.orderDate').textContent;
            var totalCost = tr.querySelector('.totalCost').textContent;

             var productList= products.textContent.replaceAll(/^ +/gm, '').split("\n");
            // замените текст на input
            let selectHTML="";
            for(let i =0;i<productList.length;i++){

                if(productList[i]!="") {
                    selectHTML += "<select>";
                    allProducts.forEach(function(product) {
                        selectHTML += `<option value='${product.id}'${product.name === productList[i] ? ' selected' : ''}>${product.name}</option>`;
                    });
                    selectHTML+="</select><br/>"
                }


            }

            products.innerHTML= selectHTML;



            var productQuantityList = productQuantity.textContent.replaceAll(/^ +/gm, '').split("\n");
            productQuantity.innerHTML=""
            for(let i=0; i<productQuantityList.length;i++){
                if(productQuantityList[i]!="")
                productQuantity.innerHTML += `<input type='text' value='${productQuantityList[i]}'/> <br/>`;
            }


            status.innerHTML = `<input type='text' value='${status.textContent}'/>`;

            // замените кнопку "update" на "submit"
            e.target.outerHTML = '<button class="submitBtn">Подтвердить</button>';

            var submitBtn = tr.querySelector('.submitBtn');
            submitBtn.addEventListener('click', function(e) {

                // отправьте запрос AJAX на сервер для обновления данных в БД
                updateOrder(id,fullname.querySelector('input').value,phone.querySelector('input').value,email.querySelector('input').value)

                fullname.textContent = fullname.querySelector('input').value;
                phone.textContent = phone.querySelector('input').value;
                email.textContent = email.querySelector('input').value;

                // замените кнопку "submit" на "update"

                e.target.outerHTML = '<button class="updateBtn">Обновить</button>';
                updateBtns = document.querySelectorAll('.updateBtn');
                updateBtns.forEach(updateButtonsMethod);
            });
        });
    }
    function deleteOrder(id){
        return new Promise((resolve, reject) => {
            $.ajax({
                url: '/admin/api/order/delete',
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

    function updateOrder(id, fullname, phone, email) {
        return new Promise((resolve, reject) => {
            $.ajax({
                url: '/admin/api/client/update',
                type: 'POST',
                data: {
                    id: id,
                    fullname: fullname,
                    phone: phone,
                    email: email
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
