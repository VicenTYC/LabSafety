<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div style="width:80%;margin:0 auto">
<table id="demo" lay-filter="test"></table>
</div>
 
<script src="/layui/layui.js"></script>
<script>
layui.use('table', function(){
  var table = layui.table;
  
  //第一个实例
  table.render({
     elem: '#demo'
    ,height: 400
    ,url: '/exam/getStuScore.do' //数据接口
    ,page: true 	//开启分页
    ,cols: [[ 		//表头
       {field: 'student_id', title: '学号', sort: true, fixed: 'left'}
      ,{field: 'student_name', title: '学生名'}
      ,{field: 'score', title: '成绩', sort: true}
      ,{field: 'examStartTime', title: '考试时间', sort: true } 
      ,{field: 'student_college', title: '学院' , sort: true} 
      ,{field: 'student_major', title: '专业' , sort: true} 
    ]]
    ,parseData: function(res){ //res 即为原始返回的数据
        return {
            "code": res.status, //解析接口状态,0
            "msg": res.message, //解析提示文本,''
            "count": res.total, //解析数据长度,1000
            "data": res.data.item //解析数据列表,[{},{}]
          };
        }
    ,text: {              //如空数据时的异常提示等
        none: '暂无相关数据' //默认：无数据。注：该属性为 layui 2.2.5 开始新增
    	}
    ,method:'post'       //post提交
    ,where:{examId:'examId'} //添加examId参数
    
  });
  
});
</script>

