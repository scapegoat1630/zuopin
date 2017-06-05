<%-- 
    Document   : list
    Created on : 2014-10-30, 11:12:27
    Author     : Administrator
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="org.byau.dao.QuestionDAO"%>
<%@page import="org.byau.bean.Question"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
    String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="<%=contextPath%>/script/jquery-1.4.2.js"></script>
        <script>
            function delAjax(Id) {
                if (confirm("确定该用户操作" + Id + "吗？"))
                {
                    var param = {questionId: Id};
                    $.get("deleteAjax.jsp", param,
                            function (data) {
                                //var result = data.result;
                                if (data == 1)
                                {
                                    alert("操作成功");
                                    $("#" + Id).remove();
                                } else if (data ==0)
                                {
                                    alert("删除失败。");
                                }
                            });
                }
            }
             function del(id) {
                if (confirm("你确定要删除吗") == true) {
                    window.location = "delete.jsp?questionId=" + id;
                }
            }
            function toexcel() {
                window.location = "list_toexcel.jsp";
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
        <a href="insert.jsp">添加题目</a>
        <a href="importquestion/upload.html">导入题目</a>
        <input type="button" value="导出到excel" onclick="toexcel()">
        <h1>试题数据</h1>
      <table border="1" class="style1" >
            <tr>
                <th>编号</th>
                <th>题目</th>
                <th>选项1</th>
                <th>选项2</th>
                <th>选项3</th>
                <th>选项4</th>
                <th>答案</th>
                <th colspan="3">操作</th>
            </tr>
            <%
                QuestionDAO sdao = new QuestionDAO();
                ArrayList<Question> list = sdao.ListAll();
                //多条记录用while循环
                for (Question s : list) {
            %>

            <tr id="<%=s.getQuestionId()%>" >
                <td>
                    <%=s.getQuestionId()%>
                </td>
                <td>
                    <%=s.getSubject()%>
                </td>
                <td>
                    <%=s.getChoiceA()%>
                </td>

                <td>
                    <%=s.getChoiceB()%>
                </td>
                <td>
                    <%=s.getChoiceC()%>
                </td>
                <td>
                    <%=s.getChoiceD()%>
                </td>
                <td>
                    <%=s.getAnswer()%>
                </td>
                <td>

                    <a href="update.jsp?questionId=<%=s.getQuestionId()%>">更新</a>  
                </td>
                <td>
                    <a href="javascript:delAjax(<%=s.getQuestionId()%>)">ajax删除</a>
                  
                </td>
                 <td>
                 
                    <input type="button" onclick="del(<%=s.getQuestionId()%>)" value="删除">
                </td>
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>
