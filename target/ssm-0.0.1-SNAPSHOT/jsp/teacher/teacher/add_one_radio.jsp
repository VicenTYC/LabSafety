<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div>
	<form class="layui-form" id="sinForm">
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
		      <input type="radio" name="answer" value="a" title="A">
		      <input type="radio" name="answer" value="b" title="B">
		      <input type="radio" name="answer" value="c" title="C">
		      <input type="radio" name="answer" value="d" title="D">
		    </div>
  		</div>
  		
		<div class="layui-form-item">
			<label class="layui-form-label">答案解析</label>
			<div class="layui-input-block">
				<input type="text" name="analysis" required lay-verify="required"
					placeholder="请输入答案解析" autocomplete="off" class="layui-input">
			</div>
		</div>
		
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter="sinChoice">立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
		<input class="layui-input" value = "0" name="ifPractice" style="display: none;">
	</form>
</div>
<script>
    layui.use(['layer', 'form','laydate'], function(){
        var layer = layui.layer
            ,laydate=layui.laydate
            ,form = layui.form;
 
        form.on('submit(sinChoice)', function(data){
            $.ajax({
                url:'exam/addSingleChoice.do',
                method:'post',
                data: data.field,
                dataType:'JSON',
                success:function(res){
                    if(res.code='0'){
                    	$("#sinForm")[0].reset();
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