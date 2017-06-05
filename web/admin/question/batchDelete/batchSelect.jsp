<%-- 
    Document   : batchSelect
    Created on : 2013-4-16, 10:12:34
    Author     : Administrator
--%>


<%@page contentType="text/html" pageEncoding="GBK"%>
<%@page import="org.byau.dao.QuestionDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=GBK">
        <title>JSP Page</title>
    </head>
    <body>
       

        <%             
          
            String ids[] = request.getParameterValues("selectFlag");

            QuestionDAO questionDAO = new QuestionDAO();
            boolean flag = questionDAO.batchDeleteQuestion(ids);
        %> 
        <% if (flag) {
        %>
        <script language="javascript">alert('成功');
            window.location = ("list_Questions.jsp");
        </script>
        <%
        } else {%>
        <script language="javascript">alert('失败，请继续')</script>
        <%
            }
        %>
    </body>
</html>
