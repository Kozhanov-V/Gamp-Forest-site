document.addEventListener('DOMContentLoaded', function() {

    var updateBtns = document.querySelectorAll('.updateBtn');
    var deleteBtns = document.querySelectorAll('.deleteBtn');

    deleteBtns.forEach(function (btn){
        btn.addEventListener('click',function (e) {

            var tr = e.target.parentElement.parentElement;
            var id = tr.querySelector('.id').textContent;

            // отправьте запрос AJAX на сервер для удаления работника из БД
            deleteEmployee(id);
            tr.parentNode.removeChild(tr);

        })
    })

    function deleteEmployee(id) {
        return new Promise((resolve, reject) => {
            $.ajax({
                url: '/admin/api/employee/delete',
                type: 'POST',
                data: {
                    id: id
                },
                success: function () {
                    resolve(true);
                },
                error: function (jqXHR) {
                    if (jqXHR.status === 403) {
                        window.location.href = "/admin/login";
                    }
                    resolve(false);
                }
            });
        });
    }

    function updateEmployee() {
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
                success: function () {
                    resolve(true);
                },
                error: function (jqXHR) {
                    if (jqXHR.status === 403) {
                        window.location.href = "/admin/login";
                    }
                    resolve(false);
                }
            });
        });
    }
});