<%-- 
    Document   : index
    Created on : Jun 23, 2020, 3:59:29 AM
    Author     : sherl
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang chủ | Build Your House</title>
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
        <!-- Links (sit on top) -->
        <div class="w3-top">
            <div class="w3-row w3-padding w3-black">
                <div class="w3-col s3">
                    <a href="index.jsp" class="w3-button w3-block w3-black">TRANG CHỦ</a>
                </div>
                <div class="w3-col s3">
                    <a href="suggest.jsp" class="w3-button w3-block w3-black">TƯ VẤN TRANG TRÍ</a>
                </div>
                <div class="w3-col s3">
                    <a href="#" class="w3-button w3-block w3-black">TÌM KIẾM</a>
                </div>
                <div class="w3-col s3">
                    <c:choose>
                        <c:when test="${empty user}">
                            <a href="login.jsp" class="w3-button w3-block w3-black">ĐĂNG NHẬP</a>
                        </c:when>
                        <c:otherwise>
                            <a href="admin.jsp" class="w3-button w3-block w3-black">Welcome, ${user}</a>
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
            <div class="w3-container" style="padding-bottom:32px;">
                <div class="w3-content" style="max-width:700px">
                    <h5 class="w3-center w3-padding-48"><span class="w3-tag w3-wide">CONSTRUCTION COST ESTIMATOR</span></h5>
                    <p>Chúng tôi <span class="w3-tag">BYH</span> sẽ giúp bạn ước tính số lượng vật liệu xây dựng cần thiết và chi phí cho ngôi nhà của bạn.</p>
                    <form action="MainController" method="POST">
                        <p><input class="w3-input w3-padding-16 w3-border" type="number" placeholder="Nhà của bạn có mấy tầng?" required name="numOfFloors"></p>
                        <p><input class="w3-input w3-padding-16 w3-border" type="number" placeholder="Diện tích sàn là bao nhiêu? (m2)" required name="areaOfFloor"></p>
                        <p>
                            <select class="w3-input w3-padding-16 w3-border" required name="substructure">
                                <option value="" disabled selected>Chọn loại móng</option>
                                <option value="mong_don">Móng đơn</option>
                                <option value="mong_bang">Móng băng, đóng bè</option>
                                <option value="mong_coc">Móng cọc</option>
                                <option value="mong_coc_be_tong">Móng dọc, nền bê tông cốt thép</option>
                            </select>
                        </p>
                        <p>
                            <select class="w3-input w3-padding-16 w3-border" required name="typeOfWall">
                                <option value="" disabled selected>Chọn loại tường</option>
                                <option value="tuong_10">Tường dày 10 cm</option>
                                <option value="tuong_20">Tường dày 20 cm</option>
                                <option value="tuong_30">Tường dày 30 cm</option>
                            </select>
                        </p>
                        <p class="w3-padding-16">Lợp mái hay sân thượng? 
                            <input class="w3-radio" type="radio" name="typeOfCeiling" value="lop_mai" onclick="handleClickRadio(this)" required>
                            <label for="roof">Lợp mái</label>
                            <input class="w3-radio " type="radio" name="typeOfCeiling" value="san_thuong" onclick="handleClickRadio(this)">
                            <label for="terrace">Sân thượng</label>
                        </p>
                        <div id="roof-block" class="hidden">
                            <p class="w3-padding-16">
                                <input class="w3-radio" type="radio" name="roof" value="mai_chong_tham">
                                <label for="roof">Mái láng chống thấm, xây cao</label>
                            </p>
                            <p class="w3-padding-16">
                                <input class="w3-radio" type="radio" name="roof" value="mai_chong_nong">
                                <label for="roof">Mái chống nóng, xây cao</label>
                            </p>
                            <p class="w3-padding-16">
                                <input class="w3-radio" type="radio" name="roof" value="mai_ngoi_tran_gia">
                                <label for="roof">Mái ngói, trần giả</label>
                            </p>
                            <p class="w3-padding-16">
                                <input class="w3-radio" type="radio" name="roof" value="mai_ngoi_tran_thach_cao">
                                <label for="roof">Mái ngói, trần thạch cao</label>
                            </p>
                            <p class="w3-padding-16">
                                <input class="w3-radio" type="radio" name="roof" value="mai_ngoi_be_tong">
                                <label for="roof">Mái ngói, đổ sàn bê tông</label>
                            </p>
                            <p class="w3-padding-16">
                                <input class="w3-radio" type="radio" name="roof" value="mai_ton">
                                <label for="roof">Mái tôn</label>
                            </p>
                        </div>
                        <div id="terrace-block" class="hidden">
                            <p class="w3-padding-16">
                                <input id="cbx" class="w3-check" type="checkbox" name="simpleTerrace" value="simpleTerrace" onclick="handleClickCheckBox()">
                                <label for="simpleTerrace">Chỉ lát nền, xây tường bao quanh.</label>
                            </p>
                            <p><input id="tum" class="w3-input w3-padding-16 w3-border" type="number" name="areaOfTum" placeholder="Diện tích tầng tum (nếu có)"></p>
                            <p><input id="flower" class="w3-input w3-padding-16 w3-border" type="number" name="areaOfFlower" placeholder="Diện tích sàn có giàn hoa (nếu có)"></p>
                            <p><input id="lam" class="w3-input w3-padding-16 w3-border" type="number" name="areaOfLam" placeholder="Diện tích sàn có giàn lam (nếu có)"></p>
                            <p><input id="cover" class="w3-input w3-padding-16 w3-border" type="number" name="areaOfCover" placeholder="Diện tích sàn có mái che (nếu có)"></p>
                            <p><input id="no-cover" class="w3-input w3-padding-16 w3-border" type="number" name="areaOfNoCover" placeholder="Diện tích sàn không có mái che (nếu có)"></p>
                        </div>
                        <p>
                            <select class="w3-input w3-padding-16 w3-border" required name="quality">
                                <option value="" disabled selected>Chọn chất lượng vật liệu</option>
                                <option value="low_quality">Thấp</option>
                                <option value="medium_quality">Phổ thông</option>
                                <option value="high_quality">Tốt</option>
                            </select>
                        </p>

                        <!--<p><input class="w3-input w3-padding-16 w3-border" type="datetime-local" placeholder="Date and time" required name="date" value="2017-11-16T20:00"></p>-->

                        <p><input class="w3-button w3-black" type="submit" name="btnAction" value="Calculate"></p>
                    </form>
                </div>
            </div>

            <c:set var="result" value="${requestScope.RESULT}"/>
            <c:set var="products" value="${requestScope.PRODUCTS}"/>
            <c:if test="${not empty result}">
                <div class="w3-container">
                    <div class="w3-content" style="max-width:700px">
                        <h5 class="w3-center w3-padding-48"><span class="w3-tag w3-wide">KẾT QUẢ</span></h5>

                        <table class="w3-table w3-bordered">
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
    <script>
        function handleClickRadio(radio) {
            if (radio.value === 'lop_mai') {
                document.getElementById("roof-block").style.display = "block";
                document.getElementById("terrace-block").style.display = "none";
            } else if (radio.value === 'san_thuong') {
                document.getElementById("roof-block").style.display = "none";
                document.getElementById("terrace-block").style.display = "block";
            }
        }

        function handleClickCheckBox() {
            var cbx = document.getElementById('cbx');
            if (cbx.checked == true) {
                document.getElementById('tum').disabled = true;
                document.getElementById('flower').disabled = true;
                document.getElementById('lam').disabled = true;
                document.getElementById('cover').disabled = true;
                document.getElementById('no-cover').disabled = true;
            } else {
                document.getElementById('tum').disabled = false;
                document.getElementById('flower').disabled = false;
                document.getElementById('lam').disabled = false;
                document.getElementById('cover').disabled = false;
                document.getElementById('no-cover').disabled = false;
            }
        }
    </script>
</html>
