<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="layui-col-lg12 layui-col-md12">
	<fieldset class="layui-elem-field ">
		<form class="layui-form" id="examForm">
		</br>
		<div class="layui-form-item">
			<div class="layui-block">
				<label class="layui-form-label">选择题库</label>
				<div class="layui-input-inline" >
					<select name="bank_type" xm-select="select1" xm-select-search="" id="select" xm-select-skin="primary">
						<c:forEach var="iter" items="${examList}" varStatus="status">
							<c:if test="${status.first}">
								<option value="${iter.exam_id}" class="selectExam" id="firstExam" selected >${iter.exam_name}</option>
							</c:if>
							<c:if test="${!status.first}">
								<option value="${iter.exam_id}" class="selectExam">${iter.exam_name}</option>
							</c:if>
						</c:forEach>
					</select>
				</div>
			</div>
		</div>

		<div style="width:90%;margin:20px auto 40px; ">
		<table id="demo" lay-filter="test"></table>
		</div>
		</form>
	</fieldset>
</div>

<script>
	layui.use('table', function(){
        var table = layui.table;
        var firstId = $("#firstExam").attr("value");
        loadTable(firstId);
        //第一个实例
        function loadTable(examId) {
            table.render({
                elem: '#demo'
                , height: 700
                , url: 'exam/getStuScore.do' //数据接口
                , page: true 	//开启分页
                , cols: [[ 		//表头
                    {field: 'student_id', title: '学号', sort: true, fixed: 'left'}
                    , {field: 'student_name', title: '学生名'}
                    , {field: 'score', title: '成绩', sort: true}
                    , {field: 'exam_begin_time', title: '考试时间', sort: true}
                    , {field: 'student_college', title: '学院', sort: true}
                    , {field: 'student_major', title: '专业', sort: true}
                ]]
                , parseData: function (res) { //res 即为原始返回的数据
                    return {
                        "code": res.status, //解析接口状态,0
                        "msg": res.message, //解析提示文本,''
                        "count": res.total, //解析数据长度,1000
                        "data": res.data //解析数据列表,[{},{}]
                    };
                }
                , text: {              //如空数据时的异常提示等
                    none: '暂无相关数据' //默认：无数据。注：该属性为 layui 2.2.5 开始新增
                }
                , method: 'post'       //post提交
                , where: {examId: examId} //添加examId参数

            });
        }
        $(".layui-this").click(function () {
            var examId = $(this).attr("lay-value");
            loadTable(examId);
        });
    });
</script>

