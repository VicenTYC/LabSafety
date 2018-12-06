<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>在线学习</title>
<jsp:include page="head.jsp"></jsp:include>
<link type="text/css" rel="stylesheet"
	href="./Resource/css/learnfile.css">
</head>

<body bgcolor="#F0F0F0">
	<jsp:include page="top.jsp" />
	<div id="all">
		<div style="margin-top: 10px; width: 20%" id="left">
			<ul class="layui-nav layui-nav-tree " lay-filter="test">
				<li class="layui-nav-item layui-nav-itemed"><a
					href="javascript:;">在线学习</a>
					<dl class="layui-nav-child">
						<c:forEach var="type" items="${fileTypeList}" varStatus="status">
							<dd>
								<a href="javascript:;" typeid="${type.type_id}" onclick="getList(this)">${type.type_name}</a>
							</dd>
						</c:forEach>
					</dl></li>
			</ul>
		</div>
		<div id="right" style="width: 78%; margin-top: 10px;">
			<div class="rig-top">
				<span class="layui-breadcrumb" style="" id="breadcrumb"> <a
					href="getIndex.do" style="font-size: 1.25rem">首页</a> <a href="">在线学习</a>
					<a href="#" id="idmark" typeid="1" onclick="getFileListByType(1,1,0)"><cite>通识类知识</cite></a>
				</span>
			</div>
			<div class="rig-mid">
				<div id="fileList">
					<c:forEach var="file" items="${fileList }">
						<div fileid="${ file.file_id}" onclick="getFile(this)" class="preitem">
							<img src="./Resource/images/zyaq.jpg" height="100px"></img>
							<div class="rig-mid-text">
								<p class="title" id="fileName">·${file.file_name }</p>
								<div id="fileContent">${file.file_content}...</div>
							</div>
						</div>
					</c:forEach>	            
				</div>
			 <div id="fenye"></div>
			</div>

		</div>
	</div>

<!-- 引入底部jsp -->
   <jsp:include page="foot.jsp"></jsp:include>   
<!--结束引用  -->

	<script src="./Resource/js/jquery.min.js"></script>
	<script>
		layui.use([ 'laypage', 'layer' ], function() {
			var laypage = layui.laypage, layer = layui.layer; //获取laypage、layer模块

		});
	</script>
	<script>
	
	  var curAmount = ${amount};
	  $(document).ready(reFenye(curAmount));
	  function getList(sel){
	     var ftype = $(sel).attr("typeid");
	     getFileListByType(ftype,1,0);
	     var  idmark = $("#idmark");
	     var tname = $(sel).text();
	     idmark.attr("onclick",'getFileListByType('+ftype+',1,0)');
	     console.log()
	     idmark.html('<cite>'+tname+'</cite>');	     
	     idmark.next().remove();
	     idmark.next().remove();
	    }
	    
		function getFile(sel) {
			var fileId = $(sel).attr("fileid");
			$("#breadcrumb").html('<a href="getIndex.do">首页</a><span lay-separator="">/</span><a href="">在线学习</a><span lay-separator="">/</span><a href="" id="idmark" typeid="1"><cite>通识类知识</cite></a><span lay-separator="">/</span><a href="" disable="true"><cite>正文</cite></a>')			
			$.ajax({
						url : "/labsafety/learn/getFileById.do?fileId="
								+ fileId,
						type : "POST",
						dataType : "json",
						async : false,
						success : function(data) {							
							console.log(data);
							var view = document.getElementById("fileList");
							view.innerHTML = '<p style="font-size: 1.5rem;text-align:center" class="title"></p>'
									+ '<p class="fileDate" style="text-align: center;background:#9999994f; font-size: 13px;"></p>'
									+ '<div class="fileContent style="margin-top:10px"></div>';
							$(".title").html(data.file_name);
							$(".fileDate").html(data.file_date);
							$(".fileContent").html(data.file_content);
							$("#fenye").remove();
						}
					});
		};
		// ajax请求
        function getFileListByType(ftype,currPage,amount){
        	$.ajax({
				type : 'POST',
				url : "/labsafety/learn/getFileList.do", // ajax请求路径
				async : false,
				data : {
					page : currPage, //当前页数
					fileType : ftype,
					amount : amount
				},
				dataType : 'json',
				success : function(res) {
					if(res.stat=='200'){
						var test = res;
						console.log('res:'+res);
						var viewDiv = document.getElementById("fileList");
						var str = "";
						var data = res.fileList;
						console.log('data:'+data);
						for (var i = 0; i < data.length; i++) {
							str += '<div fileid="'									
									+ data[i].file_id
									+ '"onclick="getFile(this)" class="preitem"><img src="./Resource/images/zyaq.jpg" height="100px"></img>'
									+ '<div class="rig-mid-text"><p class="title" id="fileName">·'
									+ data[i].file_name
									+ '</p><div id="fileContent">'
									+ data[i].file_content
									+ '...</div></div></div>';
						}
						curAmount = res.amount;
						console.log("amount:"+curAmount);
						reFenye(curAmount);
						viewDiv.innerHTML = str;
				    }
					else{
						$("#fileList").html("<h6>没有更多啦</h6>");
					}
				}
			});
        }
		function getListData(currPage) {
			var ftype = $("#idmark").attr("typeid");
			console.log(currPage);
			getFileListByType(ftype,currPage,curAmount);
		};
		function reFenye(curAmount){
			layui.use('laypage', function() {
				var laypage = layui.laypage;		
				console.log("amount:"+curAmount);
				laypage.render({
					elem : 'fenye',
					count : curAmount ,//数据总数，从服务端得到			
					limit : 5,
					jump : function(obj, first) {
						//obj包含了当前分页的所有参数，比如：
						console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
						console.log(obj.limit); //得到每页显示的条数
						console.log("amount:"+curAmount);
						//首次不执行
						if (!first) {
							var currPage = obj.curr;
							getListData(currPage);
						}
					}
				});
			});
		};
	</script>
</body>
</html>