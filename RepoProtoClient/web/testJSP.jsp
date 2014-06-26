<%-- 
    Document   : testJSP
    Created on : 26-06-2014, 04:58:16 PM
    Author     : Martín
--%>

<%@page import="java.net.URL"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.File"%>
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
	cl.usach.ws.ImageServerImplService service = new cl.usach.ws.ImageServerImplService();
	cl.usach.ws.ImageServer port = service.getImageServerImplPort();
	 // TODO initialize WS operation arguments here
	java.lang.String arg0 = "asdaf.jpg";
	// TODO process result here
	byte[] result = port.downloadImage(arg0);
        FileOutputStream file = new FileOutputStream("C:\\Users\\Martín\\Pictures\\Camera Roll\\holo.png");
        file.write(result);
        file.close();
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }
    %>
    <%-- end web service invocation --%><hr/>
    </body>
</html>
