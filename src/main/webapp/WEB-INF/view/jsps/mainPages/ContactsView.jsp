<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Главная</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/contacts.css">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/header.js"></script>

</head>
<body>
<div class="body">
    <sec:authorize access="isAuthenticated()">
        <jsp:include page="/WEB-INF/view/jsps/includes/headerUser.jsp"/>
    </sec:authorize>
    <sec:authorize access="isAnonymous()">
        <jsp:include page="/WEB-INF/view/jsps/includes/header.jsp"/>
    </sec:authorize>
        <div class="main--block">
            <div class="contacts--block">
                <h1>Контакты: </h1>
                <h2>Мы в Вконтакте: <span>vk.com/club32424234</span></h2>
                <h2>Мы в Телеграм:<span> t.me/dsfa324 </span></h2>
                <h2>Наш номер телефона:<span> +7 (999) 999-99-99</span> </h2>
                <h2>Адрес кондитерской: <span>Россия, Самарская обл., ул. Птушкина, Дом 213</span></h2>
                <h2></h2>
            </div>
            <div class="how--us--find">
                <h1>Как найти нас: </h1>
                <iframe src="https://yandex.ru/map-widget/v1/?um=constructor%3A4e3512a1a2f55bb581113260bae659ab583ba05468294ee961752c8015660c4f&amp;source=constructor" width="800" height="550" frameborder="0" style="border: 2px solid black"></iframe>

            </div>
        </div>



    <jsp:include page="/WEB-INF/view/jsps/includes/footer.jsp"/>
</div>
</body>
</html>