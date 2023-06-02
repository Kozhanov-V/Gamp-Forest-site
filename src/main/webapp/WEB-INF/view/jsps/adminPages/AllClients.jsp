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
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>
<body>

<h2>Пример табличных данных</h2>
<jsp:include page="/WEB-INF/view/jsps/includes/leftSideBarAdm.jsp"/>
<table id="dataTable">
    <tr>
        <th>id</th>
        <th>ФИО Заказчика</th>
        <th>Телефон</th>
        <th>email</th>
        <th></th>
        <th></th>
    </tr>
    <c:forEach var="client" items="${clientList}">
        <tr>
            <td class="id">${client.id}</td>
            <td class="fullname">${client.fullName}</td>
            <td class="phone">${client.phone}</td>
            <td class="email">${client.email}</td>
            <td><button class="updateBtn">Обновить</button> </td>
            <td><button class="deleteBtn">Удалить</button> </td>
        </tr>
    </c:forEach>
</table>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/leftSidebarAdm.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ClientsAdm.js"></script>
</body>
</html>

</html>