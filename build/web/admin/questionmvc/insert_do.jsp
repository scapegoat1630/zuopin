<%@ page contentType="text/html;charset=gb2312"%>

<html>
    <head>
        <title>JSP+DAO ���������򡪡���½</title>
    </head>
    <body>
        <center>
            <h1>��������� ���� JSP + DAOʵ��</h1>
            <hr>
            <br>
            <%
             response.setHeader("refresh","2;URL=QuestionServlet.do?method=selectAll") ;
	     boolean flag = ((Boolean)request.getAttribute("flag")).booleanValue();
            %>
            <% if (flag)
            {
            %>
				������ӳɹ����������ת�������б�ҳ������<br>
				���û����ת���밴<a href="QuestionServlet.do?method=selectAll">����</a>������
            <% } else
                {
            %>
				�������ʧ�ܣ��������ת�������б�ҳ������<br>
				���û����ת���밴<a href="QuestionServlet.do?method=selectAll">����</a>������
            <%
            }
            %>
        </center>
    </body>
</html>