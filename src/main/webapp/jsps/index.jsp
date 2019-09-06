<%--
  Created by IntelliJ IDEA.
  User: 冯朝阳
  Date: 2019/8/28
  Time: 15:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8"/>
    <link href="${pageContext.request.contextPath}/static/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/font-awesome.min.css"/>
    <!--[if IE 7]>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/font-awesome-ie7.min.css"/>
    <![endif]-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/ace-rtl.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/ace-skins.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css"/>
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/ace-ie.min.css"/>
    <![endif]-->
    <script src="${pageContext.request.contextPath}/static/assets/js/ace-extra.min.js"></script>
    <!--[if lt IE 9]>
    <script src="${pageContext.request.contextPath}/static/assets/js/html5shiv.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/js/respond.min.js"></script>
    <![endif]-->
    <script src="${pageContext.request.contextPath}/static/js/jquery-1.9.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/layer/layer.js" type="text/javascript"></script>
    <title>登陆</title>
</head>
<script type="text/javascript">
    $(function () {
        $("#verification").on("click", function () {

            var random = Math.random();

            $(this).attr("src", "${pageContext.request.contextPath}/user/verification?random" + random);

        })
    })
</script>
<body class="login-layout Reg_log_style"
      style="background-image:url(${pageContext.request.contextPath}/static/images/112.png)">
<div class="logintop">

    <ul>
        <li><a href="#">返回首页</a></li>
        <li><a href="#">帮助</a></li>
        <li><a href="#">关于</a></li>
    </ul>
</div>
<div class="loginbody">
    <div class="login-container">
        <div class="center">

        </div>

        <div class="space-6"></div>

        <div class="position-relative">
            <div id="login-box" class="login-box widget-box no-border visible" style="margin-left: 450px">
                <div class="widget-body">
                    <div class="widget-main">
                        <h4 class="header blue lighter bigger">
                            <i class="icon-coffee green"></i>
                            请登陆
                        </h4>


                        <form class="">
                            <fieldset>
                                <ul style="width: 298px;height: 165px;">
                                    <li class="frame_style form_error"><label class="user_icon"></label>
                                        <input name="codename" id="codename" type="text"/><i>用户名</i></li>
                                    <li class="frame_style form_error"><label class="password_icon"></label>
                                        <input name="password" id="password" type="password"/><i>密码</i></li>
                                    </li>


                                </ul>
                                <div class="space"></div>

                                <div class="clearfix">
                                    <input type="button" onclick="denglu()"
                                           class="width-35 pull-right btn btn-sm btn-primary" value="登陆"/>
                                </div>

                                <div class="space-4"></div>
                            </fieldset>
                        </form>

                        <div class="social-or-login center">
                            <span class="bigger-110">通知</span>
                        </div>

                        <div class="social-login center">
                            本网站系统不再对IE8以下浏览器支持，请见谅。
                        </div>
                    </div><!-- /widget-main -->

                    <div class="toolbar clearfix">


                    </div>
                </div><!-- /widget-body -->
            </div><!-- /login-box -->
        </div><!-- /position-relative -->
    </div>
</div>
<div class="loginbm">版权所有 2019 <a href="">系统有限公司</a></div>
<strong></strong>
</body>
</html>
<script type="text/javascript">
    function denglu() {

        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/UseCon/login",
            data: {"codename": $("#codename").val(), "password": $("#password").val()},
            datatype: "json",
            success: function (data) {
                alert("登陆成功")
                window.location.href = 'shouye.jsp';
            }
        });

    }


</script>
