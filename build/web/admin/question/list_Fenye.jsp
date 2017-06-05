<%-- 
    Document   : list_Questions
    Created on : 2012-9-17, 19:06:01
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="org.byau.dao.QuestionDAO"%>
<%@page import="org.byau.bean.Question"%>
<%@page  import="java.util.*" %>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function go(id) {
                if (confirm("你确定要删除吗") == true) {
                    window.location = "delete.jsp?questionId=" + id;
                }
            }


        </script>

        <style type="text/css">
            .style1{
                width: 1000px;
                margin: 0px;
                margin-bottom:20px;
                border:1px solid #96C2F1;
                background-color: #EFF7FF;
                border-collapse:collapse
            }

            .style1 td{
                border:1px solid #000000;
                /*border-collapse:collapse ;*/
            }
            .style1 th {
                border:1px solid #000000;
                background-color: #0099CC;
            }


        </style>   
    </head>
    <body>
      
        

        <%

            request.setCharacterEncoding("UTF-8");
            QuestionDAO dao = new QuestionDAO();

            int totalPage = dao.getTotalPage();

            String toPage = request.getParameter("pageNO");

            if (toPage == null || toPage.length() == 0) {
                toPage = "1";
            }
            int pageNO = Integer.parseInt(toPage);

            if (pageNO <= 0) {
                pageNO = 1;
            }

            if (pageNO > totalPage) {
                pageNO = totalPage;
            }
            ArrayList<Question> questions = dao.queryByLike(pageNO);
         //ArrayList<Question> questions=dao.queryAll();


        %>
        <%                //rs.next()的返回
            //如果查询结果有记录，则第一次执行rs.next()
            //指向第一条，并且返回值为真
            //因为rs指针的初始位置指向结果集的首部在第一条之前
        %>
        <table border="1" class="style1" >
            <tr>
                <th>题目</th>
                <th>选项1</th>
                <th>选项2</th>
                <th>选项3</th>
                <th>选项4</th>
                <th>答案</th>
             
            </tr>
            <%                for (Question question : questions) {
            %>
            <tr>
                <td><%= question.getSubject()%></td>
                <td><%= question.getChoiceA()%></td>
                <td><%= question.getChoiceB()%></td>
                <td><%= question.getChoiceC()%></td>
                <td><%= question.getChoiceD()%></td>
                <td><%= question.getAnswer()%></td>
               
                
              




            </tr>     

            <%
                }
            %>
            第<%=pageNO%>页 共<%=totalPage%>页
            <a href="list_Fenye.jsp?pageNO=<%=1%>">首页</a>
            <a href="list_Fenye.jsp?pageNO=<%=pageNO - 1%>">上一页</a>
            <a href="list_Fenye.jsp?pageNO=<%=pageNO + 1%>">下一页</a>
            <a href="list_Fenye.jsp?pageNO=<%=totalPage%>">最后一页</a>


    </body>
</html>
