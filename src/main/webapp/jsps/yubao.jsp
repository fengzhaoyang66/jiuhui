<%--
  Created by IntelliJ IDEA.
  User: 冯朝阳
  Date: 2019/8/30
  Time: 11:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />

    <link href="${pageContext.request.contextPath}/static/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/font-awesome.min.css" />
    <!--[if IE 7]>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrapTable/css/bootstrap-table.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/font-awesome-ie7.min.css" />
    <![endif]-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/ztree/css/zTreeStyle.css"/>
    <!--[if lte IE 8]>
    <![endif]-->
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript" src="/static/bootstrapTable/bootstrap-table.js"></script>
    <script type="text/javascript" src="/static/bootstrapTable/bootstrap-table-zh-CN.js"></script>

    <script src="${pageContext.request.contextPath}/static/ztree/js/jquery.ztree.all.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/ztree/js/jquery.ztree.core.js"></script>


    <!--[if lt IE 9]>
    <script src="${pageContext.request.contextPath}/static/assets/js/html5shiv.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/js/respond.min.js"></script>
    <![endif]-->

    <script src="${pageContext.request.contextPath}/static/assets/layer/layer.js" type="text/javascript"></script>
    <title>Title</title>
</head>
<body>
<div class="container" style="border:1px solid #c3c3c3;margin-left:38px" >
    <div class="row clearfix">
        <div class="col-md-12 column" style="width:964px;height:30px;background-color: #c3c3c3;margin-left: -13px" >
            <span style="line-height:30px">
                预报数据
            </span>

        </div>
    </div>

    <div class="row clearfix">
        <div class="col-md-12 column" style="margin-top: 20px;margin-left: -13px" >
            <form class="" id="form2">
                <fieldset>
                    <ul>
                        <li class="frame_style form_error"><label class="user_icon"></label>
                            <i>计划名称:</i>
                            <input name="codename" id="codename" type="text" style="border-radius:9px;width: 180px"/>
                        </li><br><br>
                        <li class="frame_style form_error"><label class="password_icon"></label>
                            <i>计划召开桌数:</i>
                            <input name="password" id="password" type="password" style="border-radius:9px;width: 180px"/>
                        </li><br><br>
                        <li class="frame_style form_error"><label class="password_icon"></label>
                            <i>开始时间:</i><input type="date"  style="border-radius:9px;width: 180px"/>
                        </li><br><br>
                        <li class="frame_style form_error"><label class="password_icon"></label>
                            <i>结束时间:</i><input type="date"  style="border-radius:9px;width: 180px"/>
                        </li>

                    </ul>

                    <div class="clearfix" style="margin-top: 20px;" >
                        <input type="button" onclick="tijiao()"  value="提交"/>
                        <input type="submit"   value="取消"/>
                    </div>
                </fieldset>
            </form>

        </div>
    </div>
</div>

</body>
<script type="text/javascript">
    function login() {
        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "" ,//url
            data: $('#form2').serialize(),
            success: function (result) {
                console.log(result);//打印服务端返回的数据(调试用)
            }
        });
    }
</script>
</html>
