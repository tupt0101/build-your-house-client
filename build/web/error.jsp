<%-- 
    Document   : error
    Created on : Jun 23, 2020, 5:27:58 AM
    Author     : sherl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Opps, something went wrong!</h1>
		<h3 style="color: red">${requestScope.ERROR}</h3>
    </body>
</html>
