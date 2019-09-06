<%--
  Created by IntelliJ IDEA.
  User: 冯朝阳
  Date: 2019/8/29
  Time: 15:00
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrapTable/css/bootstrap-table.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/ace-rtl.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/ace-skins.min.css"/>
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
        <div class="col-md-12 column" style="width:964px;height:30px;background-color: #c3c3c3;margin-left: -13px">
            <span style="line-height:30px">查看数据</span>

        </div>
    </div>


    <div class="row clearfix">
        <div class="col-md-12 column" style="margin-top: 20px;margin-left: -20px">
            开始日期：&nbsp;&nbsp;<input type="date" style="border-radius:9px;width: 180px"/>&nbsp;&nbsp;&nbsp;
            结束时间：&nbsp;&nbsp;<input type="date" style="border-radius:9px;width: 180px"/>&nbsp;&nbsp;&nbsp;
            <button type="button" class="btn btn-default">查询</button>
            <button type="button" class="btn btn-default">导出活动数据</button>
        </div>
    </div>


    <div class="row clearfix">
      <div class="col-md-12 column" style="margin-top: 20px;margin-left: -20px">
    <ul id="myTab" class="nav nav-tabs">
        <li class="active">
            <a href="#tongji" data-toggle="tab">
                统计图
            </a>
        </li>

        <li>
            <a href="#liebiao" data-toggle="tab">
                详细列表信息
            </a>
        </li>

    </ul>

    <div id="myTabContent" class="tab-content">
        <div class="tab-pane fade in active" id="tongji" >
            <form class="form-horizontal " id="changeMobileForm">
                <!-- 2 设置echarts基板 -->
                <div id="main" style="height: 600px;width: 1000px;"></div>
                <script>
                    // 3 初始化echarts
                    var myChart = echarts.init(document.getElementById('main'));
                    var option = {
                        color: ['#3398DB'],
                        tooltip: {
                            trigger: 'axis',
                            axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                                type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                            }
                        },
                        grid: {
                            left: '3%',
                            right: '4%',
                            bottom: '3%',
                            containLabel: true
                        },
                        xAxis: [
                            {
                                type: 'category',
                                data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
                                axisTick: {
                                    alignWithLabel: true
                                }
                            }
                        ],
                        yAxis: [
                            {
                                type: 'value'
                            }
                        ],
                        series: [
                            {
                                name: '直接访问',
                                type: 'bar',
                                barWidth: '60%',
                                data: [10, 52, 200, 334, 390, 330, 220]
                            }
                        ]
                    };
                    // 5 将配置项和数据加载到echarts中
                    myChart.setOption(option);
                </script>
            </form>
        </div>

        <div class="tab-pane fade" id="liebiao">
            <table id="ArbetTable" class="table"></table>
        </div>

    </div>

        </div>
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
                url: '${pageContext.request.contextPath}/getAll',         //请求后台的URL（*）
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
                        field: 'actualTableCount',
                        title: '实际上报桌数'
                    }, {
                        field: 'newCustomers',
                        title: '新客户人数'
                    },{
                        field: 'oldCustomers',
                        title: '老客户人数'
                    },{
                        field: 'intentionalCustomers',
                        title: '意向客户人数'
                    },{
                        field: 'premium',
                        title: '保费'
                    },{
                        field: 'activityTime',
                        title: '活动时间'
                    },

                    /*{
                        field: 'operate',
                        title: '操作',
                        formatter: operateFormatter //自定义方法，添加操作按钮
                    },*/
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


   /* function operateFormatter(value, row, index) {//赋予的参数
        return [
            '<a class="btn active disabled" href="#">编辑</a>',
            '<a class="btn active" href="#">档案</a>',
            '<a class="btn btn-default" href="#">记录</a>',
            '<a class="btn active" href="#">准入</a>'
        ].join('');
    }*/
</script>


</body>
</html>
