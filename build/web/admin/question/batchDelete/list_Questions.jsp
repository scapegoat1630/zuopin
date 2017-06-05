<%-- 
    Document   : list_Questions
    Created on : 2012-9-17, 19:06:01
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@page  import="java.util.*" %>

<%@page import="org.byau.dao.QuestionDAO"%>
<%@page import="org.byau.bean.Question"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>

            function checkAll() {
                var selectFlag = document.getElementsByName("selectFlag");
                for (var i = 0; i < selectFlag.length; i++) {
                    selectFlag[i].checked = document.getElementById("ifAll").checked;
                }
            }

            function selectQuestion() {
                var selectFlag = document.getElementsByName("selectFlag");
                var flag = false;
                for (var i = 0; i < selectFlag.length; i++) {
                    if (selectFlag[i].checked) {
                        flag = true;
                        break;
                    }
                }
                if (!flag) {
                    alert("请选择需要添加的题目！");
                    return;
                }
                if (window.confirm("确认删除吗")) {
                    //with (document.getElementById("StudentForm")) {
                    //action="/BatchDelete.do";
                    // method="post";
                    document.Studentform.submit();
                    //}
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
            request.setCharacterEncoding("GBK");
            QuestionDAO dao = new QuestionDAO();
            ArrayList<Question> questions = dao.ListAll();
        %>
        <form name="Studentform" id="Studentform"  action="batchSelect.jsp" method="post">
            <%
                    //rs.next()的返回
                //如果查询结果有记录，则第一次执行rs.next()
                //指向第一条，并且返回值为真
                //因为rs指针的初始位置指向结果集的首部在第一条之前
            %>
            <table border="1" class="style1" >
                <tr>
                    <th width="10" class="rd6" align="center">
                        <input type="checkbox" name="ifAll" id="ifAll"
                               onClick="checkAll()">
                    </th>
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
                    <td>
                        <input type="checkbox" name="selectFlag" class="checkbox1"
                               value="<%=question.getQuestionId()%>">
                    </td>
                    <td><%= question.getSubject()%></td>
                    <td><%= question.getChoiceA()%></td>
                    <td><%= question.getChoiceB()%></td>
                    <td><%= question.getChoiceC()%></td>
                    <td><%= question.getChoiceD()%></td>
                    <td><%= question.getAnswer()%></td>
<!--                <td><a href="delete.jsp?questionId=<%=question.getQuestionId()%>">删除</a></td>-->
                    
                </tr>     
                <%
                    }
                %>
                <tr>
                    <td colspan="7">
                        <input name="btnselect"  type="button"
                               id="selectDelete" value="删除" onClick="selectQuestion()">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
