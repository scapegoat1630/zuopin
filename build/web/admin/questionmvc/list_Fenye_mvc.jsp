<%-- 
    Document   : list_Questions
    Created on : 2012-9-17, 19:06:01
    Author     : Administrator
--%>

<%@ page contentType="text/html;charset=gb2312"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function go(id) {
                if (confirm("��ȷ��Ҫɾ����") == true) {
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
      
        

       
        <%                //rs.next()�ķ���
            //�����ѯ����м�¼�����һ��ִ��rs.next()
            //ָ���һ�������ҷ���ֵΪ��
            //��Ϊrsָ��ĳ�ʼλ��ָ���������ײ��ڵ�һ��֮ǰ
        %>
        <table border="1" class="style1" >
            <tr>
                <th>��Ŀ</th>
                <th>ѡ��1</th>
                <th>ѡ��2</th>
                <th>ѡ��3</th>
                <th>ѡ��4</th>
                <th>��</th>
             
            </tr>
              <c:forEach items="${questions}" var="question">
            <tr>
                    <td>${question.subject}</td>
                    <td>${question.choiceA}</td>
                    <td>${question.choiceB}</td>
                    <td>${question.choiceC}</td>
                    <td>${question.choiceD}</td>
                    <td>${question.answer}</td>
               
            </tr>  
                 </c:forEach>

         
            ��${pageNO}ҳ ��${totalPage}ҳ
            <a href="QuestionServlet.do?method=page&pageNO=<%=1%>">��ҳ</a>
            <a href="QuestionServlet.do?method=page&pageNO=${pageNO -1 }">��һҳ</a>
            <a href="QuestionServlet.do?method=page&pageNO=${pageNO +1 }">��һҳ</a>
            <a href="QuestionServlet.do?method=page&pageNO=${totalPage}">���һҳ</a>


    </body>
</html>
