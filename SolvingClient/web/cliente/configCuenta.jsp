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
            <li><a href="index.jsp">Inicio</a></li>
            <li class="active"><a href="configCuenta.jsp">Configurar cuenta</a></li>            
            <div style="float: right; vertical-align: middle; margin-right: 10px; margin-top: 5px; margin-bottom: 5px;">
                <b><% out.println(session.getAttribute("user1"));%>&nbsp;</b>                
                <button class="btn btn-danger"><span class="glyphicon glyphicon-log-out" onclick="location = '<% out.print(request.getContextPath());%>'"></span> Cerrar sesion</a>
            </div>
        </ul>
        <div style="margin-top: 30px; margin-left: 30px">
            <h4>Configurar Cuenta</h4>
            <br/>
            <div class="col-lg-4">
                <form role="form" class="inline">
                        <label for="pass1">Contraseña:</label>
                        <input type="password" name="pass1" class="form-control" id="pass1">
                        <label for="pass2">Repita Contraseña:</label>
                        <input type="password" name="pass2" class="form-control" id="pass2">      
                        <br/>
                        <button type="submit" class="btn btn-success"><span class="glyphicon glyphicon-save"></span> Guardar</button>
                </form>
            </div>
        </div>

    </body>

</html>

