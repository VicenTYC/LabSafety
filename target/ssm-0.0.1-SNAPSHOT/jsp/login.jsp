<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=0.8, minimum-scale=0.8, maximum-scale=3" />
    <meta name="renderer" content="webkit" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>实验室安全教育与考试平台</title>

    <script type="text/javascript">
        function AddFavorite(sURL, sTitle) {
            sURL = encodeURI(sURL);
            try {
                window.external.addFavorite(sURL, sTitle);
            } catch (e) {
                try {
                    window.sidebar.addPanel(sTitle, sURL, "");
                } catch (e) {
                    alert("﻿加入收藏失败，请使用Ctrl+D进行添加,或手动在浏览器里进行设置");
                }
            }
        }
    </script>
    <script src="./Resource/js/layui.js"></script>
    <link href="./Resource/css/layui.css" rel="stylesheet" />
    <link href="./Resource/css/main.css" rel="stylesheet" />  
    <link href="./Resource/css/style.css" rel="stylesheet" />
</head>
<body>
<div class="head-w">
        <div class="head">
            <img alt="logo" src="./Resource/images/logo.png" />
            <ul>
                <li> <a href="http://www.nwafu.edu.cn" target="_blank"> 学校主页</a> </li>
                <li> |</li>
                <li> <a onclick="AddFavorite(window.location,document.title)" href="javascript:void(0);"> 加入收藏</a> </li>
                <li> |</li>
                <li> <a href="https://nic.nwafu.edu.cn/download/info_service_platform_manual.pdf" target="_blank"> 登录帮助</a> </li>
            </ul>
        </div>
    </div>
    <div class="content">
        <div class="banner">
            <div id="top">
                <img width="796" height="414" src="./Resource/images/banner.jpeg" />
            </div>
        </div>
        <div class="kuang">
		  <div class="layui-tab layui-tab-card" style="margin-left:20px;">
			  <ul class="layui-tab-title">			   
			    <li style="width:142px;" class="layui-this">学生登陆</li>
			    <li style="width:142px;">教师登陆</li>			   
			  </ul>
			  <div class="layui-tab-content">
			    <div class="layui-tab-item layui-show">
						<div id="show0" style="display: block;">
							<div class="login-aside">
								<form class="fm-v clearfix amp-login-form" id="casLoginForm"
									role="form" action="studentlogin.do" method="post">

									<div class="fm-item">
										<label class="form-label" for="logonId"> 用户名</label> <input
											name="userId" class="i-text" id="userId" type="text"
											placeholder="职工号" value="" /> <span class="auth_error"
											id="usernameError" style="display: none;"> 请输入用户名</span>
									</div>
									<div class="fm-item">
										<label class="form-label" for="logonId">
											密&nbsp;&nbsp;&nbsp;码</label> <input name="userPwd" class="i-text"
											id="userPwd" type="password" placeholder="请输入密码" value=""
											autocomplete="off" /> <span class="auth_error"
											id="passwordError" style="display: none;"> 请输入密码</span>
									</div>
									<div id="cpatchaDiv" style="position: relative;"></div>
									<div class="checkbox"
										style="margin-top: 10px; position: relative;">
										<input type="checkbox" id="niminggo" name="niminggo" value="1" />
										<label for="niminggo">记住我的密码</label> <a
											style="top: 0px; right: 10px; color: rgb(0, 156, 255); font-size: 14px; position: static; margin-left: 20px"
											href="https://nic.nwafu.edu.cn/download/info_service_platform_manual.pdf"
											target="_blank"> 操作指南 </a> <a id="getBackPasswordMainPage"
											style="top: 0px; right: 10px; color: rgb(0, 156, 255); font-size: 14px; position: absolute;"
											href="resetPassword.jsp"> 忘记密码？</a>
									</div>
									<div class="load">
										<input tabindex="4" class="btn-login" id="send-btn"
											type="submit" value="登录" />
										<div class="ui-form-explain"></div>
									</div>
								</form>
								<div class="clearfloat"></div>
							</div>
						</div>
						<div class="clear"></div>
						<div class="clear"></div>
					</div>
			    <div class="layui-tab-item">
						<div id="show0" style="display: block;">
							<div class="login-aside">
								<form class="fm-v clearfix amp-login-form" id="casLoginForm"
									role="form" action="teacherlogin.do" method="post">

									<div class="fm-item">
										<label class="form-label" for="logonId"> 用户名</label> <input
											name="userId" class="i-text" id="userId" type="text"
											placeholder="职工号" value="" /> <span class="auth_error"
											id="usernameError" style="display: none;"> 请输入用户名</span>
									</div>
									<div class="fm-item">
										<label class="form-label" for="logonId">
											密&nbsp;&nbsp;&nbsp;码</label> <input name="userPwd" class="i-text"
											id="userPwd" type="password" placeholder="请输入密码" value=""
											autocomplete="off" /> <span class="auth_error"
											id="passwordError" style="display: none;"> 请输入密码</span>
									</div>
									<div id="cpatchaDiv" style="position: relative;"></div>
									<div class="checkbox"
										style="margin-top: 10px; position: relative;">
										<input type="checkbox" id="niminggo" name="niminggo" value="1" />
										<label for="niminggo">记住我的密码</label> <a
											style="top: 0px; right: 10px; color: rgb(0, 156, 255); font-size: 14px; position: static; margin-left: 20px"
											href="https://nic.nwafu.edu.cn/download/info_service_platform_manual.pdf"
											target="_blank"> 操作指南 </a> <a id="getBackPasswordMainPage"
											style="top: 0px; right: 10px; color: rgb(0, 156, 255); font-size: 14px; position: absolute;"
											href="resetPassword.jsp"> 忘记密码？</a>
									</div>
									<div class="load">
										<input tabindex="4" class="btn-login" id="send-btn"
											type="submit" value="登录" />
										<div class="ui-form-explain"></div>
									</div>
								</form>
								<div class="clearfloat"></div>
							</div>
						</div>
						<div class="clear"></div>
						<div class="clear"></div>
					</div>			    
			  </div>
			</div>
            <!-- <div class="xuanze" style="width: 348px; height: 250px; overflow: hidden; margin-top: 7px; margin-left: 7px;">

             
            </div> -->
            <div class="zhushi">
                <span> 登录说明：</span> 用户名为工号/学号，登录密码与校园网密码相同。【注意】如果用户为新教工或新生，初始密码为本人身份证后六位数字（不包括字母），建议师生及时修改密码并完善个人资料。
            </div>
        </div>
    </div>
    <div class="footer">
    	<div class="line"> </div>
        <p> 服务热线 87082976</p>
        <p> 版权所有 西北农林科技大学 Copy © NORTHWEST A&amp;F UNIVERSITY All RIGHTS RESERVED</p>
    </div>
    
    <script type="text/javascript">
        if('${errMsg}'!=null&&'${errMsg}'!=''){
        	alert('${errMsg}')
        }
        
      
        layui.use('element', function(){
          var $ = layui.jquery
          ,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
        });
    </script>
</body>
</html>