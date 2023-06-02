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

<table>
    <tr>
        <th>id</th>
        <th>Название категории</th>
        <th>Описание</th>
    </tr>
    <c:forEach var="category" items="${categories}" >
        <tr>
            <td class="id">${category.id}</td>
            <td class="name">${category.name}</td>
            <td class="description">${category.description}</td>
            <td><button class="updateBtn">Обновить</button> </td>
            <td><button class="deleteBtn">Удалить</button> </td>
        </tr>
    </c:forEach>

</table>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/leftSidebarAdm.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/CategoryAdm.js"></script>
</body>
</html>