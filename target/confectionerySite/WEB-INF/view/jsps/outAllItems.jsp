<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>
<div class="container--item--confectionery" id="product-container">

    <div class="image--item" >
        <img src="${product.imageURL}" height="255px" width="290px">
    </div>

    <div class="name--item">
        <h3>  ${product.name}</h3>
    </div>

    <div class="description--item">

        <p>  ${fn:substring(product.description, 0,90)}...</p>

    </div>

    <div class="buttons--item">

        <form action="/product" method="get" class="about--product">
            <c:url var="urlAbout" value="/product">
                <c:param name="productId" value="${product.id}"/>
            </c:url>
            <input type="button" value="Подробнее" class="catalog--button" onclick="window.location.href='${urlAbout}'"/>
        </form>
        <form action="/addToBasket" class="button--add--to--basket">

            <button>
                <span> <h3> В корзину</h3></span>
            </button>

        </form>
    </div>
    <div class="price--item">
        <h3>  ${fn:substring(product.price,0 ,fn:indexOf(product.price, '.'))}₽</h3>
    </div>
</div>
