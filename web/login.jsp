<%@page contentType="text/html;charset=gbk"  %>
<html>
    <head>
        <title></title>
        <Script language="javascript">
            function check() {
                if (myform.userId.value == "") {
                    alert("请输入用户名!");
                    myform.userId.focus();
                    return;
                }
                if (myform.password.value == "") {
                    alert("请输入密码");
                    myform.password.focus();
                    return;
                }
                myform.submit();
            }
//更换验证码
            function changeVerifyCode() {

                //1、如果用<iframe>实现，则重新加载<iframe>的内容
                //verifyCodeFrame.location.reload();

                //2、如果用<img>实现，则修改<img src=url>的url
                //这里有一个小技巧，如果给url赋相同的值，浏览器不会重新发出请求，因此用js生成一个即时毫秒数做url中的参数
                //t=new Date().getTime();
                document.myform.verifyCodeImg.src = "image.jsp";
            }

        </Script>
    </head>

    <body onload="javascript:myform.userId.focus()"  background="">


        <form action="check.jsp" method="post" name="myform">
            <div align="center">
                <table width="777" border="0" cellpadding="0" cellspacing="0"
                       bgcolor="#FFFFFF" style="border: 2px solid #008000; padding: 0px">
                    <tr>
                        <td  colspan="3" height="162" align="justify" valign="bottom"
                             background="images/bg.jpg"
                             style="border-bottom: 1px solid #008000; padding: 0">
                        </td>
                    </tr>
                    <tr>
                        <td height="50">

                        </td>
                    </tr>


                    <tr>
                        <td align="right">用户名：</td>
                        <td><input type="text" name="userId" value="admin"></td>
                    </tr>

                    <tr>
                        <td align="right">	密码:</td>
                        <td><input type="password" name="password" value="1"></td>
                    </tr>
                    <tr><td align="right">验证码：</td><td><input name="verifyCode" style="height:29px;width:70px;font-size:25px"/>




                            <!-- 采用<img>实现 -->

                            <img name="verifyCodeImg" src="image.jsp">
                            <a href="javascript:changeVerifyCode()">看不清？</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="button" name="sub" value="登陆" onclick="check()">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <%
                            //null
                                String userNamePasswordLevelError = request.getParameter("userNamePasswordLevelError");
                                if (userNamePasswordLevelError != null) {
                                    out.println("<font color=\"red\">用户名或密码错误");
                                }
                                String VadalitionError = request.getParameter("VadalitionError");
                                if (VadalitionError != null) {
                                    out.println("<font color=\"red\">验证码错误");
                                }
                            %>

                        </td>
                    </tr>
                </table>
                <table width="777" border="0" cellpadding="0" cellspacing="0"
                       bgcolor="#FFFFFF" style="border: 2px solid #008000; padding: 0px">

                    <tr bgcolor="#999999">
                        <td height="52">
                            <div align="center" style="font: 9pt">
                                All Rights Reserved.
                                <br>
                                版权没有 Copyright@2017
                                <BR>

                                如有任何问题和建议，
                                <A href="mailto:taijh999@163.com">请E-mail to me</A>！
                                <BR>
                                建议您使用1024*768分辨率，IE6.0以上版本浏览本站!
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </form>
    </body>
</html>