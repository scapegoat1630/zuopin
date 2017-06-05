<%@page import="org.byau.dao.QuestionDAO"%>
<%@page import="org.byau.util.RandomFileRenamePolicy"%>
<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html; charset=UTF-8" %>
<%@page import="java.io.*"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%
String saveDirectory = application.getRealPath("/") + "upload";

int maxPostSize =15 * 1024 * 1024 ;
//实现上传，就这一句就完成上传了
//MultipartRequest请求对象可以获取前一个页面传来的文件。
RandomFileRenamePolicy rfrp=new RandomFileRenamePolicy();
//MultipartRequest request1 = new MultipartRequest(request, saveDirectory, 
  //      maxPostSize,"GBK");

MultipartRequest request1 = new MultipartRequest(request, saveDirectory, 
        maxPostSize,"GBK",rfrp);

File f1=request1.getFile("file1");
String f2=f1.getName();

out.println(f2+"上传成功");
QuestionDAO qdao=new QuestionDAO();
qdao.importQuestionFromExcel2(f1);
%>