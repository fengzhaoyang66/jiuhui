<%--
  Created by IntelliJ IDEA.
  User: 冯朝阳
  Date: 2019/8/30
  Time: 11:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<meta charset="utf-8"/>
<link href="${pageContext.request.contextPath}/static/assets/css/bootstrap.min.css" rel="stylesheet"/>

<![endif]-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrapTable/css/bootstrap-table.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css"/>
<!--[if lte IE 8]>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/ace-ie.min.css"/>
<![endif]-->
<!-- 1 引入echarts类库 -->
<script src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="/static/echarts/echarts.min.js"></script>
<script type="text/javascript" src="/static/bootstrapTable/bootstrap-table.js"></script>
<script type="text/javascript" src="/static/bootstrapTable/bootstrap-table-zh-CN.js"></script>
<script src="${pageContext.request.contextPath}/static/assets/js/ace-extra.min.js"></script>
<!--[if lt IE 9]>

<script src="${pageContext.request.contextPath}/static/assets/js/html5shiv.js"></script>
<script src="${pageContext.request.contextPath}/static/assets/js/respond.min.js"></script>
<![endif]-->

<script src="${pageContext.request.contextPath}/static/assets/layer/layer.js" type="text/javascript"></script>
<title>Title</title>
</head>
<body>
<div class="container" style="border:1px solid #c3c3c3;margin-left:38px">
    <div class="row clearfix">
        <div class="col-md-12 column" style="width:965px;height:30px;background-color: #7b858c;margin-left: -13px">
            <span style="line-height:30px">查看数据</span>

        </div>
    </div>


    <div class="row clearfix">
        <table id="ArbetTable" class="table"></table>
    </div>
</div>

<script>
    $(function () {
        //1.初始化Table
        var oTable = new TableInit();
        oTable.Init();
    });

    var TableInit = function () {
        var oTableInit = new Object();
        //初始化Table
        oTableInit.Init = function () {
            $('#ArbetTable').bootstrapTable({
                url: '${pageContext.request.contextPath}/forecast/Byforecast',         //请求后台的URL（*）
                method: 'get',                      //请求方式（*）
                toolbar: '#toolbar',                //工具按钮用哪个容器
                striped: true,                      //是否显示行间隔色
                cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                pagination: true,                   //是否显示分页（*）
                sortable: false,                     //是否启用排序
                sortOrder: "asc",                   //排序方式
                queryParams: oTableInit.queryParams,//传递参数（*）
                sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
                pageNumber: 1,                       //初始化加载第一页，默认第一页
                pageSize: 10,                       //每页的记录行数（*）
                pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
                //search: true,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
                contentType: "application/x-www-form-urlencoded",
                strictSearch: true,
                // showColumns: true,                  //是否显示所有的列
                //showRefresh: true,                  //是否显示刷新按钮
                minimumCountColumns: 2,             //最少允许的列数
                clickToSelect: true,                //是否启用点击选中行
                height: 700,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                uniqueId: "no",                     //每一行的唯一标识，一般为主键列
                // showToggle: true,                    //是否显示详细视图和列表视图的切换按钮
                cardView: false,                    //是否显示详细视图
                detailView: false,                   //是否显示父子表
                columns: [
                    {
                        field: 'id',
                        title: 'ID'
                    }, {
                        field: 'planName',
                        title: '计划名称'
                    }, {
                        field: 'planNumberTables',
                        title: '计划召开桌数'
                    }, {
                        field: 'startTtime',
                        title: '开始时间'
                    }, {
                        field: 'endTime',
                        title: '结束时间'
                    }, {
                        field: 'entryTime',
                        title: '录入时间'
                    },

                    {
                        field: 'operate',
                        title: '操作',
                        formatter: operateFormatter //自定义方法，添加操作按钮
                    },
                ],
                rowStyle: function (row, index) {
                    var classesArr = ['success', 'info'];
                    var strclass = "";
                    if (index % 2 === 0) {//偶数行
                        strclass = classesArr[0];
                    } else {//奇数行
                        strclass = classesArr[1];
                    }
                    return {classes: strclass};
                },//隔行变色
            });

        };


        //得到查询的参数
        oTableInit.queryParams = function (params) {
            var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                limit: params.limit,   //页面大小
                offset: params.offset
            };
            return temp;
        };
        return oTableInit;
    };


    function operateFormatter(value, row, index) {//赋予的参数
        return [
            '<a  href="shijishuju.jsp">上报实际数据</a>'

        ].join('');
    }
</script>

</body>
</html>