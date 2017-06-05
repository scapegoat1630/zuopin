<%@ page contentType="text/html;charset=gb2312"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>



<%
    String contextPath = request.getContextPath();
%>
<html>
    <head>

        <script >
            
             function del(questionId){
             //\u4f60\u786e\u5b9a\u8981\u5220\u9664\u5417��"��ȷ��Ҫɾ����"��unicode����
       if ((confirm("\u4f60\u786e\u5b9a\u8981\u5220\u9664\u5417"))==true){
           window.location=("QuestionServlet.do?method=delete&questionId="+questionId);
        }
    }


    
     function edit(questionId){
             //\u4f60\u786e\u5b9a\u8981\u5220\u9664\u5417��"��ȷ��Ҫɾ����"��unicode����
           window.location=("QuestionServlet.do?method=selectId&questionId="+questionId);
        }
         function toexcel() {
                window.location = "QuestionServlet.do?method=exportExcel";
            }

        </script>
        <style>
            .tablecss2{ border:#C0C0C0 1px solid; border-collapse:collapse; margin:5px; }
            /*.tablecss2 td{ BORDER-BOTTOM: #C0C0C0 1px solid; BORDER-right: #C0C0C0 1px solid; padding:2px; }*/
            .tablecss2 tr{ BORDER-BOTTOM: #C0C0C0 1px solid; BORDER-right: #C0C0C0 1px solid; padding:2px; background-color:#E8E8E8}
            .style1{
                width: 800px;
                height: 100px;
                margin: 0px auto;
                margin-bottom:20px;
                border:1px solid #96C2F1;
                background-color: #EFF7FF;
                border-collapse:collapse
            }
            /*
            .style1 a{
                font-size:20px;
                text-decoration:none;
                color:green

            }
            */
            .style1 td{
                border:1px solid #000000;
                border-collapse:collapse ;

            }
            .style1 th {
                border:1px solid #000000;
                background-color: #0099CC;
            }

            a:link {color: #FF0000; text-decoration: none} /* δ���ʵ����� */
            a:visited {color: #000000; text-decoration: none} /* �ѷ��ʵ����� */
            a:hover {color: #FF00FF; text-decoration: underline} /* ����������� */
            a:active {color: #0000FF; text-decoration: underline} /* �������� */
        </style>

    </head>
    <body>
    <center>

        <hr>
        <br>





       <input type="button" value="������excel" onclick="toexcel()">
        <h3><a href="insert.jsp">���������</a></h3>


        <!--table width="80%" border="1"-->
        <table  cellspacing="0" cellpadding="0" class="style1"><!--class="tablecss2"-->
            <tr>
                <th width="100">��Ŀ���</th>
                <th>��Ŀ</th>
                <th>ѡ��1</th>
                <th>ѡ��2</th>
                <th>ѡ��3</th>
                <th>ѡ��4</th>
                <th>��</th>
                
                <th>�༭</th>
                <th>ɾ��</th>


            </tr>
            <c:forEach items="${questions}" var="question">

                <tr>
                    <td>${question.questionId}</td>
                    <td>${question.subject}</td>
                    <td>${question.choiceA}</td>
                    <td>${question.choiceB}</td>
                    <td>${question.choiceC}</td>
                    <td>${question.choiceD}</td>
                    <td>${question.answer}</td>
                    
                    


                    <td> <IMG
                            onclick="javascript:edit(${question.questionId})" height=16
                            src="<%=contextPath%>/images/pencil.gif" width=16
                            border=0> </td>
                    <td><IMG onclick="javascript:del(${question.questionId})"
                             height=16
                             src="<%=contextPath%>/images/bin_closed.gif" width=16
                             border=0> </td>
                </tr>
            </c:forEach>

        </table>

    </center>
</body>
</html>