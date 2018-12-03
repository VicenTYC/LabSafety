<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!-- 折线图 及格人数 不及格人数 及格率 最高分 最低分 平均分 标准差 参考人数 考试题 正确率 考试名次 准考证号 姓名 成绩 名次
 -->
<script src="http://cdn.hcharts.cn/highcharts/highcharts.js"></script>
<div>
	<div class="panel panel-default"
		style="margin-left: 20px; margin-right: 20px; position: absolute;">
		<div class="panel-header">统计图表</div>
		<div class="panel-body">
			<div id="container" style="width: 500px; height: 400px; float: left;"></div>
			<div id="container2"
				style="width: 500px; height: 400px; float: left;"></div>
		</div>
	
</div>

</div>

<script type="text/javascript">
	//及格人数饼图
	$(function() {
		$('#container')
				.highcharts(
						{
							chart : {
								plotBackgroundColor : null,
								plotBorderWidth : null,
								plotShadow : false
							},
							title : {
								text : '及格人数占比'
							},
							tooltip : {
								headerFormat : '{series.name}<br>',
								pointFormat : '{point.name}: <b>{point.percentage:.1f}%</b>'
							},
							plotOptions : {
								pie : {
									allowPointSelect : true,
									cursor : 'pointer',
									dataLabels : {
										enabled : true,
										format : '<b>{point.name}</b>: {point.percentage:.1f} %',
										style : {
											color : (Highcharts.theme && Highcharts.theme.contrastTextColor)
													|| 'black'
										}
									},
									states : {
										hover : {
											enabled : false
										}
									},
									slicedOffset : 20, // 突出间距
									point : { // 每个扇区是数据点对象，所以事件应该写在 point 下面
										events : {
											// 鼠标滑过是，突出当前扇区
											mouseOver : function() {
												this.slice();
											},
											// 鼠标移出时，收回突出显示
											mouseOut : function() {
												this.slice();
											},
											// 默认是点击突出，这里屏蔽掉
											click : function() {
												return false;
											}
										}
									}
								}
							},
							credits : {
								enabled : false
							// 禁用版权信息
							},
							series : [ {
								type : 'pie',
								name : '及格人数占比',
								data : [ {
									name : '及格 2人',
									y : 1,
									sliced : true, // 突出显示这个点（扇区），用于强调。
								}, [ '不及格2人',2 ],['未考试2人',2]]

							} ]
						});
	});
</script>

<script>
	//成绩条形图
	$(function() {
		$('#container2').highcharts(
				{
					chart : {
						type : 'column'
					},
					title : {
						text : '成绩统计'
					},
					xAxis : {
						categories : ['未考试','<50','50-60', '60-70', '70-80', '80-90', '90-100' ]
					},
					credits : {
						enabled : false
					// 禁用版权信息
					},
					plotOptions : {
						column : {
							// 关于柱状图数据标签的详细配置参考：https://api.hcharts.cn/highcharts#plotOptions.column.dataLabels
							dataLabels : {
								enabled : true,
								// verticalAlign: 'top', // 竖直对齐方式，默认是 center
								inside : true
							},
							  colorByPoint:true
							
						}
					},			
					series : [ {
						name : '分数段人数',
						data : [ 1,2, 3, 4, 5, 6,7]
					} ]
				});
	});
</script>
