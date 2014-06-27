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
        <link href="resources/css/bootstrap.min.css" rel="stylesheet">
        <link href="resources/css/generalcss.css" rel="stylesheet">

    </head>
    <body>
        
    <%-- start web service invocation --%><hr/>
    <%
    try {
	cl.usach.server.SolvingWS_Service service = new cl.usach.server.SolvingWS_Service();
	cl.usach.server.SolvingWS port = service.getSolvingWSPort();
	 // TODO initialize WS operation arguments here
	java.lang.String name = "";
	// TODO process result here
	java.lang.String result = port.hello(name);
	out.println("Result = "+result);
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }
    %>
    <%-- end web service invocation --%><hr/>
    </body>

</html>

