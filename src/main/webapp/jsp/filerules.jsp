<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>在线学习</title>
<jsp:include page="head.jsp"></jsp:include>
</head>

<body bgcolor="#F0F0F0">
	<jsp:include page="top.jsp" />
	<div class="center" style="width:1100px;margin:10px auto;font-size:20px;">
	    <c:forEach items="${fileRulesList}" var="iter" varStatus="stat">
	     <div style="height: 28px;">
	       	<span class='layui-badge-dot layui-bg-blue' style="margin-top:8px"></span>
	       	<a href='down.do?fileName=${iter.file_name}' class="down" path="${iter.file_path}" style="width: 98%;float: right; background: #4d78a21f;">${iter.show_name}</a>
       	</div>
        </c:forEach>
       
	</div>
	 <div id="fenye" style="width:1100px;margin:20px auto;text-align:center"></div>
	<jsp:include page="foot.jsp"></jsp:include>
<script src="./Resource/js/jquery.min.js"></script>
	<script>
		layui.use([ 'laypage', 'layer' ], function() {
			var laypage = layui.laypage, layer = layui.layer; //获取laypage、layer模块

		});
	</script>
  <script>
     var fileList = new Array();
     var curAmount = ${amount};
     reFenye(curAmount);
     
     $(document).ready(
        function(){
          console.log(fileList);
           var center =$(".center");
           for(var i=0;i<fileList.length;i++){
        	   center.append("<span class='layui-badge-dot layui-bg-blue'></span>");
        	   center.append("<p class='down' path='" + fileList[i].file_path + "'>"+fileList[i].file_name+"</p>");
           }
        }	 
     );
    function getlist(currPage){
    	var view = $(".center");
    	 $.ajax({
				type : 'POST',
				url : "/labsafety/moreFileRules.do", // ajax请求路径
				async : false,
				data : {
					page : currPage,
				},
				dataType : 'json',
				success : function(res) {
					view.empty();
				    for(var i=0;res.length;i++){
				    	view.append(
				    			'<div style="height: 28px;">'
				    	       	+'<span class="layui-badge-dot layui-bg-blue" style="margin-top:8px"></span>'
				    	       	+'<a href="down.do?rootPath='+res[i].file_path+'&fileName='+res[i].file_name+'" class="down" style="width: 98%;float: right; background: #4d78a21f;">'+res.file_name+'</a>'
				           +'	</div>'
				    			);
				    	
				    }
				}
    	 })
     };
     function reFenye(curAmount){
			layui.use('laypage', function() {
				var laypage = layui.laypage;		
				console.log("amount:"+curAmount);
				laypage.render({
					elem : 'fenye',
					count : curAmount ,//数据总数，从服务端得到			
					limit : 15,
					jump : function(obj, first) {						
						//首次不执行
						if (!first) {
							var currPage = obj.curr;
							getlist(currPage);
						}
					}
				});
			});
		};
     
  </script>
</body>
</html>