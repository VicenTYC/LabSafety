<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- meat
	meta信息
 -->
<jsp:include page="./common/meta.jsp"></jsp:include>
<!-- end meat -->

<!-- 
导入页面公共css
 -->
<jsp:include page="./common/linkcss.jsp"></jsp:include>
<!-- 
单个页面所用css放在这下面
 -->
<jsp:include page="./common/importjs.jsp"></jsp:include>
<title>教师用户</title>
</head>

<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo"
				style="width: 17%; color: #fff; font-size: 1.3rem;">实验室安全考试后台管理系统</div>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="javascript:;"> <img
						src="http://t.cn/RCzsdCq" class="layui-nav-img"> ${teacher.teacher_name}
				</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="">基本资料</a>
						</dd>
						<dd>
							<a href="">安全设置</a>
						</dd>
					</dl></li>
				<li class="layui-nav-item"><a href="quit.do?user=teacher">退出</a></li>
			</ul>
		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree" lay-filter="test">
					<li class="layui-nav-item"><a class="" href="javascript:;">题库维护</a>
						<dl class="layui-nav-child">
							<dd>
								<li class="layui-nav-item"><a class="" href="javascript:;">浏览题库</a>
									<dl class="layui-nav-child" style="padding-left: 6%;">
										<c:forEach var="iter" items="${banktype}">
											<dd>
												<a href="javascript:void(0)" op="queslist"
													type="${iter.type_id}" onclick="childRelod(this)">${iter.bank_name}</a>
											</dd>
										</c:forEach>

									</dl>
							</dd>
							<dd>
								<a href="javascript:void(0)" op="addquestion"
									onclick="childRelod(this)" title="新增题目">新增题目</a>
							</dd>
							<dd>
								<a href="javascript:void(0)" op="importquestions"
									onclick="childRelod(this)" title="批量导入">批量导入</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;"> 安排考试</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:void(0)" op="newexam"
									onclick="childRelod(this)" title="新建考试">新建考试</a>
							</dd>
							<dd>
								<a href="javascript:void(0)" op="examlist"
									onclick="childRelod(this)" title="考试管理">考试管理</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;">结果统计</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:void(0)" op="picresult"
									onclick="childRelod(this)" title="统计图表">统计图表</a>
							</dd>
							<dd>
								<a href="javascript:void(0)" op="tableresult"
									onclick="childRelod(this)" title="学生成绩表">学生成绩表</a>
							</dd>
						</dl></li>
					<!-- <li class="layui-nav-item"><a href="javascript:;">学生导入</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:void(0)" op="importstudent"
									onclick="childRelod(this)" title="批量导入">批量导入</a>
							</dd>
						</dl></li> -->
				</ul>
			</div>
		</div>

		<div class="layui-body" style="padding-top: 10px">
			<c:if test="${op=='queslist'}">
				<jsp:include page="./teacher/questionslist.jsp"></jsp:include>
			</c:if>
			<c:if test="${op=='addquestion'}">
				<jsp:include page="./teacher/addquestion.jsp"></jsp:include>
			</c:if>
			<c:if test="${op=='importquestions'}">
				<jsp:include page="./teacher/importquestions.jsp"></jsp:include>
			</c:if>
			<c:if test="${op=='newexam'}">
				<jsp:include page="./teacher/newexam.jsp"></jsp:include>
			</c:if>
			<c:if test="${op=='examlist'}">
				<jsp:include page="./teacher/examlist.jsp"></jsp:include>
			</c:if>
			<c:if test="${op=='picresult'}">
				<jsp:include page="./teacher/picresult.jsp"></jsp:include>
			</c:if>
			<c:if test="${op=='tableresult'}">
				<jsp:include page="./teacher/tableresult.jsp"></jsp:include>
			</c:if>
			<%-- <c:if test="${op=='importstudent'}">
				<jsp:include page="./teacher/importstudent.jsp"></jsp:include>
			</c:if> --%>
		</div>

		<script type="text/javascript">
			/*实现侧边功能栏的跳转  */
			function childRelod(sel) {
				var op = $(sel).attr("op");
				var banktype = $(sel).attr("type");

				var form = $("<form method='post'></form>");
				form.attr({
					"action" : "/labsafety/exam/bgIndex.do"
				});

				var input = $("<input type='hidden'>");
				input.attr({
					"name" : "op"
				});
				input.val(op);
				form.append(input);
				var input = $("<input type='hidden'>");
				input.attr({
					"name" : "banktype"
				});
				input.val(banktype);
				form.append(input);

				$("html").append(form);
				form.submit();
			}

			$(document).ready(function() {
				var ii = layer.load();
				//此处用setTimeout演示ajax的回调
				setTimeout(function() {
					layer.close(ii);
				}, 500);
			});
		</script>
		<script>
			//注意：选项卡 依赖 element 模块，否则无法进行功能性操作
			layui.use('element', function() {
				var element = layui.element;

				//…
			});
		</script>

		<jsp:include page="./common/footer.jsp"></jsp:include>