<%--
  Created by IntelliJ IDEA.
  User: Tian yc
  Date: 2018/12/4
  Time: 17:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="layui-tab">
    <ul class="layui-tab-title">
        <li class="layui-this">新增选择题</li>
        <li>新增多选题</li>
        <li>新增判断题</li>
    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
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
                        <input type="radio" name="answer" title="A" value="a">
                        <input type="radio" name="answer" title="B" value="b">
                        <input type="radio" name="answer" title="C" value="c">
                        <input type="radio" name="answer" title="D" value="d">
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
            </form>
        </div>

        <div class="layui-tab-item">
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
                        <input type="checkbox" name="answer" title="A" value="a">
                        <input type="checkbox" name="answer" title="B" value="b">
                        <input type="checkbox" name="answer" title="C" value="c">
                        <input type="checkbox" name="answer" title="D" value="d">
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
                        <!-- <input class="layui-btn" type="button" id="multChoice" value="立即提交" > </input> -->
                        <button class="layui-btn" lay-submit lay-filter="multChoice">立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="layui-tab-item">
            <form class="layui-form" id="tofForm">
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
                    <label class="layui-form-label">题目答案</label>
                    <div class="layui-input-block">
                        <input type="radio" name="answer" value="a" title="正确">
                        <input type="radio" name="answer" value="b" title="错误">
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
                        <button class="layui-btn" lay-submit lay-filter="tofChoice">立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    layui.use(['layer', 'form','laydate'], function(){
        var layer = layui.layer
            ,laydate=layui.laydate
            ,form = layui.form;
        //新增单选题
        form.on('submit(sinChoice)', function(data){
            var formData = data.field;
            formData.ifPractice = 1;
            console.log(formData);
            $.ajax({
                url:'exam/addSingleChoice.do',
                method:'post',
                data: formData,
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

        //新增多选题
        form.on('submit(multChoice)', function(data){
            var checkboxValue = '';
            var formData = data.field;
            $("input:checkbox[name='answer']:checked").each(function() { // 遍历name=standard的多选框
                checkboxValue += ' ' + $(this).val();
            });
            formData.ifPractice = 1;
            formData.answer = checkboxValue.trim();
            $.ajax({
                url:'exam/addMultChoice.do',
                method:'post',
                data:  formData,
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
        //新增判断题
        form.on('submit(tofChoice)', function(data){
            var formData = data.field;
            formData.ifPractice = 1;
            $.ajax({
                url:'exam/addTofChoice.do',
                method:'post',
                data: formData,
                dataType:'JSON',
                success:function(res){
                    if(res.code='0'){
                        $("#tofForm")[0].reset();
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


    layui.use(['form','element'], function() {
        var element = layui.element;
        var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功
        //但是，如果你的HTML是动态生成的，自动渲染就会失效
        //因此你需要在相应的地方，执行下述方法来手动渲染，跟这类似的还有 element.init();
        form.render();
    });
    layui.use([ 'layer', 'form' ], function() {
        var layer = layui.layer, form = layui.form;
        layer.msg('增加练习题目', {time:1500});
    });
</script>
</body>
</html>
