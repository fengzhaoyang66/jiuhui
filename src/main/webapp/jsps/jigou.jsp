<%--
  Created by IntelliJ IDEA.
  User: 冯朝阳
  Date: 2019/8/29
  Time: 17:29
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
    <script src="${pageContext.request.contextPath}/static/zterr/js/jquery.ztree.core.js"></script>
    <script src="${pageContext.request.contextPath}/static/ztree/js/jquery.ztree.all.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/zterr/js/jquery.ztree.excheck.js"></script>
    <script src="${pageContext.request.contextPath}/static/zterr/js/jquery.ztree.exedit.js"></script>
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
            view: {
                addHoverDom: addHoverDom,//用于当鼠标移动到节点上时
                removeHoverDom: removeHoverDom,//自定义删除

            },
            edit: {
                enable: true,//设置 zTree 是否处于编辑状态
                editNameSelectAll: true,//节点编辑名称 input 初次显示时,设置 txt 内容是否为全选状态。
                //showRemoveBtn: setRemoveBtn,    //设置所有的父节点不显示删除按钮
                removeTitle: "删除节点",
                renameTitle: "编辑节点名称"
            }
        };


        $(function () {
            $.fn.zTree.init($("#treeDemo"), setting);//初始化ztree
        })

        /**
         * 添加ztree树节点
         * @param treeId
         * @param treeNode
         */
        function addHoverDom(treeId, treeNode) {
            var sObj = $("#" + treeNode.tId + "_span"); //获取节点信息
            if (treeNode.editNameFlag || $("#addBtn_" + treeNode.tId).length > 0) return;

            var addStr = "<span class='button add' id='addBtn_" + treeNode.tId + "' title='add node' οnfοcus='this.blur();'></span>"; //定义添加按钮
            sObj.after(addStr); //加载添加按钮
            var btn = $("#addBtn_" + treeNode.tId);
            if (btn) btn.bind("click", function () {
                $("#ZtreeModal").modal('show');
                $("#ZtreeOk").click(function () {
                    $.ajax({
                        type: "post",//方式
                        url: "${pageContext.request.contextPath }/AddressCon/InserAddress",  //提交的路径
                        data: {pid: treeNode.id, name: $("#newname").val(), "level": $("#levelId").val()},  //传的参数
                        dataType: "json", //用json格式
                        success: function (data) { //后台传过来的参数
                            $("#ZtreeModal").modal('hide');
                            $.fn.zTree.init($("#treeDemo"), setting);
                        }
                    });
                })
            });
        };

        function removeHoverDom(treeId, treeNode) {
            $("#addBtn_" + treeNode.tId).unbind().remove();
        };

        function zTreeOnClick(event, treeId, treeNode) {

            $("#oldname").val(treeNode.name);
            $("#levelId").val(treeNode.level + 2);

        }

        function setRemoveBtn(treeId, treeNode) {
            return !treeNode.isParent;
        }


    </script>
</head>
<body>
<div class="container" style="border:1px solid #c3c3c3;margin-left:38px">
    <div class="row clearfix">
        <div class="col-md-12 column" style="width:964px;height:30px;background-color: #c3c3c3;margin-left: -13px">
            <span style="line-height:30px">
                机构管理
            </span>

        </div>
    </div>

    <div class="row clearfix">
        <div class="col-md-12 column" style="margin-top: 20px;margin-left: -45px">
            <div class="panel-body">
                <div class="form-group">
                    <form>
                        <label class="col-sm-2 control-label">导入市级机构数据:</label>
                        <div class="col-sm-3">
                            <input id="file" type="file" name=""/>
                        </div>
                    </form>

                    <div class="col-sm-1">
                        <a href="#" class="btn btn-default">确定导出</a>
                    </div>
                </div>
                <br>
                <div class="form-group">
                    <form>
                        <label class="col-sm-2 control-label">导入县级机构数据:</label>
                        <div class="col-sm-3">
                            <input id="" type="file" name=""/>
                        </div>
                    </form>

                    <div class="col-sm-1">
                        <a href="#" class="btn btn-default">确定导出</a>
                    </div>
                </div>


            </div>
        </div>
    </div>

    <div class="row clearfix">
        <div class="col-md-12 column" style="margin-top: 20px;margin-left: -26px">
            <span style="line-height:30px">
                <ul id="treeDemo" class="ztree"></ul>
            </span>

        </div>
    </div>
</div>
</body>
</html>
