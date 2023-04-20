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

                <div class="container--item--confectionery">

                    <div class="image--item" >
                        <img src="${pageContext.request.contextPath}/img/ovsCookie.png" height="255px" width="290px">
                    </div>

                    <div class="name--item">
                        <h3>   Овсяные печенья</h3>
                    </div>

                    <div class="description--item">

                        <p>  Крутые классные бомбезные офигенные прикольные вкусные и ...</p>

                    </div>

                    <div class="buttons--item">

                        <form action="/product" method="get" class="about--product">
                            <button class="catalog--button">
                                Подробнее
                            </button>
                        </form>
                        <form action="/addToBasket" class="button--add--to--basket">

                            <button>
                                <span> <h3> В корзину</h3></span>
                            </button>

                        </form>
                    </div>
                    <div class="price--item">
                        <h3>  250₽</h3>
                    </div>
                </div>

                <div class="container--item--confectionery">

                    <div class="image--item" >
                        <img src="${pageContext.request.contextPath}/img/ovsCookie.png" height="255px" width="290px">
                    </div>

                    <div class="name--item">
                        <h3>   Овсяные печенья</h3>
                    </div>

                    <div class="description--item">

                        <p>  Крутые классные бомбезные офигенные прикольные вкусные и ...</p>

                    </div>

                    <div class="buttons--item">

                        <form action="/product" method="get" class="about--product">
                            <button class="catalog--button">
                                Подробнее
                            </button>
                        </form>
                        <form action="/addToBasket" class="button--add--to--basket">

                            <button>
                                <span> <h3> В корзину</h3></span>
                            </button>

                        </form>
                    </div>
                    <div class="price--item">
                        <h3>  250₽</h3>
                    </div>
                </div>

                <div class="container--item--confectionery">

                    <div class="image--item" >
                        <img src="${pageContext.request.contextPath}/img/ovsCookie.png" height="255px" width="290px">
                    </div>

                    <div class="name--item">
                        <h3>   Овсяные печенья</h3>
                    </div>

                    <div class="description--item">

                        <p>  Крутые классные бомбезные офигенные прикольные вкусные и ...</p>

                    </div>

                    <div class="buttons--item">

                        <form action="/product" method="get" class="about--product">
                            <button class="catalog--button">
                                Подробнее
                            </button>
                        </form>
                        <form action="/addToBasket" class="button--add--to--basket">

                            <button>
                                <span> <h3> В корзину</h3></span>
                            </button>

                        </form>
                    </div>
                    <div class="price--item">
                        <h3>  250₽</h3>
                    </div>
                </div>


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

        <div class="second--block" style="
    position: relative;
    top: 117px;">

            <h1>Акции&nbspи&nbspскидки</h1>

            <div class="now--popular--second--block">

                <div class="container--item--confectionery">

                    <div class="image--item" >
                        <img src="${pageContext.request.contextPath}/img/ovsCookie.png" height="255px" width="290px">
                    </div>

                    <div class="name--item">
                        <h3>   Овсяные печенья</h3>
                    </div>

                    <div class="description--item">

                        <p>  Крутые классные бомбезные офигенные прикольные вкусные и ...</p>

                    </div>

                    <div class="buttons--item">

                        <form action="/product" method="get" class="about--product">
                            <button class="catalog--button">
                                Подробнее
                            </button>
                        </form>
                        <form action="/addToBasket" class="button--add--to--basket">

                            <button>
                                <span> <h3> В корзину</h3></span>
                            </button>

                        </form>
                    </div>
                    <div class="price--item">
                        <h3>  250₽</h3>
                    </div>
                </div>

                <div class="container--item--confectionery">

                    <div class="image--item" >
                        <img src="${pageContext.request.contextPath}/img/ovsCookie.png" height="255px" width="290px">
                    </div>

                    <div class="name--item">
                        <h3>   Овсяные печенья</h3>
                    </div>

                    <div class="description--item">

                        <p>  Крутые классные бомбезные офигенные прикольные вкусные и ...</p>

                    </div>

                    <div class="buttons--item">

                        <form action="/product" method="get" class="about--product">
                            <button class="catalog--button">
                                Подробнее
                            </button>
                        </form>
                        <form action="/addToBasket" class="button--add--to--basket">

                            <button>
                                <span> <h3> В корзину</h3></span>
                            </button>

                        </form>
                    </div>
                    <div class="price--item">
                        <h3>  250₽</h3>
                    </div>
                </div>

                <div class="container--item--confectionery">

                    <div class="image--item" >
                        <img src="${pageContext.request.contextPath}/img/ovsCookie.png" height="255px" width="290px">
                    </div>

                    <div class="name--item">
                        <h3>   Овсяные печенья</h3>
                    </div>

                    <div class="description--item">

                        <p>  Крутые классные бомбезные офигенные прикольные вкусные и ...</p>

                    </div>

                    <div class="buttons--item">

                        <form action="/product" method="get" class="about--product">
                            <button class="catalog--button">
                                Подробнее
                            </button>
                        </form>
                        <form action="/addToBasket" class="button--add--to--basket">

                            <button>
                                <span> <h3> В корзину</h3></span>
                            </button>

                        </form>
                    </div>
                    <div class="price--item">
                        <h3>  250₽</h3>
                    </div>
                </div>


            </div>


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





    <jsp:include page="/WEB-INF/view/jsps/footer.jsp"/>
</div>
</body>
</html>
