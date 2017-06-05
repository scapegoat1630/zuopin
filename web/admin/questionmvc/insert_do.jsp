<%@ page contentType="text/html;charset=gb2312"%>

<html>
    <head>
        <title>JSP+DAO 试题管理程序——登陆</title>
    </head>
    <body>
        <center>
            <h1>试题管理范例 —— JSP + DAO实现</h1>
            <hr>
            <br>
            <%
             response.setHeader("refresh","2;URL=QuestionServlet.do?method=selectAll") ;
	     boolean flag = ((Boolean)request.getAttribute("flag")).booleanValue();
            %>
            <% if (flag)
            {
            %>
				试题添加成功，两秒后跳转到试题列表页！！！<br>
				如果没有跳转，请按<a href="QuestionServlet.do?method=selectAll">这里</a>！！！
            <% } else
                {
            %>
				试题添加失败，两秒后跳转到试题列表页！！！<br>
				如果没有跳转，请按<a href="QuestionServlet.do?method=selectAll">这里</a>！！！
            <%
            }
            %>
        </center>
    </body>
</html>