


<%@page import="org.byau.dao.QuestionDAO"%>






<%
        String id=request.getParameter("questionId");//"3"
        int id1=Integer.parseInt(id);
        %>
 
<%
    //response.setContentType("application/x-json;charset=UTF-8");
     QuestionDAO questionDAO=new QuestionDAO();
        if(questionDAO.del(id1)){
            out.print(1);
        }else{
           out.print(0);
        }
    
    

%>




        

