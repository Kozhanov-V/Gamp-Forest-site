document.addEventListener('DOMContentLoaded', function() {
    var updateBtns = document.querySelectorAll('.updateBtn');
    var deleteBtns = document.querySelectorAll('.deleteBtn');

    deleteBtns.forEach(function (btn){
        btn.addEventListener('click',function (e) {

            var tr = e.target.parentElement.parentElement;
            var id = tr.querySelector('.id').textContent;

            // отправьте запрос AJAX на сервер для удаления клиента из БД
            deleteClient(id);
            tr.parentNode.removeChild(tr);

        })
    })

    updateBtns.forEach(updateButtonsMethod);
    function updateButtonsMethod(btn) {
        btn.addEventListener('click', function(e) {
            var tr = e.target.parentElement.parentElement;
            var id = tr.querySelector('.id').textContent;
            var fullname = tr.querySelector('.fullname');
            var phone = tr.querySelector('.phone');
            var email = tr.querySelector('.email');
            console.log(id + " "+fullname.textContent+ " "+phone.textContent+ " "+email.textContent)
            // замените текст на input
            fullname.innerHTML = `<input type='text' value='${fullname.textContent}'/>`;
            phone.innerHTML = `<input type='text' value='${phone.textContent}'/>`;
            email.innerHTML = `<input type='text' value='${email.textContent}'/>`;

            // замените кнопку "update" на "submit"
            e.target.outerHTML = '<button class="submitBtn">Подтвердить</button>';

            var submitBtn = tr.querySelector('.submitBtn');
            submitBtn.addEventListener('click', function(e) {

                // отправьте запрос AJAX на сервер для обновления данных в БД
                updateClient(id,fullname.querySelector('input').value,phone.querySelector('input').value,email.querySelector('input').value)

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
    function deleteClient(id){
        return new Promise((resolve, reject) => {
            $.ajax({
                url: '/admin/api/client/delete',
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

    function updateClient(id, fullname, phone, email) {
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
