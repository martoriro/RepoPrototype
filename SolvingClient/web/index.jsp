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
        <div class="container"> 
            <div class="row" style="margin-top:80px">
                <div class="col-lg-4"></div>
                <div class="col-lg-4">
                    <img src="resources/images/Logo.jpg" width="160" height="60"/>

                    <form role="form"  action="index.jsp" method="post">
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
                        <div class="form-group">
                            <p class="bg-danger">Error en</p>
                        </div>
                    </form>


                </div>
                <div class="col-lg-4"></div>
            </div>

            <%
                if (request.getMethod() == "POST") {
                    String nombre = (String) request.getParameter("usuario");
                    String pass = (String) request.getParameter("pass");
                    out.print(session.getId());
                    //función que verifica usuario
                    if (nombre.equals("gustavo") && pass.equals("gustavo")) {

                        session.setAttribute("user1", nombre);
                        session.setAttribute("pass2", pass);
                        //request.login(nombre, pass);
                        response.sendRedirect(request.getContextPath() + "/admin");
                    }

                }


            %>
        </div>
        <script src="resources/js/bootstrap.min.js"></script>
    </body>

</html>
