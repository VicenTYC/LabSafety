<%--
  Created by IntelliJ IDEA.
  User: tyc
  Date: 2018/12/14
  Time: 15:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<form class="layui-form">
    <div class="layui-form-item">
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 25px;">
            <legend>添加文件库</legend>
        </fieldset>

    </div>
    <div class="layui-form-item" style=" width: 40%;">
        <label class="layui-form-label">文件库名称</label>
        <div class="layui-input-block">
            <input type="text" name="bankName" lay-verify="required" placeholder="请输入" autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="submit">提交</button>
        </div>
    </div>
</form>
<script>
    layui.use(['form'], function () {
        var $ = layui.jquery;
        var form = layui.form;
        form.on('submit(submit)', function (data) {
            $.ajax({
                url: 'addFileBank.do',
                method: 'post',
                data: data.field,
                dataType: 'JSON',
                success: function (res) {
                    if (res == '1') {
                        $('input').val('');
                        layer.msg("添加成功", {time: 1000});
                    } else if(res == '2')
                        layer.msg("已存在，请更换名称", {time: 1000});
                    else
                        layer.msg("添加失败", {time: 1000});
                },
                error: function (data) {
                }
            });
            return false;
        });
    });
</script>