<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: vkozh
  Date: 27.04.2023
  Time: 22:43
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


            <h2>Добро пожаловать! Войдите, чтобы пользоваться сайтом.</h2>
            <form action="${pageContext.request.contextPath}/user/authenticateTheClient"  method="post">
                <label for="username">Ваш номер телефона или email</label><br/>
              <input type="text" name="username" placeholder="Username" id="username"/><br/>
                <label for="password">Ваш пароль</label><br/>
              <input type="password" name="password" placeholder="Password" id="password"/><br/>
                <c:if test="${param.error != null}">
                    <div class="alert alert-danger" role="alert">
                        Неправильный логин или пароль
                    </div>
                </c:if>
              <input type="submit" value="Войти" />
            </form>

    </div>
</div>
</body>
</html>
