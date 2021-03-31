<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 32766
  Date: 2020/6/12
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <title>漫步时尚广场-商品详情</title>
    <link href="${pageContext.request.contextPath}/css/detail.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/admin/jquery-1.x.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/goodsOperator.js"></script>
</head>
<body>
<article id="main">
    <!--顶部区域 start-->
    <header class="top_bg">
        <div class="top_content">
            <div class="floatl"><img src="../images/star.jpg">收藏 | HI，欢迎来订购 ！
                <c:if test="${sessionScope.UserRealName==null}">
                    <a href="${pageContext.request.contextPath}/jsp/login.jsp" class="orange">[请登录]</a>
                    <a href="${pageContext.request.contextPath}/jsp/register.jsp"  class="orange"> [免费注册]</a>
                </c:if>
                <c:if test="${sessionScope.UserRealName!=null}">${sessionScope.UserRealName}</c:if>
            </div>
            <div class="floatr">客户服务<img src="../images/arrow.gif">&nbsp;网站导航<img src="../images/arrow.gif">&nbsp;<span class="droparrow"><span class="shopcart"></span>我的购物车<span class="orange">0</span>件<img src="../images/arrow.gif"  /></span></div>
        </div>
    </header>
    <!--顶部区域 end-->
    <!--logo和banner start-->
    <div class="logo"><a href="${pageContext.request.contextPath}/mall/toIndex"><img src="../images/logo.jpg" ></a><img src="../images/banner.jpg" ></div>
    <!--logo和banner  end-->
    <!--菜单导航 start-->
    <nav class="nav_bg">
        <div class="nav_content">
            <ul class="menu_nav">
                <li ><a href="${pageContext.request.contextPath}/mall/toIndex" class="white">首页</a></li>
                <li><a href="shoppingShow.html"  class="white">最新上架</a></li>
                <li>品牌活动</li>
                <li>原厂直供</li>
                <li>团购</li>
                <li>限时抢购</li>
                <li>促销打折</li>
            </ul>
        </div>
    </nav>
    <!--菜单导航 end-->
    <!--中间部分 start-->
    <section>
        <div class="main">
            <nav>
                <ul class="menu">

                    <c:forEach items="${goodsTypeList}" var="goodType">
                        <li>
                            <span class="red_dot"></span>
                            <a href="${pageContext.request.contextPath}/good/search?goodsType=${goodType.id}">${goodType.typename}</a>
                        </li>
                    </c:forEach>
                </ul>
            </nav>
            <!--购物分类end-->
            <!--中间区 start-->
            <div class="middle">
                <h1 class="pic_title">商品详情</h1>
                <div class="left_pic">
                    <div id="box">
                        <img src="${pageContext.request.contextPath}${good.picture}" width="400" height="400" id="showGoodsPicture">
                        <div id="shade"></div>
                    </div>
                    <ul class="small_piclist" id="goodsList">
                       <%-- <li><img src="../images/showdetail/dd1.jpg" onclick="changeGoodsImage(this)"></li>--%>
                           <li><img src="${pageContext.request.contextPath}${good.picture}" onclick="changeGoodsImage(this)"></li>
                        <%--<li><img src="../images/showdetail/dd2.jpg" onclick="changeGoodsImage(this)"></li>
                        <li><img src="../images/showdetail/dd3.jpg" onclick="changeGoodsImage(this)"></li>
                        <li><img src="../images/showdetail/dd4.jpg" onclick="changeGoodsImage(this)"></li>
                        <li><img src="../images/showdetail/dd5.jpg" onclick="changeGoodsImage(this)"></li>--%>
                    </ul>
                    <!--canvas不能通过样式设置大小，只能通过属性设置-->
                    <canvas id="canvas" width="400px" height="400px"></canvas>
                </div>
                <div class="right">
                    <div style="width:270px;height: 368px;">
                        <h1 class="font16" name="goodName" id="${good.id}" style="height: 21px;padding-left: 10px">${good.goodName}</h1>
                        <br/>
                        <ul>
                            <li style="height: 40px;padding-left: 10px;font-size: 20px">价格<span style="color: red;font-size: 30px">￥${good.goodPrice}</span></li>
                            <li style="height: 40px;padding-left: 10px;font-size: 20px">数量
                            <span><input type="number" value="1" name="num" id="num" style="width: 50px"
                                         step="1" min="0" onkeyup="this.value= this.value.match(/\d+(\.\d{0,2})?/) ? this.value.match(/\d+(\.\d{0,2})?/)[0] : ''"
                            >
                            (库存${good.goodStore}件)
                            </span>
                            </li>
                            <li style="height: 40px;padding-left: 70px;font-size: 20px">
                                <input type="button" value="立即购买" id="saveOrder" style="height:30px;width:100px;background-color: red;color: white;border: red solid 1px">
                            </li>
                        </ul>
                    </div>
                    </div>
                <div class="clear"></div>
                <ul class="tab" id="goodsTabs">
                    <li  class="tab_active" onClick="changeGoodsInfo(this)">商品详情</li>
                    <li onClick="changeGoodsInfo(this)">商品评价</li>
                    <li onClick="changeGoodsInfo(this)">成交记录</li>
                </ul>
                <article class="tab_content1">
                    <ul class="particulars">
                        <li title=" 修身">服装版型: 修身</li>
                        <li title=" 甜美">风格: 甜美</li>
                        <li title=" 瑞丽">甜美: 瑞丽</li>
                        <li title=" 中长款">衣长: 中长款</li>
                        <li title=" 长袖">袖长:长袖</li>
                        <li title=" 常规">袖型: 常规</li>
                        <li title=" 带帽">领型:带帽</li>
                        <li title=" 拉链">衣门襟:拉链</li>
                        <li title=" 纯色">图案: 纯色</li>
                        <li title=" 81%(含)-90%(含)">成分含量:81%(含)-90%(含)</li>
                        <li title=" 棉">质地: 棉</li>
                        <li title=" 25-29周岁">适用年龄: 25-29周岁</li>
                        <li title=" 2015年冬季">年份季节:2015年冬季</li>
                        <li title=" 深蓝色 蓝色">颜色分类: 深蓝色 蓝色</li>
                        <li title=" M L XL 2XL">尺码:M L XL 2XL</li>
                    </ul>
                    <section> <img src="${pageContext.request.contextPath}${good.picture}" class="img_border" style="width: 686px;height: 500px"> <img src="../images/showdetail/detail2.jpg" class="img_border"> </section>
                </article>
                <article class="tab_content2 none"><img src="../images/showdetail/pinglun.jpg"/></article>
                <article class="tab_content3 none">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <thead>
                        <tr>
                            <th>买家</th>
                            <th>淘宝价</th>
                            <th>数量</th>
                            <th>付款时间</th>
                            <th>款式和型号</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td> a**男 (匿名) </td>
                            <td><em class="price2">¥198.00</em></td>
                            <td>1</td>
                            <td> 2015-07-31 20:08:39 </td>
                            <td><div>
                                <p>颜色分类:深蓝色[胸前格纹]</p>
                                <p>尺码:L</p>
                            </div></td>
                        </tr>
                        <tr>
                            <td> 闺**你 (匿名) </td>
                            <td><em class="price2">¥198.00</em></td>
                            <td>1</td>
                            <td> 2015-07-27 14:05:17 </td>
                            <td><div>
                                <p>颜色分类:蓝色[口袋格纹]</p>
                                <p>尺码:L</p>
                            </div></td>
                        </tr>
                        <tr>
                            <td> w**0 (匿名)</td>
                            <td><em class="price2">¥198.00</em></td>
                            <td>1</td>
                            <td> 2015-07-23 12:33:54 </td>
                            <td><div>
                                <p>颜色分类:深蓝色[胸前格纹]</p>
                                <p>尺码:L</p>
                            </div></td>
                        </tr>
                        <tr>
                            <td> a**u (匿名)</td>
                            <td><em class="price2">¥198.00</em></td>
                            <td>1</td>
                            <td> 2015-07-23 12:04:19 </td>
                            <td><div>
                                <p>颜色分类:蓝色[口袋格纹]</p>
                                <p>尺码:L</p>
                            </div></td>
                        </tr>
                        <tr>
                            <td> 落**1 (匿名) </td>
                            <td><em class="price2">¥198.00</em></td>
                            <td>1</td>
                            <td> 2015-07-22 21:39:27 </td>
                            <td><div>
                                <p>颜色分类:深蓝色[胸前格纹]</p>
                                <p>尺码:L</p>
                            </div></td>
                        </tr>
                        <tr>
                            <td> 6**s (匿名) </td>
                            <td><em class="price2">¥198.00</em></td>
                            <td>1</td>
                            <td> 2015-07-12 15:00:30 </td>
                            <td><div>
                                <p>颜色分类:蓝色[口袋格纹]</p>
                                <p>尺码:L</p>
                            </div></td>
                        </tr>
                        </tbody>
                    </table>
                </article>
                <!--品牌活动-->
                <article>
                    <h1 class="pic_title">看了又看</h1>
                    <ul class="pic_list4">
                        <li><img src="../images/showdetail/ss1.jpg" title="2015新款条纹显瘦V领短袖露背宽松连身裤"/>
                            <p>2015新款条纹显瘦V领短袖露背宽松连身裤</p>
                        </li>
                        <li><img src="../images/showdetail/ss2.jpg" title="2015女士新款百搭休闲阔腿裤高腰红色短裤"/>
                            <p>2015女士新款百搭休闲阔腿裤高腰红色短裤</p>
                        </li>
                        <li><img src="../images/showdetail/ss3.jpg" title="女版街头个性休闲口袋纯色卫衣吊带哈伦裤"/>
                            <p>女版街头个性休闲口袋纯色卫衣吊带哈伦裤</p>
                        </li>
                        <li><img src="../images/showdetail/ss4.jpg" title="韩版简约百搭五分袖喇叭袖圆领打底短袖"/>
                            <p>韩版简约百搭五分袖喇叭袖圆领打底短袖</p>
                        </li>
                        <li><img src="../images/showdetail/ss5.jpg" title="卡玛娅秋装新款女装 圆领纯棉上衣棉T恤" />
                            <p>卡玛娅秋装新款女装 圆领纯棉上衣棉T恤</p>
                        </li>
                    </ul>
                    <article>
            </div>
            <!--中间区 end-->
            <!--右侧热门推荐 start-->
            <aside class="right_nav">
                <h1 class="notice_title"> 热门推荐 </h1>
                <ul class="pic_list3">
                    <ul>
                        <li><a href="#"><img src="../images/shopshow/s1.jpg" /></a>
                            <p class="price2">￥56.00元</p>
                        </li>
                        <li><a href="#"><img src="../images/shopshow/s2.jpg" /></a>
                            <p class="price2">￥97.00元</p>
                        </li>
                        <li><a href="#"><img src="../images/shopshow/s3.jpg" /></a>
                            <p class="price2">￥89.00元</p>
                        </li>
                        <li><a href="#"><img src="../images/shopshow/s4.jpg" /></a>
                            <p class="price2">￥69.00元</p>
                        </li>
                        <li><a href="#"><img src="../images/shopshow/s5.jpg" /></a>
                            <p class="price2">￥89.00元</p>
                        </li>
                        <li><a href="#"><img src="../images/shopshow/s6.jpg" /></a>
                            <p class="price2">￥93.00元</p>
                        </li>
                        <li><a href="#"><img src="../images/shopshow/s7.jpg" /></a>
                            <p class="price2">￥58.00元</p>
                        </li>
                        <li><a href="#"><img src="../images/shopshow/s8.jpg" /></a>
                            <p class="price2">￥69.00元</p>
                        </li>
                        <li><a href="#"><img src="../images/shopshow/s9.jpg" /></a>
                            <p class="price2">￥78.00元</p>
                        </li>
                    </ul>
                </ul>
            </aside>
        </div>
    </section>
    <!--右侧热门推荐 end-->
    <!--中间部分 end-->
    <footer>
        <div class="clear"></div>
        <div class="foot">
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
    </footer>
</article>
<script>
    $("#saveOrder").on("click",function () {
        var goodId=$("h1[name='goodName']").prop("id");
        var num=$("#num").val();
        $.ajax({
            url:"${pageContext.request.contextPath}/mall/saveOrder",
            type:"post",
            data:JSON.stringify({goodId:goodId,num:num}),

            contentType:"application/json;charset=utf-8",
            success:function (result) {
                if(result.message=="notLogin"){
                    alert("你还未登录");
                }
                else if (result.message=="success")
                {
                    alert("操作成功");
                    location.href="/mall/orderDetail/"+result.data.orderId;
                }
                else{
                    alert("操作失败，请联系管理员");
                }

            },
            error:function () {
                alert("操作失败，请联系管理员非200");
            }
        })
    })
</script>
</body>
</html>
