<%-- 
    Document   : user
    Created on : Jul 17, 2020, 9:39:22 PM
    Author     : sherl
--%>

<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang cá nhân | Build Your House</title>
        <link rel="icon" href="${pageContext.request.contextPath}/assets/image/logo.png"/>
        <link href="${pageContext.request.contextPath}/assets/css/main.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet">
        <style>
            body, html {
                height: 100%;
                font-family: "Open Sans", sans-serif;
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
            .hidden {
                display: none;
            }
            .imgContainer {
                position: relative;
                width: 100%;
            }
            .imgProduct {
                opacity: 1;
                display: block;
                width: 100%;
                height: auto;
                transition: .5s ease;
                backface-visibility: hidden;
            }
            .middle {
                transition: .5s ease;
                opacity: 0;
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                -ms-transform: translate(-50%, -50%);
                text-align: center;
            }

            .imgContainer:hover .imgProduct {
                opacity: 0.5;
            }

            .imgContainer:hover .middle {
                opacity: 1;
            }

            .text {
                background-color: #000000;
                color: white;
                font-size: 14px;
            }
        </style>
    </head>
    <body>
        <c:set var="user" value="${sessionScope.USER}" />
        <c:if test="${empty user}">
            <jsp:forward page="login.jsp" />
        </c:if>
        <!-- Links (sit on top) -->
        <div class="w3-top">
            <div class="w3-row w3-padding w3-black">
                <div class="w3-col s3">
                    <a href="index.jsp" class="w3-button w3-block w3-black">TRANG CHỦ</a>
                </div>
                <div class="w3-col s3">
                    <a href="init-question" class="w3-button w3-block w3-black">TƯ VẤN TRANG TRÍ</a>
                </div>
                <div class="w3-col s3">
                    <a href="search" class="w3-button w3-block w3-black">TÌM KIẾM</a>
                </div>
                <div class="w3-col s3">
                    <c:set var="acc" value="${sessionScope.ACC}" />
                    <c:choose>
                        <c:when test="${acc.getRole().equals('admin')}">
                            <a href="admin.jsp" class="w3-button w3-block w3-black">Welcome, ${user}</a>
                        </c:when>
                        <c:otherwise>
                            <a href="favorite-product" class="w3-button w3-block w3-black">Welcome, ${user}</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>

        <!-- Header with image -->
        <header class="bgimg w3-display-container w3-grayscale-min" id="home">
            <div class="w3-display-bottomleft w3-center w3-padding-large w3-hide-small">
                <!--<span class="w3-tag">Open from 6am to 5pm</span>-->
            </div>
            <div class="w3-display-middle w3-center">
                <span class="w3-text-white" style="font-size:72px">B.Y.H<br>build your house</span>
            </div>
            <div class="w3-display-bottomright w3-center w3-padding-large">
                <!--<span class="w3-text-white">15 Adr street, 5015</span>-->
                <a href="log-out"><span class="w3-tag">Log out >></span></a>
            </div>
        </header>

        <div class="w3-sand w3-large">
            <div class="w3-container" style="padding-bottom:32px;">
                <div class="w3-content" style="max-width:800px">
                    <h5 class="w3-center w3-padding-48"><span class="w3-tag w3-wide">DANH SÁCH YÊU THÍCH</span></h5>

                    <c:set var="doc" value="${sessionScope.DOC}"/>
                    <c:if test="${not empty doc}">
                        <x:set var="favorites" select="$doc//favorites" scope="session"/>
                        <div class="w3-row">
                            <x:if select="$favorites">
                                <x:forEach var="product" select="$favorites/product">
                                    <div class="w3-container w3-third" id="<x:out select="$product/ID" />" style="margin-bottom: 22px">
                                        <div class="w3-card-4">
                                            <div class="imgContainer">
                                                <img src="<x:out select="$product/ImageUrl" />" style="width: 100%" class="imgProduct" />
                                                <div class="middle">
                                                    <div class="text">
                                                        <input class="w3-button w3-hover-red" type="button" value="Bỏ thích" onclick="removeFavorite(<x:out select="$product/ID"/>)"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <h4>
                                            <a href="<x:out select="$product/Url" />" style="color: red; font-weight: bold; text-decoration: none" target="blank"><x:out select="$product/Name" /></a>
                                        </h4>
                                        <div style="font-size: 14px">
                                            <strong>Kích thước: </strong>
                                            <span class="w3-tag w3-round w3-white" style="padding:3px">
                                                <span class="w3-tag w3-round w3-white w3-border w3-border-gray">
                                                    <x:out select="$product/Size" /> cm
                                                </span>
                                            </span>
                                        </div>
                                        <div style="font-size: 14px">
                                            <strong>Màu: </strong>
                                            <span class="w3-tag w3-round w3-white" style="padding:3px">
                                                <span class="w3-tag w3-round w3-white w3-border w3-border-gray">
                                                    <x:out select="$product/Color" />
                                                </span>
                                            </span>
                                        </div>
                                        <div class="w3-right-align" style="font-weight: bold">
                                            <span style="font-size: 20px "><fmt:formatNumber value="" type="currency"/><x:out select="$product/Price"/></span>
                                            <x:set var="unit" select="$product/Unit"/>
                                            <c:if test="${not unit.equals('NG')}">
                                                <span style="font-size: 14px">/ <x:out select="$product/Unit" /></span>
                                            </c:if>
                                        </div>
                                    </div>
                                </x:forEach>
                            </x:if>
                        </div>
                    </c:if>
                    <c:if test="${empty doc}">
                        <p class="w3-center">
                            No products in favorite list. Let's add some.
                        </p>
                    </c:if>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <footer class="w3-center w3-grey w3-padding-48 w3-large">
            <p>&#169; 2020 PHAN THANH TU</p>
        </footer>
    </body>
    <script type="text/javascript">
        function getXmlHttpObject() {
            var xmlHttp = null;
            try {
                // Firefox, Opera 8.0 +, Safari
                xmlHttp = new XMLHttpRequest();
            } catch (e) {
                // IE
                try {
                    xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
                } catch (e) {
                    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
            }
            return xmlHttp;
        }

        function removeFavorite(productID) {
            hideItem(productID);
            xmlHttp = getXmlHttpObject();
            if (xmlHttp == null) {
                alert("Your browser does not support AJAX!");
                return;
            }
            var url = "remove-favorite?productID=";
            url += productID;
            xmlHttp.open("GET", url, true);
            xmlHttp.send(null);
        }

        function hideItem(id) {
            document.getElementById(id).style.display = "none";
        }
    </script>
</html>
