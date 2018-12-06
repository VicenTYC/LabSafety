
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

	<div class="panel panel-default">
		<div class="panel-header">一、选择题</div>
		<table
			class="table table-striped table-hover table-bordered table-responsive"
			style="table-layout: fixed;">
			<thead>
				<tr>
					<th width="4%"></th>
					<th width="30%">题目描述</th>
					<th width="25%">选项</th>
					<th width="20px">答案</th>
					<th width="15%">答案解析</th>
					<th width="6%"></th>
				</tr>
			</thead>
			<tbody id="tbody1">
				<c:forEach var="ques" items="${question1List}" varStatus="status">
					<tr>

						<td style="text-align: center">${status.count}</td>
						<td>${ques.question_content }</td>
						 <td><c:set var="string1" value="${ ques.question_item}" /> 
						 <c:set	var="stringA" value="${fn:split(string1, ' ')}" /> 
						  A:${stringA[0]}<br>
							B:${stringA[1]}<br> C:${stringA[2]}<br> D:${stringA[3]}<br>
						</td> 
						
						<td>${ques.question_answer }</td>
						<td>解析：${ques.question_analysis}</td>
						<td>
							<div class="btn-group">
								<a href="javascript:void(0)" class="btn btn-danger" qid="${ques.question_id}" qtype="1" curpage="1" onclick="delques(this)">删除</a>
							</div>
						</td>
					</tr>

				</c:forEach>

			</tbody>
		</table>
		<div id="fenye1" style="text-align: center;"></div>


		<div class="panel-header">二、多选题</div>
		<table
			class="table table-striped table-hover table-bordered table-responsive"
			style="table-layout: fixed;">
			<thead>
				<tr>
					<th width="4%"></th>
					<th width="30%">题目描述</th>
					<th width="25%">选项</th>
					<th width="20px">答案</th>
					<th width="15%">答案解析</th>
					<th width="6%"></th>
				</tr>
			</thead>
			<tbody id="tbody2">
				<c:forEach var="ques" items="${question2List}" varStatus="status">
					<tr>

						<td style="text-align: center">${status.count}</td>
						<td>${ques.question_content }</td>
						 <td><c:set var="string1" value="${ ques.question_item}" /> 
						 <c:set	var="stringA" value="${fn:split(string1, ' ')}" /> 
						  A:${stringA[0]}<br>
							B:${stringA[1]}<br> C:${stringA[2]}<br> D:${stringA[3]}<br>
						</td> 
						
						<td>${ques.question_answer }</td>
						<td>解析：${ques.question_analysis}</td>
						<td>
							<div class="btn-group">
								<a href="javascript:void(0)" class="btn btn-danger" qid="${ques.question_id}" qtype="2" curpage="1" onclick="delques(this)">删除</a>
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
         <div id="fenye2" style="text-align: center;"></div>
         
		<div class="panel-header">三、判断题（A为正确，B为错误）</div>
		<table
			class="table table-striped table-hover table-bordered table-responsive"
			style="table-layout: fixed;">
			<thead>
				<tr>
					<th width="4%"></th>
					<th width="30%">题目描述</th>
					<th width="25%">选项</th>
					<th width="20px">答案</th>
					<th width="15%">答案解析</th>
					<th width="6%"></th>
				</tr>
			</thead>

			<tbody id="tbody3">
				<c:forEach var="ques" items="${question3List}" varStatus="status">
					<tr>

						<td style="text-align: center">${status.count}</td>
						<td>${ques.question_content }</td>
						 <td><c:set var="string1" value="${ ques.question_item}" /> 
						 <c:set	var="stringA" value="${fn:split(string1, ' ')}" /> 
						  A:${stringA[0]}<br>
							B:${stringA[1]}<br> C:${stringA[2]}<br> D:${stringA[3]}<br>
						</td> 
						
						<td>${ques.question_answer }</td>
						<td>解析：${ques.question_analysis}</td>
						<td>
							<div class="btn-group">
								<a href="javascript:void(0)" class="btn btn-danger" qid="${ques.question_id}" qtype="3" curpage="1" onclick="delques(this)">删除</a>
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	     <div id="fenye3" style="text-align: center;"></div>
	</div>
	<script src="./Resource/js/jquery.min.js"></script>
	<script>
		layui.use([ 'laypage', 'layer' ], function() {
			var laypage = layui.laypage, layer = layui.layer; //获取laypage、layer模块

		});
	</script>
	<script>
	    
	    var qbank= ${qbank};
	    //单选题总数
		var curAmount1 = ${amount1};
		//多选题总数
		var curAmount2 = ${amount2};
		//判断题总数
		var curAmount3 = ${amount3};
		
		$(document).ready(reFenye(curAmount1,"fenye1",1));
		$(document).ready(reFenye(curAmount2,"fenye2",2));
		$(document).ready(reFenye(curAmount3,"fenye3",3));
		
		//ajax请求
		function getFileListByType(qtype, currPage, amount) {
			$.ajax({
						type : 'POST',
						url : "/labsafety/exam/getQuestinsByType.do", // ajax请求路径
						async : false,
						data : {
							page : currPage, //当前页数
							qtype : qtype,
							amount : amount,
							qbank : qbank
						},
						dataType : 'json',
						success : function(res) {
							if (res.stat == '200') {												
								var viewDiv = document
										.getElementById("tbody"+qtype);
								var str = "";
								viewDiv.innerHTML = str;
								var data = res.questionlist;
								for (var i = 0; i < data.length; i++) {
									var index=i+1;
									str += '<tr><td style="text-align: center">'+index+'</td><td>'
											+ data[i].question_content
											+ '</td><td>'
											+splitItems(data[i].question_item)
											+ '</td><td>'
											+ data[i].question_answer
											+ '</td><td>'
											+ data[i].question_analysis
											+ '</td><td><div class="btn-group"><a href="javascript:void(0)" class="btn btn-danger" qid="'+data[i].question_id
											+'" qtype="'+qtype+'" curpage="'+currPage+'" onclick="delques(this)">删除</a></div></td></tr>';
								}
								viewDiv.innerHTML = str;
							} else {
								viewDiv.innerHTML="<td></td><td></td><td></td><td></td><td></td><td></td>";
							}
						}
					});
		}
		function splitItems(item){
			var items = item.split(" ");
			var str='';
			if(items.length<3){
				str=str+"A:"+items[0];
				str+='</br>'+'B'+items[1];
			}
			else{
				str=str+"A:"+items[0];
				str+='</br>'+'B'+items[1];
				str+='</br>'+'C'+items[2];
				str+='</br>'+'D'+items[3];
			}
			return str;
		}
		function reFenye(curAmount,id,qtype) {
			layui.use('laypage', function() {
				var laypage = layui.laypage;
				console.log("amount:" + curAmount);
				laypage.render({
					elem : id,
					count : curAmount,//数据总数，从服务端得到			
					limit : 15,
					jump : function(obj, first) {
						//obj包含了当前分页的所有参数，比如：
						console.log("page:"+obj.curr); //得到当前页，以便向服务端请求对应页的数据。
						//首次不执行
						if (!first) {
							var currPage = obj.curr;
							getFileListByType(qtype, currPage, curAmount);
						}
					}
				});
			});
		};
		function delques(sel){
			var qid = $(sel).attr('qid');
			var qtype=$(sel).attr('qtype');
			var curpage = $(sel).attr('curpage');
			var amount;
			
			$.ajax({
				type : 'POST',
				url : "/labsafety/exam/delQuestionById.do", // ajax请求路径
				async : false,
				data : {
					qid : qid,
				},
				dataType : 'json',
				success:function(data){	
					if(data==200){
						if(qtype==1){
							curAmount1-=1;
							amount=curAmount1;
							reFenye(curAmount1,"fenye1",1)
						}
						else if(qtype==2){
							curAmount2-=1;
							amount=curAmount2;
							reFenye(curAmount2,"fenye1",2)
						}
						else{
							curAmount3-=1;
							amount=curAmount3;
							reFenye(curAmount3,"fenye1",3)
						}
					    getFileListByType(qtype, curpage, amount);
				}
					else
						layer.msg("删除失败",{time:1500});
				}
			});
				
		}
	</script>
