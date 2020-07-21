<%-- 
    Document   : index
    Created on : Jun 23, 2020, 3:59:29 AM
    Author     : sherl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tư vấn trang trí | Build Your House</title>
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
                <!--<a href="login.jsp"><span class="w3-tag">Log in >></span></a>-->
            </div>
        </header>

        <div class="w3-sand w3-large">
            <div class="w3-container" id="where" style="padding-bottom:32px;">
                <div class="w3-content" style="max-width:800px">
                    <h5 class="w3-center w3-padding-48"><span class="w3-tag w3-wide">GỢI Ý CHỌN GẠCH ỐP LÁT</span></h5>
                    <p>Chúng tôi <span class="w3-tag">BYH</span> sẽ gợi ý những cách lựa chọn nội thất không những đáp ứng được sở thích mà còn hợp phong thủy cho căn nhà của bạn.</p>
                    <c:set var="qaList" value="${requestScope.QA}"/>
                    <c:if test="${not empty qaList}">
                        <form action="suggest" method="POST">
                            <p>
                                <select class="w3-input w3-padding-16 w3-border" required name="quality">
                                    <option value="" disabled selected>Chọn chất lượng vật liệu</option>
                                    <option value="low_quality">Thấp</option>
                                    <option value="medium_quality">Phổ thông</option>
                                    <option value="high_quality">Tốt</option>
                                </select>
                            </p>
                            <c:forEach items="${qaList}" var="qaDTO" varStatus="counter">
                                <c:if test="${empty qaDTO.getListAnswer()}">
                                    <p class="w3-padding-16">
                                        ${counter.count}. ${qaDTO.getQuestion().getName()}<br>
                                        <input class="w3-input w3-padding-16 w3-border" type="number" min="1900" max="3000" required name="yearOfBirth">
                                    </p>
                                </c:if>
                                <c:if test="${not empty qaDTO.getListAnswer()}">
                                    <p class="w3-padding-16">
                                        ${counter.count}. ${qaDTO.getQuestion().getName()}<br>
                                        <input class="w3-radio" type="radio" name="ansOfQues${qaDTO.getQuestion().getId()}" value="${qaDTO.getListAnswer().get(0).getId()}" required>
                                        <label for="roof">${qaDTO.getListAnswer().get(0).getName()}</label><br>
                                        <input class="w3-radio " type="radio" name="ansOfQues${qaDTO.getQuestion().getId()}" value="${qaDTO.getListAnswer().get(1).getId()}">
                                        <label for="terrace">${qaDTO.getListAnswer().get(1).getName()}</label>
                                    </p>
                                </c:if>
                            </c:forEach>
                            <p class="w3-center"><input class="w3-button w3-black" type="submit" value="Xem kết quả"></p>
                        </form>
                    </c:if>

                </div>
            </div>

            <c:set var="result" value="${requestScope.RESULT}"/>
            <c:set var="products" value="${requestScope.PRODUCTS}"/>
            <c:if test="${not empty result}">
                <div class="w3-container">
                    <div class="w3-content" style="max-width:900px">
                        <h5 class="w3-center w3-padding-48"><span class="w3-tag w3-wide">DANH SÁCH SẢN PHẨM</span></h5>
                        <div class="w3-row">
                            <fmt:setLocale value="vi_VN"/>
                            <c:forEach items="${result}"  var="prod" varStatus="counter">
                                <c:set var="tmp" value="${counter.count % 3}"/>
                                <c:if test="${(tmp == 1) && (counter.count > 1)}">
                                </div>
                                <div class="w3-row">
                                    <div class="w3-container w3-third" id="${prod.getId()}" style="margin-bottom: 22px">
                                        <div class="w3-card-4">
                                            <div class="imgContainer">
                                                <img src="${prod.getImageUrl()}" style="width: 100%" class="imgProduct" />
                                                <div class="middle">
                                                    <div class="text">
                                                        <input class="w3-button w3-hover-red" type="button" value="Yêu thích" onclick="addToFavorite(${prod.getId()})"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <h4>
                                            <a href="${prod.getUrl()}" style="color: red; font-weight: bold; text-decoration: none" target="blank">${prod.getName()}</a>
                                        </h4>
                                        <div style="font-size: 14px">
                                            <strong>Kích thước: </strong>
                                            <span class="w3-tag w3-round w3-white" style="padding:3px">
                                                <span class="w3-tag w3-round w3-white w3-border w3-border-gray">
                                                    ${prod.getSize()} cm
                                                </span>
                                            </span>
                                        </div>
                                        <div style="font-size: 14px">
                                            <strong>Màu: </strong>
                                            <span class="w3-tag w3-round w3-white" style="padding:3px">
                                                <span class="w3-tag w3-round w3-white w3-border w3-border-gray">
                                                    ${prod.getColor()}
                                                </span>
                                            </span>
                                        </div>
                                        <div class="w3-right-align" style="font-weight: bold">
                                            <span style="font-size: 20px "><fmt:formatNumber value="${prod.getPrice()}" type="currency"/></span>
                                            <c:set var="unit" value="${prod.getUnit()}"/>
                                            <c:if test="${not unit.equals('NG')}">
                                                <span style="font-size: 14px">/ ${unit}</span>
                                            </c:if>
                                        </div>
                                    </div>
                                </c:if>
                                <c:if test="${not (tmp == 1) || (counter.count == 1)}">
                                    <div class="w3-container w3-third" id="${prod.getId()}" style="margin-bottom: 22px">
                                        <div class="w3-card-4">
                                            <div class="imgContainer">
                                                <img src="${prod.getImageUrl()}" style="width: 100%" class="imgProduct" />
                                                <div class="middle">
                                                    <div class="text">
                                                        <input class="w3-button w3-hover-red" type="button" value="Yêu thích" onclick="addToFavorite(${prod.getId()})"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <h4>
                                            <a href="${prod.getUrl()}" style="color: red; font-weight: bold; text-decoration: none" target="blank">${prod.getName()}</a>
                                        </h4>
                                        <div style="font-size: 14px">
                                            <strong>Kích thước: </strong>
                                            <span class="w3-tag w3-round w3-white" style="padding:3px">
                                                <span class="w3-tag w3-round w3-white w3-border w3-border-gray">
                                                    ${prod.getSize()} cm
                                                </span>
                                            </span>
                                        </div>
                                        <div style="font-size: 14px">
                                            <strong>Màu: </strong>
                                            <span class="w3-tag w3-round w3-white" style="padding:3px">
                                                <span class="w3-tag w3-round w3-white w3-border w3-border-gray">
                                                    ${prod.getColor()}
                                                </span>
                                            </span>
                                        </div>
                                        <div class="w3-right-align" style="font-weight: bold">
                                            <span style="font-size: 20px "><fmt:formatNumber value="${prod.getPrice()}" type="currency"/></span>
                                            <c:set var="unit" value="${prod.getUnit()}"/>
                                            <c:if test="${not unit.equals('NG')}">
                                                <span style="font-size: 14px">/ ${unit}</span>
                                            </c:if>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </c:if>
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

        function addToFavorite(productID) {
//            hideItem(productID);
            xmlHttp = getXmlHttpObject();
            if (xmlHttp == null) {
                alert("Your browser does not support AJAX!");
                return;
            }
            var url = "add-to-favorite?productID=";
            url += productID;
            xmlHttp.open("GET", url, true);
            xmlHttp.send(null);
        }

        function hideItem(id) {
            document.getElementById(id).style.display = "none";
        }
    </script>
</html>
