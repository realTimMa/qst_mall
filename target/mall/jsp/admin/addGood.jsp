<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 32766
  Date: 2020/6/9
  Time: 10:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
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
        <li><a href="#">添加商品</a></li>
    </ul>
</div>
<div class="formbody">
    <div  class="usual">
        <div class="tabson">
            <form id="addgoodsForm" method="post" ENCTYPE="multipart/form-data" action="${pageContext.request.contextPath}/admin/good/save">
                <ul class="forminfo">
                    <li>
                        <label>商品缩略图<b>*</b></label>
                        <input name="picture" id="picture" type="file"  multiple="multiple"/>
                    </li>
                    <li>
                        <label>商品名称<b>*</b></label>
                        <input name="goodName" id="goodName" type="text" class="dfinput" placeholder="请填写商品名称"
                               required="required" style="width:500px;"/>
                    </li>
                    <li>
                        <label>商品类别<b>*</b></label>
                        <div class="vocation">
                            <select class="select3" name="goodsType" id="goodsType">
                                <c:forEach items="${goodsTypeList}" var="goodsType">
                                    <option value="${goodsType.id}">${goodsType.typename}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </li>
                    <li>
                        <label>商品单价<b>*</b></label>
                        <input name="goodPrice" id="goodPrice" class="dfinput" type="number"  required="required"  style="width:100px;"
                               step="1" min="0" onkeyup="this.value= this.value.match(/\d+(\.\d{0,2})?/) ? this.value.match(/\d+(\.\d{0,2})?/)[0] : ''"
                        />元 </li>
                    <li>
                        <label>库存数量<b>*</b></label>
                        <input name="goodStore" id="goodStore" type="number" class="dfinput"  required="required" style="width:100px;"
                               step="1" min="0" onkeyup="this.value= this.value.match(/\d+(\.\d{0,2})?/) ? this.value.match(/\d+(\.\d{0,2})?/)[0] : ''"
                        />
                        件 </li>
                    <li>
                        <label>商品详情<b>*</b></label>
                        <textarea name="detail" rows="3" id="content"  style="width:500px;height:100px;"></textarea>
                    </li>
                    <li>  <label>&nbsp;</label>
                        <input type="submit" class="btn" id="btnPublish" value="添加"/>
                    </li>
                </ul>
            </form>
        </div>
    </div>
</div>
</body>
</html>