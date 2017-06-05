<%@page import="org.byau.dao.LogInfoDAO"%>
<%@page import="org.byau.dao.UserDAO"%>
<%@page contentType="text/html;charset=UTF-8"   %>

<html>
    <head>
        <title></title>
    </head>
    <body>

        <%
            
//             String rand = (String)session.getAttribute("rand");
//             String input = request.getParameter("verifyCode");
//             if(!rand.equals(input)){
//             response.sendRedirect("login.jsp?VadalitionError=error");
//             return;
//             }
             
            request.setCharacterEncoding("GBK");
            String userId = request.getParameter("userId");
            String userPass = request.getParameter("password");
        %>


        <%      UserDAO userDAO = new UserDAO();
            boolean flag = userDAO.findByIDAndPassword(
                    userId, userPass);
            if (flag) {
                LogInfoDAO infoDAO = new LogInfoDAO();
                infoDAO.addLog(userId);
                session.setAttribute("userid", userId);
                session.setAttribute("pw", userPass);
                session.setAttribute("login", "success");
                response.sendRedirect("admin/index.jsp");
            } else {
                response.sendRedirect("login.jsp?userNamePasswordLevelError=error");
            }
        %>
    </body>
</html>