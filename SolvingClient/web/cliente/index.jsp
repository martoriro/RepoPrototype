<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
        <script language="JavaScript">
            function mandar() {
                window.open('detalleSolicitud.jsp', 'popup', 'toolbar= no,location=no,directories=no,status=no,menubar=no ,scrollbars=yes,resizable=no,width=410,height=400');
                formu.submit();
            }
        </script>
        <%@ include file="../resources/codigos/seguridadCliente.jsp" %>

    </head>
    <body> 
        <%            cl.usach.server.SolvingWS_Service service = new cl.usach.server.SolvingWS_Service();
            cl.usach.server.SolvingWS port = service.getSolvingWSPort();

        %>
        <ul class="nav nav-tabs" role="tablist">
            <li class="active"><a href="index.jsp">Inicio</a></li>
            <li><a href="configCuenta.jsp">Configurar cuenta</a></li>            
            <div style="float: right; vertical-align: middle; margin-right: 10px; margin-top: 5px; margin-bottom: 5px;">
                <b><% out.println(session.getAttribute("user1"));%>&nbsp;</b>                
                <button class="btn btn-danger" onclick="location = '<%out.print(request.getContextPath());%>'"><span class="glyphicon glyphicon-log-out" ></span> Cerrar sesion</button>
            </div>
        </ul>

        <div style="margin-top: 30px; margin-left: 30px">
            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#crearSolicitud"> 
                <span class="glyphicon glyphicon-plus"></span>  Crear Solicitud</button>
        </div>


        <div style="margin-top: 30px; margin-left: 30px">            
            <h4>Solicitudes realizadas</h4>
            <form action="detalleSolicitud.jsp" method="post" target="popup">
                <table class="table table-striped" style="width: 700px">            
                    <thead>
                        <tr>                    
                            <th>ID</th>                    
                            <th>Fecha</th>
                            <th>Estado</th>
                            <th>Requerimiento</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            
                            try {
                                //Llenado de tabla
                                List<String> solicitudesUsuario = new ArrayList<String>();
                                solicitudesUsuario = port.allUserRequest((String) login.getAttribute("rut"));
                                String auxSolicitudesUsuario[];
                                if (solicitudesUsuario.size() == 0) {
                                    out.println("<tr>");
                                    out.println("<td>No se registran datos</td>");
                                    out.println("</tr>");
                                } else {
                                    for (String su : solicitudesUsuario) {
                                        auxSolicitudesUsuario = su.split(",");
                                        out.println("<tr>");
                                        out.println("<td>" + auxSolicitudesUsuario[0] + "</td>");
                                        out.println("<td>" + auxSolicitudesUsuario[4] + "</td>");
                                        out.println("<td>" + auxSolicitudesUsuario[3] + "</td>");
                                        out.println("<td>" + auxSolicitudesUsuario[2] + "</td>");
                                        out.println("<td><button type='submit' onClick='mandar();' class='btn btn-sm btn-success' name='btnIdSolicitud' value='" + auxSolicitudesUsuario[0] + "'><span class='glyphicon glyphicon-search'></span></button></td>");
                                        out.println("</tr>");
                                    }
                                }
                            } catch (Exception e) {

                            }
                        %>                    
                    </tbody>
                </table>
            </form>
        </div>
        

        <%

            if (request.getMethod() == "POST" && request.getParameter("bntNuevaSolicitud") != null) {
                String requerimiento = request.getParameter("req");
                String observaciones = request.getParameter("obs");
                System.out.println("Los datos son:"+ requerimiento.length() +"n x"+observaciones.length());
                if (requerimiento.length()==0 || observaciones.length()==0) {
                    
                } else {
                    if (port.crearSolicitud((String) login.getAttribute("rut"), requerimiento, observaciones)) {
                        response.setIntHeader("Refresh", 0);
                    }

                }

            }
        %>
        <form action="index.jsp" method="post" >                        
            <div class="modal fade" id="crearSolicitud" tabindex="-1" role="dialog" aria-labelledby="showrequestModal" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                            <h4 class="modal-title" id="myModalLabel">Crear Solicitud</h4>
                        </div>                    

                        <div class="modal-body">
                            <div class="form-group">
                                <label>Requerimiento:</label>
                                <select class="form-control input-sm" name="req">
                                    <option value="" label="Seleccione"/>
                                    <%
                                        List<String> requerimientos = new ArrayList<String>();
                                        try {
                                            requerimientos = port.allrequirimientos();
                                            for (int i = 0; i < requerimientos.size(); i++) {
                                                out.print("<option value='" + requerimientos.get(i) + "' label='" + requerimientos.get(i) + "'/>");
                                            }
                                        } catch (Exception ex) {

                                        }
                                    %>                                    
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Observaciones</label>
                                <textarea class="form-control" rows="6" name="obs"></textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" name="bntNuevaSolicitud" value="btnNS" class="btn btn-success"><span class="glyphicon glyphicon-check"></span> Enviar Solicitud </button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal"><span class="glyphicon glyphicon-log-out"></span> cancelar</button>
                        </div>

                    </div>
                </div>
            </div> 
        </form>
    </body>

</html>

