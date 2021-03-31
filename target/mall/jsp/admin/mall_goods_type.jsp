<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 32766
  Date: 2020/6/3
  Time: 15:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <title>商品类型-后台管理</title>
    <link href="${pageContext.request.contextPath}/css/admin/layout.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/admin/list.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/admin/jquery-1.x.js"></script>
</head>
<body>
<div class="place"> <span>位置：</span>
    <ul class="placeul">
        <li><a href="${pageContext.request.contextPath}/admin/toMain" target="_parent">首页</a></li>
        <li><a href="#">购物后台管理</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/goodsType/list">商品类型</a></li>
    </ul>
    <div class="date_text"><img src="../../images/admin/leftico04.png">&nbsp;今天是2015年2月10日 星期一 12：00</div>
</div>
<div class="rightinfo">
    <div class="tools">
        <ul class="toolbar">
            <li >
                <a href="${pageContext.request.contextPath}/jsp/admin/addGoodsType.jsp">
                    <span><img src="../../images/admin/t01.png" /></span>添加
                </a>
            </li>
            <li id="update"><span><img src="../../images/admin/t02.png" /></span>修改</li>
            <li class="click" id="delete"><span><img src="../../images/admin/t03.png" /></span>删除</li>
            <li><a href="jqueryChart.html"><span><img src="../../images/admin/t04.png" /></span>统计</a></li>
            <li><span><img src="../../images/admin/t05.png" /></span>设置</li>
        </ul>

    </div>
    <table class="tablelist">
        <thead>
        <tr>
            <th><input name="checkAll" type="checkbox" id="checkAll" onchange="selectAll()"/>全选
            </th>
            <th>类型名称</th>
            <th>发布时间</th>
            <th>是否审核</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${goodTypeList}" var="goodsType">
            <tr>
                <td><input name="checkItem" type="checkbox" value="${goodsType.id}" /></td>
                <td>${goodsType.typename}</td>
                <td>
                    <fmt:formatDate value="${goodsType.releaseTime}" pattern="yyyy-MM-dd"/>

                </td>
                <td>
                    <c:if test="${goodsType.auditStatus==0}">未审核</c:if>
                    <c:if test="${goodsType.auditStatus!=0}">已审核</c:if>
                </td>
                <td>
                    <c:if test="${goodsType.auditStatus==0}">
                        <a href="${pageContext.request.contextPath}/admin/goodsType/audit/approved/${goodsType.id}" class="tablelink">审核通过</a>
                    </c:if>
                    <c:if test="${goodsType.auditStatus!=0}">
                        <a href="${pageContext.request.contextPath}/admin/goodsType/audit/cancel/${goodsType.id}" class="tablelink">取消审核</a>
                    </c:if>
                </td>
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
        <div class="message">共<i class="blue">1256</i>条记录，当前显示第&nbsp;<i class="blue">2&nbsp;</i>页</div>
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
    <script>
        $("#update").on("click",function () {
        var id=    $("input[name=checkItem]:checked:first").val();
            if(id==undefined||id==null){
                alert("请选择商品类型");
            }else{
                var href="${pageContext.request.contextPath}/admin/goodsType/info/"+id;
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
                alert("请选择商品类型")
            }else{
                var href="${pageContext.request.contextPath}/admin/goodsType/delete/"+ids;
                location.href=href;
            }
        })
    </script>
</div>
</body>
</html>
