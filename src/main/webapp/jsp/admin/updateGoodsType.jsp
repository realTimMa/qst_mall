<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2020/6/4
  Time: 14:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加商品页面-后台管理系统</title>
    <link href="${pageContext.request.contextPath}/css/admin/layout.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/admin/add.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/admin/jquery-1.x.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/admin/cascadingMenu.js"></script>
</head>
<body>
<div class="place"><span>位置：</span>
    <ul class="placeul">
        <li><a href="main.html" target="_parent">首页</a></li>
        <li><a href="#">修改商品类型</a></li>
    </ul>
</div>
<div class="formbody">
    <div  class="usual">
        <div class="tabson">
            <form id="addgoodsForm" method="post" action="${pageContext.request.contextPath}/admin/goodsType/update">
                <input type="hidden" name="id" value="${goodsType.id}">
                <ul class="forminfo">
                    <li>
                        <label>商品类型名称<b>*</b></label>
                        <input name="typename" id="typename" type="text" class="dfinput"  value="${goodsType.typename}"
                               required="required" style="width:500px;"/>
                    </li>
                    <li>
                        <label>发布日期<b>*</b></label>
                        <input name="releaseTime" id="releaseTime" type="date"
                               value="<fmt:formatDate value="${goodsType.releaseTime}" pattern="yyyy-MM-dd"/>"
                               class="dfinput"  required="required" style="width:180px;"/>
                    </li>
                    <li>
                        <label>是否审核<b>*</b></label>
                        <div class="vocation">
                            <select class="select3" name="auditStatus" id="isChecked">
                                <option value="1">已审核</option>
                                <option value="0">未审核</option>
                            </select>
                        </div>
                    </li>
                    <li>  <label>&nbsp;</label>
                        <input type="submit" class="btn" id="btnPublish" value="保存"/>
                    </li>
                </ul>
            </form>
        </div>
    </div>
</div>
</body>
</html>
