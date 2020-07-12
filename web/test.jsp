<%-- 
    Document   : test
    Created on : Jul 11, 2020, 2:02:26 PM
    Author     : sherl
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

    </head>
    <body>
        <c:set var="index" value="${requestScope.INDEX}"/>
        <c:set var="roomHelper" value="${requestScope.ROOM_HELPER}"/>
        <c:set var="room" value="${roomHelper.room}"/>
        <h1>${room.name}</h1>
        Total Price: <fmt:formatNumber type="number" value="${roomHelper.totalPrice}"/>

        <form action="BuildController" method="POST">
            <input type="hidden" name="index" value="${requestScope.INDEX}"/>
            <input type="hidden" name="buildId" value="${requestScope.buildId}"/>
            <c:forEach items="${roomHelper.typeHelpers}" var="typeHelpers">
                <h2>${typeHelpers.type.name}</h2>
                <c:forEach items="${typeHelpers.type.furnitures}" var="furniture" varStatus="furnitureCounter">
                    <input type="hidden" name="furnitureId" value="${furniture.id}"/>

                    <p>${furniture.name}</p>
                    <p><fmt:formatNumber type="number" value="${furniture.price}"/></p>

                    <a href="FurnitureDetailController?id=${furniture.id}">Chi tiết</a>
                    <c:if test="${furnitureCounter.count == 1}">
                    <input type="number" value="${typeHelpers.quantity}" max="${typeHelpers.quantity}" name="quantity"/>
                    </c:if>
                    <c:if test="${furnitureCounter.count != 1}">
                    <input type="number" value="0" max="${typeHelpers.quantity}" name="quantity"/>
                    </c:if>
                    
                    <img src="${furniture.image[0].href}" style="width:200px">
                </c:forEach>
            </c:forEach>
            <input type="submit" value="Create" name="action" />
            <input type="submit" value="Cancel" name="action"/>
        </form>
    </body>
</html>
