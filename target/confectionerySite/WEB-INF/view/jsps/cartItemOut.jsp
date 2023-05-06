<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>



<div class="container--item--confectionery">

    <div class="image--item" >
        <img src="${cartItem.product.imageURL}" height="255px" width="290px">
    </div>

    <div class="name--item">
        <h3>   ${cartItem.product.name}</h3>
    </div>

    <div class="description--item">

        <p>  ${fn:substring(cartItem.product.description,0 , 90)}</p>

    </div>

    <div class="price--item">
        <h3>  ${cartItem.product.price}</h3>
    </div>
    <div class="buttons--item">
        <form action="/product" method="get" class="about--product">
            <c:url var="urlAbout" value="/product">
                <c:param name="productId" value="${cartItem.product.id}"/>
            </c:url>
            <input type="button" value="Подробнее" class="catalog--button" onclick="window.location.href='${urlAbout}'"/>
        </form>

        <div class="button--add--to--basket">

            <button class="add-to-cart" data-product-id="${cartItem.product.id}" style="display: none">В корзину</button>
            <div class="cart-item-controls" data-product-id="${cartItem.product.id}">
                <button class="decrease-quantity">-</button>
                <span class="item-quantity">${cartItem.quantity}</span>
                <button class="increase-quantity">+</button>
            </div>
        </div>
    </div>
</div>
