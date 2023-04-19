<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Главная</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/aboutProduct.css">

</head>
<body>
<div class="body">
    <jsp:include page="/WEB-INF/view/jsps/header.jsp"/>
    <div class="main--block">
        <div>
            <div class="button--go--back">
                <img src="${pageContext.request.contextPath}/img/buttonGoBack.png"/>
            </div>
            <div class="main--image">
                <img src="${pageContext.request.contextPath}/img/pngwing11.png"width="800" height="670"/>
            </div>
        </div>
        <div class="main--block--info">

            <h2>Шоколадный торт</h2>

            <p>Добро о гостя
                нашей кондитерской..</p>

            <h2>220 ₽</h2>

            <button>В корзину</button>

        </div>


    </div>

    <div class="see--also--block">

        <h1>Смотрите также</h1>
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




    <jsp:include page="/WEB-INF/view/jsps/footer.jsp"/>
</div>
</body>
</html>