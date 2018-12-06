<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% 
String path = request.getContextPath(); 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href=" <%=basePath%>"> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css"
	href="../Resource/bootstrap/css/bootstrap.min.css" />
<title>学生</title>

</head>

<body>

	<div>

		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">

						<h4 class="modal-title" id="myModalLabel">考试须知</h4>
					</div>
					<div class="modal-body">
						一、考试开始前15分钟考生凭学生证和有效身份证件（身份证等）进入规定考场对号入座，并将有效证件放在考桌左上角，以便监考人员查验。考试开始指令发出后，考生才能开始答卷。
						<br /> 二、考生进入考场必须关闭各种通讯工具。
						参加闭卷考试考生在入场时除携带必要的文具外，不准携带其它物品(如:书籍、资料、笔记本和自备草稿纸以及具有收录、储存、记忆功能的电子工具等)。已携带入场的应按要求指定位置存放。
						参加非闭卷考试的考生除携带必要的文具外，可携带该考试科目规定允许的相关资料。 <br />
						三、考试开始30分钟后，考生停止进入考场（听力考试开始至结束，考生不得进出考场）。开考30分钟后考生方可交卷离开考场。考生交卷后应立即退场，不得在考场附近逗留、交谈，不得再返回考场续考。
						<br /> 四、考生领到试卷后，应清点试卷是否齐全，检查试卷有无缺损、错印等情况，若发现试卷差错应举手向监考人员报告。 <br />五、考生答卷前，在试卷密封线内填写指定内容（如姓名、学号等）。凡漏写姓名、学生证号、座位号或字迹模糊无法辨认，以及在试卷密封线外填写学生证号、姓名或作其他标记的试卷一律按零分处理。
						<br />六、考生答卷时只允许用黑、蓝色钢笔或圆珠笔书写。特殊要求的科目（如使用答题卡）按具体要求执行。 <br />七、考生不得询问试题题意，若发现试题字迹模糊或试题有误，可举手向监考人员询问，不准询问其他考生。
						<br />八、考生必须服从监考人员的监督管理。不准交头接耳，左顾右盼，传递物品，打手势，做暗号；不准擅自借用其他考生文具；不准偷看、抄袭他人答卷或允许他人抄袭自己的答卷；严禁夹带；严禁换卷、替考，以及其他违纪、舞弊行为。
						<br />九、在考试期间原则上不允许上厕所，若遇特殊情况，须由工作人员陪同出入考场。 <br />十、考试结束指令发出后，考生立即停止答卷，将答卷（答题卡）反扣在桌面上，并按监考人员要求退离考场。严禁将试卷、答卷（答题卡）和考场统一发放的草稿纸带出考场。
						<br />十一、留考考生必须服从考试工作人员和监考人员的安排，不得与其他考生或场外人员接触。
					</div>
					<div class="modal-footer">
						<!-- 转发去服务器查询试题 -->
						<a type="button" href="jsp/student/exam.jsp" id="agree"
							class="btn btn-lg btn-primary disabled">我已阅读考试说明</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="jsp/lib/jquery/1.9.1/jquery.min.js"></script>
	<script
		src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			
			$('#myModal').modal("show");
		setInterval(function(){
				if(time>0){
				settimes();
				}
			}, 1000);	
		});
		
		//阅读考试须知时间
		var time=20;
		function settimes(){
			time=time-1;
			console.log(time);
			if(time<=0){
				$("#agree").removeClass("disabled");
				$("#agree").text("我已阅读考试说明");			
			}else{
			$("#agree").text("我已阅读考试说明("+time+"s)");
			}
		}
	</script>
	
</body>
</html>
