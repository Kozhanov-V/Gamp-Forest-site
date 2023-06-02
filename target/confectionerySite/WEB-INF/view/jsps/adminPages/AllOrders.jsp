<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: vkozh
  Date: 20.05.2023
  Time: 18:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Таблица данных</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid black;
            padding: 15px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/leftSidebarAdm.css">
</head>
<body>

<h2>Пример табличных данных</h2>
<jsp:include page="/WEB-INF/view/jsps/includes/leftSideBarAdm.jsp"/>
<table>
    <tr>
        <th>id</th>
        <th>ФИО Заказчика</th>
        <th>Список продуктов</th>
        <th>Кол-во</th>
        <th>Статус заказа</th>
        <th>Дата заказа</th>
        <th>Итоговая цена</th>
        <th>
            <input type='text'/><br/>
            <input type='text'/>
        </th>
    </tr>
    <c:forEach var="order" items="${allOrders}">
        <tr>
            <td class="id">${order.id}</td>
            <td class="clientName">${order.clientName}</td>
            <td class="productList">
                <c:forEach var="product" items="${order.products}">
                    <c:out value="${product.key}"/><br/>
                </c:forEach>
            </td>
            <td class="productQuantity">
                <c:forEach var="product" items="${order.products}">
                    <c:out value="${product.value}"/><br/>
                </c:forEach>
            </td>
            <td class="status">${order.status}</td>
            <td class="orderDate">${order.orderDate}</td>

            <td class="totalCost">${order.totalCost}</td>
            <td><button class="updateBtn">Обновить</button> </td>
            <td><button class="deleteBtn">Удалить</button> </td>
        </tr>
    </c:forEach>
</table>

<script>
    var allProducts =[

            <c:forEach var="product" items="${allProducts}">

        {
            id: ${product.id},
            name: "${product.name}",
        },
            </c:forEach>

    ]
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/leftSidebarAdm.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/OrdersAdm.js"></script>
</body>

</html>