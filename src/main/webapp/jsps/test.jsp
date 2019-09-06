<%--
  Created by IntelliJ IDEA.
  User: 冯朝阳
  Date: 2019/9/2
  Time: 10:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <!-- 1 引入echarts类库 -->
    <script type="text/javascript" src="/static/echarts/echarts.min.js" ></script>
</head>
<body>
<!-- 2 设置echarts基板 -->
<div id="main" style="height: 800px;width: 1200px;"></div>
<script>

// 3 初始化echarts
var myChart = echarts.init(document.getElementById('main'));
var option = {
color: ['#3398DB'],
tooltip : {
trigger: 'axis',
axisPointer : {            // 坐标轴指示器，坐标轴触发有效
type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
}
},
grid: {
left: '3%',
right: '4%',
bottom: '3%',
containLabel: true
},
xAxis : [
{
type : 'category',
data : ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
axisTick: {
alignWithLabel: true
}
}
],
yAxis : [
{
type : 'value'
}
],
series : [
{
name:'直接访问',
type:'bar',
barWidth: '60%',
data:[10, 52, 200, 334, 390, 330, 220]
}
]
};

// 5 将配置项和数据加载到echarts中
myChart.setOption(option);
</script>
</body>
</html>
