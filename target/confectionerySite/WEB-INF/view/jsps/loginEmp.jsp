<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: vkozh
  Date: 27.04.2023
  Time: 22:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body>

    <div class="body">
        <div class="button--go--back">
            <a href=""> <img src="${pageContext.request.contextPath}/img/buttonGoBack.png"></a>
        </div>
        <div class="login--form">
            <h2>Добро пожаловать! Войдите, чтобы пользоваться админ панелью .</h2>
    <!-- loginEmp.jsp -->
        <form action="${pageContext.request.contextPath}/admin/authenticateTheEmployee" method="post">
            <input type="text" name="username" placeholder="Username" />
            <input type="password" name="password" placeholder="Password" />
            <input type="submit" value="Log in" />
        </form>
        <c:if test="${param.error != null}">
            <div class="alert alert-danger" role="alert">
                Invalid username or password.
            </div>
        </c:if>
    </div>
</div>
</body>
</html>
