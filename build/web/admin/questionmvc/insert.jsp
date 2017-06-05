<%@ page contentType="text/html;charset=gb2312"%>
<html>
<head>
	<title>JSP+JDBC </title>
</head>
<body>
<center>
	<h1>试题管理</h1>
	<hr>
	<br>


	<form action="QuestionServlet.do?method=insert" method="post">
		<table>
			<tr>
				<td colspan="2">添加新试题</td>
			</tr>
			<tr>
				<td>题目：</td>
				<td><input type="text" name="subject"></td>
			</tr>

                        <tr>
				<td>选项1：</td>
				<td><input type="text" name="choiceA"></td>
			</tr>
                        <tr>
				<td>选项2：</td>
				<td><input type="text" name="choiceB"></td>
			</tr>
                        <tr>
				<td>选项3：</td>
				<td><input type="text" name="choiceC"></td>
			</tr>
                        <tr>
				<td>选项4：</td>
				<td><input type="text" name="choiceD"></td>
			</tr>


                        <tr>
				<td>答案：</td>
				<td>
                                    <input type="text" name="answer"    ></td>
			</tr>
                        <tr>
		              <td>题型：</td>
				<td>
                                    <select name="typeId">
                                        <option value="01">单选</option>
                                        <option value="02">复选</option>

                                    </select>
                              </td>
			</tr>
                        <tr>
		              <td>科目：</td>
				<td>
                                    <select name="categoryId">
                                        <option value="01">java</option>
                                        <option value="02">linux</option>
                                    </select>
                              </td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="添加">
					<input type="reset" value="重置">
				</td>
			</tr>
		</table>
	</form>
	<h3><a href="QuestionServlet.do?method=selectAll">回到留言列表页</a></h3>

</center>
</body>
</html>