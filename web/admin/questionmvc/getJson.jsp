<%@ page language="java" pageEncoding="utf-8"%> 
<%   
String path = request.getContextPath();   
String basePath =request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html> 
<head> 

<script language="javascript" src="<%=path%>/script/jquery-1.4.2.js"></script>     
<script language="javascript">   
      
$(document).ready(function(){
	$.getJSON("QuestionServlet.do",{method:"getJson"},function(data){   
       // alert(data.person);
        //var dataObj=eval("("+data+")");
       
      //  alert(list);
        $.each(data, function(i, p){   
            var row =$("#tr").clone();   
           row.find("#name").text(p.name);   
           row.find("#age").text(p.age);   
           row.find("#sex").text(p.sex);   
          
           row.appendTo("#tbody");   
        });      
    });   
});
</script>

</head> 
<body> 

<div id="dateMessage">      
    <table id="planTable"border="1">      
        <tr> 
           <td>Name</td> 
           <td>Sex</td> 
           <td>Age</td> 
        
       </tr>      
        <tbody id="tbody"> 
            <tr id="tr"> 
               <td id="name"></td> 
               <td id="sex"></td> 
               <td id="age"></td> 
             
           </tr>      
        </tbody> 
    </table>      
</div> 
</body> 
</html>