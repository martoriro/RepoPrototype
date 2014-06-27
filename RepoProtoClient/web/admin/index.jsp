<%-- 
    Document   : index
    Created on : 26-06-2014, 03:24:42 PM
    Author     : Martín
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bienvenido a ShareFile</title>
        <link href="resources/css/bootstrap.min.css" rel="stylesheet">
        <link href="resources/css/generalcss.css" rel="stylesheet">

    </head>
    <body>
        <%
            String usuario = (String) request.getSession().getId();
            String pass = (String) request.getSession().getId();
            out.print(session.getAttribute("user1") + " " + session.getAttribute("pass1"));
        %>
        
        <script src="resources/js/bootstrap.min.js"></script>
    </body>

</html>

