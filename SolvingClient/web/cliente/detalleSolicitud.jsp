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
        <%            cl.usach.server.SolvingWS_Service service = new cl.usach.server.SolvingWS_Service();
            cl.usach.server.SolvingWS port = service.getSolvingWSPort();
            String auxDatosSolicitud = "";
            int idSolicitud = 0;
            if (request.getMethod() == "POST" && request.getParameter("btnIdSolicitud") != null) {
                idSolicitud = Integer.parseInt(request.getParameter("btnIdSolicitud"));
                auxDatosSolicitud = port.datosSolicitud(idSolicitud);
                System.out.println(auxDatosSolicitud);
            }
            String[] DatosSolicitud = auxDatosSolicitud.split(",");
            int cantDat = DatosSolicitud.length;
        %>


       
        <h4 class="modal-title" id="myModalLabel">Solicitud <%if (cantDat == 6) {
                out.print(DatosSolicitud[0]);
            } %></h4>
        <div class="modal-body">
            <table class="table">
                <tr>
                    <td>
                        <label for="rut">Requerimiento: </label>
                    </td>                            
                    <td>
                        <%if (cantDat == 6) {
                                out.print(DatosSolicitud[2]);
                            } %>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="rut">Estado: </label>
                    </td>                            
                    <td>
                        <%if (cantDat == 6) {
                                out.print(DatosSolicitud[3]);
                            } %>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="rut">Fecha: </label>
                    </td>                            
                    <td>
                        <%if (cantDat == 6) {
                                out.print(DatosSolicitud[4]);
                            } %>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="empresa">Observaciones: </label>
                    </td>
                    <td>
                        <%if (cantDat == 6) {
                                out.print(DatosSolicitud[5]);
                            }%>
                    </td>
                </tr>

            </table>
        </div>
      

    </body>

</html>

