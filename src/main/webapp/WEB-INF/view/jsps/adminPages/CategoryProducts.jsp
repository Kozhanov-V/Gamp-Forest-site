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
        <th>Название категории</th>
        <th>Описание</th>
    </tr>
    <c:forEach var="category" items="${categories}" >
        <tr>
            <td>${category.id}</td>
            <td>${category.name}</td>
            <td>${category.description}</td>

        </tr>
    </c:forEach>

</table>

</body>
</html>