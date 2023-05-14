<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</head>
<body>
    <c:forEach var="productItem" items="${sessionScope.cartItems}">
        <h1>${productItem.product}</h1>
    </c:forEach>
</body>
</html>
