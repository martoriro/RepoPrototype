<%-- 
    Document   : solicitudes
    Created on : 27-06-2014, 12:15:36 PM
    Author     : Martín
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="../resources/css/bootstrap.min.css" rel="stylesheet">
        <link href="../resources/css/generalcss.css" rel="stylesheet">
    </head>
    <body>
        <ul class="nav nav-tabs" role="tablist">
            <li><a href="index.jsp">Inicio</a></li>
            <li class="active"><a href="solicitudes.jsp">Ver solicitudes</a></li>
            <li><a href="#">Administrar usuarios</a></li>
            <div style="float: right; vertical-align: middle; margin-right: 10px; margin-top: 10px"><b><% out.println(session.getAttribute("user1"));%></b> - <a href="#">Cerrar sesion</a></div>
        </ul>
        <div style="margin-top: 30px; margin-left: 30px">
        <h4>Solicitudes abiertas</h4>
        <table class="table table-striped" style="width: 700px">            
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Solicitud</th>
                    <th>Observacion</th>
                    <th>Empresa</th>
                    <th>Fecha</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>Arreglar tijeras</td>
                    <td>Se nos echaron a perder las tijeras, cortan alrevés</td>
                    <td>3M</td>
                    <td>28/06/2014</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>Limpiar baño</td>
                    <td>El baño está tapado</td>
                    <td>Plomeros tropicales</td>
                    <td>12/05/2014</td>
                </tr>            
            </tbody>
        </table>
        </div>
        <div style="margin-top: 30px; margin-left: 30px">
        <h4>Solicitudes cerradas</h4>
        <table class="table table-striped" style="width: 700px">            
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Solicitud</th>
                    <th>Observacion</th>
                    <th>Empresa</th>
                    <th>Fecha</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>Arreglar tijeras</td>
                    <td>Se nos echaron a perder las tijeras, cortan alrevés</td>
                    <td>3M</td>
                    <td>05/04/2010</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>Limpiar baño</td>
                    <td>El baño está tapado</td>
                    <td>Plomeros tropicales</td>
                    <td>02/03/2012</td>
                </tr>            
            </tbody>
        </table>
        </div>
        <script src="../resources/js/bootstrap.min.js"></script>
    </body>
</html>
