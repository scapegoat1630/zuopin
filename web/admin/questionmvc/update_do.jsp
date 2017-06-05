<%@ page contentType="text/html;charset=gb2312"%>

<html>
<head>
	<title>JSP+DAO 留言管理程序</title>
</head>
<body>
<center>
	<h1>留言管理范例 —— JSP + DAO实现</h1>
	<hr>
	<br>
	<%
		// 进行乱码处理
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
				试题修改成功，两秒后跳转到试题列表页！！！<br>
				如果没有跳转，请按<a href="QuestionServlet.do?method=selectAll">这里</a>！！！
	<%
			}
			else
			{
	%>
				试题修改失败，两秒后跳转到试题列表页！！！<br>
				如果没有跳转，请按<a href="QuestionServlet.do?method=selectAll">这里</a>！！！
	<%
			}
	%>
</center>
</body>
</html>