package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html;charset=gbk");
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
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title></title>\n");
      out.write("        <Script language=\"javascript\">\n");
      out.write("            function check() {\n");
      out.write("                if (myform.userId.value == \"\") {\n");
      out.write("                    alert(\"请输入用户名!\");\n");
      out.write("                    myform.userId.focus();\n");
      out.write("                    return;\n");
      out.write("                }\n");
      out.write("                if (myform.password.value == \"\") {\n");
      out.write("                    alert(\"请输入密码\");\n");
      out.write("                    myform.password.focus();\n");
      out.write("                    return;\n");
      out.write("                }\n");
      out.write("                myform.submit();\n");
      out.write("            }\n");
      out.write("//更换验证码\n");
      out.write("            function changeVerifyCode() {\n");
      out.write("\n");
      out.write("                //1、如果用<iframe>实现，则重新加载<iframe>的内容\n");
      out.write("                //verifyCodeFrame.location.reload();\n");
      out.write("\n");
      out.write("                //2、如果用<img>实现，则修改<img src=url>的url\n");
      out.write("                //这里有一个小技巧，如果给url赋相同的值，浏览器不会重新发出请求，因此用js生成一个即时毫秒数做url中的参数\n");
      out.write("                //t=new Date().getTime();\n");
      out.write("                document.myform.verifyCodeImg.src = \"image.jsp\";\n");
      out.write("            }\n");
      out.write("\n");
      out.write("        </Script>\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("    <body onload=\"javascript:myform.userId.focus()\"  background=\"\">\n");
      out.write("\n");
      out.write("\n");
      out.write("        <form action=\"check.jsp\" method=\"post\" name=\"myform\">\n");
      out.write("            <div align=\"center\">\n");
      out.write("                <table width=\"777\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"\n");
      out.write("                       bgcolor=\"#FFFFFF\" style=\"border: 2px solid #008000; padding: 0px\">\n");
      out.write("                    <tr>\n");
      out.write("                        <td  colspan=\"3\" height=\"162\" align=\"justify\" valign=\"bottom\"\n");
      out.write("                             background=\"images/bg.jpg\"\n");
      out.write("                             style=\"border-bottom: 1px solid #008000; padding: 0\">\n");
      out.write("                        </td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td height=\"50\">\n");
      out.write("\n");
      out.write("                        </td>\n");
      out.write("                    </tr>\n");
      out.write("\n");
      out.write("\n");
      out.write("                    <tr>\n");
      out.write("                        <td align=\"right\">用户名：</td>\n");
      out.write("                        <td><input type=\"text\" name=\"userId\" value=\"admin\"></td>\n");
      out.write("                    </tr>\n");
      out.write("\n");
      out.write("                    <tr>\n");
      out.write("                        <td align=\"right\">\t密码:</td>\n");
      out.write("                        <td><input type=\"password\" name=\"password\" value=\"1\"></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr><td align=\"right\">验证码：</td><td><input name=\"verifyCode\" style=\"height:29px;width:70px;font-size:25px\"/>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                            <!-- 采用<img>实现 -->\n");
      out.write("\n");
      out.write("                            <img name=\"verifyCodeImg\" src=\"image.jsp\">\n");
      out.write("                            <a href=\"javascript:changeVerifyCode()\">看不清？</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n");
      out.write("                        </td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>\n");
      out.write("                            <input type=\"button\" name=\"sub\" value=\"登陆\" onclick=\"check()\">\n");
      out.write("                        </td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>\n");
      out.write("                            ");

                            //null
                                String userNamePasswordLevelError = request.getParameter("userNamePasswordLevelError");
                                if (userNamePasswordLevelError != null) {
                                    out.println("<font color=\"red\">用户名或密码错误");
                                }
                                String VadalitionError = request.getParameter("VadalitionError");
                                if (VadalitionError != null) {
                                    out.println("<font color=\"red\">验证码错误");
                                }
                            
      out.write("\n");
      out.write("\n");
      out.write("                        </td>\n");
      out.write("                    </tr>\n");
      out.write("                </table>\n");
      out.write("                <table width=\"777\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"\n");
      out.write("                       bgcolor=\"#FFFFFF\" style=\"border: 2px solid #008000; padding: 0px\">\n");
      out.write("\n");
      out.write("                    <tr bgcolor=\"#999999\">\n");
      out.write("                        <td height=\"52\">\n");
      out.write("                            <div align=\"center\" style=\"font: 9pt\">\n");
      out.write("                                All Rights Reserved.\n");
      out.write("                                <br>\n");
      out.write("                                版权没有 Copyright@2017\n");
      out.write("                                <BR>\n");
      out.write("\n");
      out.write("                                如有任何问题和建议，\n");
      out.write("                                <A href=\"mailto:taijh999@163.com\">请E-mail to me</A>！\n");
      out.write("                                <BR>\n");
      out.write("                                建议您使用1024*768分辨率，IE6.0以上版本浏览本站!\n");
      out.write("                            </div>\n");
      out.write("                        </td>\n");
      out.write("                    </tr>\n");
      out.write("                </table>\n");
      out.write("            </div>\n");
      out.write("        </form>\n");
      out.write("    </body>\n");
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
