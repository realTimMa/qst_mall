<%--
  Created by IntelliJ IDEA.
  User: 32766
  Date: 2020/6/3
  Time: 14:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html><%--html5的标记--%>
<html>
<head>
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/css/admin/layout.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/admin/top.css" rel="stylesheet" type="text/css" />
</head>
<body style="background:url(../../images/admin/topbg.gif) repeat-x;">
<div class="topleft"> <a href="../index.html" target="_parent"><img src="../../images/admin/logo.png" title="系统首页" /></a> </div>
<ul class="nav">
    <li><a href="${pageContext.request.contextPath}/mall/toIndex" target="_parent" class="selected"><img  src="../../images/admin/globe.png"title="网站前台" />
        <h2>网站前台</h2>
    </a></li>
    <li><a href="${pageContext.request.contextPath}/admin/toIndex"  target="rightFrame"><img src="../../images/admin/home.png"  title="后台首页" />
        <h2>后台首页</h2>
    </a></li>
   <%-- <li><a href="" target="rightFrame"><img src="../../images/admin/shop.png" title="添加商品" />
        <h2>添加商品</h2>
    </a></li>--%>
</ul>
<div class="topright">
    <ul>
        <li><span><img src="../../images/admin/help.png" title="帮助"  class="helpimg"/></span><a href="#">帮助</a></li>
        <li><a href="#">关于</a></li>
        <li><a href="login.html" target="_parent">退出</a></li>
    </ul>
    <div class="user"><span>${sessionScope.loginUser}</span> <i>消息</i> <b>5</b> </div>
</div>
</body>
</html>
