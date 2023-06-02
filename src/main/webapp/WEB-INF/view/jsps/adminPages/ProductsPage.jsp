<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <script>
        var categoryList =[
        <c:forEach var="category" items="${categoryList}">
            {
                id: ${category.id},
                name: "${category.name}",
                description: "${category.description}",
            },
        </c:forEach>
        ]
    </script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/ProductsAdm.js">
    </script>
</head>
<body>

<h2>Пример табличных данных</h2>
<jsp:include page="/WEB-INF/view/jsps/includes/leftSideBarAdm.jsp"/>
<table>
    <tr>
        <th>id</th>
        <th>Название товара</th>
        <th>категория</th>
        <th>Описание</th>
        <th>Цена</th>
        <th>Скидка</th>
    </tr>
    <c:forEach var="product" items="${products}" >
    <tr>
        <td class="id">${product.id}</td>
        <td class="name">${product.name}</td>
        <td class="categoryName">${product.category.name}</td>
        <td class="description">${product.description}</td>
        <td class="price">${product.price}</td>
        <td class="stock">${product.isStock}</td>
        <td><button class="updateBtn">Обновить</button> </td>
        <td><button class="deleteBtn">Удалить</button> </td>
    </tr>
    </c:forEach>

</table>


<script type="text/javascript" src="${pageContext.request.contextPath}/js/leftSidebarAdm.js"></script>

</body>
</html>

