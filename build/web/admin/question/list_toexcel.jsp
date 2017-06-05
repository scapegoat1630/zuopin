<%-- 
    Document   : list_ketitoexcel
    Created on : 2010-8-7, 17:26:00
    Author     : tai
--%>


<%@page import="org.byau.dao.QuestionDAO"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.*"%>


<%@ page import="org.apache.poi.hssf.usermodel.*"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
         response.setContentType("application/vnd.ms-excel");
         response.setHeader("Content-disposition",
                "attachment;filename=" + "data.xls");
         ServletOutputStream out1 = response.getOutputStream();
         out1.flush();

         QuestionDAO dao=new QuestionDAO();
       
         HSSFWorkbook wb2 =dao.getWorkBook();
         wb2.write(out1);
        %>
    </body>
</html>
