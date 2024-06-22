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
        <th>ФИО Работника</th>
        <th>Телефон</th>
        <th>email</th>
        <th>Позиция работника</th>
        <th>Роли</th>
        <th>Управлениями ролями</th>
        <th>Активен аккаунт</th>
    </tr>
    <c:forEach var="employee" items="${employeeList}">
        <tr>
            <td class="id">${employee.id}</td>
            <td class="fullName">${employee.fullName}</td>
            <td class="phone">${employee.phone}</td>
            <td class="email">${employee.email}</td>
            <td class="position">${employee.position}</td>
            <td>
                <c:forEach var="role" items="${employee.roles}">
                    <div style="float: left;">
                        <c:out value="${role.name}"/>
                    </div>
                    <div style="float: right;">
                        <button>Удалить</button>
                    </div>
                    <br style="clear: both;">
                </c:forEach>
            </td>


            <td>${employee.enabled}</td>

            <td><button class="updateBtn">Обновить</button> </td>
            <td><button class="deleteBtn">Удалить</button> </td>

        </tr>
    </c:forEach>
</table>


<script type="text/javascript" src="${pageContext.request.contextPath}/js/leftSidebarAdm.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/EmployeeAdm.js"></script>
</body>
</html>