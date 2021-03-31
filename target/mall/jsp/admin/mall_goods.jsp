<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 32766
  Date: 2020/6/8
  Time: 14:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/css/admin/layout.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/admin/list.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/admin/jquery-1.x.js"></script>
</head>
<body>
<div class="place"> <span>位置：</span>
    <ul class="placeul">
        <li><a href="${pageContext.request.contextPath}/admin/toMain" target="_parent">首页</a></li>
        <li><a href="#">购物后台管理</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/good/list" target="_self">商品列表</a></li>
    </ul>
    <div class="date_text"><img src="../../images/admin/leftico04.png">&nbsp;今天是2015年2月10日 星期一 12：00</div>
</div>
<div class="rightinfo">
    <div class="tools">
        <ul class="toolbar">
            <li id="add" ><span><img src="../../images/admin/t01.png" /></span>添加</li>
            <li id="update"><span><img src="../../images/admin/t02.png" /></span>修改</li>
            <li id="delete" class="click"><span><img src="../../images/admin/t03.png" /></span>删除</li>
            <li><a href="jqueryChart.html"><span><img src="../../images/admin/t04.png" /></span>统计</a></li>
            <li><span><img src="../../images/admin/t05.png" /></span>设置</li>
        </ul>
        <div style="width: 400px;height: 42px;">
            <form method="post" action="${pageContext.request.contextPath}/admin/good/search">
            <ul class="seachform">
                <li>
                    <div class="vocation">
                        <select class="select3" name="goodsType">
                            <option value="">所有类型</option>
                            <c:forEach items="${goodsTypeList}" var="goodsType">
                                <option value="${goodsType.id}">${goodsType.typename}</option>
                            </c:forEach>
                        </select>
                    </div>
                </li>
                <li>
                    <input type="text" name="keyword" class="scinput" placeholder="请输入商品名称"/>
                </li>
                <li>
                    <input name="searchBtn" type="submit" class="scbtn" value="查询"/>
                </li>
            </ul>
            </form>
        </div>


    </div>
    <table class="tablelist">
        <thead>
        <tr>
            <th><input name="checkAll" type="checkbox" id="checkAll" onchange="selectAll()"/>全选

            </th>
            <th>缩略图</th>
            <th>商品名称</th>
            <th>库存数量(件）</th>
            <th>销售数量(件）</th>
            <th>单价（元）</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="good" items="${goodList}">
            <tr>
                <td><input name="checkItem" type="checkbox" value="${good.id}" /></td>
                <td class="imgtd"><img src="${pageContext.request.contextPath}${good.picture}" height="60px" width="80px"/></td><%--src="/good-img/img06.png"  --%>
                <td>${good.goodName}</td>
                <td>${good.goodStore}</td>
                <td>${good.saleNum}</td>
                <td>¥${good.goodPrice}</td>
                <td><a href="#" class="tablelink">查看详情</a>

            </tr>
        </c:forEach>
        </tbody>
    </table>
    <script type="text/javascript">
        function selectAll(){
            var items=$("[name='checkItem']");
            var checkAll=$("#checkAll");
            $("#checkOther").prop("checked",false);
            for(var i=0;i<items.length;i++){
                $(items[i]).prop("checked",checkAll.prop("checked"));
            }
        }
        function selectOther(){
            var items=$("[name='checkItem']");
            $("#checkAll").prop("checked",false);
            for(var i=0;i<items.length;i++){
                $(items[i]).prop("checked",!$(items[i]).prop("checked"));
            }
        }
    </script>
    <div class="pagin">
        <div class="message">共<i class="blue">1256</i>条记录，当前显示第&nbsp;<i class="blue">1&nbsp;</i>页</div>
        <ul class="paginList">
            <li class="paginItem"><a href="#"><span class="pagepre"></span></a></li>
            <li class="paginItem"><a href="#">1</a></li>
            <li class="paginItem current"><a href="#">2</a></li>
            <li class="paginItem"><a href="#">3</a></li>
            <li class="paginItem"><a href="#">4</a></li>
            <li class="paginItem"><a href="#">5</a></li>
            <li class="paginItem more"><a href="#">...</a></li>
            <li class="paginItem"><a href="#">10</a></li>
            <li class="paginItem"><a href="#"><span class="pagenxt"></span></a></li>
        </ul>
    </div>
</div>
<script>
    $("#add").on("click",function () {
        location.href='${pageContext.request.contextPath}/admin/good/edit'
    })
    $("#update").on("click",function () {
        var id=    $("input[name=checkItem]:checked:first").val();
        if(id==undefined||id==null){
            alert("请选择商品");
        }else{
            var href="${pageContext.request.contextPath}/admin/good/info/"+id;
            location.href=href;
        }
    })

    $("#delete").on("click",function () {
        var ids=[];
        $("input[name=checkItem]:checked").each(function () {
            ids.push($(this).val());
        })
        if(ids.length<1)
        {
            alert("请选择商品")
        }else{
            var href="${pageContext.request.contextPath}/admin/good/delete/"+ids;
            location.href=href;
        }
    })
</script>
</body>
</html>
