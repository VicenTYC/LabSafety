<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
#examtable tr th {
	text-align: center;
}

#examtable tr td {
	text-align: center;
}
</style>
<div class="panel panel-default">
	<div class="panel-header">考试列表</div>
	<div class="panel-body">
		<table class="table table-hover table-bordered table-striped "
			id="examtable">

			<tr>
				<th class="col-2">考试场次ID</th>
				<th class="col-2">考试名称</th>
				<th class="col-2">开考时间</th>
				<th class="col-2">考试时长</th>
				<th class="col-2">是否结束</th>
				<th class="col-2">删除</th>
			</tr>
			<c:forEach items="${examList}" var="exam" varStatus="stat">
				<tr>
					<td>${stat.count}</td>
					<td>${exam.exam_name }</td>
					<td><fmt:formatDate value="${exam.exam_begin_time }"
							pattern="yyyy年MM月dd日 HH:mm:ss" /></td>
					<td><fmt:formatDate value="${exam.exam_duration }"
							pattern="HH:mm:ss" /></td>

					<td><c:if test="${exam.if_finish == 1}">
					           已结束
					     </c:if> <c:if test="${exam.if_finish == 0}">
					             未结束
					     </c:if></td>
					<td>
						<div class="btn-group">
							<a href="javascript:void(0)" class="btn btn-danger"
								examId="${exam.exam_id }" onclick="deleExam(this)">删除</a>
						</div>
					</td>
				</tr>
			</c:forEach>
		</table>
		<br />
	</div>
	<script>
	 layui.use(['layer'], function(){
	        var layer = layui.layer;
	  })
	  function deleExam(sel){
		  var examId = $(sel).attr('examId');
			$.ajax({
				type : 'POST',
				url : "/labsafety/exam/deleExam.do", // ajax请求路径
				async : false,
				data : {
					examId : examId, 
				},
				dataType : 'json',
				success : function(res) {
					if(res==200){
						$(sel).parents("tr").remove();
						layer.msg('删除成功', {time:1000});
					}
				}
			});		
	   }
	</script>
</div>

