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
														href="" id="aa">${qusBankType}</a></td>
											</c:if>
											<c:if test="${status.index % 3 !=0}">
												<td><span class="layui-badge-dot layui-bg-green"></span><a
													href="" id="aa">${qusBankType}</a></td>
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
											href="" id="aa">${qusBankType}</a></td>
								</c:if>
								<c:if test="${status.index % 3 !=0}">
									<td><span class="layui-badge-dot layui-bg-green"></span><a
										href="" id="aa">${qusBankType}</a></td>
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
					</blockquote>
				</div>
				<button class="layui-btn layui-btn-lg layui-btn-radius">进入考试</button>

				<%-- <center>
					<img src="./Resource/images/3wm.jpg" width="400px" height="200px">
				</center> --%>
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

</body>
</html>