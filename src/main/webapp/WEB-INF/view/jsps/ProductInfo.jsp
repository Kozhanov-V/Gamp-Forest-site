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
            <c:forEach var="productItem" items="${lastSells}">
            <div class="container--item--confectionery">

                <div class="image--item" >
                    <img src="${productItem.imageURL}" height="255px" width="290px">
                </div>

                <div class="name--item">
                    <h3>   ${productItem.name}</h3>
                </div>

                <div class="description--item">

                    <p>  ${fn:substring(productItem.description,0 , 90)}</p>

                </div>

                <div class="price--item">
                    <h3>  ${productItem.price}</h3>
                </div>
                <div class="buttons--item">
                    <form action="/product" method="get" class="about--product">
                        <c:url var="urlAbout" value="/product">
                            <c:param name="productId" value="${productItem.id}"/>
                        </c:url>
                        <input type="button" value="Подробнее" class="catalog--button" onclick="window.location.href='${urlAbout}'"/>
                    </form>

                    <div class="button--add--to--basket">

                        <button class="add-to-cart" data-product-id="${productItem.id}"">В корзину</button>
                        <div class="cart-item-controls" data-product-id="${productItem.id}" style="display: none;">
                            <button class="decrease-quantity">-</button>
                            <span class="item-quantity">0</span>
                            <button class="increase-quantity">+</button>
                        </div>

                    </div>
                </div>
            </div>
            </c:forEach>

        </div>


    </div>




    <jsp:include page="/WEB-INF/view/jsps/footer.jsp"/>
</div>
</body>
</html>