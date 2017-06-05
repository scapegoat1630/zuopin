<%-- 
    Document   : insert
    Created on : 2012-9-17, 19:28:57
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page  import="java.util.*" %>





<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <h1>添加试题</h1>
        <form action="insert_do.jsp" method="post">
        <table border="0">
            <tr>
                <td>题目</td>
                <td><input type="text" name="subject"></td>
                
                
            </tr>
               <tr>
                <td>选项一</td>
                <td><input type="text" name="choiceA"></td>

            </tr>
          <tr>
                <td>选项二</td>
                <td><input type="text" name="choiceB"></td>

            </tr>
            <tr>
                <td>选项三</td>
                <td><input type="text" name="choiceC"></td>

            </tr>
            <tr>
                <td>选项四</td>
                <td><input type="text" name="choiceD"></td>

            </tr>
             <tr>
                <td>答案</td>
                <td><select name="answer">
                        <option value="a">a</option>
                        <option value="b" >b</option>
                        <option value="c">c</option>
                       <option value="d">d</option>
                    </select>
                </td>

            </tr>
            <tr>
                <td>试题类型</td>
                <td><select name="typeid">
                         <option value="01">单选题</option>
                        <option value="02" >多选题</option>
                    </select>
                </td>
            </tr>
            
            <tr>
                <td>科目</td>
               <td> <%-- <select name="categoryid">
                       
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
                        <option value="01">java</option>
                        <option value="02">linux</option>
                    </select>
                </td>
            </tr>
             <tr>
                 <td><input type="submit" value="添加"></td>
            </tr>
        </table>
            
        </form>
    </body>
</html>
