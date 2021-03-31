<%--
  Created by IntelliJ IDEA.
  User: 32766
  Date: 2020/6/4
  Time: 14:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加商品页面-后台管理系统</title>
    <link href="../../css/admin/layout.css" rel="stylesheet" type="text/css" />
    <link href="../../css/admin/add.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../js/admin/jquery-1.x.js"></script>
    <script type="text/javascript" src="../../js/admin/cascadingMenu.js"></script>
</head>
<body>
<div class="place"><span>位置：</span>
    <ul class="placeul">
        <li><a href="main.html" target="_parent">首页</a></li>
        <li><a href="#">添加商品类型</a></li>
    </ul>
</div>
<div class="formbody">
    <div  class="usual">
        <div class="tabson">
            <form id="addgoodsForm" method="post" action="${pageContext.request.contextPath}/admin/goodsType/add">
                <ul class="forminfo">
                    <li>
                        <label>商品类型名称<b>*</b></label>
                        <input name="typename" id="typename" type="text" class="dfinput" placeholder="请填写商品类型名称"
                               required="required" style="width:500px;"/>
                    </li>
                    <li>
                        <label>发布日期<b>*</b></label>
                        <input name="releaseTime" id="releaseTime" type="date" class="dfinput"  required="required" style="width:180px;"/>
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
