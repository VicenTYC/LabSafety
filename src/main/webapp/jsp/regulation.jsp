<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>规章制度</title>
<link rel="stylesheet" type="text/css" href="./Resource/css/layui.css">
<script src="./Resource/js/layui.js" charset="utf-8"></script>
<link href="./Resource/css/main.css" rel="stylesheet" type="text/css" />
<link href="./Resource/css/system_notice.css" rel="stylesheet" />
<link href="./Resource/css/layui.css" rel="stylesheet" media="all" />
<script>
	
</script>
</head>
<body>
	<jsp:include page="top.jsp" />
	<div id="main">
		<div id="left">
			<blockquote class="layui-elem-quote"
				style="padding: 5px; padding-bottom: 10px; border-left: 5px solid #1ea1bf; background-color: #339de426;">
				<div id="left_up">
					<fieldset class="layui-elem-field layui-field-title"
						style="margin-top: 20px;">
						<legend>
							<p class="p_1">规章制度</p>
						</legend>
					</fieldset>
				</div>
				<div id="left_down">
					<ul class="layui-timeline">
						<c:forEach items="${regulationList}" var="regulation">
							<a href="javascript:void(0)" class="getNotice"
								fileId="${regulation.file_id}"><li
								class="layui-timeline-item"><i
									class="layui-icon layui-timeline-axis"></i>
									<div class="layui-timeline-content layui-text">
										<%-- <h3 class="layui-timeline-title">
											<fmt:formatDate value="${regulation.file_date}"
												pattern="yy年MM月dd日" />
										</h3>  --%>
										<p>${regulation.file_name}</p>
									</div></li> </a>
						</c:forEach>
					</ul>
				</div>
				<div id="demo6">
					<button class="layui-btn layui-btn-normal layui-btn-sm"
						style="background-color: #646f773b; margin-right: 40px"
						id="prePage" title="上一页" curentPage="${curPage}">
						<i class="layui-icon">∧</i>
					</button>
					<button class="layui-btn layui-btn-normal layui-btn-sm"
						style="background-color: #646f773b;" id="nextPage">
						<i class="layui-icon" title="下一页" curentPage="${curPage}" pA ="${pageAmount}">∨</i>
						
					</button>
				</div>
			</blockquote>

		</div>
		<div id="right">
			<div id="right_up">
				<span class="layui-breadcrumb" lay-separator=" / "> <a
					href="getIndex.do">首页</a> <a href="">规章制度</a> <a><cite>正文</cite></a>
				</span>
			</div>

			<div id="riht_down">
				<div class="layui-card">
					<div class="layui-card-header"
						style="text-align: center; font-size: 1rem; font-weight: 600;"
						id="fileTitle">${regulation.file_name }</div>
					<%-- <div id="fileDate" style="text-align: center;background: #f6f6f6; font-size: 11px;">
					    发布时间：<fmt:formatDate value="${regulation.file_date}"
												pattern="yy年MM月dd日" />
					</div> --%>
					<div class="layui-card-body" id="fileContent">
						${regulation.file_content}</div>
				</div>
			</div>
		</div>
	</div>	
	</div>
	<div class="footer">
    	<div class="line"> </div>
        <p> 服务热线 87082976</p>
        <p> 版权所有 西北农林科技大学 Copy © NORTHWEST A&amp;F UNIVERSITY All RIGHTS RESERVED</p>
    </div>
	<script src="./Resource/js/jquery.min.js"></script>
	<script>
		$(function() {
			$(".getNotice").click(function() {
				var noticeId = $(this).attr("fileId");
				$.ajax({
					url : "/labsafety/learn/getRegulation.do?fileId=" + noticeId,
					type : "POST",
					dataType : "json",
					async : false,
					success : function(data) {
						$("#fileTitle").html(data.file_name);
						$("#fileDate").html('发布时间：'+data.file_date);
						$("#fileContent").html(data.file_content);
					}
				});
			})
		});

		$(function() {
			$("#prePage")
					.click(
							function() {
								var curPage = $(this).attr("curentPage");
								if (curPage == 1) {
									alert("没有更多啦");
								}
								if (curPage != 1) {
									var newPage = curPage - 1;
									requestPost(newPage);
									$(this).setAttribute("curentPage",newPage);
								}
							});

		})
		
		$(function() {
			$("#nextPage")
					.click(
							function() {
								var curPage = $(this).attr("curentPage");
								var pageEnd = $(this).attr("pA");
								if (curPage == pageEnd) {
									alert("没有更多啦");
								}
								else  {
									var newPage = curPage + 1;
									requestPost(newPage);
									$(this).setAttribute("curentPage",newPage);
								}
							});

		})
		function requestPost(newPage){
			$.ajax({
				url : "/labsafety/learn/getNewRegulation.do?pageNum="
						+ newPage,
				type : "POST",
				dataType : "json",
				async : false,
				success : function(data) {					
					var divInner = document
							.getElementById("left_down");
					divInner.innerHTML = '<ul class="layui-timeline" id="iterul"></ul>';
					var test = document
							.getElementById("iterul");
					for (var i = 0; i < data.length; i++) {
						test.innerHTML += '<a href="javascript:void(0)" class="getNotice" noticeId="'
								+ data[i].file_id
								+ '"><li class="layui-timeline-item"><i class="layui-icon layui-timeline-axis"></i>'
								+ '<div class="layui-timeline-content layui-text"><h3 class="layui-timeline-title">'
								+ data[i].file_date
								+ '</h3><p>'
								+ data[i].file_name
								+ '</p></div></li> </a>';
					}
				}
			});
		} 
	</script>
</body>
</html>