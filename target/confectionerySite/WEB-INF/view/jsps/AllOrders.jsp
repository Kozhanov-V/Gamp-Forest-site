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
</head>
<body>

<h2>Пример табличных данных</h2>

<table>
    <tr>
        <th>id</th>
        <th>ФИО Заказчика</th>
        <th>Список продуктов</th>
        <th>Кол-во</th>
        <th>Статус заказа</th>
        <th>Итоговая цена</th>
    </tr>
    <c:forEach var="order" items="${allOrders}">
        <tr>
            <td>${order.id}</td>
            <td>${order.clientName}</td>
            <td>
                <c:forEach var="product" items="${order.products}">
                    <c:out value="${product.key}"/><br/>
                </c:forEach>
            </td>
            <td>
                <c:forEach var="product" items="${order.products}">
                    <c:out value="${product.value}"/><br/>
                </c:forEach>
            </td>
            <td>${order.status}</td>
            <td>${order.totalCost}</td>
        </tr>
    </c:forEach>
</table>



</body>
</html>