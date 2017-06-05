<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.*"%>

<%@page import="org.byau.dao.QuestionDAO"%>
<%@page import="org.byau.bean.Question"%>
<html>
    <head>
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
    <center>

        <hr>
        <br>
        <%
            // 编码转换
            request.setCharacterEncoding("UTF-8");

            QuestionDAO dao = new QuestionDAO();
            String key = request.getParameter("key");//""
            // out.println(keyword) ;
            if (key == null) {
                // 没有任何查询条件
                key = "";
            }
            int totalPage = dao.getTotalPage(key);

            String toPage = request.getParameter("pageNO");//"0"

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
            ArrayList<Question> all = dao.queryByLike(key, pageNO);
        %>


        <form action="list_FenyeChaxun.jsp" method="POST">
            请输入查询内容：<input type="text" name="key">
            <input type="submit" value="查询">
        </form>
       

       <table border="1" class="style1" >
            <tr>
                <th width="100">题目编号</th>
                <th>题目</th>
                <th>选项1</th>
                <th>选项2</th>
                <th>选项3</th>
                <th>选项4</th>
                <th>答案</th>
                <th>题型</th>
                <th>所属试卷</th>

            </tr>
            <%
                if (all.size() <= 0) {
                    out.print("没有找到满足要求的记录.");
                }
                for (Question question : all) {


            %>
            <tr>
                <td><%=question.getQuestionId()%></td>
                <td> <%=question.getSubject()%></a></td>
                <td><%= question.getChoiceA()%></td>
                <td><%= question.getChoiceB()%></td>
                <td><%= question.getChoiceC()%></td>
                <td><%= question.getChoiceD()%></td>
                <td><%= question.getAnswer()%></td>
                <td><%= question.getTypeId()%></td>
                <td><%=question.getCategoryId()%></td>
               

            </tr>
            <%
                }
            %>
        </table>
        第<%=pageNO%>页 共<%=totalPage%>页
        <a href="list_FenyeChaxun.jsp?key=<%=key%>&amp;pageNO=<%=1%>">首页</a>
        <a href="list_FenyeChaxun.jsp?key=<%=key%>&amp;pageNO=<%=pageNO - 1%>">上一页</a>
        <a href="list_FenyeChaxun.jsp?key=<%=key%>&amp;pageNO=<%=pageNO + 1%>">下一页</a>
        <a href="list_FenyeChaxun.jsp?key=<%=key%>&amp;pageNO=<%=totalPage%>">最后一页</a>
       
    </center>
</body>
</html>