<%@ page contentType="text/html;charset=gb2312"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<html>
<head>
	<title>JSP+DAO ����������</title>
</head>
<body>
<center>
	<h1>��������� ���� JSP + DAOʵ��</h1>
	<hr>
	<br>
	<%
		// �������봦��
		request.setCharacterEncoding("GB2312") ;
	%>
	
		
	
	
	
		
	<form action="QuestionServlet.do?method=update" method="post">
		  <table>

                    <tr>
                        <td colspan="2">�޸�����</td>
                    </tr>
                    <tr>
                        <td>��Ŀ��</td>
                        <td><input type="text" name="subject" value="${question.subject}"></td>
                    </tr>
                    <tr>
                        <td>ѡ��1��</td>
                        <td><input type="text" name="choiceA" value="${question.choiceA}"></td>
                    </tr>

                    <tr>
                        <td>ѡ��2��</td>
                        <td><input type="text" name="choiceB" value="${question.choiceB}"></td>
                    </tr>
                    <tr>
                        <td>ѡ��3��</td>
                        <td><input type="text" name="choiceC" value="${question.choiceC}"></td>
                    </tr>
                    <tr>
                        <td>ѡ��4��</td>
                        <td><input type="text" name="choiceD" value="${question.choiceD}"></td>
                    </tr>


                    <tr>
                        <td>�𰸣�</td>
                        <td>
                            <input type="text" name="answer"   value="${question.answer}" ></td>
                    </tr>
                   <tr>
                        <td>���ͣ�</td>
                        <td>
                            <select name="typeId">
                                <option value="01" <c:if test="${question.typeId == '01'}">selected</c:if>>��ѡ</option>
                                <option value="02" <c:if test="${question.typeId == '02'}">selected</c:if>>��ѡ</option>

                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>��Ŀ��</td>


                        <td>
                            <select name="categoryId">
                                <option value="01" <c:if test="${question.categoryId == '01'}">selected</c:if>>java</option>
                                <option value="02" <c:if test="${question.categoryId == '02'}">selected</c:if>>linux</option>
                            </select>
                        </td>

                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="hidden" name="questionId" value="${question.questionId}">
                            <input type="submit" value="����">
                            <input type="reset" value="����">
                        </td>
                    </tr>
                </table>
	</form>
	
	<h3><a href="list_questions.jsp">�ص������б�ҳ</a></h3>
	
</center>
</body>
</html>