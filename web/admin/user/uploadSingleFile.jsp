
<%@page contentType="text/html; charset=gb2312" %>
<%@page import="java.io.*"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<%@page  import="org.byau.dao.UserDAO" %>
<%@page  import="java.util.*" %>

<%
//�ļ��ϴ��󣬱�������Ŀ�е�upload
    String saveDirectory = application.getRealPath("/") + "upload";
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();

    int maxPostSize = 15 * 1024 * 1024;

    MultipartRequest multi = new MultipartRequest(request, saveDirectory,
            maxPostSize, "GBK");



//MuitipartRequest muiti=new MultipartRequest();
    File file = multi.getFile("file1");
    String fileName = file.getName();
    
    out.println(fileName);
    String accessPath = basePath + "/upload/" + fileName;
%>


<%

    String userID = (String) session.getAttribute("userid");
    UserDAO userDAO = new UserDAO();
    if (userDAO.updatePhoto(userID, accessPath)) {

        out.println("�޸ĳɹ�");
    } else {
        out.println("�޸�ʧ��");
    }
%>