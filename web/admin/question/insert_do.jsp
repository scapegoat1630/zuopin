
<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="org.byau.dao.QuestionDAO"%>

<html>
    <head>
        <title>JSP+DAO 试题管理程序——登陆</title>
    </head>
    <body>
    <center>
        <h1>试题管理范例 —— JSP + DAO实现</h1>
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
            boolean flag = questionDAO.insert(question);
        %>
        <% if (flag) {
        %>
        <script language="javascript">alert('添加成功');
            window.location = ("listALL.jsp");
        </script>
        <%
} else {%>
        <script language="javascript">alert('添加失败，请继续')</script>
        <%
            }
        %>
    </center>
</body>
</html>