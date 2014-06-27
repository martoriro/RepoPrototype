<%
    HttpSession login = request.getSession();
    if (login.getAttribute("rol") == null) {
        response.sendRedirect("../");
    } else {
        if (!((String) login.getAttribute("rol")).equals("admin")) {
            response.sendRedirect("../");
        }
    }
%>