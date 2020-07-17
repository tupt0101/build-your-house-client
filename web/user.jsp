<%-- 
    Document   : user
    Created on : Jul 17, 2020, 9:39:22 PM
    Author     : sherl
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
                    <a href="#" class="w3-button w3-block w3-black">TÌM KIẾM</a>
                </div>
                <div class="w3-col s3">
                    <c:set var="acc" value="${sessionScope.ACC}" />
                    <c:choose>
                        <c:when test="${acc.getRole().equals('admin')}">
                            <a href="admin.jsp" class="w3-button w3-block w3-black">Welcome, ${user}</a>
                        </c:when>
                        <c:otherwise>
                            <a href="user.jsp" class="w3-button w3-block w3-black">Welcome, ${user}</a>
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
                <a href="login.jsp"><span class="w3-tag">Log out >></span></a>
            </div>
        </header>

        <div class="w3-sand w3-large">
            <div class="w3-container" style="padding-bottom:32px;">
                <div class="w3-content" style="max-width:700px">
                    <h5 class="w3-center w3-padding-48"><span class="w3-tag w3-wide">DANH SÁCH YÊU THÍCH</span></h5>
                </div>
            </div>

            <c:set var="result" value="${requestScope.RESULT}"/>
            <c:set var="products" value="${requestScope.PRODUCTS}"/>
            <c:if test="${not empty result}">
                <div class="w3-container">
                    <div class="w3-content" style="max-width:800px">
                        <h5 class="w3-center w3-padding-48"><span class="w3-tag w3-wide">KẾT QUẢ</span></h5>

                        <table class="w3-table-all w3-bordered">
                            <thead>
                                <tr>
                                    <th>STT</th>
                                    <th style="text-align: left;">Tên vật liệu</th>
                                    <th>Lượng</th>
                                    <th>Đơn vị</th>
                                    <th>Đơn giá</th>
                                    <th>Thành tiền</th>
                                </tr>
                            </thead>
                            <tbody>
                                <fmt:setLocale value="vi_VN"/>
                                <tr>
                                    <td>1</td>
                                    <td style="text-align: left;">Xi măng</td>
                                    <td>${result.cementMass()}</td>
                                    <td>tấn</td>
                                    <td>
                                        <fmt:formatNumber value="${products.get(0).getPrice()}" type="currency"/>
                                    </td>
                                    <td>
                                        <fmt:formatNumber value="${result.cementMass() * products.get(0).getPrice()}" type="currency"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td style="text-align: left;">Đá</td>
                                    <td>${result.rockVolume()}</td>
                                    <td>m3</td>
                                    <td>
                                        <fmt:formatNumber value="${products.get(1).getPrice()}" type="currency"/>
                                    </td>
                                    <td class="">
                                        <fmt:formatNumber value="${result.rockVolume() * products.get(1).getPrice()}" type="currency"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td style="text-align: left;">Cát vàng</td>
                                    <td>${result.sandVolume()}</td>
                                    <td>m3</td>
                                    <td>
                                        <fmt:formatNumber value="${products.get(2).getPrice()}" type="currency"/>
                                    </td>
                                    <td>
                                        <fmt:formatNumber value="${result.sandVolume() * products.get(2).getPrice()}" type="currency"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>4</td>
                                    <td style="text-align: left;">Thép</td>
                                    <td>${result.steelMass()}</td>
                                    <td>kg</td>
                                    <td>
                                        <fmt:formatNumber value="${products.get(3).getPrice()}" type="currency"/>
                                    </td>
                                    <td>
                                        <fmt:formatNumber value="${result.steelMass() * products.get(3).getPrice()}" type="currency"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>5</td>
                                    <td style="text-align: left;">Gạch</td>
                                    <td>${result.numberOfBricks()}</td>
                                    <td>viên</td>
                                    <td>
                                        <fmt:formatNumber value="${products.get(4).getPrice()}" type="currency"/>
                                    </td>
                                    <td>
                                        <fmt:formatNumber value="${result.numberOfBricks() * products.get(4).getPrice()}" type="currency"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>6</td>
                                    <td style="text-align: left;">Ngói lợp</td>
                                    <td>${result.numberOfTiles()}</td>
                                    <td>viên</td>
                                    <td>
                                        <fmt:formatNumber value="${products.get(5).getPrice()}" type="currency"/>
                                    </td>
                                    <td>
                                        <fmt:formatNumber value="${result.numberOfTiles() * products.get(5).getPrice()}" type="currency"/>
                                    </td>
                                </tr>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th>Tổng cộng:</th>
                                    <th style="color: red"><fmt:formatNumber value="${requestScope.TOTAL}" type="currency"/></th>
                                </tr>
                            </tfoot>
                        </table>

                        <h5 class="w3-center w3-padding-48"><span class="w3-tag w3-wide">DANH SÁCH SẢN PHẨM</span></h5>
                        <div>
                            <div class="w3-row w3-padding">
                                <c:forEach items="${products}"  var="prod" varStatus="counter">
                                    <div class="w3-col s4">
                                        <img src="${prod.getImageUrl()}" />
                                        <p>${prod.getName()}</p>
                                        <p>
                                            <fmt:formatNumber value="${prod.getPrice()}" type="currency"/>
                                            <c:set var="unit" value="${prod.getUnit()}"/>
                                            <c:if test="${not unit.equals('NG')}">
                                                <span>/ ${unit}</span>
                                            </c:if>
                                        </p>
                                    </div>

                                </c:forEach>
                            </div>
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
</html>
