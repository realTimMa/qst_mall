<%--
  Created by IntelliJ IDEA.
  User: 32766
  Date: 2020/6/5
  Time: 15:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>欢迎登录后台管理系统</title>
    <link href="${pageContext.request.contextPath}/css/admin/login.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript" src="${pageContext.request.contextPath}/js/admin/jquery-3.1.1.min.js"></script>
    <script language="JavaScript" src="${pageContext.request.contextPath}/js/admin/jquery.cookie.js"></script>
    <script language="JavaScript" src="${pageContext.request.contextPath}/js/admin/login.js"></script>
</head>
<body style="background-color:#1c77ac; background-image:url(../images/admin/light.png); background-repeat:no-repeat; background-position:center top;">
<div class="logintop"> <span>您好，欢迎登录前台管理界面平台</span>
    <ul>
        <li><a href="${pageContext.request.contextPath}/mall/toIndex">回首页</a></li>
        <li><a href="#">帮助</a></li>
        <li><a href="#">关于</a></li>
    </ul>
</div>
<div class="loginbody"> <span class="systemlogo"></span>
    <div class="loginbox">
        <form action="${pageContext.request.contextPath}/mall/login" method="post">
            <ul>
                <li>
                    <input name="phone" type="text" class="loginuser" id="phone" required="required" />
                    <label id="phoneLable"></label>
                </li>
                <li>
                    <input name="password" type="password" class="loginpwd" id="password" required="required" />
                    <label id="passwordLable"></label>
                </li>
                <li>
                    <input  type="submit" class="loginbtn" value="登录"   />
                    <label id="che">
                        <input name="check1" type="checkbox" id="check1" checked="checked" onclick="check()"/>
                        记住密码</label>
                    <label><a href="#">忘记密码？</a></label>
                </li>
                <li>${errorMsg1}</li>
            </ul>
        </form>
    </div>
</div>
<div class="loginbm">Copyright  2015-2020  Q- Walking Fashion E&S 漫步时尚广场（QST教育）版权所有</div>
</body>
</html>
