<%--
  Created by IntelliJ IDEA.
  User: Tyc
  Date: 2018/12/5
  Time: 17:41
  在线练习页面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>在线练习</title>
    <link href="./Resource/css/exam_main.css" rel="stylesheet"
          type="text/css"/>
    <link href="./Resource/css/exam_iconfont.css" rel="stylesheet"
          type="text/css"/>
    <link href="./Resource/css/exam_test.css" rel="stylesheet"
          type="text/css"/>
    <link href="./Resource/js/css/layui.css" rel="stylesheet"
          type="text/css"/>
    <jsp:include page="head.jsp"></jsp:include>
    <link type="text/css" rel="stylesheet"
          href="./Resource/css/learnfile.css">
</head>
<body>

<div class="head-w" style="margin: 0 0;">
    <div class="head">
        <img alt="logo" src="./Resource/images/logo.png"/>

    </div>
</div>
<div class="top">
    <div class="bar" style="margin: 0 auto; width: 1100px">
        <ul class="layui-nav" lay-filter="" style="background: #f0f0f0;">
            <li class="layui-nav-item"><a href="getIndex.do" style="color: black;">首页</a></li>
            <li class="layui-nav-item"><a href="getMoreSystemNotice.do" style="color: black;">系统公告</a></li>
            <li class="layui-nav-item"><a href="getFileResource.do" style="color: black;">在线学习</a></li>
            <li class="layui-nav-item"><a href="" style="color: black;">在线练习</a></li>
            <li class="layui-nav-item"><a href="getMoreRegulation.do" style="color: black;">规章制度</a></li>
            <li class="layui-nav-item"><a href="fileRules.do" style="color: black;">文件制度</a></li>
        </ul>
    </div>
</div>
<div id="all">
    <div style="margin-top: 10px; width: 20%" id="left">
        <ul class="layui-nav layui-nav-tree " lay-filter="test">
            <li class="layui-nav-item layui-nav-itemed"><a
                    href="javascript:;">在线练习</a>
                <dl class="layui-nav-child">
                    <c:forEach var="iter" items="${questionBankTypeList}" varStatus="status">
                        <dd>
                            <a href="javascript:;" typeid="${iter.type_id}"
                               onclick="getList(this)">${iter.bank_name}</a>
                        </dd>
                    </c:forEach>
                </dl>
            </li>
        </ul>
    </div>
    <div id="right" style="width: 78%;">
        <div class="main">
            <!--nr start-->
            <div class="test_main">
                <div class="nr_left">
                    <div class="test" bankId="${quesList[0].bank_id}">
                        <%--  <input name="examId" value="${nowExam.exam_id}" style="display:none"/> --%>
                        <div class="test_title">
                            <%--  <font><input type="button" value="交卷" id="submit"></font>--%>
                            <%--加入分页。。start--%>
                            <div id="fenye"></div>
                            <%--分页。。end--%>
                        </div>

                        <div class="test_content_nr" style="margin-bottom: 41px ">
                            <ul>
                                <c:forEach items="${quesList}" var="que" varStatus="status">

                                    <li id="qu_0_${status.index }">
                                        <div class="test_content_nr_tt">
                                            <i>${status.count}</i><span><c:if
                                                test="${que.question_type==1}">(单选题)</c:if><c:if
                                                test="${que.question_type==2}">(多选题)</c:if><c:if
                                                test="${que.question_type==3}">(判断题)</c:if></span><font>${que.question_content }</font><b
                                                class="icon iconfont">
                                            <button class="layui-btn layui-btn-radius layui-btn-normal" id="ckda"
                                                    onclick="answer(this)" answer="${que.question_answer}">查看答案
                                            </button>
                                        </b>
                                        </div>
                                        <c:if test="${que.question_type==1}">
                                            <div class="test_content_nr_main">
                                                <ul>
                                                    <c:set var="string1" value="${ que.question_item}"/>
                                                    <c:set var="stringA" value="${fn:split(string1, ' ')}"/>
                                                    <li class="option"><label
                                                            for="0_answer_${status.count}_option_1"><input
                                                            type="radio" class="radioOrCheck"
                                                            name="single${status.count}"
                                                            id="0_answer_${status.count}_option_1" value="a"/> A.
                                                        <p class="ue" style="display: inline;">${stringA[0]}</p>
                                                    </label></li>

                                                    <li class="option"><label
                                                            for="0_answer_${status.count}_option_2"><input
                                                            type="radio" class="radioOrCheck"
                                                            name="single${status.count}"
                                                            id="0_answer_${status.count}_option_2" value="b"/> B.
                                                        <p class="ue" style="display: inline;">${stringA[1]}</p>
                                                    </label></li>

                                                    <li class="option"><label
                                                            for="0_answer_${status.count}_option_3"><input
                                                            type="radio" class="radioOrCheck"
                                                            name="single${status.count}"
                                                            id="0_answer_${status.count}_option_3" value="c"/> C.
                                                        <p class="ue" style="display: inline;">${stringA[2]}</p>
                                                    </label></li>
                                                    <li class="option"><label
                                                            for="0_answer_${status.count}_option_4"><input
                                                            type="radio" class="radioOrCheck"
                                                            name="single${status.count}"
                                                            id="0_answer_${status.count}_option_4" value="d"/> D.
                                                        <p class="ue" style="display: inline;">${stringA[3]}</p>
                                                    </label></li>
                                                </ul>
                                            </div>
                                        </c:if>
                                        <c:if test="${que.question_type==2}">
                                            <div class="test_content_nr_main">
                                                <ul>
                                                    <c:set var="string1" value="${ que.question_item}"/>
                                                    <c:set var="stringA" value="${fn:split(string1, ' ')}"/>
                                                    <li class="option"><label
                                                            for="1_answer_${status.count}_option_1"><input
                                                            type="checkbox" class="radioOrCheck"
                                                            name="mulit${status.count}" value="a"
                                                            id="1_answer_${status.count}_option_1"/> A.
                                                        <p class="ue" style="display: inline;">${stringA[0]}</p>
                                                    </label></li>

                                                    <li class="option"><label
                                                            for="1_answer_${status.count}_option_2">
                                                        <input type="checkbox"
                                                               class="radioOrCheck" name="mulit${status.count}"
                                                               value="b"
                                                               id="1_answer_${status.count}_option_2"/>
                                                        B.
                                                        <p class="ue" style="display: inline;">${stringA[1]}</p>
                                                    </label></li>

                                                    <li class="option"><label
                                                            for="1_answer_${status.count}_option_3"><input
                                                            type="checkbox" class="radioOrCheck"
                                                            name="mulit${status.count}" value="c"
                                                            id="1_answer_${status.count}_option_3"/> C.
                                                        <p class="ue" style="display: inline;">${stringA[2]}</p>
                                                    </label></li>

                                                    <li class="option"><label
                                                            for="1_answer_${status.count}_option_4"><input
                                                            type="checkbox" class="radioOrCheck"
                                                            name="mulit${status.count}" value="d"
                                                            id="1_answer_${status.count}_option_4"/> D.
                                                        <p class="ue" style="display: inline;">${stringA[3]}</p>
                                                    </label></li>
                                                </ul>
                                            </div>
                                        </c:if>
                                        <c:if test="${que.question_type==3}">
                                            <div class="test_content_nr_main">
                                                <ul>
                                                    <li class="option"><label
                                                            for="3_answer_${status.count}_option_1"> <input
                                                            type="radio" class="radioOrCheck"
                                                            name="torf${status.count}" value="a"
                                                            id="3_answer_${status.count}_option_1"/>
                                                        <p class="ue" style="display: inline;" value="A">是</p>
                                                    </label></li>
                                                    <li class="option"><label
                                                            for="3_answer_${status.count}_option_2"> <input
                                                            type="radio" class="radioOrCheck"
                                                            name="torf${status.count}" value="b"
                                                            id="3_answer_${status.count}_option_2"/>
                                                        <p class="ue" style="display: inline;" value="B">否</p>
                                                    </label></li>
                                                </ul>
                                            </div>
                                        </c:if>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="./Resource/js/jquery.min.js"></script>
<script src="./Resource/js/exampaper.js"></script>
<script>
    function answer(sel) {
        var answerStr = $(sel).attr("answer");
        var ifwatch = $(sel).attr("watch");
        if (ifwatch == undefined) {
            $(sel).attr("watch", 1);
            $(sel).html(answerStr);
        } else {
            $(sel).removeAttr("watch");
            $(sel).html("查看答案");
        }
    }

    var curAmount = ${quesAmount};
    $(document).ready(reFenye(curAmount));
   function getList(sel) {
       var bankId = $(sel).attr("typeid");
       $(".test").attr("bankId",bankId);
       curAmount=0;//清零使后台重新查询总数
       setListData(1);
       reFenye(curAmount);
   }
    function reFenye(curAmount) {
        layui.use('laypage', function () {
            var laypage = layui.laypage;
            console.log("amount:" + curAmount);
            laypage.render({
                elem: 'fenye',
                count: curAmount,//数据总数，从服务端得到
                limit: 15,
                jump: function (obj, first) {
                    //obj包含了当前分页的所有参数，比如：
                    console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
                    console.log(obj.limit); //得到每页显示的条数
                    console.log("amount:" + curAmount);
                    //首次不执行
                    if (!first) {
                        var currPage = obj.curr;
                        setListData(currPage);
                    }
                }
            });
        });
    };

    function setListData(currPage) {
        var bankId = $(".test").attr("bankId");
        $.ajax({
            type: 'POST',
            url: "/labsafety/learn/getPrectice.do", // ajax请求路径
            async: false,
            data: {
                page: currPage, //当前页数
                bankId: bankId,
                limit: 15,
                quesAmount: curAmount
            },
            dataType: 'json',
            success: function (res) {
                if (res.status == 200) {
                    curAmount = res.quesAmount;
                    var questions = res.quesList;
                    var element =document.getElementsByClassName("test_content_nr")[0];
                    var str = '';
                    element.innerHTML = str;
                    for (var i = 0; i < questions.length; i++) {
                        var items = questions[i].question_item.trim();
                        var item = items.split(/\s+/);//分割成单词
                        var index = i+1;
                        str += '<ul><li ><div class="test_content_nr_tt"><i>' +
                            index +
                            '</i><span>';
                        if (questions[i].question_type == 1) {
                            str += ''+'(单选题)</span><font>' + questions[i].question_content + '</font><b class="icon iconfont"><button class="layui-btn layui-btn-radius layui-btn-normal" id="ckda" onclick="answer(this)" answer = "' + questions[i].question_answer
                                + '">查看答案</button></b></div><div class="test_content_nr_main"><ul>' +
                                '<li class="option"><label><input name="single' + i + '"type="radio" class="radioOrCheck" value="a"/> A.' +
                                ' <p class="ue" style="display: inline;">' + item[0] + '</p> </label></li>' +
                                '<li class="option"><label><input name="single' + i + '" type="radio" class="radioOrCheck value="b"/> B.' +
                                ' <p class="ue" style="display: inline;">' + item[1] + '</p></label></li>' +
                                '<li class="option"><label><input name="single' + i + '" type="radio" class="radioOrCheck" value="c"/> C.' +
                                ' <p class="ue" style="display: inline;">' + item[2] + '</p></label></li>' +
                                ' <li class="option"><label><input name="single' + i + '" type="radio" class="radioOrCheck" value="d"/> D.' +
                                ' <p class="ue" style="display: inline;">' + item[3] + '</p></label></li>' +
                                '</ul></div>';
                        } else if (questions[i].question_type == 2) {
                            str += '(多选题)</span><font>'+questions[i].question_content+' </font><b class="icon iconfont"><button class="layui-btn layui-btn-radius layui-btn-normal" id="ckda" onclick="answer(this)" answer = "'+questions[i].question_answer+
                                 '">查看答案</button></b></div><div class="test_content_nr_main"><ul>' +
                                '<li class="option"><label><input name="mulit' + i + '"type="checkbox" class="radioOrCheck" value="a"/> A.' +
                                ' <p class="ue" style="display: inline;">' + item[0] + '</p> </label></li>' +
                                '<li class="option"><label><input name="mulit' + i + ' "type="checkbox" class="radioOrCheck" value="b"/> B.' +
                                ' <p class="ue" style="display: inline;">' + item[1] + '</p></label></li>' +
                                '<li class="option"><label><input name="mulit' + i + ' "type="checkbox" class="radioOrCheck" value="c"/> C.' +
                                ' <p class="ue" style="display: inline;">' + item[2] + '</p></label></li>' +
                                ' <li class="option"><label><input name="mulit' + i + ' "type="checkbox" class="radioOrCheck" value="d"/> D.' +
                                ' <p class="ue" style="display: inline;">' + item[3] + '</p></label></li>' +
                                '</ul></div>';
                        } else {
                            str += '(判断题)</span><font>'+questions[i].question_content+' </font><b class="icon iconfont"><button class="layui-btn layui-btn-radius layui-btn-normal" id="ckda" onclick="answer(this)" answer = "'+questions[i].question_answer +
                                 '">查看答案</button></b></div><div class="test_content_nr_main"><ul>' +
                                '<li class="option"><label><input name="torf' + i + '"type="radio" class="radioOrCheck" value="a"/> A:是.' +
                                '<li class="option"><label><input name="torf' + i + '" type="radio" class="radioOrCheck value="b"/> B:否.' +
                                '</ul></div>';
                        }
                        element.innerHTML = str;
                    }
                }
            }
        });
    }
</script>
</body>
</html>
