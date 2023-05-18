<%@ page import="com.kozhanov.confectionerySite.entity.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: vkozh
  Date: 14.05.2023
  Time: 19:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/confectioneryItem.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/cart.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/header.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/cartPage.js"></script>

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/addToCart.js"></script>
</head>
<body>
<div class="body">


    <jsp:include page="/WEB-INF/view/jsps/headerUser.jsp"/>
    <div style="display: flex;margin-bottom: 200px;position: relative;left: -120px">
        <div class="cart--block">
            <h1>Корзина</h1>
            <div class="cart--items">

                <c:forEach var="cartItem" items="${cartItems}">

                <div class="cart--item">
                    <div class="img--cart--item">
                        <img src="${cartItem.product.imageURL}" width="350" height="300"/> <!-- тута ссылка на имг -->
                    </div>

                    <div class="main--information">

                        <h2>
                           ${cartItem.product.name} <!-- тута название товара -->
                        </h2>

                        <h3 class="product-price">${cartItem.product.price}</h3> <!-- тута прайс -->

                        <div class="buttons--cart--item" data-product-id="${cartItem.product.id}">
                            <button class="button--none minus--item" >
                                <img src="${pageContext.request.contextPath}/img/minus.png"/> <!-- тута ссылка на имг минуса -->
                            </button>

                            <div class="number--item--in--cart">
                              <h3>  ${cartItem.quantity} </h3> <!-- тута кол-во товаров -->
                            </div>

                            <button class="button--none plus--item">
                                <img src="${pageContext.request.contextPath}/img/plus.png"/> <!-- тута ссылка на имг plus -->
                            </button>
                        </div>

                        <button class="delete--cart--item button--none" data-product-id="${cartItem.product.id}">
                            <div style="
        margin: 0;
        position: absolute;               /* 2 */
        top: 50%;                         /* 3 */
        transform: translate(0, -50%);
        display: flex;
    ">
                                <img src="${pageContext.request.contextPath}/img/delete.png"/> <!-- тута ссылка на имг делете-->
                                <p>Удалить</p>
                            </div>

                        </button>

                    </div>

                </div>
                </c:forEach>
            </div>


        </div>
        <div class="go--to--order">
            <button id="go--to--order">
                Перейти к оформлению
            </button>
           <p style="
    position: relative;
    top: 184px;
    left: 55px;
    font-size: 32px;
    letter-spacing: 2px;
"> Всего:<span id="numberAllCartItem"> ${fn:length(cartItems)}</span> товара
               <c:set var="totalPrice" value="0"/>
            <c:forEach var="cartItem" items="${cartItems}">
                <c:set var="totalPrice" value="${totalPrice + (cartItem.product.price * cartItem.quantity)}"/>
                <span id="cartItem${cartItem.product.id}"> <br> - ${cartItem.product.name}</span>

            </c:forEach>
           </p>

            <h3 style="
    position: relative;
    top: 190px;
    left: 63px;
    letter-spacing: 2px;
"> Итого <span id="totalPrice"> ${totalPrice} </span> ₽</h3>
        </div>
    </div>

    <jsp:include page="/WEB-INF/view/jsps/footer.jsp"/>
</div>
</body>
</html>
