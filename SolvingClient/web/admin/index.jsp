<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
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
        <title>Bienvenido</title>
        <link href="../resources/css/bootstrap.min.css" rel="stylesheet">
        <link href="../resources/css/generalcss.css" rel="stylesheet">

    </head>
    <body>
        <ul class="nav nav-tabs" role="tablist">
            <li class="active"><a href="index.jsp">Inicio</a></li>
            <li><a href="solicitudes.jsp">Ver solicitudes</a></li>
            <li><a href="#">Administrar usuarios</a></li>
            <div style="float: right; vertical-align: middle; margin-right: 10px; margin-top: 10px"><b><% out.println(session.getAttribute("user1"));%></b> - <a href="#">Cerrar sesion</a></div>
        </ul>
        <div style="margin-top: 30px; margin-left: 30px">
        <h4>Ultimas solicitudes</h4>
        <table class="table table-striped" style="width: 700px">            
            <thead>
                <tr>                    
                    <th>Solicitud</th>                    
                    <th>Empresa</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Arreglar tijeras</td>                    
                    <td>3M</td>
                </tr>
                <tr>
                    <td>Limpiar baño</td>
                    <td>Plomeros tropicales</td>
                </tr>            
            </tbody>
        </table>
        </div>
        <script src="../resources/js/bootstrap.min.js"></script>
    </body>

</html>

