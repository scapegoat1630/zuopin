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
            boolean flag = false;
            response.setHeader("refresh", "2;URL=QuestionServlet.do?method=selectAll");

            try {
                flag = ((Boolean) request.getAttribute("flag")).booleanValue();
            } catch (Exception e) {
                out.println(e.getMessage());
            }
            %>
            <%if (flag) {
            %>
				����ɾ���ɹ����������ת�������б�ҳ������<br>
				���û����ת���밴<a href="QuestionServlet.do?method=selectAll">����</a>������
            <%} else {
            %>
				����ɾ��ʧ�ܣ��������ת�������б�ҳ������<br>
				���û����ת���밴<a href="QuestionServlet.do?method=selectAll">����</a>������
            <%            }
            %>

        </center>
    </body>
</html>