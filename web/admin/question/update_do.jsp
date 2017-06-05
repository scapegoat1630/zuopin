<%@page import="org.byau.dao.QuestionDAO"%>

<%@ page contentType="text/html;charset=UTF-8"%>

<html>
    <head>
        <title>JSP+DAO 留言管理程序</title>
    </head>
    <body>
    <center>
        <h1>留言管理范例 —— JSP + DAO实现</h1>
        <hr>
        <br>
        <%
            // 进行乱码处理
            request.setCharacterEncoding("GB2312");
        %>
        <jsp:useBean id="question" scope="page" class="org.byau.bean.Question"/>
        <jsp:setProperty name="question" property="*"/>

        <%
            response.setHeader("refresh", "2;URL=list_questions.jsp");

            QuestionDAO questionDAO = new QuestionDAO();
            boolean flag = questionDAO.update(question);

        %>
        <%                            response.setHeader("refresh", "2;URL=listALL.jsp");
            if (flag) {

        %>
        试题修改成功，两秒后跳转到试题列表页！！！<br>
        如果没有跳转，请按<a href="listALL.jsp">这里</a>！！！
        <%        } else {
        %>
        试题修改失败，两秒后跳转到试题列表页！！！<br>
        如果没有跳转，请按<a href="listALL.jsp">这里</a>！！！
        <%
            }
        %>
    </center>
</body>
</html>