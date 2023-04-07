<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Главная</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
</head>
<body>
<div class="body">
    <jsp:include page="/WEB-INF/view/jsps/header.jsp"/>
    <div class="main">
        <div class="layer--blur--first--block">
            <img src="${pageContext.request.contextPath}/img/LayerBlurMainImage.png">
        </div>
        <div class="first--block">

            <div class="main--text--first--block">
                <div class="name--company--first--block">

                    <h2>Gamp</h2>
                    <img src="${pageContext.request.contextPath}/img/logoOnFirstBlockMainText.png">
                    <br>
                    <h1>Forest</h1>

                </div>

                <div class="img--splitter--text--first--block">

                    <img src="${pageContext.request.contextPath}/img/splitterImgFirstBlock.png"/>

                </div>

                <div class="main--text--first--block">

                    <p>
                        Добро пожаловать в нашу кондитерскую, где настоящее искусство в мире кондитерства оживает у нас в каждом десерте.
                        Здесь вы можете заказать торты на любой вкус и для любого торжества, а также купить конфеты и другие сладости в
                        нашей кафе-кондитерской. Наша миссия - удивлять и радовать каждого гостя нашей кондитерской..
                    </p>

                </div>

                <div class="catalog--button--first--block">

                    <button class="catalog--button">

                        <span>Каталог</span>

                        <div class="arrow--in--button">
                            <img src="${pageContext.request.contextPath}/img/arrowInButton.png">
                        </div>
                    </button>

                </div>


            </div>

            <div class="main--image--first--block">

                <img src="${pageContext.request.contextPath}/img/MainImageFirstBlock.png"/>

            </div>



        </div>

        <div class="second--block">

            <h1>Сейчас популярно</h1>

            <div class="now--popular--second--block">

                <div class="container--item--confectionery">

                    <div class="image--item">
                        <img src="">
                    </div>

                    <div class="name--item">
                        Овсяные печенья
                    </div>

                    <div class="description--item">

                        Крутые классные бомбезные офигенные прикольные вкусные и ...

                    </div>

                    <div class=""

                </div>


            </div>


        </div>



    </div>



  <!--  <jsp:include page="/WEB-INF/view/jsps/footer.jsp"/>-->
</div>
</body>
</html>
