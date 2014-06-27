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
        <script src="../resources/js/jquery-1.11.1.min.js"></script>
        <script src="../resources/js/bootstrap.min.js"></script>
        <%@ include file="../resources/codigos/seguridadCliente.jsp" %>
    </head>
    <body>        
        <ul class="nav nav-tabs" role="tablist">
            <li class="active"><a href="index.jsp">Inicio</a></li>
            <li><a href="configCuenta.jsp">Configurar cuenta</a></li>            
            <div style="float: right; vertical-align: middle; margin-right: 10px; margin-top: 5px; margin-bottom: 5px;">
                <b><% out.println(session.getAttribute("user1"));%>&nbsp;</b>                
                <button class="btn btn-danger"><span class="glyphicon glyphicon-log-out" onclick="location = '<% out.print(request.getContextPath());%>'"></span> Cerrar sesion</a>
            </div>
        </ul>
        <div style="margin-top: 30px; margin-left: 30px">
            <div class="col-lg-4">
                <form role="form" class="inline">
                        <label for="rut">Rut:</label>
                        <input type="text" class="form-control" id="rut">
                        <label for="nombre">Nombre:</label>
                        <input type="text" class="form-control" id="nombre">
                        <label for="aPat:">Apellido Paterno:</label>
                        <input type="text" class="form-control" id="aPat">
                        <label for="aMat">Apellido Materno</label>
                        <input type="text" class="form-control" id="aMat">
                        <label for="pass1">Contraseña:</label>
                        <input type="password" class="form-control" id="pass1">
                        <label for="pass2">Repita Contraseña:</label>
                        <input type="password" class="form-control" id="pass2">

                    <div class="form-group">
                        <label for="mail">Email:</label>
                        <input type="email" class="form-control" id="mail">
                    </div>                   
                        <button type="submit" class="btn btn-success"><span class="glyphicon glyphicon-save"></span> Guardar</button>
                </form>
            </div>
        </div>

    </body>

</html>

