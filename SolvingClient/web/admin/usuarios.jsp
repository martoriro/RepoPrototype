<%-- 
    Document   : usuarios
    Created on : 27-06-2014, 01:30:12 PM
    Author     : Martín
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="../resources/css/bootstrap.min.css" rel="stylesheet">
        <link href="../resources/css/generalcss.css" rel="stylesheet">
        <script src="../resources/js/jquery-1.11.1.min.js"></script>
        <script src="../resources/js/bootstrap.min.js"></script>
    </head>
    <body>
        <%
        java.util.List<java.lang.String> result = null;
        String[] userData;
        try {
            cl.usach.server.SolvingWS_Service service = new cl.usach.server.SolvingWS_Service();
            cl.usach.server.SolvingWS port = service.getSolvingWSPort();
            if(request.getParameter("addBtn") != null){
                //port.addUser(request.getParameter("rut");
                System.out.println(request.getParameter("addBtn"));
            }
            result = port.allUsers();
            if(!request.getParameter("deleteBtn").isEmpty()){
                //port.deleteUser(request.getParameter("deleteBtn");
                System.out.println(request.getParameter("deleteBtn"));
            }
        } catch (Exception ex) {
	// TODO handle custom exceptions here
        }
    %>
        <ul class="nav nav-tabs" role="tablist">
            <li><a href="index.jsp">Inicio</a></li>
            <li><a href="solicitudes.jsp">Ver solicitudes</a></li>
            <li class="active"><a href="usuarios.jsp">Administrar usuarios</a></li>
            <div style="float: right; vertical-align: middle; margin-right: 10px; margin-top: 5px">
                <button class="btn btn-danger"><span class="glyphicon glyphicon-log-out"></span> Cerrar sesion</a>
            </div>
        </ul>
        
        <div style="margin-top: 30px; margin-left: 30px">
            <h4>Usuarios</h4>
            <table class="table table-striped" style="width: 700px">            
                <thead>
                    <tr>                    
                        <th>Rut</th>                    
                        <th>Nombre</th>
                        <th>Apellido Paterno</th>
                        <th>Apellido Materno</th>
                        <th>Empresa</th>
                        <th>Rol</th>
                    </tr>
                </thead>
                <tbody>
                <%
                for (String usuario : result) {
                        userData = usuario.split(",");
                        out.println("<tr>");
                        out.println("<td>" + userData[0] + "</td>");
                        out.println("<td>" + userData[1] + "</td>");
                        out.println("<td>" + userData[2] + "</td>");
                        out.println("<td>" + userData[3] + "</td>");
                        out.println("<td>" + userData[5] + "</td>");
                        out.println("<td>" + userData[4] + "</td>");
                        out.println("<td><button class='btn btn-sm btn-warning'><span class='glyphicon glyphicon-edit'></span></button></td>");
                        out.println("<td><form><button name='deleteBtn' value='"+userData[0]+"' class='btn btn-sm btn-danger' formmethod='POST' formaction='usuarios.jsp'><span class='glyphicon glyphicon-ban-circle'></span></button></form></td>");
                        out.println("</tr>");
                    }
                %>
                </tbody>
            </table>
            <button class="btn btn-primary" data-toggle="modal" data-target="#adduser"><span class="glyphicon glyphicon-plus-sign"></span> Agregar usuario</button>

            <div class="modal fade" id="showuser" tabindex="-1" role="dialog" aria-labelledby="showuserModal" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                            <h4 class="modal-title" id="myModalLabel">Juan Perez Vidal</h4>
                        </div>
                        <div class="modal-body">
                            <table class="table">
                                <tr>
                                    <td>
                                        <label for="rut">Rut: </label>
                                    </td>                            
                                    <td>
                                        176032502
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="empresa">Empresa: </label>
                                    </td>
                                    <td>
                                        Solvo Ltda.
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="rol">Rol: </label>
                                    </td>                            
                                    <td>
                                        Cliente
                                    </td>                            
                                </tr>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-warning"><span class="glyphicon glyphicon-edit"></span> Editar</button>
                            <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-ban-circle"></span> Borrar</button>
                        </div>
                    </div>
                </div>
            </div>
            
            <form>
            <div class="modal fade" id="adduser" tabindex="-1" role="dialog" aria-labelledby="adduserModal" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                            <h4 class="modal-title" id="myModalLabel">Agregar usuario</h4>
                        </div>
                        <div class="modal-body">
                            <table class="table">
                                <tr>
                                    <td>
                                        <label for="rut">Rut: </label>
                                    </td>                            
                                    <td>
                                        <input id="rut">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="pass">Contraseña: </label>
                                    </td>
                                    <td>
                                        <input id="pass">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="nombre">Nombre: </label>
                                    </td>                            
                                    <td>
                                        <input id="nombre">
                                    </td>                            
                                </tr>
                                <tr>
                                    <td>
                                        <label for="apellidop">Apellido Paterno: </label>
                                    </td>                            
                                    <td>
                                        <input id="apellidop">
                                    </td>                            
                                </tr>
                                <tr>
                                    <td>
                                        <label for="apellidom">Apellido Materno: </label>
                                    </td>                            
                                    <td>
                                        <input id="apellidom">
                                    </td>                            
                                </tr>
                                <tr>
                                    <td>
                                        <label for="rol">Rol: </label>
                                    </td>                            
                                    <td>
                                        <select id="rol">
                                            <option value="client">Cliente</option>
                                            <option value="admin" labe="chao">Administrador</option>
                                        </select>
                                    </td>                            
                                </tr>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button name="addBtn" value="addBtn" class="btn btn-success" formmethod="POST" formaction='usuarios.jsp'><span class="glyphicon glyphicon-save"></span> Guardar</button>
                        </div>
                    </div>
                </div>
            </div>
           </form>
            
    </body>
</html>
