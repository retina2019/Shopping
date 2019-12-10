<%--
  Created by IntelliJ IDEA.
  User: stone
  Date: 2019-12-10
  Time: 15:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>ECharts</title>
    <link rel="stylesheet" type="text/css" href="/Shopping/H-ui.admin/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="/Shopping/H-ui.admin/static/h-ui.admin/css/H-ui.admin.css" />
    <!-- 引入 echarts.js -->
    <script src="/Shopping/H-ui.admin/lib/echarts/3.4.0/echarts.common.min.js"></script>
    <script type="text/javascript" src="/Shopping/H-ui.admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
    <script type="text/javascript" src="/Shopping/H-ui.admin/lib/jquery/1.9.1/jquery.min.js"></script>
</head>
<body>
<div id="main" style="width: 600px;height:400px;">
<%--    <a href="javascript:;" name="submit" id="submitButton"  onclick="query()"><i class="Hui-iconfont">&#xe665;</i> 查看商品库存统计图</a>--%>
<%--    <a data-href="/Shopping/echarts/echart" data-title="每日库存商品统计" href="javascript:void(0)">每日库存商品统计</a>--%>

</div>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));
    function query() {
        myChart.setOption({
            title: {
                text: '每日库存情况统计',
                // subtext: '纯属虚构',
                x: 'center'
            },
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                left: 'left',
                <%--data:${cutId},--%>
                data:['饮料','饼干','休闲食品']
            },
            series: [
                {
                    name: '访问来源',
                    type: 'pie',
                    radius: '55%',
                    center: ['50%', '60%'],
                    data:${dataArr},
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            ]
        });//加载数据图表
    }
query();
</script>
</body>
</html>
