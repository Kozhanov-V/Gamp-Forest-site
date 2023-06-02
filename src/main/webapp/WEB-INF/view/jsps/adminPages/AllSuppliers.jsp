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
        <th>Номер телефона</th>
        <th>Email</th>
        <th>Адресс</th>

    </tr>
    <c:forEach var="supplier" items="${supplierList}" >
        <tr>
            <td>${supplier.name}</td>
            <td>${supplier.phone}</td>
            <td>${supplier.email}</td>
            <td>${supplier.address}</td>
            <td><button class="updateBtn">Обновить</button> </td>
            <td><button class="deleteBtn">Удалить</button> </td>
        </tr>
    </c:forEach>

</table>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/leftSidebarAdm.js"></script>
</body>
</html>