package org.apache.jsp.admin.question;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import org.byau.dao.QuestionDAO;
import org.byau.bean.Question;
import java.sql.*;

public final class listALL_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

    String contextPath = request.getContextPath();

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        <script type=\"text/javascript\" src=\"");
      out.print(contextPath);
      out.write("/script/jquery-1.4.2.js\"></script>\n");
      out.write("        <script>\n");
      out.write("            function delAjax(Id) {\n");
      out.write("                if (confirm(\"确定该用户操作\" + Id + \"吗？\"))\n");
      out.write("                {\n");
      out.write("                    var param = {questionId: Id};\n");
      out.write("                    $.get(\"deleteAjax.jsp\", param,\n");
      out.write("                            function (data) {\n");
      out.write("                                //var result = data.result;\n");
      out.write("                                if (data == 1)\n");
      out.write("                                {\n");
      out.write("                                    alert(\"操作成功\");\n");
      out.write("                                    $(\"#\" + Id).remove();\n");
      out.write("                                } else if (data ==0)\n");
      out.write("                                {\n");
      out.write("                                    alert(\"删除失败。\");\n");
      out.write("                                }\n");
      out.write("                            });\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("             function del(id) {\n");
      out.write("                if (confirm(\"你确定要删除吗\") == true) {\n");
      out.write("                    window.location = \"delete.jsp?questionId=\" + id;\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("            function toexcel() {\n");
      out.write("                window.location = \"list_toexcel.jsp\";\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("        <style type=\"text/css\">\n");
      out.write("            .style1{\n");
      out.write("                width: 1000px;\n");
      out.write("                margin: 0px;\n");
      out.write("                margin-bottom:20px;\n");
      out.write("                border:1px solid #96C2F1;\n");
      out.write("                background-color: #EFF7FF;\n");
      out.write("                border-collapse:collapse\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .style1 td{\n");
      out.write("                border:1px solid #000000;\n");
      out.write("                /*border-collapse:collapse ;*/\n");
      out.write("            }\n");
      out.write("            .style1 th {\n");
      out.write("                border:1px solid #000000;\n");
      out.write("                background-color: #0099CC;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <a href=\"insert.jsp\">添加题目</a>\n");
      out.write("        <a href=\"importquestion/upload.html\">导入题目</a>\n");
      out.write("        <input type=\"button\" value=\"导出到excel\" onclick=\"toexcel()\">\n");
      out.write("        <h1>试题数据</h1>\n");
      out.write("      <table border=\"1\" class=\"style1\" >\n");
      out.write("            <tr>\n");
      out.write("                <th>编号</th>\n");
      out.write("                <th>题目</th>\n");
      out.write("                <th>选项1</th>\n");
      out.write("                <th>选项2</th>\n");
      out.write("                <th>选项3</th>\n");
      out.write("                <th>选项4</th>\n");
      out.write("                <th>答案</th>\n");
      out.write("                <th colspan=\"3\">操作</th>\n");
      out.write("            </tr>\n");
      out.write("            ");

                QuestionDAO sdao = new QuestionDAO();
                ArrayList<Question> list = sdao.ListAll();
                //多条记录用while循环
                for (Question s : list) {
            
      out.write("\n");
      out.write("\n");
      out.write("            <tr id=\"");
      out.print(s.getQuestionId());
      out.write("\" >\n");
      out.write("                <td>\n");
      out.write("                    ");
      out.print(s.getQuestionId());
      out.write("\n");
      out.write("                </td>\n");
      out.write("                <td>\n");
      out.write("                    ");
      out.print(s.getSubject());
      out.write("\n");
      out.write("                </td>\n");
      out.write("                <td>\n");
      out.write("                    ");
      out.print(s.getChoiceA());
      out.write("\n");
      out.write("                </td>\n");
      out.write("\n");
      out.write("                <td>\n");
      out.write("                    ");
      out.print(s.getChoiceB());
      out.write("\n");
      out.write("                </td>\n");
      out.write("                <td>\n");
      out.write("                    ");
      out.print(s.getChoiceC());
      out.write("\n");
      out.write("                </td>\n");
      out.write("                <td>\n");
      out.write("                    ");
      out.print(s.getChoiceD());
      out.write("\n");
      out.write("                </td>\n");
      out.write("                <td>\n");
      out.write("                    ");
      out.print(s.getAnswer());
      out.write("\n");
      out.write("                </td>\n");
      out.write("                <td>\n");
      out.write("\n");
      out.write("                    <a href=\"update.jsp?questionId=");
      out.print(s.getQuestionId());
      out.write("\">更新</a>  \n");
      out.write("                </td>\n");
      out.write("                <td>\n");
      out.write("                    <a href=\"javascript:delAjax(");
      out.print(s.getQuestionId());
      out.write(")\">ajax删除</a>\n");
      out.write("                  \n");
      out.write("                </td>\n");
      out.write("                 <td>\n");
      out.write("                 \n");
      out.write("                    <input type=\"button\" onclick=\"del(");
      out.print(s.getQuestionId());
      out.write(")\" value=\"删除\">\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("            ");

                }
            
      out.write("\n");
      out.write("        </table>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
