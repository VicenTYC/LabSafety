<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% 
String path = request.getContextPath(); 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>在线考试</title>
<link href="../Resource/css/exam_main.css" rel="stylesheet" type="text/css" />
<link href="../Resource/css/exam_iconfont.css" rel="stylesheet" type="text/css" />
<link href="../Resource/css/exam_test.css" rel="stylesheet" type="text/css" />

<style>
.hasBeenAnswer {
	background: #5d9cec;
	color: #fff;
}
</style>
</head>

<body>
	<div class="main">
		<!--nr start-->
		<div class="test_main">
			<div class="nr_left">
				<div class="test">
					<form action="" method="post">
						<div class="test_title">
							<p class="test_time">
								<i class="icon iconfont">&#xe6fb;</i><b class="alt-1">01:40</b>
							</p>
							<font><input type="button" name="test_jiaojuan" value="交卷"></font>
						</div>

						<div class="test_content">
							<div class="test_content_title">
								<h2>单选题</h2>
								<p>
									<span>共</span><i class="content_lit">60</i><span>题，</span><span>合计</span><i
										class="content_fs">60</i><span>分</span>
								</p>
							</div>
						</div>
						<div class="test_content_nr">
							<ul>

								<li id="qu_0_0">
									<div class="test_content_nr_tt">
										<i>1</i><span>(1分)</span><font>在生产管理信息系统中，下列操作步骤能正确将工单推进流程的是（
											）</font><b class="icon iconfont">&#xe881;</b>
									</div>

									<div class="test_content_nr_main">
										<ul>

											<li class="option"><input type="radio"
												class="radioOrCheck" name="answer1" id="0_answer_1_option_1" />


												<label for="0_answer_1_option_1"> A.
													<p class="ue" style="display: inline;">在工具栏中点击“workflow”标签</p>
											</label></li>

											<li class="option"><input type="radio"
												class="radioOrCheck" name="answer1" id="0_answer_1_option_2" />


												<label for="0_answer_1_option_2"> B.
													<p class="ue" style="display: inline;">在缺陷单界面中点击“推进流程”按钮</p>
											</label></li>

											<li class="option"><input type="radio"
												class="radioOrCheck" name="answer1" id="0_answer_1_option_3" />


												<label for="0_answer_1_option_3"> C.
													<p class="ue" style="display: inline;">在缺陷单界面中点击“提交”按钮</p>
											</label></li>

											<li class="option"><input type="radio"
												class="radioOrCheck" name="answer1" id="0_answer_1_option_4" />


												<label for="0_answer_1_option_4"> D.
													<p class="ue" style="display: inline;">后台启动流程推进</p>
											</label></li>

										</ul>
									</div>
								</li>

								<li id="qu_0_1">
									<div class="test_content_nr_tt">
										<i>2</i><span>(1分)</span><font>在营销系统中查询客户有无欠费、余额及抄表数据接待客户时应做到哪些最基本的礼仪？</font><b
											class="icon iconfont">&#xe881;</b>
									</div>

									<div class="test_content_nr_main">
										<ul>

											<li class="option"><input type="radio"
												class="radioOrCheck" name="answer2" id="0_answer_2_option_1" />


												<label for="0_answer_2_option_1"> A.
													<p class="ue" style="display: inline;">起身、微笑、示坐、问候客户</p>
											</label></li>

											<li class="option"><input type="radio"
												class="radioOrCheck" name="answer2" id="0_answer_2_option_2" />


												<label for="0_answer_2_option_2"> B.
													<p class="ue" style="display: inline;">坐着，问候客户</p>
											</label></li>

											<li class="option"><input type="radio"
												class="radioOrCheck" name="answer2" id="0_answer_2_option_3" />


												<label for="0_answer_2_option_3"> C.
													<p class="ue" style="display: inline;">坐着，问候客户</p>
											</label></li>

											<li class="option"><input type="radio"
												class="radioOrCheck" name="answer2" id="0_answer_2_option_4" />


												<label for="0_answer_2_option_4"> D.
													<p class="ue" style="display: inline;">请问需要办理什么业务</p>
											</label></li>

										</ul>
									</div>
								</li>

							</ul>
						</div>

						<div class="test_content">
							<div class="test_content_title">
								<h2>多选题</h2>
								<p>
									<span>共</span><i class="content_lit">30</i><span>题，</span><span>合计</span><i
										class="content_fs">30</i><span>分</span>
								</p>
							</div>
						</div>
						<div class="test_content_nr">
							<ul>

								<li id="qu_1_0">
									<div class="test_content_nr_tt">
										<i>1</i><span>(1分)</span><font>以下属于南方电网员工职业操守中明文规定的有()</font><b
											class="icon iconfont">&#xe881;</b>
									</div>

									<div class="test_content_nr_main">
										<ul>

											<li class="option"><input type="checkbox"
												class="radioOrCheck" name="answer1" id="1_answer_1_option_1" />

												<label for="1_answer_1_option_1"> A.
													<p class="ue" style="display: inline;">热爱祖国、热爱南网、热爱岗位</p>
											</label></li>

											<li class="option"><input type="checkbox"
												class="radioOrCheck" name="answer1" id="1_answer_1_option_2" />

												<label for="1_answer_1_option_2"> B.
													<p class="ue" style="display: inline;">遵纪守法、忠于职守、令行禁止</p>
											</label></li>

											<li class="option"><input type="checkbox"
												class="radioOrCheck" name="answer1" id="1_answer_1_option_3" />

												<label for="1_answer_1_option_3"> C.
													<p class="ue" style="display: inline;">客户至上、诚实守信、优质服务</p>
											</label></li>

											<li class="option"><input type="checkbox"
												class="radioOrCheck" name="answer1" id="1_answer_1_option_4" />

												<label for="1_answer_1_option_4"> D.
													<p class="ue" style="display: inline;">公平竞争、互相监督、服从监管</p>
											</label></li>

										</ul>
									</div>
								</li>

								<li id="qu_1_1">
									<div class="test_content_nr_tt">
										<i>2</i><span>(1分)</span><font>以下属于南方电网员工职业禁区的有()</font><b
											class="icon iconfont">&#xe881;</b>
									</div>

									<div class="test_content_nr_main">
										<ul>

											<li class="option"><input type="checkbox"
												class="radioOrCheck" name="answer2" id="1_answer_2_option_1" />

												<label for="1_answer_2_option_1"> A.
													<p class="ue" style="display: inline;">严禁违反人文道德</p>
											</label></li>

											<li class="option"><input type="checkbox"
												class="radioOrCheck" name="answer2" id="1_answer_2_option_2" />

												<label for="1_answer_2_option_2"> B.
													<p class="ue" style="display: inline;">严禁违反安全规定</p>
											</label></li>

											<li class="option"><input type="checkbox"
												class="radioOrCheck" name="answer2" id="1_answer_2_option_3" />

												<label for="1_answer_2_option_3"> C.
													<p class="ue" style="display: inline;">严禁违背行风规定</p>
											</label></li>

											<li class="option"><input type="checkbox"
												class="radioOrCheck" name="answer2" id="1_answer_2_option_4" />

												<label for="1_answer_2_option_4"> D.
													<p class="ue" style="display: inline;">严禁违反财经纪律</p>
											</label></li>

										</ul>
									</div>
								</li>

							</ul>
						</div>

					</form>
				</div>

			</div>
			<div class="nr_right">
				<div class="nr_rt_main">
					<div class="rt_nr1">
						<div class="rt_nr1_title">
							<h1>
								<i class="icon iconfont">&#xe692;</i>答题卡
							</h1>
							<p class="test_time">
								<i class="icon iconfont">&#xe6fb;</i><b class="alt-1">01:40</b>
							</p>
						</div>

						<div class="rt_content">
							<div class="rt_content_tt">
								<h2>单选题</h2>
								<p>
									<span>共</span><i class="content_lit">60</i><span>题</span>
								</p>
							</div>
							<div class="rt_content_nr answerSheet">
								<ul>

									<li><a href="#qu_0_0">1</a></li>

									<li><a href="#qu_0_1">2</a></li>

									<li><a href="#qu_0_2">3</a></li>

									<li><a href="#qu_0_3">4</a></li>

									<li><a href="#qu_0_4">5</a></li>

									<li><a href="#qu_0_5">6</a></li>

									<li><a href="#qu_0_6">7</a></li>

								</ul>
							</div>
						</div>

						<div class="rt_content">
							<div class="rt_content_tt">
								<h2>多选题</h2>
								<p>
									<span>共</span><i class="content_lit">30</i><span>题</span>
								</p>
							</div>
							<div class="rt_content_nr answerSheet">
								<ul>

									<li><a href="#qu_1_0">1</a></li>

									<li><a href="#qu_1_1">2</a></li>

									<li><a href="#qu_1_2">3</a></li>

									<li><a href="#qu_1_3">4</a></li>

									<li><a href="#qu_1_4">5</a></li>

									<li><a href="#qu_1_5">6</a></li>

									<li><a href="#qu_1_6">7</a></li>

									<li><a href="#qu_1_7">8</a></li>



								</ul>
							</div>
						</div>

					</div>

				</div>
			</div>
		</div>
		<!--nr end-->
		<div class="foot"></div>
	</div>

	<script src="../Resource/js/layui.js" charset="utf-8"></script>
	<script src="../Resource/js/jquery.min.js"></script>
	<script src="../Resource/js/jquery.easy-pie-chart.js"></script>
	<!--时间js-->
	<script src="../Resource/js/time/jquery.countdown.js"></script>
	<script>
		window.jQuery(function($) {
			"use strict";
			
			$('time').countDown({
				with_separators : false
			});
			$('.alt-1').countDown({
				css_class : 'countdown-alt-1'
			});
			$('.alt-2').countDown({
				css_class : 'countdown-alt-2'
			});
			
		});
		
		
		$(function() {
			$('li.option label').click(function() {
			debugger;
				var examId = $(this).closest('.test_content_nr_main').closest('li').attr('id'); // 得到题目ID
				var cardLi = $('a[href=#' + examId + ']'); // 根据题目ID找到对应答题卡
				// 设置已答题
				if(!cardLi.hasClass('hasBeenAnswer')){
					cardLi.addClass('hasBeenAnswer');
				}
				
			});
		});
	</script>
</body>
</html>