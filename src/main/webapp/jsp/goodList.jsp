<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 32766
  Date: 2020/6/12
  Time: 15:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <title>漫步时尚广场-购物列表</title>
    <link href="${pageContext.request.contextPath}/css/show.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/shoppingCart.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/hotAdvise.js"></script>
</head>
<body>
<!--顶部区域 start-->
<div class="top_bg">
    <div class="top_content">
        <div class="floatl"><img src="../images/star.jpg">收藏 | HI，欢迎来订购 ！
            <c:if test="${sessionScope.UserRealName==null}">
                <a href="${pageContext.request.contextPath}/jsp/login.jsp" class="orange">[请登录]</a>
                <a href="${pageContext.request.contextPath}/jsp/register.jsp"  class="orange"> [免费注册]</a>
            </c:if>
            <c:if test="${sessionScope.UserRealName!=null}">${sessionScope.UserRealName}</c:if>
        </div>
        <div class="floatr">客户服务<img src="../images/arrow.gif">&nbsp;网站导航<img src="../images/arrow.gif">&nbsp;
            <div class="xl">
                <!--购物车-->
                <div class="droparrow" onclick="showCar()"><span class="shopcart"></span>我的购物车
                    <span class="orange">0</span>件<img src="../images/arrow.gif"/></div>
                <!--下拉菜单-->
                <div class="dropdown" id="dropdown" style="display: none"
                     ondrop="drop(event)" ondragover="allowDrop(event)">

                    <ul class="shop_pic">

                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!--顶部区域 end-->
<div class="clear"></div>
<!--logo和banner start-->
<div class="logo"><a href="${pageContext.request.contextPath}/mall/toIndex"><img src="../images/logo.jpg" ></a><img src="../images/banner.jpg" class="floatr "></div>
<!--logo和banner  end-->

<!--菜单导航栏 start-->
<div class="nav_bg">
    <div class="nav_content">
        <ul class="nav">
            <li ><a href="${pageContext.request.contextPath}/mall/toIndex" class="white">首页</a></li>
            <li class="nav_active" ><a href="shoppingShow.html"  class="white">最新上架</a></li>
            <li>品牌活动</li>
            <li>原厂直供</li>
            <li>团购</li>
            <li>限时抢购</li>
            <li>促销打折</li>
        </ul>
    </div>
</div>
<!--菜单导航栏 end-->
<!--中间部分 start-->
<div class="main">
    <!--购物分类 start-->
    <ul class="menu">
        <c:forEach items="${goodsTypeList}" var="goodType">
            <li>
                    <span class="red_dot"></span>
                    <a href="${pageContext.request.contextPath}/good/search?goodsType=${goodType.id}">${goodType.typename}</a>
            </li>
        </c:forEach>
    </ul>
    <!--购物分类end-->
    <!--中间区 start-->
    <div class="middle">
        <h1 class="pic_title">最新上架</h1>
        <div class="pic_list">
          <c:forEach items="${goodList}" var="good">
            <dl>
                <div>
                    <a href="${pageContext.request.contextPath}/good/detail?id=${good.id}" target="_blank">
                        <img style="width: 150px;height: 180px" src="${pageContext.request.contextPath}${good.picture}" /></a></div>
                <dt><div class="price">￥${good.goodPrice}元</div>
                    <div class="font12">${good.saleNum}人购买</div>
                </dt>
                <dd>${good.goodName}</dd>
            </dl>
          </c:forEach>
        </div>


    </div>
    <!--中间区 end-->

    <!--右侧热门推荐 start-->
    <div class="right_nav" id="right_nav">

    </div>
    <!--右侧热门推荐 end-->

</div>

<!--中间部分 end-->
<!--底部 start-->
<div class="clear"></div>
<div class="footer">
    <div class="gotop"></div>
    <div class="foot_title">
        <ul class="foot_pic">
            <li><img src="../images/gray1.jpg" ></li>
            <li><img src="../images/gray2.jpg" ></li>
            <li><img src="../images/gray3.jpg" ></li>
            <li><img src="../images/gray4.jpg" ></li>
            <li><img src="../images/gray5.jpg" ></li>
        </ul>
    </div>
    <ul class="foot_list">
        <li>
            <div class="floatl">
                <p class="red1"></p>
                <p class="line1"></p>
            </div>
            <ul class="floatl">
                <li class="font16 padding-bottom">新手指导</li>
                <li>用户注册</li>
                <li>电话下单</li>
                <li>购物流程</li>
                <li>购物保障</li>
                <li>服务协议</li>
            </ul>
        </li>
        <li>
            <div class="floatl">
                <p class="red2"></p>
                <p class="line1"></p>
            </div>
            <ul class="floatl">
                <li class="font16 padding-bottom">支付方式</li>
                <li>货到付款</li>
                <li>商城卡支付</li>
                <li>支付宝、网银支付</li>
                <li>优惠券抵用</li>
            </ul>
        </li>
        <li>
            <div class="floatl">
                <p class="red3"></p>
                <p class="line1"></p>
            </div>
            <ul class="floatl">
                <li class="font16 padding-bottom">配送方式</li>
                <li>闪电发货</li>
                <li>满百包邮</li>
                <li>配送范围及时间</li>
                <li>商品验收及签收</li>
                <li>服务协议</li>
            </ul>
        </li>
        <li>
            <div class="floatl">
                <p class="red3"></p>
                <p class="line1"></p>
            </div>
            <ul class="floatl">
                <li class="font16 padding-bottom">售后服务</li>
                <li>退换货协议</li>
                <li>关于发票</li>
                <li>退换货流程</li>
                <li>退换货运费</li>
            </ul>
        </li>
        <li>
            <div class="floatl">
                <p class="red3"></p>
                <p class="line1"></p>
            </div>
            <ul class="floatl">
                <li class="font16 padding-bottom">关于帐号</li>
                <li>修改个人信息</li>
                <li>修改密码</li>
                <li>找回密码</li>
            </ul>
        </li>
        <li>
            <div class="floatl">
                <p class="red3"></p>
                <p class="line1"></p>
            </div>
            <ul class="floatl">
                <li class="font16 padding-bottom">优惠活动</li>
                <li>竞拍须知</li>
                <li>抢购须知</li>
            </ul>
        </li>
    </ul>
    <div class="clear"></div>
    <div class="foot_line"></div>
    <p align="center" class="padding-top">Copyright  2015-2020  Q- Walking Fashion E&S 漫步时尚广场（QST教育）版权所有<Br/>
        中国青岛 高新区河东路8888号  青软教育集团    咨询热线：400-658-0166  400-658-1022 </p>
    <p align="center"><img src="../images/foot_pic.jpg"></p>
    <div class="clear"></div>
</div>
<!--底部 end-->
</body>
</html>
