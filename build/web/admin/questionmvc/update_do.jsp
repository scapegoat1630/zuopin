<%@ page contentType="text/html;charset=gb2312"%>

<html>
<head>
	<title>JSP+DAO ���Թ�������</title>
</head>
<body>
<center>
	<h1>���Թ������� ���� JSP + DAOʵ��</h1>
	<hr>
	<br>
	<%
		// �������봦��
		request.setCharacterEncoding("GB2312") ;
	%>
	

	<%
			response.setHeader("refresh","2;URL=QuestionServlet.do?method=selectAll") ;
	     boolean flag = ((Boolean)request.getAttribute("flag")).booleanValue();

	%>
			<%
			
			if(flag)
			{

	%>
				�����޸ĳɹ����������ת�������б�ҳ������<br>
				���û����ת���밴<a href="QuestionServlet.do?method=selectAll">����</a>������
	<%
			}
			else
			{
	%>
				�����޸�ʧ�ܣ��������ת�������б�ҳ������<br>
				���û����ת���밴<a href="QuestionServlet.do?method=selectAll">����</a>������
	<%
			}
	%>
</center>
</body>
</html>