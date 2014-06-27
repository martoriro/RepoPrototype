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
            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#crearSolicitud"> 
                <span class="glyphicon glyphicon-plus"></span>  Crear Solicitud</button>
        </div>

        <div style="margin-top: 30px; margin-left: 30px">
            <h4>Solicitudes realizadas</h4>
            <table class="table table-striped table-hover" style="width: 700px">            
                <thead>
                    <tr>                    
                        <th>ID</th>                    
                        <th>Fecha</th>
                        <th>Requerimiento</th>
                    </tr>
                </thead>
                <tbody data-toggle="modal" data-target="#showRequest">
                    <tr>
                        <td>Arreglar tijeras</td>                    
                        <td>3M</td>
                        <td>asdf</td>
                    </tr>
                    <tr>
                        <td>Limpiar baño</td>
                        <td>Plomeros tropicales</td>
                        <td>asdf</td>
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
                                    <label for="rut">Requerimiento </label>
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
                                    <label for="empresa">Usuario: </label>
                                </td>
                                <td>
                                    gary
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
                            
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-success"><span class="glyphicon glyphicon-check"></span> Cerrar solicitud</button>
                    </div>
                </div>
            </div>
        </div>    


        <div class="modal fade" id="crearSolicitud" tabindex="-1" role="dialog" aria-labelledby="showrequestModal" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title" id="myModalLabel">Crear Solicitud</h4>
                    </div>                    
                    <form role="form">
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Requerimiento:</label>
                                <select class="form-control input-sm">
                                    <option value="" label="Seleccione"/>
                                    <option value="Hla" label="chao"/>
                                    <option value="COmo" label="como"/>
                                    <option value="Hla" label="estas"/>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Observaciones</label>
                                <textarea class="form-control" rows="6"></textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-success"><span class="glyphicon glyphicon-check"></span> Enviar Solicitud </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>    

    </body>

</html>

