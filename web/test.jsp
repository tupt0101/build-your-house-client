<%-- 
    Document   : test
    Created on : Jul 21, 2020, 3:47:51 AM
    Author     : sherl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>  
    <head>  
        <style type="text/css">  
            .pg-normal {  
                color: #0000FF;  
                font-weight: normal;  
                text-decoration: none;  
                cursor: pointer;  
            }  

            .pg-selected {  
                color: #800080;  
                font-weight: bold;  
                text-decoration: underline;  
                cursor: pointer;  
            }  
        </style>  
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">  
        <title>Pagination Using Java Script Tutorial - www.javaworkspace.com</title>  
    </head>  

    <script type="text/javascript">
        function Pager(tableName, itemsPerPage) {
            this.tableName = tableName;
            this.itemsPerPage = itemsPerPage;
            this.currentPage = 1;
            this.pages = 0;
            this.inited = false;

            this.showRecords = function (from, to) {
                var rows = document.getElementById(tableName).rows;
                // i starts from 1 to skip table header row  
                for (var i = 1; i < rows.length; i++) {
                    if (i < from || i > to)
                        rows[i].style.display = 'none';
                    else
                        rows[i].style.display = '';
                }
            }

            this.showPage = function (pageNumber) {
                if (!this.inited) {
                    alert("not inited");
                    return;
                }

                var oldPageAnchor = document.getElementById('pg' + this.currentPage);
                oldPageAnchor.className = 'pg-normal';

                this.currentPage = pageNumber;
                var newPageAnchor = document.getElementById('pg' + this.currentPage);
                newPageAnchor.className = 'pg-selected';

                var from = (pageNumber - 1) * itemsPerPage + 1;
                var to = from + itemsPerPage - 1;
                this.showRecords(from, to);
            }

            this.prev = function () {
                if (this.currentPage > 1)
                    this.showPage(this.currentPage - 1);
            }

            this.next = function () {
                if (this.currentPage < this.pages) {
                    this.showPage(this.currentPage + 1);
                }
            }

            this.init = function () {
                var rows = document.getElementById(tableName).rows;
                var records = (rows.length - 1);
                this.pages = Math.ceil(records / itemsPerPage);
                this.inited = true;
            }

            this.showPageNav = function (pagerName, positionId) {
                if (!this.inited) {
                    alert("not inited");
                    return;
                }
                var element = document.getElementById(positionId);

                var pagerHtml = '<span onclick="' + pagerName + '.prev();" class="pg-normal"> « Prev </span> | ';
                for (var page = 1; page <= this.pages; page++)
                    pagerHtml += '<span id="pg' + page + '" class="pg-normal" onclick="' + pagerName + '.showPage(' + page + ');">' + page + '</span> | ';
                pagerHtml += '<span onclick="' + pagerName + '.next();" class="pg-normal"> Next »</span>';

                element.innerHTML = pagerHtml;
            }
        }
    </script>  

    <body>  

        <h1>Pagination Using Java Script</h1>  

        <%
            List list = (List) session.getAttribute("studentDetails");
        %>  

        <table border="1" id="results">  
            <tr bgcolor="orange">  
                <td><strong>Student Name</strong></td>  
                <td><strong>Father Name</strong></td>  
                <td><strong>Age</strong></td>  
                <td><strong>Country</strong></td>  
            </tr>  
            <%
                for (int i = 0; i < list.size(); i++) {
            %>  
            <tr>  
                <%
                    StudentDetailsDTO studentDetailsDTO = (StudentDetailsDTO) list
                            .get(i);
                    out.println("<td>" + studentDetailsDTO.getStudentName()
                            + "</td>");
                    out.println("<td>" + studentDetailsDTO.getFatherName()
                            + "</td>");
                    out.println("<td>" + studentDetailsDTO.getAge() + "</td>");
                    out.println("<td>" + studentDetailsDTO.getCountry() + "</td>");
                %>  
            </tr>  
            <%
                }
            %>  
        </table>  
        <div id="pageNavPosition"></div>  

        <script type="text/javascript">
            var pager = new Pager('results', 2);
            pager.init();
            pager.showPageNav('pager', 'pageNavPosition');
            pager.showPage(1);
        </script>  

    </body>  
</html>  
