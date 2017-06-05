<%@ page contentType="text/html;charset=gb2312"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<html>
<head>
	<title>JSP+DAO 试题管理程序</title>
</head>
<body>
<center>
	<h1>试题管理范例 —— JSP + DAO实现</h1>
	<hr>
	<br>
	<%
		// 进行乱码处理
		request.setCharacterEncoding("GB2312") ;
	%>
	
		
	
	
	
		
	<form action="QuestionServlet.do?method=update" method="post">
		  <table>

                    <tr>
                        <td colspan="2">修改试题</td>
                    </tr>
                    <tr>
                        <td>题目：</td>
                        <td><input type="text" name="subject" value="${question.subject}"></td>
                    </tr>
                    <tr>
                        <td>选项1：</td>
                        <td><input type="text" name="choiceA" value="${question.choiceA}"></td>
                    </tr>

                    <tr>
                        <td>选项2：</td>
                        <td><input type="text" name="choiceB" value="${question.choiceB}"></td>
                    </tr>
                    <tr>
                        <td>选项3：</td>
                        <td><input type="text" name="choiceC" value="${question.choiceC}"></td>
                    </tr>
                    <tr>
                        <td>选项4：</td>
                        <td><input type="text" name="choiceD" value="${question.choiceD}"></td>
                    </tr>


                    <tr>
                        <td>答案：</td>
                        <td>
                            <input type="text" name="answer"   value="${question.answer}" ></td>
                    </tr>
                   <tr>
                        <td>题型：</td>
                        <td>
                            <select name="typeId">
                                <option value="01" <c:if test="${question.typeId == '01'}">selected</c:if>>单选</option>
                                <option value="02" <c:if test="${question.typeId == '02'}">selected</c:if>>复选</option>

                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>科目：</td>


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
                            <input type="submit" value="更新">
                            <input type="reset" value="重置">
                        </td>
                    </tr>
                </table>
	</form>
	
	<h3><a href="list_questions.jsp">回到试题列表页</a></h3>
	
</center>
</body>
</html>