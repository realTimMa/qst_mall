<%--
  Created by IntelliJ IDEA.
  User: wuxd
  Date: 2020/6/2
  Time: 14:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html><%--html5的标记--%>
<html>
<head>
    <title>后台管理首页</title>
</head>
<body style="margin: 0;padding: 0">
<%--<frameset rows="88,*" cols="*" frameborder="no" border="0" framespacing="0">
    <frame src="top.html" name="topFrame" scrolling="no" noresize="noresize"
           id="topFrame" title="topFrame" />
    <frameset cols="187,*" frameborder="no" border="0" framespacing="0">
        <frame src="left.html" name="leftFrame" scrolling="no" noresize="noresize"
               id="leftFrame" title="leftFrame" />
        <frame src="shoplist.html" name="rightFrame" id="rightFrame"
               title="rightFrame" />
    </frameset>
</frameset>--%>
<div>
    <iframe src="${pageContext.request.contextPath}/jsp/admin/top.jsp"
            name="topFrame" scrolling="no" width="100%" frameborder="no" height="88px"></iframe>
</div>
<div style="float: left">
    <iframe src="${pageContext.request.contextPath}/jsp/admin/left.jsp"
            name="leftFrame" scrolling="no" frameborder="no" width="186px" height="634px"></iframe>
</div>
<div style="overflow: hidden">
    <iframe src="${pageContext.request.contextPath}/jsp/admin/index.jsp"
            name="rightFrame" scrolling="no" frameborder="no" width="100%" height="634px"></iframe>
</div>

</body>
</html>
