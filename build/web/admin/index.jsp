<%-- 
    Document   : index
    Created on : 2015-11-15, 10:46:17
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%
    String contextPath = request.getContextPath();
%>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <title></title>

            <link rel="stylesheet" href="<%=contextPath%>/css/index.css" type="text/css" media="screen" />


            <script type="text/javascript" src="<%=contextPath%>/js/jquery.min.js"></script>
            <script type="text/javascript" src="<%=contextPath%>/js/tendina.min.js"></script>
            <script type="text/javascript" src="<%=contextPath%>/js/common.js"></script>

    </head>
    <body>
        <!--顶部-->
        <div class="layout_top_header">
            <div style="float: left"><span style="font-size: 16px;line-height: 45px;padding-left: 20px;color: #8d8d8d">管理后台</h1></span></div>
            <div id="ad_setting" class="ad_setting"></div>
        </div>
        <!--顶部结束-->
        <!--菜单-->
        <div class="layout_left_menu">
            <ul id="menu">
                <li class="childUlLi">
                    <a href="#"  target="menuFrame"><i class="glyph-icon icon-home"></i>试题管理</a>
                    <ul>
                        <li><a href="question/listALL.jsp" target="menuFrame">
                                <i class="glyph-icon icon-chevron-right"></i>显示全部记录</a>
                        </li>
                        <li><a href="question/list_Chaxun.jsp" target="menuFrame">
                                <i class="glyph-icon icon-chevron-right"></i>按查询显示记录</a>
                        </li>
                        <li><a href="question/list_Fenye.jsp" target="menuFrame">
                                <i class="glyph-icon icon-chevron-right"></i>按分页显示记录</a>
                        </li>
                        <li><a href="question/list_FenyeChaxun.jsp" target="menuFrame">
                                <i class="glyph-icon icon-chevron-right"></i>按分页和查询显示记录</a>
                        </li>
                        <li><a href="question/batchDelete/list_Questions.jsp" target="menuFrame">
                                <i class="glyph-icon icon-chevron-right"></i>批量删除</a>
                        </li>
                        
                        
                        


                    </ul>
                </li>
                
                 <li class="childUlLi">
                    <a href="#"  target="menuFrame"><i class="glyph-icon icon-home"></i>试题管理MVC模式</a>
                    <ul>
                        <li><a href="questionmvc/QuestionServlet.do?method=selectAll" target="menuFrame">
                                <i class="glyph-icon icon-chevron-right"></i>显示全部记录</a>
                        </li>
                          <li><a href="questionmvc/QuestionServlet.do?method=page" target="menuFrame">
                                <i class="glyph-icon icon-chevron-right"></i>按分页显示记录</a>
                        </li>
                      
                        <li><a href="questionmvc/getJson.jsp" target="menuFrame">
                                <i class="glyph-icon icon-chevron-right"></i>获取Json格式数据</a>
                        </li>
                      
                        
                      
                       
                        <li><a href="questionmvc/QuestionServlet.do?method=batchDelete" target="menuFrame">
                                <i class="glyph-icon icon-chevron-right"></i>批量删除</a>
                        </li>
                        
                        
                        
                        


                    </ul>
                </li>
                <li class="childUlLi">
                    <a href="#"  target="menuFrame"> <i class="glyph-icon icon-reorder"></i>用户管理</a>
                    <ul>
                        <li><a href="password/modifypasswordfirst.jsp" target="menuFrame">
                                <i class="glyph-icon icon-chevron-right"></i>修改密码</a></li>
                                <li><a href="user/upload.html" target="menuFrame">
                                <i class="glyph-icon icon-chevron-right"></i>上传图片</a></li>
                                <li><a href="user/userDetail.jsp" target="menuFrame">
                                <i class="glyph-icon icon-chevron-right"></i>查看个人信息</a></li>
                                
                        <li><a href="log/list.jsp" target="menuFrame">
                                <i class="glyph-icon icon-chevron-right"></i>查看日志</a></li>
                        <li><a href="logout.jsp"><i class="glyph-icon icon-chevron-right"></i>退出登录</a></li>

                    </ul>
                </li>


            </ul>
        </div>
        <!--菜单-->
        <div id="layout_right_content" class="layout_right_content">

            <div class="route_bg">
                <a href="#">主页</a><i class="glyph-icon icon-chevron-right"></i>
                <a href="#">管理</a>
            </div>
            <div class="mian_content">
                <div id="page_content">
                    <iframe id="menuFrame" name="menuFrame" src="welcome.jsp" style="overflow:visible;"
                            scrolling="yes" frameborder="no" width="100%" height="100%"></iframe>
                </div>
            </div>
        </div>
        <div class="layout_footer">
            <p>Copyright ©计算机软件14</p>
        </div>
    </body>
</html>
