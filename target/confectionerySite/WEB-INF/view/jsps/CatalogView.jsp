<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Главная</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">

    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/slider.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/catalog.css">
</head>
<body>
    <div class="body">
        <jsp:include page="/WEB-INF/view/jsps/header.jsp"/>

        <div class="filter--elements">
                <form>


                    <p>
                       <span><label for="amount">Цена: </label></span>
                        <input type="text" id="amount" readonly style="border:0;color: black;background: none;font-size: 24px;margin-top: 15px;margin-left: 15px;">

                    </p>

                    <div id="slider-range" style="height: 10px;width: 230px;margin-top: 20px;"></div>


                    <form>
                        <div class="catalog--elements">
                            <span>  Тип</span>
                            <div class="element--catalog--elements">
                                <input id="chizkeik" type="checkbox">
                                <label for="chizkeik">Чизкейк</label>
                            </div>

                            <div class="element--catalog--elements">
                                <input id="naborChizkeik" type="checkbox">
                                <label for="naborChizkeik">Набор чизкейков</label>
                            </div>
                        </div>
                    </form>
                </form>
        </div>

        <div class="main--block">
            <div class="container--main--block">
                <div class="tag--name--container">


                    <h1>Закажи наши десерты в Самаре</h1>
                    <h2>Доставка в назначенное время и место</h2>
                </div>
                <div class="container--for--products">

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

                            <div class="price--item">
                                <h3>  250₽</h3>
                            </div>

                            <div class="button--add--to--basket">

                                <button>
                                    <span> <h3> В корзину</h3></span>
                                </button>

                            </div>

                        </div>

                        <div class="container--item--confectionery">

                            <div class="image--item">
                                <img src="${pageContext.request.contextPath}/img/ovsCookie.png" height="255px" width="290px">
                            </div>

                            <div class="name--item">
                                <h3>  Овсяные печенья</h3>
                            </div>

                            <div class="description--item">

                                <p>  Крутые классные бомбезные офигенные прикольные вкусные и ...</p>

                            </div>

                            <div class="price--item">
                                <h3>  250₽</h3>
                            </div>

                            <div class="button--add--to--basket">

                                <button>
                                    <span> <h3> В корзину</h3></span>
                                </button>

                            </div>

                        </div>

                        <div class="container--item--confectionery">

                            <div class="image--item">
                                <img src="${pageContext.request.contextPath}/img/ovsCookie.png" height="255px" width="290px">
                            </div>

                            <div class="name--item">
                                <h3>    Овсяные печенья</h3>
                            </div>

                            <div class="description--item">

                                <p> Крутые классные бомбезные офигенные прикольные вкусные и ...</p>

                            </div>

                            <div class="price--item">
                                <h3>  250₽</h3>
                            </div>

                            <div class="button--add--to--basket">

                                <button>
                                    <span> <h3> В корзину</h3></span>
                                </button>

                            </div>

                        </div>




                </div>
                <div class="container--for--products">

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

                        <div class="price--item">
                            <h3>  250₽</h3>
                        </div>

                        <div class="button--add--to--basket">

                            <button>
                                <span> <h3> В корзину</h3></span>
                            </button>

                        </div>

                    </div>

                    <div class="container--item--confectionery">

                        <div class="image--item">
                            <img src="${pageContext.request.contextPath}/img/ovsCookie.png" height="255px" width="290px">
                        </div>

                        <div class="name--item">
                            <h3>  Овсяные печенья</h3>
                        </div>

                        <div class="description--item">

                            <p>  Крутые классные бомбезные офигенные прикольные вкусные и ...</p>

                        </div>

                        <div class="price--item">
                            <h3>  250₽</h3>
                        </div>

                        <div class="button--add--to--basket">

                            <button>
                                <span> <h3> В корзину</h3></span>
                            </button>

                        </div>

                    </div>

                    <div class="container--item--confectionery">

                        <div class="image--item">
                            <img src="${pageContext.request.contextPath}/img/ovsCookie.png" height="255px" width="290px">
                        </div>

                        <div class="name--item">
                            <h3>    Овсяные печенья</h3>
                        </div>

                        <div class="description--item">

                            <p> Крутые классные бомбезные офигенные прикольные вкусные и ...</p>

                        </div>

                        <div class="price--item">
                            <h3>  250₽</h3>
                        </div>

                        <div class="button--add--to--basket">

                            <button>
                                <span> <h3> В корзину</h3></span>
                            </button>

                        </div>

                    </div>




                </div>

                <div class="container--for--products">

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

                        <div class="price--item">
                            <h3>  250₽</h3>
                        </div>

                        <div class="button--add--to--basket">

                            <button>
                                <span> <h3> В корзину</h3></span>
                            </button>

                        </div>

                    </div>

                    <div class="container--item--confectionery">

                        <div class="image--item">
                            <img src="${pageContext.request.contextPath}/img/ovsCookie.png" height="255px" width="290px">
                        </div>

                        <div class="name--item">
                            <h3>  Овсяные печенья</h3>
                        </div>

                        <div class="description--item">

                            <p>  Крутые классные бомбезные офигенные прикольные вкусные и ...</p>

                        </div>

                        <div class="price--item">
                            <h3>  250₽</h3>
                        </div>

                        <div class="button--add--to--basket">

                            <button>
                                <span> <h3> В корзину</h3></span>
                            </button>

                        </div>

                    </div>

                    <div class="container--item--confectionery">

                        <div class="image--item">
                            <img src="${pageContext.request.contextPath}/img/ovsCookie.png" height="255px" width="290px">
                        </div>

                        <div class="name--item">
                            <h3>    Овсяные печенья</h3>
                        </div>

                        <div class="description--item">

                            <p> Крутые классные бомбезные офигенные прикольные вкусные и ...</p>

                        </div>

                        <div class="price--item">
                            <h3>  250₽</h3>
                        </div>

                        <div class="button--add--to--basket">

                            <button>
                                <span> <h3> В корзину</h3></span>
                            </button>

                        </div>

                    </div>




                </div>

            </div>


        </div>




        <jsp:include page="/WEB-INF/view/jsps/footer.jsp"/>
    </div>
</body>
</html>