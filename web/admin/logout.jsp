<%-- 
    Document   : logout
    Created on : 2014-10-27, 16:57:38
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="gbk"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=gbk">
        <title>Logout</title>
    </head>
    <body>
        <%
            session.invalidate();//ʹsessionʧЧ
            response.sendRedirect("../login.jsp");
            %>
    </body>
</html>
