<%-- 
    Document   : userDetail
    Created on : 2010-9-30, 13:50:52
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="org.byau.bean.User"%>
<%@page import="org.byau.dao.UserDAO"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        String userID = (String) session.getAttribute("userid");
        UserDAO userDAO=new UserDAO();
        User user=userDAO.queryByUserID(userID);

        %>

        <table border="1" width="800">
            <tr>
                <td>姓名</td>
                <td><%=user.getUserName()%></td>
                <td rowspan="4" width="200"><img src="<%=user.getPhoto()%>" width="195" height="200"> </td>

            </tr>
            <tr>
                <td>邮件</td>
                <td><%=user.getEmail()%></td>

            </tr><tr>
                <td>权限</td>
                <td><%=user.getLevel()%></td>

            </tr>

        </table>
       
    </body>
</html>
