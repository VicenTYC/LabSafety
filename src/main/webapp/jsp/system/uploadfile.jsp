<%--
  Created by IntelliJ IDEA.
  User: tyc
  Date: 2018/12/14
  Time: 16:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="layui-form-item">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 25px;">
        <legend>上传文件</legend>
    </fieldset>
</div>
<div class="layui-upload-drag" id="test1" style="left: 38%;">
    <i class="layui-icon" style="font-size: 98px;"></i>
    <p style="font-size: 20px;" id="fileMsg">点击上传，或将文件拖拽到此处</p>
</div>
<script>
    layui.use(['upload','layer'], function(){
        var $ = layui.jquery;
        var upload = layui.upload;
        var layer = layui.layer;
        //执行实例
        var uploadInst = upload.render({
            elem: '#test1' //绑定元素
            ,url: 'uploadFile.do' //上传接口
            ,accept: 'file'
            ,exts: 'doc|docx|txt'
            ,drag: true
            ,choose: function (obj) {
                console.log(obj.pushFile());
                var count=1,file;
                obj = obj.pushFile();
                for(var x in obj) {
                    if (count == 1)
                        file = obj[x];
                    count++;
                }
                $("#fileMsg").html(file.name);
            }
            ,before: function(obj){ //obj参数包含的信息，跟 choose回调完全一致，可参见上文。
                layer.load(); //上传loading
            }
            ,done: function(res){
                //上传完毕回调
                if(res.code==0)
                    layer.msg(res.name + '上传成功');
                else
                    layer.msg(res.name + '上传失败');
                    layer.closeAll('loading'); //关闭loading
            }
            ,error: function(){
                //请求异常回调
                console.log("上传失败");

                layer.closeAll('loading'); //关闭loading
            }
        });
    });
</script>