<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div>
	<form class="layui-form" id="multForm">
		<div class="layui-form-item">
			<label class="layui-form-label">所属题库</label>
			<div class="layui-input-block">
				<select name="quesBank" lay-verify="required">
					<option value=""></option>
					<c:forEach var="iter" items="${banktype}">
						<option value="${iter.type_id}">${iter.bank_name}</option>
					</c:forEach>
				</select>
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">是否共享</label>
			<div class="layui-input-block">
				<input type="checkbox" name="isShare" lay-skin="switch">
			</div>
		</div>
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">题目描述</label>
			<div class="layui-input-block">
				<textarea name="question" lay-verify="required" placeholder="请输入内容" class="layui-textarea"></textarea>
			</div>
		</div>
		
		 <div class="layui-form-item">
			<label class="layui-form-label">A选项</label>
			<div class="layui-input-block">
				<input type="text" name="itemA" required lay-verify="required"
					placeholder="请输入选项类容" autocomplete="off" class="layui-input">
			</div>
		</div>
		
		<div class="layui-form-item">
			<label class="layui-form-label">B选项</label>
			<div class="layui-input-block">
				<input type="text" name="itemB" required lay-verify="required"
					placeholder="请输入选项类容" autocomplete="off" class="layui-input">
			</div>
		</div>
		
		
		<div class="layui-form-item">
			<label class="layui-form-label">C选项</label>
			<div class="layui-input-block">
				<input type="text" name="itemC" required lay-verify="required"
					placeholder="请输入选项类容" autocomplete="off" class="layui-input">
			</div>
		</div>
		
		<div class="layui-form-item">
			<label class="layui-form-label">D选项</label>
			<div class="layui-input-block">
				<input type="text" name="itemD" required lay-verify="required"
					placeholder="请输入选项类容" autocomplete="off" class="layui-input">
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">题目答案</label>
			<div class="layui-input-block">
				<input type="checkbox" name="answer" title="A" value="A">
				<input type="checkbox" name="answer" title="B" value="B">
				<input type="checkbox" name="answer" title="C" value="C">
				<input type="checkbox" name="answer" title="D" value="D">
			</div>
		</div>

		<<div class="layui-form-item">
			<label class="layui-form-label">答案解析</label>
			<div class="layui-input-block">
				<input type="text" name="analysis" required lay-verify="required"
					placeholder="请输入答案解析" autocomplete="off" class="layui-input">
			</div>
		</div>
		
		<div class="layui-form-item">
			<div class="layui-input-block">
				<!-- <input class="layui-btn" type="button" id="multChoice" value="立即提交" > </input> -->
				<button class="layui-btn" lay-submit lay-filter="multChoice">立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</form>
</div>
<script>
    layui.use(['layer', 'form','laydate'], function(){
        var layer = layui.layer
            ,laydate=layui.laydate
            ,form = layui.form;
 
        form.on('submit(multChoice)', function(data){
            $.ajax({
                url:'exam/addMultChoice.do',
                method:'post',
                data: $("#multForm").serialize(),
                dataType:'JSON',
                success:function(res){
                    if(res.code='0'){
                    	$("#multForm")[0].reset();
                    	layer.msg("添加成功",{time:1000});
                    	
                    }
                    else
                    	layer.msg("添加失败",{time:1000});
                },
                error:function (data) {
                }
            })
            return false;
        });
    });
</script>