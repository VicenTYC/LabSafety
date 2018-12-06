<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<head>
<jsp:include page="head.jsp"></jsp:include>
<title>实验室安全教育与考试系统</title>
</head>
<body bgcolor="#F0F0F0">
	<jsp:include page="top.jsp" />

	<div id="all" class="">
		<div id="main" class="">
			<div id="left" class="">
				<div id="left_up" class=""
					style="background: #0566c50a; margin-top: 20px;">
					<blockquote class="layui-elem-quote layui-quote-nm">
						<fieldset class="layui-elem-field layui-field-title"
							style="margin-bottom: 30px; width: 100%; border-width: 2px; border-color: #008000;">
							<legend>在线学习</legend>
						</fieldset>

						<div class="layui-tab layui-tab-brief"
							lay-filter="docDemoTabBrief">
							<ul class="layui-tab-title">
								<li class="layui-this" style="font-size: 17px;">文章类</li>
								<li style="font-size: 17px;">题库类</li>
								<li style="font-size: 17px;">视频类</li>
							</ul>
							<div class="layui-tab-content" style="height: 100px;">
								<div class="layui-tab-item layui-show">
									<table align="left" width="660" class="table-item">
										<c:forEach var="type" items="${fileTypeList}"
											varStatus="status">
											<c:if test="${status.index % 3 ==0}">
												<tr>
													<td><span class="layui-badge-dot layui-bg-green"></span><a
														href="getFileResource.do?fileType=${ type.type_id}"
														id="aa">${type.type_name}</a></td>
											</c:if>
											<c:if test="${status.index % 3 !=0}">
												<td><span class="layui-badge-dot layui-bg-green"></span><a
													href="getFileResource.do?fileType=${ type.type_id}" id="aa">${type.type_name}</a></td>
											</c:if>

										</c:forEach>
									</table>
								</div>
								<div class="layui-tab-item ">
									<table align="left" width="660" class="table-item">
										<c:forEach var="qusBankType" items="${questionBankTypeList}"
											varStatus="status">
											<c:if test="${status.index % 3 ==0}">
												<tr>
													<td><span class="layui-badge-dot layui-bg-green"></span><a
														href="getPractice.do?page=1&limit=15&bankId=${qusBankType.type_id}" >
															${qusBankType.bank_name}</a></td>
											</c:if>
											<c:if test="${status.index % 3 !=0}">
												<td><span class="layui-badge-dot layui-bg-green"></span><a
													href="getPractice.do?page=1&limit=15&bankId=${qusBankType.type_id}" >
														${qusBankType.bank_name}</a></td>
											</c:if>

										</c:forEach>
									</table>
								</div>
								<div class="layui-tab-item">
									<table align="left" width="660" class="table-item">
										<tr>
											<td><span class="layui-badge-dot layui-bg-green"></span><a
												href="" id="aa">通识类安全</a></td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</blockquote>
				</div>

				<div id="left_center" class=""
					style="background: #0566c50a; margin-top: 20px;">
					<blockquote class="layui-elem-quote layui-quote-nm">
						<fieldset class="layui-elem-field layui-field-title"
							style="margin-bottom: 30px; width: 100%; border-width: 2px; border-color: #008000;">
							<legend>在线练习</legend>
						</fieldset>
						<table align="left" width="660" class="table-item">
							<c:forEach var="qusBankType" items="${questionBankTypeList}"
								varStatus="status">
								<c:if test="${status.index % 3 ==0}">
									<tr>
										<td><span class="layui-badge-dot layui-bg-green"></span><a
											href="getPractice.do?page=1&limit=15&bankId=${qusBankType.type_id}" id="aa">${qusBankType.bank_name}</a></td>
								</c:if>
								<c:if test="${status.index % 3 !=0}">
									<td><span class="layui-badge-dot layui-bg-green"></span><a
										href="getPractice.do?page=1&limit=15&bankId=${qusBankType.type_id}" id="aa">${qusBankType.bank_name}</a></td>
								</c:if>
							</c:forEach>
						</table>
					</blockquote>
				</div>

				<div id="left_down" class=""
					style="background: #0566c50a; margin-top: 20px;">
					<blockquote class="layui-elem-quote layui-quote-nm">
						<fieldset class="layui-elem-field layui-field-title"
							style="margin-bottom: 30px; width: 100%; border-width: 2px; border-color: #008000;">
							<legend>规章制度</legend>
						</fieldset>
						<ul>
							<c:forEach items="${regulationList}" var="regulation">
								<li style="margin-bottom: 5px;"><span
									class="layui-badge-dot"></span><a
									href="getMoreRegulation.do?fileId=${regulation.file_id }"
									id="ac" title="${regulation.file_name }"><c:if
											test="${fn:length(regulation.file_name) >'22'}">
						  		           ${fn:substring(regulation.file_name,0,22)}...
						  		    </c:if> <c:if test="${fn:length(regulation.file_name) <='22'}">
						  		           ${regulation.file_name}
						  		    </c:if></a></li>
							</c:forEach>
						</ul>
					</blockquote>
				</div>
			</div>
			<div id="right" class="">
				<div class="right-top"
					style="background: #0566c50a; margin-top: 20px; height: 248px">
					<blockquote class="layui-elem-quote layui-quote-nm">
						<fieldset class="layui-elem-field layui-field-title"
							style="margin-bottom: 30px; width: 100%; border-width: 2px; border-color: #008000;">
							<legend>系统公告</legend>
						</fieldset>
						<ul>
							<c:forEach items="${systemNoticeList}" var="systemNotice">
								<li><span class="layui-badge-dot"></span> <a
									href="getMoreSystemNotice.do?noticeId=${systemNotice.notice_id}"
									title=" ${systemNotice.notice_name}"> <c:if
											test="${fn:length(systemNotice.notice_name) >'20'}">
						  		           ${fn:substring(systemNotice.notice_name,0,20)}...
						  		    </c:if> <c:if
											test="${fn:length(systemNotice.notice_name) <='20'}">
						  		           ${systemNotice.notice_name}
						  		    </c:if>
								</a> <span style="float: right;"><fmt:formatDate
											value="${systemNotice.notice_date}" pattern="yy/MM/dd" /></span></li>
							</c:forEach>
						</ul>
					</blockquote>
				</div>
				<div class="right-down">
					<blockquote class="layui-elem-quote">
						<p>
							姓名： <span>${student.student_name}</span>
						</p>
						<p>
							学号： <span>${student.student_id}</span>
						</p>
						<p>
							学院： <span>${student.student_college}</span>
						</p>
						<p>
							班级： <span>${student.student_class}</span>
						</p>
						<p>
							待完成考试：</br>
							<span style="padding-left: 30px;color:#fb2525;">${ examInfo.exam_name}</span>
						</p>

					</blockquote>
				</div>
				<button id="startExam"
					class="layui-btn layui-btn-lg layui-btn-radius">进入考试</button>
			</div>

		</div>

	</div>
	</div>
	<div class="footer">
		<div class="line"></div>
		<p>服务热线 87082976</p>
		<p>版权所有 西北农林科技大学 Copy © NORTHWEST A&amp;F UNIVERSITY All RIGHTS
			RESERVED</p>
	</div>
	<script src="./Resource/js/jquery.min.js" charset="utf-8"></script>
	<script src="./Resource/js/layui.js" charset="utf-8"></script>
	<script>
		layui.use([ 'layer' ], function() {
			var layer = layui.layer;

			var errMsg = '${errMsg}';
			if (errMsg != null && errMsg != '')
				layer.msg(errMsg, {
					time : 2500
				});
			else
				;

			var exam_id = '${examInfo.exam_id}';
			$("#startExam").click(function() {
				if (exam_id == '') {
					layer.msg("太棒了！你没有考试", {
						time : 2500
					});
				} else {
                    layer.open({
                        type: 1
                        ,title: false //不显示标题栏
                        ,closeBtn: false
                        ,area: '300px;'
                        ,shade: 0.8
                        ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
                        ,btn: ['确认', '取消']
                        ,btnAlign: 'c'
                        ,moveType: 1 //拖拽模式，0或者1
                        ,content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">请输入考试密码<br><input type="password" id="examPwd"></div>'
                        ,success: function(layero){
                            var btn = layero.find('.layui-layer-btn');
                            btn.find('.layui-layer-btn0').attr({
                                onclick:"gotoExam()"
                            });
                        }
                    });
				}
			});

		})
		function gotoExam() {
		    var pwd = $('#examPwd').val();
            var exam_id = '${examInfo.exam_id}';
            var ival = parseInt(pwd);//如果变量val是字符类型的数则转换为int类型 如果不是则ival为NaN
            if(isNaN(ival)){
                alert("密码包含非数字");
            }
           else {
                var form = $("<form method='post'></form>");
                form.attr({
                    "action": "/labsafety/startExam.do"
                });
                var input = $("<input type='hidden'>");
                input.attr({
                    "name": "examId"
                });
                input.val(exam_id);
                form.append(input);

                var input1 = $("<input type='hidden'>");
                input1.attr({
                    "name": "pwd"
                });
                input1.val(pwd.trim());
                form.append(input1);
                $("html").append(form);
                form.submit();
            }
        }
	</script>
</body>
</html>