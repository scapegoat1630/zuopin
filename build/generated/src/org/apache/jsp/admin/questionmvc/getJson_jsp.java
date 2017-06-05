package org.apache.jsp.admin.questionmvc;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class getJson_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=utf-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write(' ');
      out.write('\n');
   
String path = request.getContextPath();   
String basePath =request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  

      out.write(" \n");
      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">\n");
      out.write("<html> \n");
      out.write("<head> \n");
      out.write("<base href=\"");
      out.print(basePath);
      out.write("\"> \n");
      out.write("<script language=\"javascript\" src=\"");
      out.print(path);
      out.write("/script/jquery-1.4.2.js\"></script>     \n");
      out.write("<script language=\"javascript\">   \n");
      out.write("      \n");
      out.write("$(document).ready(function(){\n");
      out.write("\t$.getJSON(\"QuestionServlet.do\",{method:\"getJson\"},function(data){   \n");
      out.write("       // alert(data.person);\n");
      out.write("        //var dataObj=eval(\"(\"+data+\")\");\n");
      out.write("       \n");
      out.write("      //  alert(list);\n");
      out.write("        $.each(data, function(i, p){   \n");
      out.write("            var row =$(\"#tr\").clone();   \n");
      out.write("           row.find(\"#name\").text(p.name);   \n");
      out.write("           row.find(\"#age\").text(p.age);   \n");
      out.write("           row.find(\"#sex\").text(p.sex);   \n");
      out.write("          \n");
      out.write("           row.appendTo(\"#tbody\");   \n");
      out.write("        });      \n");
      out.write("    });   \n");
      out.write("});\n");
      out.write("</script>\n");
      out.write("\n");
      out.write("</head> \n");
      out.write("<body> \n");
      out.write("\n");
      out.write("<div id=\"dateMessage\">      \n");
      out.write("    <table id=\"planTable\"border=\"1\">      \n");
      out.write("        <tr> \n");
      out.write("           <td>Name</td> \n");
      out.write("           <td>Sex</td> \n");
      out.write("           <td>Age</td> \n");
      out.write("        \n");
      out.write("       </tr>      \n");
      out.write("        <tbody id=\"tbody\"> \n");
      out.write("            <tr id=\"tr\"> \n");
      out.write("               <td id=\"name\"></td> \n");
      out.write("               <td id=\"sex\"></td> \n");
      out.write("               <td id=\"age\"></td> \n");
      out.write("             \n");
      out.write("           </tr>      \n");
      out.write("        </tbody> \n");
      out.write("    </table>      \n");
      out.write("</div> \n");
      out.write("</body> \n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
