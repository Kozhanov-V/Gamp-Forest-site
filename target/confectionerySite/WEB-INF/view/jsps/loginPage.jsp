<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: vkozh
  Date: 26.04.2023
  Time: 12:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/loginEmp" method="post">
    <input id="nameLogin" name="nameLogin" type="text">
    <label for="nameLogin">Логин</label>

    <input id="passwordLogin" name="passwordLogin" type="text">
    <label for="passwordLogin">Пароль</label>
    <input type="submit" value="Войти">
</form>
<c:if test="${not empty errorMessage}">
    <div class="error-message">
        <p>${errorMessage}</p>
    </div>
</c:if>
</body>
</html>
