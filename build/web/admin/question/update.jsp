<%-- 
    Document   : update
    Created on : 2012-9-21, 14:12:03
    Author     : Administrator
--%>

<%@page import="org.byau.dao.QuestionDAO"%>
<%@page import="org.byau.bean.Question"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page  import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>修改试题</h1>
        <%
            String id = request.getParameter("questionId");
            int id1 = Integer.parseInt(id);
        %>
        <%
            QuestionDAO dao = new QuestionDAO();
            Question q = dao.queryByQuestionId(id1);
            String answer=q.getAnswer();
            String typeId=q.getTypeId();
            String categoryId=q.getCategoryId();

        %>

        <form action="update_do.jsp" method="post">
            <table border="0">

                <tr>

                    <td>编号</td>
                    <td><input type="text" name="questionId" value="<%=q.getQuestionId()%>" readonly></td>


                </tr>
                <tr>

                    <td>题目</td>
                    <td><input type="text" name="subject" value="<%=q.getSubject()%>"></td>


                </tr>
                <tr>
                    <td>选项一</td>
                    <td><input type="text" name="choiceA" value="<%=q.getChoiceA()%>"></td>

                </tr>
                <tr>
                    <td>选项二</td>
                    <td><input type="text" name="choiceB" value="<%=q.getChoiceB()%>"></td>

                </tr>
                <tr>
                    <td>选项三</td>
                    <td><input type="text" name="choiceC" value="<%=q.getChoiceC()%>"></td>

                </tr>
                <tr>
                    <td>选项四</td>
                    <td><input type="text" name="choiceD" value="<%=q.getChoiceD()%>"></td>

                </tr>
                <tr>
                    <td>答案</td>
                    <td><select name="answer">
                            <option value="a" <%="a".equals(answer)?"selected":""%>>a</option>
                            <option value="b" <%="b".equals(answer)?"selected":""%>>b</option>
                            <option value="c" <%="c".equals(answer)?"selected":""%>>c</option>
                            <option value="d" <%="d".equals(answer)?"selected":""%>>d</option>
                        </select>
                    </td>

                </tr>
                <tr>
                    <td>试题类型</td>
                    <td><select name="typeid">
                            <option value="01" <%="01".equals(typeId)?"selected":""%>>单选</option>
                            <option value="02" <%="02".equals(typeId)?"selected":""%>>复选</option>
                        </select>
                    </td>

                </tr>

                <tr>
                    <td>科目</td>
                    <td><%-- <select name="categoryid">
                       
                       CategoryDAO categoryDAO=new CategoryDAO();
                       ArrayList<Category> categores=categoryDAO.queryAll();
                       for(Category c:categores){
                        %>
                        <option value="<%=c.getCategoryid()%>" > <%=c.getCategoryName()%> </option>
                    <%
                  }
                %>
                </select>--%>


                        <select name="categoryid">
                            <option value="01" <%="01".equals(categoryId)?"selected":""%>>java</option>
                            <option value="02" <%="02".equals(categoryId)?"selected":""%>>linux</option>
                        </select>



                    </td>

                </tr>

                </td>


                <tr>
                    <td><input type="submit" value="更新"></td>


                </tr>
            </table>

        </form>



    </body>
</html>
