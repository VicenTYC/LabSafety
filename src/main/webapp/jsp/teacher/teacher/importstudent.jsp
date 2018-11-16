<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div>
	<form class="layui-form">

		<div class="layui-form-item">
			<div class="layui-block">
				<label class="layui-form-label">考试场次</label>
				<div class="layui-input-inline" style="width: 92%;">
					<select name="bank_type" xm-select="select1" xm-select-search="">
						<c:forEach var="exam" items="${examList}">
							<option value="${exam.exam_id}">${exam.exam_name}</option>
						</c:forEach>
					</select>
				</div>
			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-form-item">
				<label class="layui-form-label">多级1</label>
				<div id="cat_ids1"></div>
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">考试口令</label>
			<div class="layui-input-block">
				<input type="text" name="spassword" required lay-verify="required"
					placeholder="学生密码" autocomplete="off" class="layui-input">
			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter="formDemo">立即导入</button>
				<button type="reset" class="layui-btn layui-btn-primary">取消重置</button>
			</div>
		</div>
	</form>
</div>
<script src="jsp/teacher/lib/layui/layui.js"></script>
<script>
  layui.use('form');

  var tagData = [{"id":12,"name":"长者","status":0},{"id":13,"name":"工厂"},{"id":14,"name":"小学生"},{"id":15,"name":"大学生"},{"id":16,"name":"研究生"},{"id":17,"name":"教师"},{"id":18,"name":"记者"}];    
  var catData = [{"id":2,"name":"信息工程学院","children":[{"id":21,"name":"信息管理与信息系统"},{"id":22,"name":"电子商务"},{"id":23,"name":"软件工程"},{"id":24,"name":"计算机科学与技术"}]}];

  layui.config({
    base : './'
  }).extend({
    selectN: './layui_extends/selectN',
    selectM: './layui_extends/selectM',
  }).use(['layer','form','jquery','selectN','selectM'],function(){
    $ = layui.jquery;	
    var form = layui.form ,selectN = layui.selectN ,selectM = layui.selectM;

    //无限级分类-基本配置
    var catIns1 = selectN({
      //元素容器【必填】
      elem: '#cat_ids1'
      ,search:[false,true]
      //候选数据【必填】
      ,data: catData
    });     
         

    //无限级分类-所有配置
    var catIns2 = selectN({
      //元素容器【必填】
      elem: '#cat_ids2'
      //候选数据【必填】
      ,data: catData 
      //设置了长度
      ,width:null
      //默认值
      ,selected: [6,10,11] 
      
      //为真只取最后一个值
      ,last:true       
  
			//空值项提示，可设置为数组['请选择省','请选择市','请选择县']
			,tips: '请选择'

			//事件过滤器，lay-filter名 不设置与选择器相同(去#.)
			,filter: ''

			//input的name 不设置与选择器相同(去#.)
			,name: 'cat2'
			
			//数据分隔符
			,delimiter: ','
			
			//数据的键名
			,field:{idName:'id',titleName:'name',childName:'children'}
			
			//表单区分 form.render(type, filter); 为class="layui-form" 所在元素的 lay-filter="" 的值 
			,formFilter: null      
      
    }); 

         
    //多选标签-基本配置
    var tagIns1 = selectM({
      //元素容器【必填】
      elem: '#tag_ids1'
      //候选数据【必填】
      ,data: tagData
      ,max:2
      ,width:400
      //添加验证
      ,verify:'required'      
    }); 
    

    //多选标签-所有配置
    var tagIns2 = selectM({
      //元素容器【必填】
      elem: '#tag_ids2'
      
      //候选数据【必填】
      ,data: tagData
      
      //默认值
      ,selected: [12,17] 			
      
      //最多选中个数，默认5
			,max : 6
      
			//input的name 不设置与选择器相同(去#.)
			,name: 'tag2'
			
			//值的分隔符
			,delimiter: ','
      
			//候选项数据的键名
			,field: {idName:'id',titleName:'name'}
      
      
    });

			
    form.on('submit(demo)',function(data){			
      console.log('catIns1 当前选中的值名：',catIns1.selected);
      console.log('catIns1 当前选中的值：',catIns1.values);
      console.log('catIns1 当前选中的名：',catIns1.names);
      console.log('catIns1 当前最后一个选中值：',catIns1.lastValue);
      console.log('catIns1 当前最后一个选中名：',catIns1.lastName);
      console.log('catIns1 当前最后一个是否已选：',catIns1.isSelected);
      console.log('');

      console.log('tagIns1 当前选中的值名：',tagIns1.selected);
      console.log('tagIns1 当前选中的值：',tagIns1.values);
      console.log('tagIns1 当前选中的名：',tagIns1.names);      
      
      console.log('');
      
      var formData = data.field;
      console.log('表单对象：',formData);
    })
     
		//通过js动态选择
    $('.set1').click(function(){
      catIns1.set([6,10]);
      
    });
		//通过js动态选择
    $('.set2').click(function(){
      tagIns1.set([12,13,14,15]);
    });

    $('.fly').click(function(){
      window.open('http://fly.layui.com/jie/26751/');
    });

    $('.mayun').click(function(){
      window.open('https://gitee.com/moretop/layui-select-ext');
    });
    
		//监听重置按钮
		$('form').find(':reset').click(function(){
			$('form')[0].reset();
			catIns1.set();//默认值
			catIns2.set();//默认值
      tagIns1.set();//默认值
      tagIns2.set();//默认值
			return false;
		});
		

    
  });

    
</script>