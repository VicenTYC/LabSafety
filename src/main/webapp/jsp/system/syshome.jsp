<%--
  Created by IntelliJ IDEA.
  User: tyc
  Date: 2018/12/13
  Time: 15:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <title>系统管理</title>
    <link rel="stylesheet" type="text/css" href="../Resource/css/layui.css"/>
    <link href="../Resource/css/layui.css" rel="stylesheet"/>
    <script src="../Resource/js/edit.js"></script>
    <script src="../Resource/js/layui.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo" style="left: 20px;font-size: 1.4rem;font-weight: 600;color: #fff;width: 15%;">
            实验室安全与教育管理系统
        </div>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    TYC
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="">退出</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="sysIndex.do?op=sysnotice">系统公告</a>
                </li>
                <li class="layui-nav-item"><a href="sysIndex.do?op=questionbank">题库维护</a></li>
                <li class="layui-nav-item"><a href="sysIndex.do?op=filebank">文件库维护</a></li>
                <li class="layui-nav-item"><a href="sysIndex.do?op=uploadfile">学习文件</a></li>
                <li class="layui-nav-item"><a href="">文件制度</a></li>
                <li class="layui-nav-item"><a href="">规章制度</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <c:if test="${op == 'sysnotice'}">
            <jsp:include page="sysnotice.jsp"></jsp:include>
        </c:if>
        <c:if test="${op == 'questionbank'}">
            <jsp:include page="addquesbank.jsp"></jsp:include>
        </c:if>
        <c:if test="${op == 'filebank'}">
            <jsp:include page="addfilebank.jsp"></jsp:include>
        </c:if>
        <c:if test="${op == 'uploadfile'}">
            <jsp:include page="uploadfile.jsp"></jsp:include>
        </c:if>
    </div>

</div>
</body>
</html>
