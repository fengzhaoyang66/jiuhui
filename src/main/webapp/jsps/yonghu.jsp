<%--
  Created by IntelliJ IDEA.
  User: 冯朝阳
  Date: 2019/8/29
  Time: 8:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8"/>
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.js"></script>
    <link href="${pageContext.request.contextPath}/static/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/font-awesome.min.css"/>
    <!--[if IE 7]>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/font-awesome-ie7.min.css"/>
    <![endif]-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/ace-rtl.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/ace-skins.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/ztree/css/zTreeStyle.css"/>
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/ace-ie.min.css"/>
    <![endif]-->
    <script src="${pageContext.request.contextPath}/static/ztree/js/jquery.ztree.all.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/ztree/js/jquery.ztree.core.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/js/ace-extra.min.js"></script>


    <!--[if lt IE 9]>
    <script src="${pageContext.request.contextPath}/static/assets/js/html5shiv.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/js/respond.min.js"></script>
    <![endif]-->

    <script src="${pageContext.request.contextPath}/static/assets/layer/layer.js" type="text/javascript"></script>
    <title>Title</title>
    <script type="text/javascript">
        var setting = {
            data: {
                simpleData: {
                    enable: true,
                    idKey: "id",
                    pIdKey: "pid",
                    rootpId: 0,
                }
            },
            async: {
                enable: true,//设置ztree是否开启异步加载模式
                url: "<%=request.getContextPath()%>/treeInfo"//路径

            },
        };

        $(function () {
            $.fn.zTree.init($("#treeDemo"), setting);//初始化ztree
        })

    </script>
</head>
<body>
<div class="container" style="border:1px solid #c3c3c3;margin-left:38px">
    <div class="row clearfix">
        <div class="col-md-12 column" style="width:964px;height:30px;background-color: #c3c3c3;margin-left: -13px">
            <span style="line-height:30px">
                用户管理
            </span>

        </div>
    </div>

    <div class="row clearfix">
        <div class="col-md-6 column" style="margin-top: 20px;margin-left: -26px">
            <span style="line-height:30px">
                <ul id="treeDemo" class="ztree"></ul>
            </span>

        </div>
        <div class="col-md-6 column" style="margin-top: 20px;margin-left: -26px">
            <span style="line-height:30px">
               <button type="button" class="btn btn-default" aria-label="Left Align">
                <span class="glyphicon glyphicon-plus" aria-hidden="true">Add</span>
               </button>
            </span>

        </div>
    </div>
</div>
</body>
</html>
