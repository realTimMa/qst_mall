<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2020/6/3
  Time: 14:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/css/admin/left.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript" src="${pageContext.request.contextPath}/js/admin/jquery-1.x.js"></script>
    <script type="text/javascript">
        $(function(){
            //导航切换
            $(".menuson li").click(function(){
                $(".menuson li.active").removeClass("active")
                $(this).addClass("active");
            });

            $('.title').click(function(){
                var $ul = $(this).next('ul');
                $('dd').find('ul').slideUp();
                if($ul.is(':visible')){
                    $(this).next('ul').slideUp();
                }else{
                    $(this).next('ul').slideDown();
                }
            });
        })
    </script>
</head>
<body style="background:#f0f9fd;">
<div class="lefttop"><span></span>功能菜单</div>
<dl class="leftmenu">
    <dd>
        <div class="title"> <span><img src="../../images/admin/leftico05.png" /></span>购物后台管理 </div>
        <ul class="menuson">
            <li class="active"><cite></cite><a href="${pageContext.request.contextPath}/admin/good/list" target="rightFrame">商品列表</a><i></i></li>
            <li><cite></cite><a href="${pageContext.request.contextPath}/admin/goodsType/list" target="rightFrame">商品类型</a><i></i></li>
        </ul>
    </dd>

    <dd>
        <div class="title"><span><img src="../../images/admin/leftico04.png" /></span>订单管理</div>
        <ul class="menuson">
            <li><cite></cite><a href="#">最新订单</a><i></i></li>
            <li><cite></cite><a href="#">已处理订单</a><i></i></li>
            <li><cite></cite><a href="#">取消订单</a><i></i></li>
        </ul>
    </dd>
    <dd>
        <div class="title"><span><img src="../../images/admin/leftico08.png" /></span>修改密码</div>
    </dd>
</dl>

</body>
</html>
