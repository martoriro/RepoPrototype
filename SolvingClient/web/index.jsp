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
            boolean error = false;
            try {
                cl.usach.server.SolvingWS_Service service = new cl.usach.server.SolvingWS_Service();
                cl.usach.server.SolvingWS port = service.getSolvingWSPort();
                if (request.getMethod() == "POST") {
                    //función que verifica usuario
                    String result = port.login((String) request.getParameter("usuario"), (String) request.getParameter("pass"));
                    if (!result.equals("")) {
                        response.sendRedirect(request.getContextPath() + "/" + result);
                    } else {
                        error = true;
                    }
                }
            } catch (Exception ex) {
                error = true;
            }
        %>
        <div class="container"> 
            <div class="row" style="margin-top:80px">
                <div class="col-lg-4"></div>
                <div class="col-lg-4">
                    <img src="resources/images/Logo.jpg" width="160" height="60"/>

                    <form role="form"  action="index.jsp" method="post">
                        <%
                            if (error == true) {
                                out.print("<div class='alert alert-danger alert-dismissible' role='alert"
                                        + "<p><span class='glyphicon glyphicon-warning-sign'></span> <strong>Error: </strong> Usuario o Contraseña incorrecta</p>"
                                        + "</div>");
                            }
                        %>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Nombre de usuario:</label>
                            <input type="text" class="form-control" id="usuario" name="usuario" placeholder="Ingrese su rut">
                        </div>
                        <div class="form-group">
                            <label for="pass">Contraseña:</label>
                            <input type="password" class="form-control" id="pass" name="pass" placeholder="Ingrese su contraseña">
                        </div>
                        <button type="submit" class="btn btn-success">
                            <span class="glyphicon glyphicon-log-in"></span>&nbsp;&nbsp;Entrar
                        </button>
                    </form>
                </div>
                <div class="col-lg-4"></div>
            </div>
        </div>
        <script src="resources/js/bootstrap.min.js"></script>
    </body>
</html>
