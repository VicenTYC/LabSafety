<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="layui-col-lg12 layui-col-md12">
	<fieldset class="layui-elem-field  ">
		<form class="layui-form" id="examForm">
			<div class="layui-form-item">
				<label class="layui-form-label">考试名称</label>
				<div class="layui-input-block">
					<input type="text" name="exam_name" id="examname" required
						lay-verify="required" placeholder="请输入考试名称" autocomplete="off"
						class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-block">
					<label class="layui-form-label">选择题库</label>
					<div class="layui-input-inline" style="width: 92%;">
						<select name="bank_type" xm-select="select1" xm-select-search="">
							 <c:forEach var="iter" items="${banktype}">
								<option value="${iter.type_id}">${iter.bank_name}</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">开考时间</label>
				<div class="layui-input-block">
					<input type="text" class="layui-input" name="exam_begin_time"
						lay-verify="required" id="begintime" placeholder="点击选择开考时间"">

				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">考试时长</label>
				<div class="layui-input-block">
					<input type="text" class="layui-input" name="exam_duration"
						lay-verify="required" id="begintoendtime" placeholder="点击选择考试时长"">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">单选题个数</label>
				<div class="layui-input-block">
					<input type="text" id="single_num" name="single_num"
						lay-verify="required|number|fushu" class="layui-input"
						placeholder="请输入单选题个数">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">单选题分值</label>
				<div class="layui-input-block">
					<input type="text" name="single_score"
						lay-verify="required|number|fushu" placeholder="请输入每个单选题分值"
						autocomplete="off" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">多选题个数</label>
				<div class="layui-input-block">
					<input type="text" id="mulit_num" name="mulit_num"
						lay-verify="required|number|fushu" class="layui-input"
						placeholder="请输入多选题个数">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">多选题分值</label>
				<div class="layui-input-block">
					<input type="text" name="mulit_score"
						lay-verify="required|number|fushu" placeholder="请输入每个多选题分值"
						autocomplete="off" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">判断题个数</label>
				<div class="layui-input-block">
					<input type="text" name="torf_num"
						lay-verify="required|number|fushu|ifzero" class="layui-input"
						placeholder="请输入判断题个数">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">判断题分值</label>
				<div class="layui-input-block">
					<input type="text" name="torf_score"
						lay-verify="required|number|fushu" placeholder="请输入每个判断题分值"
						autocomplete="off" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn" lay-submit lay-filter="addexam">立即发布</button>
					<button type="reset" class="layui-btn layui-btn-primary">重置</button>
				</div>
			</div>
			<input name="teacher_id" style="display: none" type="text" value="1">
		</form>
	</fieldset>
</div>

<script src="jsp/teacher/lib/layui/layui.all.js" type="text/javascript"
	charset="utf-8"></script>
<script src="jsp/teacher/lib/layui/formSelects-v4.js"
	type="text/javascript" charset="utf-8"></script>
<script>
	layui.use([ 'layer', 'form', 'laydate' ], function() {
		var layer = layui.layer, laydate = layui.laydate, form = layui.form;

		form.verify({
			fushu : function(value, item) { //value：表单的值、item：表单的DOM对象
				if (value.trim() < 0)
					return '竟然是负数(ºΔº)';
			},
			ifzero : function(value, item) { //value：表单的值、item：表单的DOM对象
				var sNum = parseInt($("#single_num").val());
				var mNum = parseInt($("#mulit_num").val());

				if (parseInt(value) == 0 && sNum == 0 && mNum == 0) {
					return '竟然没有题(￣▽￣)~*';
				}
			}
		});

		form.on('submit(addexam)', function(data) {
			$.ajax({
				url : 'exam/addExam.do',
				method : 'post',
				data : $("#examForm").serialize(),
				dataType : 'JSON',
				success : function(res) {
					if (res == 0) {
						$("#examForm")[0].reset();
						layer.msg('添加成功', {
							time : 1000
						});
					} else if (res == 2)
						layer.msg('考试名称已存在', {
							time : 2000
						});

					else if (res == -1)
						layer.msg('添加失败', {
							time : 2000
						});

				},
				error : function(data) {
					layer.msg('添加失败', {
						time : 2000
					});
				}
			})
			return false;
		});
	});
</script>
<script type="text/javascript">
	var formSelects = layui.formSelects;
	formSelects.value('select1');
	formSelects.value('select1', 'all');
	formSelects.value('select1', 'val');
	formSelects.value('select1', 'valStr');
	formSelects.value('select1', 'name');
	formSelects.value('select1', 'nameStr');

	//使用js主动触发搜索
	formSelects.search('select1', '关键内容');
</script>

<script>
	layui.use('form', function() {
		var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功

		//……

		//但是，如果你的HTML是动态生成的，自动渲染就会失效
		//因此你需要在相应的地方，执行下述方法来手动渲染，跟这类似的还有 element.init();
		form.render();
	});
	layui.use('laydate', function() {
		var laydate = layui.laydate;
		//执行一个laydate实例
		laydate.render({
			elem : '#begintime' //指定元素
			,type : 'datetime',
			format : 'yyyy-MM-dd HH:mm:ss' //可任意组合
		});
		laydate.render({
			elem : '#begintoendtime' //指定元素
			,type : 'time',
			format : 'HH:mm:ss' //可任意组合
		});
	});
</script>