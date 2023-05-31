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
        <th>Имя поставщика</th>
        <th>Продукт</th>
        <th>Кол-во</th>
        <th>Дата</th>
        <th>Цена</th>
    </tr>
    <c:forEach var="purchase" items="${purchaseList}" >
        <tr>
            <td>${purchase.id}</td>
            <td>${purchase.supplier.name}</td>
            <td>${purchase.product.name}</td>
            <td>${purchase.quantity}</td>
            <td>${purchase.purchaseDate}</td>
            <td>${purchase.purchasePrice}</td>

        </tr>
    </c:forEach>

</table>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/leftSidebarAdm.js"></script>
</body>
</html>