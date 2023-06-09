<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<header>
    <div class="header">

        <div class="image--menu--header">
            <img src="${pageContext.request.contextPath}/img/Navigation%20Icon.png">
        </div>

        <div class="left--menu--header">

            <h3><a href="/"> <span class="main--header">Главная</span></a></h3>

            <h3><a href="/catalog">Каталог</a></h3>

            <h3><a href="/contacts">Контакты</a></h3>

        </div>

        <div class="header--logo">
            <img src="${pageContext.request.contextPath}/img/Logo.png"/>
        </div>

        <div class="right--menu--header">

            <div class="stock--help--header">

                <h3>Скидки</h3>

                <h3>Помощь</h3>

            </div>

            <div class="dropdown">
                <a href="#" class="username-dropdown"><sec:authentication property="principal.username" /></a>
                <div class="dropdown-content">
                    <a href="/user/userPage">Личный профиль</a>
                    <a href="/user/cart">Корзина</a>
                    <a href="/user/logout">Выйти</a>
                </div>
            </div>



        </div>
    </div>
</header>