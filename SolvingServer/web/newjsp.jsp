<%-- 
    Document   : newjsp
    Created on : 27-jun-2014, 11:32:46
    Author     : Glass
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
    <%-- start web service invocation --%><hr/>
    <%
    try {
        out.println("cuanto");
	cl.usach.server.SolvingWS_Service service = new cl.usach.server.SolvingWS_Service();
        out.println("alcanza");
	cl.usach.server.SolvingWS port = service.getSolvingWSPort();
        out.println("a hacer");
	 // TODO initialize WS operation arguments here
	java.lang.String rut = "17409487k";
	java.lang.String password = "123";
	// TODO process result here
	java.lang.String result = port.login(rut, password);
	out.println("Result = "+result);
    } catch (Exception ex) {
    }
    %>
    <%-- end web service invocation --%><hr/>
    </body>
</html>
