<%--
  Created by IntelliJ IDEA.
  User: tyc
  Date: 2018/12/16
  Time: 12:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="layui-form-item">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 25px;">
        <legend>添加学习文件</legend>
    </fieldset>
</div>
<div style="padding: 15px;">
    <div class="layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label">选择文件库</label>
            <div class="layui-input-block">
                <select name="fileType" lay-filter="aihao">
                    <c:forEach items="${fileList}" var="type">
                        <option value="${type.type_id}">${type.type_name}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">标题</label>
            <div class="layui-input-block">
                <input type="text" name="title" lay-verify="title|required" autocomplete="off"
                       placeholder="请输入标题"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <textarea id="layeditDemo"></textarea>
        </div>
        <div class="layui-form-item" style="text-align: center;">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formSubmit">保存</button>
                <button id="reset" class="layui-btn layui-btn-primary">清空</button>
            </div>
        </div>
    </div>
</div>
<script>
    layui.use(['layedit', 'layer', 'jquery', 'form'], function () {
        var $ = layui.jquery
            , layer = layui.layer
            , layedit = layui.layedit;
       var form = layui.form;

        layedit.set({
            //暴露layupload参数设置接口 --详细查看layupload参数说明
            uploadImage: {
                url: 'uploadFile.do?midPath=images',
                accept: 'image',
                acceptMime: 'image/*',
                exts: 'jpg|png|gif|bmp|jpeg',
                size: 1024 * 10,
                done: function (data) {
                    console.log(data.code);
                    if (data.code == 0) {
                        var imagePath = 'http://localhost:8080/labsafety/' + data.filepath;
                        var content = layedit.getContent(ieditor);
                        content += '<img src="' + imagePath +'">';
                        layedit.setContent(ieditor, content, false);
                        console.log(data);
                    }
                }
            }
            //右键删除图片/视频时的回调参数，post到后台删除服务器文件等操作，
            //传递参数：
            //图片： imgpath --图片路径
            //视频： filepath --视频路径 imgpath --封面路径
            , calldel: {
                url: 'deleteFile.do',
                done: function (data) {

                }
            }
            //开发者模式 --默认为false
            , devmode: true
            //插入代码设置 --hide:true 等同于不配置codeConfig
            , codeConfig: {
                hide: false,  //是否显示编码语言选择框
                default: 'javascript' //hide为true时的默认语言格式
            }

            , facePath: 'http://knifez.gitee.io/kz.layedit/Content/Layui-KnifeZ/'
            , devmode: true
            , videoAttr: ' preload="none" '
            , tool: [
                'html', 'undo', 'redo', 'code', 'strong', 'italic', 'underline', 'del', 'addhr', '|', 'fontFomatt', 'fontfamily','fontSize', 'fontBackColor', 'colorpicker', 'face'
                , '|', 'left', 'center', 'right', '|', 'link', 'unlink', 'image_alt', 'anchors'
                , '|'
                , 'table'
            ]
            , height: '600px'
        });
        var ieditor = layedit.build('layeditDemo');
        //设置编辑器内容
        layedit.setContent(ieditor, "<h3>添加内容</h3>", false);
        console.log(layedit.getContent(ieditor));

        $('#reset').click(function () {
            $('input').val('');
            layedit.setContent(ieditor, "", false);
        });
        //自定义验证规则
        form.verify({
            title: function (value) {
                if (value.length < 2) {
                    return '标题至少得2个字符啊';
                }
            }
        });
        form.on('submit(formSubmit)', function (data) {
            data.field['content'] = layedit.getContent(ieditor);
            console.log(data);
            $.ajax({
                url: 'addLearnFile.do',
                method: 'post',
                data: data.field,
                dataType: 'JSON',
                success: function (res) {
                    if (res.code==0) {
                        $('input').val('');
                        layedit.setContent(ieditor, "", false);
                    }
                        layer.msg(res.msg, {time: 1000});
                },
                error: function (data) {
                }
            });
            return false;
        });
    })
</script>
