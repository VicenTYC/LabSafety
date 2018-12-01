<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>在线考试</title>
<link href="./Resource/css/exam_main.css" rel="stylesheet"
	type="text/css" />
<link href="./Resource/css/exam_iconfont.css" rel="stylesheet"
	type="text/css" />
<link href="./Resource/css/exam_test.css" rel="stylesheet"
	type="text/css" />
<link href="./Resource/js/css/layui.css" rel="stylesheet"
	type="text/css" />

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
					<form action="commitPaper.do" method="post">
						<div class="test_title">
							<p class="test_time">
								<b class="alt-1"></b>
							</p>
							<font><input type="submit" name="test_jiaojuan" value="交卷"></font>
						</div>
						<c:if test="${nowExam.single_num!=0 }">
							<div class="test_content">
								<div class="test_content_title">
									<h2>单选题</h2>
									<p>
										<span>共</span><i class="content_lit">${nowExam.single_num}</i><span>题，</span><span>合计</span><i
											class="content_fs">${nowExam.single_num*nowExam.single_score}</i><span>分</span>
									</p>
								</div>
							</div>
							<div class="test_content_nr">
								<ul>
									<c:forEach items="${singleList}" var="que" varStatus="status">
										<li id="qu_0_${status.index }">
											<div class="test_content_nr_tt">
												<i>${status.count}</i><span>(${nowExam.single_score}分)</span><font>${que.question_content }</font><b
													class="icon iconfont">&#xe881;</b>
											</div>

											<div class="test_content_nr_main">
												<ul>
													<c:set var="string1" value="${ que.question_item}" />
													<c:set var="stringA" value="${fn:split(string1, ' ')}" />
													<li class="option"><label
														for="0_answer_${status.count}_option_1"><input
															type="radio" class="radioOrCheck"
															name="single${status.count}"
															id="0_answer_${status.count}_option_1" value="a" /> A.
															<p class="ue" style="display: inline;">${stringA[0]}</p>
													</label></li>

													<li class="option"><label
														for="0_answer_${status.count}_option_2"><input
															type="radio" class="radioOrCheck"
															name="single${status.count}"
															id="0_answer_${status.count}_option_2" value="b" /> B.
															<p class="ue" style="display: inline;">${stringA[1]}</p>
													</label></li>

													<li class="option"><label
														for="0_answer_${status.count}_option_3"><input
															type="radio" class="radioOrCheck"
															name="single${status.count}"
															id="0_answer_${status.count}_option_3" value="c" /> C.
															<p class="ue" style="display: inline;">${stringA[2]}</p>
													</label></li>

													<li class="option"><label
														for="0_answer_${status.count}_option_4"><input
															type="radio" class="radioOrCheck"
															name="single${status.count}"
															id="0_answer_${status.count}_option_4" value="d" /> D.
															<p class="ue" style="display: inline;">${stringA[3]}</p>
													</label></li>
												</ul>
											</div>
										</li>
									</c:forEach>
								</ul>
							</div>
						</c:if>
						<c:if test="${nowExam.mulit_num!=0 }">
							<div class="test_content">
								<div class="test_content_title">
									<h2>多选题</h2>
									<p>
										<span>共</span><i class="content_lit">${nowExam.mulit_num}</i><span>题，</span><span>合计</span><i
											class="content_fs">${nowExam.mulit_num*nowExam.mulit_score}</i><span>分</span>
									</p>
								</div>
							</div>
							<div class="test_content_nr">
								<ul>
									<ul>
										<c:forEach items="${mulitList}" var="que" varStatus="status">
											<li id="qu_1_${status.index }">
												<div class="test_content_nr_tt">
													<i>${status.count}</i><span>(${nowExam.mulit_score}分)</span><font>${que.question_content }</font><b
														class="icon iconfont">&#xe881;</b>
												</div>

												<div class="test_content_nr_main">
													<ul>
														<c:set var="string1" value="${ que.question_item}" />
														<c:set var="stringA" value="${fn:split(string1, ' ')}" />
														<li class="option"><label
															for="1_answer_${status.count}_option_1"><input
																type="checkbox" class="radioOrCheck"
																name="mulit${status.count}" value="a"
																id="1_answer_${status.count}_option_1" /> A.
																<p class="ue" style="display: inline;">${stringA[0]}</p>
														</label></li>

														<li class="option"><label
															for="1_answer_${status.count}_option_2"
															<input type="checkbox"
														class="radioOrCheck" name="mulit${status.count}" value="b"
														id="1_answer_${status.count}_option_2" />>
																B.
																<p class="ue" style="display: inline;">${stringA[1]}</p>
														</label></li>

														<li class="option"><label
															for="1_answer_${status.count}_option_3"><input
																type="checkbox" class="radioOrCheck"
																name="mulit${status.count}" value="c"
																id="1_answer_${status.count}_option_3" /> C.
																<p class="ue" style="display: inline;">${stringA[2]}</p>
														</label></li>

														<li class="option"><label
															for="1_answer_${status.count}_option_4"><input
																type="checkbox" class="radioOrCheck"
																name="mulit${status.count}" value="d"
																id="1_answer_${status.count}_option_4" /> D.
																<p class="ue" style="display: inline;">${stringA[3]}</p>
														</label></li>
													</ul>
												</div>
											</li>
										</c:forEach>
									</ul>
							</div>
						</c:if>

						<c:if test="${nowExam.torf_num!=0}">
							<div class="test_content">
								<div class="test_content_title">
									<h2>判断题</h2>
									<p>
										<span>共</span><i class="content_lit">${nowExam.torf_num}</i><span>题，</span><span>合计</span><i
											class="content_fs">${nowtorf.single_num*nowExam.torf_score}</i><span>分</span>
									</p>
								</div>
							</div>
							<div class="test_content_nr">
								<ul>
									<c:forEach items="${torfList}" var="que" varStatus="status">
										<li id="qu_3_${status.index }">
											<div class="test_content_nr_tt">
												<i>${status.count}</i><span>(${nowExam.torf_score}分)</span><font>${que.question_content }</font><b
													class="icon iconfont">&#xe881;</b>
											</div>

											<div class="test_content_nr_main">
												<ul>
													<li class="option"><label
														for="3_answer_${status.count}_option_1"> <input
															type="radio" class="radioOrCheck"
															name="torf${status.count}" value="a"
															id="3_answer_${status.count}_option_1" />
															<p class="ue" style="display: inline;" value="A">是</p>
													</label></li>
													<li class="option"><label
														for="3_answer_${status.count}_option_2"> <input
															type="radio" class="radioOrCheck"
															name="torf${status.count}" value="b"
															id="3_answer_${status.count}_option_2" />
															<p class="ue" style="display: inline;" value="B">否</p>
													</label></li>
												</ul>
											</div>
										</li>
									</c:forEach>
								</ul>
							</div>
						</c:if>
					</form>
				</div>
			</div>
			<div class="nr_right">
				<div class="nr_rt_main">
					<div class="rt_nr1">
						<div class="rt_nr1_title">
							<h1>答题卡</h1>
							<p class="test_time">
								<b class="alt-1"></b>
							</p>
						</div>
						<div class="rt_content">
							<c:if test="${nowExam.single_num!=0 }">
								<div class="rt_content_tt">
									<h2>单选题</h2>
									<p>
										<span>共</span><i class="content_lit">${nowExam.single_num }</i><span>题</span>
									</p>
								</div>
								<div class="rt_content_nr answerSheet">
									<ul>
										<c:forEach var="x" begin="0" end="${nowExam.single_num -1}">
											<li><a href="#qu_0_${x}">${x+1}</a></li>
										</c:forEach>
									</ul>
								</div>
						</div>
						</c:if>
						<c:if test="${nowExam.mulit_num!=0 }">
							<div class="rt_content">
								<div class="rt_content_tt">
									<h2>多选题</h2>
									<p>
										<span>共</span><i class="content_lit">${nowExam.mulit_num }</i><span>题</span>
									</p>
								</div>
								<div class="rt_content_nr answerSheet">
									<ul>
										<c:forEach var="x" begin="0" end="${nowExam.mulit_num -1}">
											<li><a href="#qu_1_${x}">${x+1}</a></li>
										</c:forEach>
									</ul>
								</div>
							</div>
						</c:if>
						<c:if test="${nowExam.torf_num!=0 }">
							<div class="rt_content">
								<div class="rt_content_tt">
									<h2>判断题</h2>
									<p>
										<span>共</span><i class="content_lit">${nowExam.torf_num }</i><span>题</span>
									</p>
								</div>
								<div class="rt_content_nr answerSheet">
									<ul>
										<c:forEach var="x" begin="0" end="${nowExam.torf_num -1}">
											<li><a href="#qu_3_${x}">${x+1}</a></li>
										</c:forEach>
									</ul>
								</div>
							</div>
						</c:if>

					</div>

				</div>
			</div>
		</div>
		<!--nr end-->
		<div class="foot"></div>
	</div>

	<script src="./Resource/js/layui.js" charset="utf-8"></script>
	<script src="./Resource/js/jquery.min.js"></script>
	<script src="./Resource/js/jquery.easy-pie-chart.js"></script>
	<script src="./Resource/js/exampaper.js"></script>
	<script>
	// 倒计时
	layui.use('util', function(){
		  var util = layui.util;
		  
		  var serverTime = new Date(${year},${month},${sday},${shour},${sminute},${ssecond}).getTime();// 假设为当前服务器时间，这里采用的是本地时间，实际使用一般是取服务端的
		  var endTime = new Date(${year},${month},${eday},${ehour},${eminute},${esecond}).getTime() // 假设为结束日期
		  
		  util.countdown(endTime, serverTime, function(date, serverTime, timer){
		    var str = date[1] + '时' +  date[2] + '分' + date[3] + '秒';
		    layui.$('.alt-1').html(''+ str);
		    if(date[1]==0&&date[2]==0&&date[3]==0)
		    	test();
		  });
		});
	</script>
</body>
</html>