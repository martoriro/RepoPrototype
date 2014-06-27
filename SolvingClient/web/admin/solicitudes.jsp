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
        <script src="../resources/js/jquery-1.11.1.min.js"></script>
        <script src="../resources/js/bootstrap.min.js"></script>
    </head>
    <body>
        <ul class="nav nav-tabs" role="tablist">
            <li><a href="index.jsp">Inicio</a></li>
            <li class="active"><a href="solicitudes.jsp">Ver solicitudes</a></li>
            <li><a href="usuarios.jsp">Administrar usuarios</a></li>
            <div style="float: right; vertical-align: middle; margin-right: 10px; margin-top: 5px">
                <button class="btn btn-danger"><span class="glyphicon glyphicon-log-out"></span> Cerrar sesion</a>
            </div>
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
                <tr data-toggle="modal" data-target="#showRequest">
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
        
        <div class="modal fade" id="showRequest" tabindex="-1" role="dialog" aria-labelledby="showrequestModal" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                            <h4 class="modal-title" id="myModalLabel">Solicitud #1</h4>
                        </div>
                        <div class="modal-body">
                            <table class="table">
                                <tr>
                                    <td>
                                        <label for="rut">Solicitud: </label>
                                    </td>                            
                                    <td>
                                        Arreglar tijeras
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="rut">Fecha: </label>
                                    </td>                            
                                    <td>
                                        28/06/2014
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="empresa">Observacion: </label>
                                    </td>
                                    <td>
                                        Se nos echaron a perder las tijeras, cortan alrevés
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="rol">Empresa: </label>
                                    </td>                            
                                    <td>
                                        3M
                                    </td>                            
                                </tr>
                                <tr>
                                    <td>
                                        <label for="rut">Solicitado por: </label>
                                    </td>                            
                                    <td>
                                        Juan Solvo
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-success"><span class="glyphicon glyphicon-check"></span> Cerrar solicitud</button>
                        </div>
                    </div>
                </div>
            </div>
        
    <%-- start web service invocation --%><hr/>
    <%
    try {
	cl.usach.server.SolvingWS_Service service = new cl.usach.server.SolvingWS_Service();
	cl.usach.server.SolvingWS port = service.getSolvingWSPort();
	// TODO process result here
	java.util.List<java.lang.String> result = port.allrequirimientos();
	out.println("Result = "+result);
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }
    %>
    <%-- end web service invocation --%><hr/>
    </body>
</html>
