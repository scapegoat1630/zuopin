<%@page contentType="text/html;charset=gbk"  %>
<html>
    <head>
        <title></title>
        <Script language="javascript">
            function check() {
                if (myform.userId.value == "") {
                    alert("�������û���!");
                    myform.userId.focus();
                    return;
                }
                if (myform.password.value == "") {
                    alert("����������");
                    myform.password.focus();
                    return;
                }
                myform.submit();
            }
//������֤��
            function changeVerifyCode() {

                //1�������<iframe>ʵ�֣������¼���<iframe>������
                //verifyCodeFrame.location.reload();

                //2�������<img>ʵ�֣����޸�<img src=url>��url
                //������һ��С���ɣ������url����ͬ��ֵ��������������·������������js����һ����ʱ��������url�еĲ���
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
                        <td align="right">�û�����</td>
                        <td><input type="text" name="userId" value="admin"></td>
                    </tr>

                    <tr>
                        <td align="right">	����:</td>
                        <td><input type="password" name="password" value="1"></td>
                    </tr>
                    <tr><td align="right">��֤�룺</td><td><input name="verifyCode" style="height:29px;width:70px;font-size:25px"/>




                            <!-- ����<img>ʵ�� -->

                            <img name="verifyCodeImg" src="image.jsp">
                            <a href="javascript:changeVerifyCode()">�����壿</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="button" name="sub" value="��½" onclick="check()">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <%
                            //null
                                String userNamePasswordLevelError = request.getParameter("userNamePasswordLevelError");
                                if (userNamePasswordLevelError != null) {
                                    out.println("<font color=\"red\">�û������������");
                                }
                                String VadalitionError = request.getParameter("VadalitionError");
                                if (VadalitionError != null) {
                                    out.println("<font color=\"red\">��֤�����");
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
                                ��Ȩû�� Copyright@2017
                                <BR>

                                �����κ�����ͽ��飬
                                <A href="mailto:taijh999@163.com">��E-mail to me</A>��
                                <BR>
                                ������ʹ��1024*768�ֱ��ʣ�IE6.0���ϰ汾�����վ!
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </form>
    </body>
</html>