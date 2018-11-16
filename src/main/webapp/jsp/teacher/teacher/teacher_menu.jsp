<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<aside class="Hui-aside">
	<div class="menu_dropdown bk_2">
		<dl id="menu-member">
			<dt>
				<i class="Hui-iconfont">&#xe60d;</i> 题库维护<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><ul id="Huifold1" class="Huifold">
							<li class="item" style="margin-left: 18px;">
								<h6 id="menu1">
									浏览题库<b
										style="margin-left: 58px; font-size: 15px; color: #8b9092e3;"><i class="layui-icon layui-icon-down"></i></b>
								</h6>
								<div class="info"
									style="background: #adabab29; padding: 0;margin: 12px 0px 10px 0;">
								<c:forEach var="iter" items="${banktype}">
								  <a href="javascript:void(0)" op="queslist" type="${iter.type_id}" onclick="childRelod(this)" style="padding-left:5px; border-bottom:1px #5d5b5b45 solid;">${iter.bank_name}</a>															   
								</c:forEach>
								
								</div>
							</li>
						</ul></li>
					<li><a href="javascript:void(0)" op="addquestion" onclick="childRelod(this)" title="新增题目">新增题目</a></li>
					<li><a href="javascript:void(0)" op="importquestions" onclick="childRelod(this)" title="批量导入">批量导入</a></li>
				</ul>
			</dd>
		</dl>

		<dl id="menu-admin">
			<dt>
				<i class="Hui-iconfont">&#xe62d;</i> 安排考试<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a href="javascript:void(0)" op="newexam" onclick="childRelod(this)" title="新建考试">新建考试</a></li>
					<li><a href="javascript:void(0)" op="examlist" onclick="childRelod(this)" title="考试管理">考试管理</a></li>
					<!-- <li><a href="#" title="考试管理">考试管理</a></li> -->
					<!-- <li><a href="#" title="管理员列表">管理员列表</a></li> -->
				</ul>
			</dd>
		</dl>
		<dl id="menu-tongji">
			<dt>
				<i class="Hui-iconfont">&#xe61a;</i> 结果统计<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a href="javascript:void(0)" op="picresult" onclick="childRelod(this)" title="统计图表">统计图表</a></li>
					<li><a href="javascript:void(0)" op="tableresult" onclick="childRelod(this)" title="学生成绩表">学生成绩表</a></li>
					<!-- <li><a href="jsp/teacher.jsp?op=anexam" title="试卷分析">试卷分析</a></li> -->
				</ul>
			</dd>
		</dl>
		<dl id="menu-system">
			<dt>
				<i class="Hui-iconfont">&#xe62e;</i> 学生导入<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a href="javascript:void(0)" op="importstudent" onclick="childRelod(this)" title="批量导入">批量导入</a></li>					
				</ul>
			</dd>
		</dl>
	</div>
</aside>
<div class="dislpayArrow hidden-xs">
	<a class="pngfix" id="hiddenorplay" href="javascript:;"
		onClick="displaynavbar(this)"></a>
</div>

