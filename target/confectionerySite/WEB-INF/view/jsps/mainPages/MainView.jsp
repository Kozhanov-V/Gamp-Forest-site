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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/confectioneryItem.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
                    <form action="/catalog" method="get">
                        <button class="catalog--button">

                            <span>Каталог</span>

                            <div class="arrow--in--button">
                                <img src="${pageContext.request.contextPath}/img/arrowInButton.png">
                            </div>

                        </button>
                    </form>


                </div>


            </div>

            <div class="main--image--first--block">

                <img src="${pageContext.request.contextPath}/img/MainImageFirstBlock.png"/>

            </div>



        </div>

        <!-- ---------------------------- -->

        <div class="second--block">

            <h1>Сейчас&nbspпопулярно</h1>

            <div class="now--popular--second--block">

                <sec:authorize access="isAuthenticated()">
                    <c:forEach var="productItem" items="${lastSells}">
                        <c:set var="check" value="true"/>


                        <c:forEach var="cartItem" items="${sessionScope.cartItems}">
                            <c:if test="${cartItem.product.id==productItem.id}">

                                <c:set var="cartItem" value = "${cartItem}" scope="request"/>
                                <jsp:include page="../includes/cartItemOut.jsp" />
                                <c:set var="check" value="false"/>
                            </c:if>

                        </c:forEach>
                        <c:if test="${check}">
                            <c:set var="productItem" value="${productItem}" scope="request" />
                            <jsp:include page="../includes/confectioneryItem.jsp" />
                        </c:if>


                    </c:forEach>
                </sec:authorize>



                <sec:authorize access="isAnonymous()">
                    <c:forEach var="productItem" items="${lastSells}">
                        <c:set var="productItem" value="${productItem}" scope="request" />
                        <jsp:include page="../includes/confectioneryItem.jsp" />
                    </c:forEach>
                </sec:authorize>

            </div>


        </div>

        <!-- ---------------------------- -->

        <div class="three--block" style="position: relative;
left: 120px;
top: 140px; width:1350px; height:500px">

            <h1>Накрываем праздничные столы на Gender Party и детские праздники</h1>
            <p>
                Рождение ребёнка - важнейшее событие в жизни любого человека. Мы предлагаем
                узнать пол нового члена семьи необычным способом. В кульминации мероприятия вам
                подадут торт с розовой или голубой начинкой в зависимости от того, будет у вас
                мальчик или же девочка. Вам останется только разрезать угощение и все карты станут
                раскрыты! Подробности уточняйте по телефону
            </p>

        </div>

        <!-- ---------------------------- -->

        <div class="four--block">

            <div class="container--four--block">

                <div class="form--call--four--block">

                    <h1>Заказать звонок</h1>
                    <p class="after--call--calling">Заполните форму, мы перезвоним вам в ближайшее время
                        и ответим на все вопросы!</p>
                    <div class="name--forms">
                        <span>Ваше&nbspимя</span><span>Ваш&nbspтелефон</span><span>Ваша&nbspпочта</span>
                    </div>
                    <form>
                        <input placeholder="Иван Иванов" type="text">

                        <input placeholder="+7 (999) 999-99-99" type="tel">

                        <input placeholder="Email" type="email">
                        <input  type="submit" value="Отправить">

                    </form>
                        <p class="after--form--calling">Нажимая на кнопку, вы даете согласие на обработку персональных данных и соглашаетесь c политикой
                            конфиденциальности</p>


                </div>



            </div>


        </div>
        <!-- ---------------------------- -->
        <div class="five--block">
            <div class="container--five--block">

                <h1>Оплачивайте покупки онлайн</h1>
                <h2>Дбавьте все интерисующие тавары в корзину и оплатите без каких-либо проблем</h2>

                <form action="/catalog" method="get">
                    <button>Перейти в каталог</button>
                </form>




            </div>




        </div>



        <!-- ---------------------------- -->

    </div>





    <jsp:include page="/WEB-INF/view/jsps/includes/footer.jsp"/>
</div>
</body>
</html>
