<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Главная</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/aboutProduct.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/confectioneryItem.css">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/header.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/addToCart.js"></script>

</head>
<body>
<div class="body">
    <sec:authorize access="isAuthenticated()">
        <jsp:include page="/WEB-INF/view/jsps/headerUser.jsp"/>
    </sec:authorize>
    <sec:authorize access="isAnonymous()">
        <jsp:include page="/WEB-INF/view/jsps/header.jsp"/>
    </sec:authorize>
    <div class="main--block">
        <div>
            <div class="button--go--back">
                <a href="/catalog">
                    <img src="${pageContext.request.contextPath}/img/buttonGoBack.png"/>
                </a>
            </div>
            <div class="main--image">
                <img src="${product.imageURL}"width="800" height="670"/>
            </div>
        </div>
        <div class="main--block--info">

            <h2>${product.name}</h2>

            <p>${product.description}</p>

            <h2>${product.price}</h2>

            <button>В корзину</button>

        </div>


    </div>

    <div class="see--also--block">

        <h1>Смотрите также</h1>
        <div class="container--for--products">



            <sec:authorize access="isAuthenticated()">
                <c:forEach var="productItem" items="${lastSells}">
                    <c:set var="check" value="true"/>


                    <c:forEach var="cartItem" items="${sessionScope.cartItems}">
                        <c:if test="${cartItem.product.id==productItem.id}">

                            <c:set var="cartItem" value = "${cartItem}" scope="request"/>
                            <jsp:include page="cartItemOut.jsp" />
                            <c:set var="check" value="false"/>
                        </c:if>

                    </c:forEach>
                    <c:if test="${check}">
                        <c:set var="productItem" value="${productItem}" scope="request" />
                        <jsp:include page="confectioneryItem.jsp" />
                    </c:if>


                </c:forEach>
            </sec:authorize>
            <sec:authorize access="isAnonymous()">
                <c:forEach var="productItem" items="${lastSells}">
                    <c:set var="productItem" value="${productItem}" scope="request" />
                    <jsp:include page="confectioneryItem.jsp" />
                </c:forEach>
            </sec:authorize>







        </div>


    </div>




    <jsp:include page="/WEB-INF/view/jsps/footer.jsp"/>
</div>
</body>
</html>