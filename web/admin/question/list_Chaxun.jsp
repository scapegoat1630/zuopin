<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.util.*"%>

<%@page import="org.byau.dao.QuestionDAO"%>
<%@page  import="org.byau.bean.Question"%>

    
   
<html>
    <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>index</title>
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
           // ����ת��
            request.setCharacterEncoding("UTF-8");

           String keyword = request.getParameter("keyword");
           // out.println(keyword) ;
           if (keyword == null) {
               // û���κβ�ѯ����
               keyword = "";
           }
            %>
           
            <%           

            List all = null;
            try {
                QuestionDAO userdao = new QuestionDAO();
                all = userdao.queryByLike(keyword);
            } catch (Exception e) {
                System.out.println(e);
            }
            %>
            <form action="" method="POST">
	�������ѯ���ݣ�<input type="text" name="keyword">
                <input type="submit" value="��ѯ">
            </form>
         

           <table border="1" class="style1" >
                <tr>
                    <th>��Ŀ���</th>
                    <th>��Ŀ</th>
                    <th>ѡ��1</th>
                    <th>ѡ��2</th>
                    <th>ѡ��3</th>
                    <th>ѡ��4</th>
                    <th>��</th>
                    <th>����</th>
                    
                  

                </tr>
                 <%
                    if (all.size() <= 0) {
            out.print("û���ҵ�����Ҫ��ļ�¼.");
        }
            //Iterator iter = all.iterator();
            for (int i = 0; i < all.size(); i++) {
            //while (iter.hasNext()) {
              //  Question question = (Question) iter.next();
                   Question question = (Question)all.get(i);
%>
               <tr class="<%=(i % 2 == 1 ? "odd" : "even")%>">
                    <td><%=question.getQuestionId()%></td>
                    <td><%=question.getSubject()%></a></td>
                    <td><%= question.getChoiceA()%></td>
                    <td><%= question.getChoiceB()%></td>
                    <td><%= question.getChoiceC()%></td>
                    <td><%= question.getChoiceD()%></td>
                    <td><%= question.getAnswer()%></td>
                    <td><a href="showDetail.jsp?questionId=<%= question.getQuestionId()%>">��ʾ��ϸ��Ϣ</a></td>
                    
                  
                   
                   
                </tr>
                <%
            }
         %>
          
            </table>
        </center>
    </body>
</html>