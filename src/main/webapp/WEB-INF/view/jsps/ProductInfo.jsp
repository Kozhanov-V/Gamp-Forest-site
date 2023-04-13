<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Главная</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/contacts.css">

</head>
<body>
<div class="body">
    <jsp:include page="/WEB-INF/view/jsps/header.jsp"/>
    <div class="main--block">

    </div>



    <jsp:include page="/WEB-INF/view/jsps/footer.jsp"/>
</div>
</body>
</html>