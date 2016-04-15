<%-- 
    Document   : EditCustomer
    Created on : Apr 15, 2016, 3:45:13 PM
    Author     : parth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
           // response.sendRedirect("viewCustomer.html");
            // New location to be redirected
            String site = new String("viewCustomer.html");
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", site);
        %>
    </body>
</html>
