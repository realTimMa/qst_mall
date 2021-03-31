<%--
  Created by IntelliJ IDEA.
  User: 32766
  Date: 2020/6/11
  Time: 16:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <title>用户注册-Q-Walking E&S</title>
    <link href="${pageContext.request.contextPath}/css/register.css" rel="stylesheet" type="text/css">
    <script language="JavaScript" src="${pageContext.request.contextPath}/js/admin/jquery-3.1.1.min.js"></script>
   <%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/cascade.js"></script>--%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/validate.js"></script>
   <%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/onLoad.js"></script>--%>
</head>
<body>
<!--顶部区域 start-->
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="top_line">
    <tr>
        <td bgcolor="#f7f7f7" ><table width="1200" border="0" cellspacing="0" cellpadding="0" align="center">
            <tr>
                <td  class="padding-top"><img src="../images/star.jpg">收藏 | HI，欢迎来订购 ！
                    <c:if test="${sessionScope.UserRealName==null}">
                    <a href="${pageContext.request.contextPath}/jsp/login.jsp" class="orange">[请登录]</a>
                    <a href="${pageContext.request.contextPath}/jsp/register.jsp"  class="orange"> [免费注册]</a>
                </c:if>
                    <c:if test="${sessionScope.UserRealName!=null}">${sessionScope.UserRealName}</c:if></td>
                <td align="right" > 客户服务<img src="../images/arrow.gif">&nbsp;网站导航<img src="../images/arrow.gif">&nbsp;<span class="droparrow"><span class="shopcart"></span>我的购物车<span class="orange">0</span>件<img src="../images/arrow.gif" /></span></td>
            </tr>
        </table></td>
    </tr>
</table>
<!--顶部区域 end-->
<!--logo和banner start-->
<table width="1200" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>
        <td height="95"><img src="../images/logo.jpg"></td>
        <td align="right"><img src="../images/banner.jpg"></td>
    </tr>
</table>
<!--logo和banner  end-->
<!--菜单导航 start-->
<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ce2626" >
    <tr>
        <td><table width="1200" border="0" cellspacing="0" cellpadding="4" align="center" class="nav_font16" height="40">
            <tr>
                <td width="200">&nbsp;</td>
                <td width="80" align="center" >首页</td>
                <td width="100" align="center">最新上架</td>
                <td width="100" align="center">品牌活动</td>
                <td width="100" align="center">原厂直供</td>
                <td width="80" align="center">团购</td>
                <td width="100" align="center">限时抢购</td>
                <td width="100" align="center">促销打折</td>
                <td width="200" align="center">&nbsp;</td>
            </tr>
        </table></td>
    </tr>
</table>
<!--菜单导航 end-->

<!--注册部分 start-->
<table width="100%" border="0" cellspacing="0" cellpadding="0"
       bgcolor="#f8f8f8">
    <tr>
        <td>
            <table width="1000" border="0" cellspacing="0" cellpadding="0"
                   bgcolor="#ffffff" align="center">
                <tr>
                    <td valign="top"><h2 align="center">用户注册</h2>
                        <hr width="90%" align="center" color="#ccc"/></td>
                    <td width="420" rowspan="2" valign="middle">
                        <img src="../images/zhuce_pic.jpg" align="right"/></td>
                </tr>
                <tr>
                    <td valign="top">
                        <form action="${pageContext.request.contextPath}/mall/register" method="post" enctype="multipart/form-data">
                            <table width="90%" border="0" cellspacing="0" cellpadding="0"
                                   class="reg" align="center">
                                <tr>
                                    <td>上传头像</td>
                                    <td><input type="file" name="picture" id="picture" required="required"/></td>
                                </tr>
                                <tr>
                                    <td>真实姓名：</td>
                                    <td><input name="realName" type="text" id="realName" required="required"
                                              PLACEHOLDER="请输入真实姓名" />
                                        <label id="realNameLable" class="l1"></label></td>
                                </tr>
                                <tr>
                                    <td>您的性别：</td>
                                    <td><input type="radio" name="sex"  value="0" required="required" checked/>男
                                        <input type="radio" name="sex"  value="1" required="required"/>女</td>
                                </tr>
                                <tr>
                                    <td>设置密码：</td>
                                    <td><input name="password" type="password" id="password" required="required"/>
                                        <label id="passwordLable" class="l1"></label></td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td class="gray12">6-20个字符，由字母、数字和符号的两种以上组合。&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>确认密码：</td>
                                    <td><input name="password1" type="password" id="password1" required="required"/>
                                        <label id="password1Lable" class="l1"></label></td>
                                </tr>
                                <tr>
                                    <td>您的手机：</td>
                                    <td><input name="phone" type="text" id="phone"
                                               PLACEHOLDER="请输入您的手机号" required="required"/>
                                        <label id="phoneLable" class="l1"></label></td>
                                </tr>
                                <tr>
                                    <td>地址：</td>
                                    <td><input name="address" type="text" id="address"
                                               PLACEHOLDER="请输入您的地址" required="required"/>
                                        <label id="addressLable" class="l1"></label></td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td><input type="submit" name="button" value="提交" /></td>
                                </tr>
                            </table>
                        </form></td>
                </tr>
            </table>
            <!--三大模块图片-->
            <table width="1000" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#FFFFFF" class="padding-bottom">
                <tr>
                    <td align="center"><a href="#"><img src="../images/shop.jpg"  class="bian"/></a></td>
                    <td align="center"><a href="#"><img src="../images/movie.jpg" class="bian"/></a></td>
                    <td align="center"><a href="#"><img src="../images/food.jpg" class="bian"/></a></td>
                </tr>
            </table></td>
    </tr>
</table>

<!--注册部分 end-->

<!--底部 start-->
<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#6a6665" >
    <tr>
        <td bgcolor="#efefef" align="center" class="padding-top">Copyright  2015-2020  Q- Walking Fashion E&S 漫步时尚广场（QST教育）版权所有<Br/>
            中国青岛 高新区河东路8888号  青软教育集团    咨询热线：400-658-0166  400-658-1022<br/>
            <img src="../images/foot_pic.jpg"></td>
    </tr>
</table>

<!--底部 end-->
</body>
</html>
