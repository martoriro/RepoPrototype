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
                <button class="btn btn-danger" onclick="location = '<%out.print(request.getContextPath());%>'"><span class="glyphicon glyphicon-log-out" ></span> Cerrar sesion</button>
            </div>
        </ul>
        <%
            cl.usach.server.SolvingWS_Service service = new cl.usach.server.SolvingWS_Service();
            cl.usach.server.SolvingWS port = service.getSolvingWSPort();
            String mensaje = "";
            if (request.getMethod() == "POST" && request.getParameter("cambio") != null) {
                String pass = request.getParameter("pass");
                String newPass = request.getParameter("pass1");
                String newPass2 = request.getParameter("pass2");
                
                if (newPass.length() == 0 || newPass2.length() == 0 || pass.length() == 0) {
                   mensaje = "<div class='alert alert-danger' role='alert'>Todos los campos son obligatorios.</div>";
                } else {
                    if (((String) login.getAttribute("pass")).equals(pass) && newPass.equals(newPass2)) {
                        login.setAttribute("pass", newPass);
                        port.cambiarPassword(((String) login.getAttribute("rut")), newPass);
                        mensaje = "<div class='alert alert-success' role='alert'>Contraseña cambiada exitosamente.</div>";
                    } else {
                        mensaje = "<div class='alert alert-danger' role='alert'>Error al ingresar un campo</div>";
                    }
                }

            }

        %>
        <div style="margin-top: 30px; margin-left: 30px">
            <h4>Configurar Cuenta</h4>
            <br/>
            <div class="col-lg-4">
                <%out.print(mensaje); %>
                <form role="form" action="configCuenta.jsp" method="POST" class="inline">
                    <label for="pass">Contraseña antigua:</label>
                    <input type="password" name="pass" class="form-control" id="pass1">
                    <label for="pass1">Nueva contraseña:</label>
                    <input type="password" name="pass1" class="form-control" id="pass1">
                    <label for="pass2">Repita Contraseña:</label>
                    <input type="password" name="pass2" class="form-control" id="pass2">      
                    <br/>
                    <button type="submit" value="cambio" name="cambio" class="btn btn-success"><span class="glyphicon glyphicon-save"></span> Guardar</button>
                </form>
            </div>
        </div>

    </body>

</html>

