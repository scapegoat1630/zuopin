<%@ page contentType="text/html;charset=gb2312"%>
<html>
<head>
	<title>JSP+JDBC </title>
</head>
<body>
<center>
	<h1>�������</h1>
	<hr>
	<br>


	<form action="QuestionServlet.do?method=insert" method="post">
		<table>
			<tr>
				<td colspan="2">���������</td>
			</tr>
			<tr>
				<td>��Ŀ��</td>
				<td><input type="text" name="subject"></td>
			</tr>

                        <tr>
				<td>ѡ��1��</td>
				<td><input type="text" name="choiceA"></td>
			</tr>
                        <tr>
				<td>ѡ��2��</td>
				<td><input type="text" name="choiceB"></td>
			</tr>
                        <tr>
				<td>ѡ��3��</td>
				<td><input type="text" name="choiceC"></td>
			</tr>
                        <tr>
				<td>ѡ��4��</td>
				<td><input type="text" name="choiceD"></td>
			</tr>


                        <tr>
				<td>�𰸣�</td>
				<td>
                                    <input type="text" name="answer"    ></td>
			</tr>
                        <tr>
		              <td>���ͣ�</td>
				<td>
                                    <select name="typeId">
                                        <option value="01">��ѡ</option>
                                        <option value="02">��ѡ</option>

                                    </select>
                              </td>
			</tr>
                        <tr>
		              <td>��Ŀ��</td>
				<td>
                                    <select name="categoryId">
                                        <option value="01">java</option>
                                        <option value="02">linux</option>
                                    </select>
                              </td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="���">
					<input type="reset" value="����">
				</td>
			</tr>
		</table>
	</form>
	<h3><a href="QuestionServlet.do?method=selectAll">�ص������б�ҳ</a></h3>

</center>
</body>
</html>