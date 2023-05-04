<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- ДОБАВИТЬ ОБРАБОТКУ УНИКАЛЬНЫХ ПОЛЕЙ -->
<!-- ДОБАВИТЬ ОБРАБОТКУ УНИКАЛЬНЫХ ПОЛЕЙ -->
<!-- ДОБАВИТЬ ОБРАБОТКУ УНИКАЛЬНЫХ ПОЛЕЙ -->
<!-- ДОБАВИТЬ ОБРАБОТКУ УНИКАЛЬНЫХ ПОЛЕЙ -->


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userPage.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/confectioneryItem.css">

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/userPage.js"></script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/header.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/addToCart.js"></script>

</head>
<body>
<jsp:include page="/WEB-INF/view/jsps/headerUser.jsp"/>
<div class="main--block">

    <div class="main--block--info">
        <h1>Личный кабинет</h1>

        <div id="user-data">
            <form method="post" action="/user/updateUser">

                <!-- ДОБАВИТЬ ОБРАБОТКУ УНИКАЛЬНЫХ ПОЛЕЙ -->
                <!-- ДОБАВИТЬ ОБРАБОТКУ УНИКАЛЬНЫХ ПОЛЕЙ -->
                <!-- ДОБАВИТЬ ОБРАБОТКУ УНИКАЛЬНЫХ ПОЛЕЙ -->
                <!-- ДОБАВИТЬ ОБРАБОТКУ УНИКАЛЬНЫХ ПОЛЕЙ -->
                <input name="id" type="hidden" value="${client.id}">
                <div class="field--elem--user">
                    <h3>Полное ФИО:</h3>
                    <span id="full-name-display">${fn:substring(client.fullName,0 , 25) }</span>
                    <input name="fullName" type="text" id="full-name-input" value="${client.fullName}" style="display: none;">
                </div>
                <div class="field--elem--user">
                    <h3>Email:</h3>
                    <span id="email-display">${client.email}</span>
                    <input name="email" type="email" id="email-input" value="${ fn:substring(client.email,0 , 25)}" style="display: none;">
                </div>
                <div class="field--elem--user">
                    <h3>Номер телефона:</h3>
                    <span id="phone-display">${client.phone}</span>
                    <input name="phone" type="tel" id="phone-input" value="${fn:substring(client.phone,0 , 25)}" style="display: none;">
                </div>
                <div class="field--elem--user">
                    <h3>Адресс доставки</h3>
                    <span id="delivery-address-display">${client.deliveryAddress}</span>
                    <input name="deliveryAddress" type="text" id="delivery-address-input" value="${fn:substring(client.deliveryAddress,0 , 25)}" style="display: none;">
                </div>



                <input name="password" type="hidden" value="${client.password}">

                <input type="submit" id="save-btn" style="display: none; margin-left: 50px" value="Save"></input>
            </form>
            <div style="display: flex; margin-left: 50px">
                <button id="edit-btn" onclick="toggleEditMode(true)" >Edit</button>
                <button id="cancel-btn" onclick="toggleEditMode(false)" style="display: none;">Cancel</button>
            </div>
        </div>



    </div>


</div>

<div class="see--also--block">

    <h1>Ваша история заказов</h1>
    <div class="container--container--for--products">


        <div class="container--for--products">
            <c:forEach var="productItem" items="${lastSells}">
                <c:set var="productItem" value="${productItem}" scope="request" />
                <jsp:include page="confectioneryItem.jsp" />
            </c:forEach>

        </div>
    </div>

</div>




<jsp:include page="/WEB-INF/view/jsps/footer.jsp"/>


</body>
</html>
