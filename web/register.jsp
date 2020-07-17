<%-- 
    Document   : register
    Created on : Jul 17, 2020, 3:42:07 PM
    Author     : sherl
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Build Your House</title>
        <link rel="icon" href="${pageContext.request.contextPath}/assets/image/logo.png"/>
        <link href="${pageContext.request.contextPath}/assets/css/main.css" rel="stylesheet" type="text/css"/>
        <style>
            body, html {
                height: 100%;
                font-family: "Inconsolata", sans-serif;
            }

            .bgimg {
                background-position: center;
                background-size: cover;
                background-image: url("${pageContext.request.contextPath}/assets/image/bgimg.jpg");
                min-height: 40%;
            }

            .menu {
                display: none;
            }
        </style>
    </head>
    <body>
        <c:set var="user" value="${sessionScope.USER}" />
        <c:set var="error" value="${requestScope.ERROR}" />
        <!-- Header with image -->
        <header class="bgimg w3-display-container w3-grayscale-min" id="home">
            <div class="w3-display-bottomleft w3-center w3-padding-large w3-hide-small">
                <!--<span class="w3-tag">Open from 6am to 5pm</span>-->
            </div>
            <div class="w3-display-middle w3-center">
                <span class="w3-text-white" style="font-size:72px">B.Y.H<br>build your house</span>
            </div>
            <div class="w3-display-bottomright w3-center w3-padding-large">
                <!--<a href="index.jsp"><span class="w3-tag">Home >></span></a>-->
            </div>
        </header>

        <div class="w3-sand w3-grayscale w3-large">
            <div class="w3-container" id="where" style="padding-bottom:32px;">
                <div class="w3-content" style="max-width:700px">
                    <h5 class="w3-center w3-padding-48"><span class="w3-tag w3-wide">ĐĂNG KÝ</span></h5>
                    <form action="register" method="POST">
                        <p><input class="w3-input w3-padding-16 w3-border" type="text" placeholder="Email" required name="txtEmail"></p>
                        <p><input class="w3-input w3-padding-16 w3-border" type="text" placeholder="Họ và tên" required name="txtFullname"></p>
                        <p><input class="w3-input w3-padding-16 w3-border" type="password" placeholder="Mật khẩu" required name="txtPassword"></p>
                        <p><input class="w3-input w3-padding-16 w3-border" type="password" placeholder="Xác nhận mật khẩu" required name="txtConfirmPassword"></p>
                        <p><input type="hidden" name="btnAction" value="Register"></p>
                        <p><input class="w3-button w3-black" type="submit" value="Đăng ký"></p>
                        <p>Đã có tài khoản? <a href="login.jsp">Đăng nhập</a> ngay.</p>
                    </form>
                    <c:if test="${not empty error}">
                        <h4 style="color: red">${error}</h4>
                    </c:if>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <footer class="w3-center w3-grey w3-padding-48 w3-large">
            <p>&#169; 2020 PHAN THANH TU</p>
        </footer>
    </body>
</html>
