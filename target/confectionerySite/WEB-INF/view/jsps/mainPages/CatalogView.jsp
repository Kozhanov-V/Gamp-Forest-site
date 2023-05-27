<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/confectioneryItem.css">

    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/slider.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/catalog.css">

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/header.js"></script>

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/addToCart.js"></script>

</head>
<body>
    <div class="body">

        <sec:authorize access="isAuthenticated()">
            <jsp:include page="/WEB-INF/view/jsps/includes/headerUser.jsp"/>
        </sec:authorize>
        <sec:authorize access="isAnonymous()">
            <jsp:include page="/WEB-INF/view/jsps/includes/header.jsp"/>
        </sec:authorize>

        <input type="hidden" id="price" data-price="${price}">
        <div class="filter--elements">
            <form id="filter-form"  action="/catalog" method="POST">
                <p>
                    <span><label for="amount">Цена: </label></span>
                    <input type="text" id="amount" name="price" readonly style="border:0;color: black;background: none;font-size: 24px;margin-top: 15px;margin-left: 15px;">
                </p>
                <div id="slider-range" style="height: 10px;width: 230px;margin-top: 20px;"></div>
                <div class="catalog--elements">
                    <span>  Тип</span>
                    <c:forEach var="entry" items="${categories}">
                        <div class="element--catalog--elements">
                            <input id="${fn:escapeXml(entry.key)}" name="${fn:escapeXml(entry.key)}" type="checkbox"
                                ${entry.value.equals("on") ? 'checked' : ''}>
                            <label for="${fn:escapeXml(entry.key)}">${fn:escapeXml(entry.key)}</label>
                        </div>
                    </c:forEach>
                </div>
                <input type="submit" value="Применить">
            </form>

        </div>


        <div class="main--block">
            <div class="container--main--block">
                <div class="tag--name--container">


                    <h1>Закажи наши десерты в Самаре</h1>
                    <h2>Доставка в назначенное время и место</h2>
                </div>
                <c:if test="${empty products}">
                    <h1 style="margin-bottom: 200px">В данный момент нет продуктов подходящих под ваши параметры</h1>
                </c:if>
                <c:if test="${not empty products}">

                    <!-- Код для случая, когда список не пуст -->

                <% int i=2;%>
                <c:forEach var="product" items="${products}">
                    <% i++;%>
                <% if(i%3==0){%>
                <div class="container--for--products">
                <%}%>


                    <sec:authorize access="isAnonymous()">
                        <c:set var="productItem" value="${product}" scope="request" />
                        <jsp:include page="../includes/confectioneryItem.jsp" />
                   </sec:authorize>


                    <sec:authorize access="isAuthenticated()">


                        <c:set var="check" value="true"/>


                        <c:forEach var="cartItem" items="${sessionScope.cartItems}">
                            <c:if test="${cartItem.product.id==product.id}">

                                <c:set var="cartItem" value = "${cartItem}" scope="request"/>
                                <jsp:include page="../includes/cartItemOut.jsp" />
                                <c:set var="check" value="false"/>
                            </c:if>

                        </c:forEach>
                        <c:if test="${check}">
                            <c:set var="productItem" value="${product}" scope="request" />
                            <jsp:include page="../includes/confectioneryItem.jsp" />
                        </c:if>



                    </sec:authorize>



                    <% if((i+1)%3==0){%>
                </div>
                    <%}%>
                </c:forEach>
                <% if(i%3!=0 || i==3){%>
                </div>
                 <%}%>

            </c:if>
            </div>


        </div>




        <jsp:include page="/WEB-INF/view/jsps/includes/footer.jsp"/>
    </div>
</body>
</html>