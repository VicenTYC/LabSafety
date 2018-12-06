<%--
  Created by IntelliJ IDEA.
  User: Tyc
  Date: 2018/12/5
  Time: 17:41
  在线练习页面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
    <title>在线练习</title>
    <link href="./Resource/css/exam_main.css" rel="stylesheet"
          type="text/css" />
    <link href="./Resource/css/exam_iconfont.css" rel="stylesheet"
          type="text/css" />
    <link href="./Resource/css/exam_test.css" rel="stylesheet"
          type="text/css" />
    <link href="./Resource/js/css/layui.css" rel="stylesheet"
          type="text/css" />
</head>
<body>
<div class="main">
    <!--nr start-->
    <div class="test_main">
        <div class="nr_left">
            <div class="test">
                <form action="" method="post" id="examPaper">
                    <%--  <input name="examId" value="${nowExam.exam_id}" style="display:none"/> --%>
                    <div class="test_title">
                        <p class="test_time">
                            <b class="alt-1"></b>
                        </p>
                        <font><input type="button" value="交卷" id="submit"></font>
                    </div>
                        <div class="test_content">
                            <div class="test_content_title">
                                <h2>单选题</h2>
                            </div>
                        </div>
                        <div class="test_content_nr">
                            <ul>
                                <c:forEach items="${quesList}" var="que" varStatus="status">
                                    <c:if test="${que.question_type==1}">
                                        <li id="qu_0_${status.index }">
                                            <div class="test_content_nr_tt">
                                            <i>${status.count}</i><font>${que.question_content }</font><b
                                                class="icon iconfont">&#xe881;</b>
                                        </div>
                                        <div class="test_content_nr_main">
                                            <ul>
                                                <c:set var="string1" value="${ que.question_item}" />
                                                <c:set var="stringA" value="${fn:split(string1, ' ')}" />
                                                <li class="option"><label
                                                        for="0_answer_${status.count}_option_1"><input
                                                        type="radio" class="radioOrCheck"
                                                        name="single${status.count}"
                                                        id="0_answer_${status.count}_option_1" value="a" /> A.
                                                    <p class="ue" style="display: inline;">${stringA[0]}</p>
                                                </label></li>

                                                <li class="option"><label
                                                        for="0_answer_${status.count}_option_2"><input
                                                        type="radio" class="radioOrCheck"
                                                        name="single${status.count}"
                                                        id="0_answer_${status.count}_option_2" value="b" /> B.
                                                    <p class="ue" style="display: inline;">${stringA[1]}</p>
                                                </label></li>

                                                <li class="option"><label
                                                        for="0_answer_${status.count}_option_3"><input
                                                        type="radio" class="radioOrCheck"
                                                        name="single${status.count}"
                                                        id="0_answer_${status.count}_option_3" value="c" /> C.
                                                    <p class="ue" style="display: inline;">${stringA[2]}</p>
                                                </label></li>
                                                <li class="option"><label
                                                        for="0_answer_${status.count}_option_4"><input
                                                        type="radio" class="radioOrCheck"
                                                        name="single${status.count}"
                                                        id="0_answer_${status.count}_option_4" value="d" /> D.
                                                    <p class="ue" style="display: inline;">${stringA[3]}</p>
                                                </label></li>
                                            </ul>
                                        </div>
                                    </li>
                                    </c:if>
                                    <c:if test="${que.question_type==2}">
                                        <li id="qu_1_${status.index }">
                                            <div class="test_content_nr_tt">
                                                <i>${status.count}</i><font>${que.question_content }</font><b
                                                    class="icon iconfont">&#xe881;</b>
                                            </div>

                                            <div class="test_content_nr_main">
                                                <ul>
                                                    <c:set var="string1" value="${ que.question_item}" />
                                                    <c:set var="stringA" value="${fn:split(string1, ' ')}" />
                                                    <li class="option"><label
                                                            for="1_answer_${status.count}_option_1"><input
                                                            type="checkbox" class="radioOrCheck"
                                                            name="mulit${status.count}" value="a"
                                                            id="1_answer_${status.count}_option_1" /> A.
                                                        <p class="ue" style="display: inline;">${stringA[0]}</p>
                                                    </label></li>

                                                    <li class="option"><label
                                                            for="1_answer_${status.count}_option_2">
                                                        <input type="checkbox"
                                                               class="radioOrCheck" name="mulit${status.count}" value="b"
                                                               id="1_answer_${status.count}_option_2" />
                                                        B.
                                                        <p class="ue" style="display: inline;">${stringA[1]}</p>
                                                    </label></li>

                                                    <li class="option"><label
                                                            for="1_answer_${status.count}_option_3"><input
                                                            type="checkbox" class="radioOrCheck"
                                                            name="mulit${status.count}" value="c"
                                                            id="1_answer_${status.count}_option_3" /> C.
                                                        <p class="ue" style="display: inline;">${stringA[2]}</p>
                                                    </label></li>

                                                    <li class="option"><label
                                                            for="1_answer_${status.count}_option_4"><input
                                                            type="checkbox" class="radioOrCheck"
                                                            name="mulit${status.count}" value="d"
                                                            id="1_answer_${status.count}_option_4" /> D.
                                                        <p class="ue" style="display: inline;">${stringA[3]}</p>
                                                    </label></li>
                                                </ul>
                                            </div>
                                        </li>
                                    </c:if>
                                    <c:if test="${que.question_type==3}">
                                        <li id="qu_2_${status.index }">
                                            <div class="test_content_nr_tt">
                                                <i>${status.count}</i><font>${que.question_content }</font><b
                                                    class="icon iconfont">&#xe881;</b>
                                            </div>

                                            <div class="test_content_nr_main">
                                                <ul>
                                                    <li class="option"><label
                                                            for="3_answer_${status.count}_option_1"> <input
                                                            type="radio" class="radioOrCheck"
                                                            name="torf${status.count}" value="a"
                                                            id="3_answer_${status.count}_option_1" />
                                                        <p class="ue" style="display: inline;" value="A">是</p>
                                                    </label></li>
                                                    <li class="option"><label
                                                            for="3_answer_${status.count}_option_2"> <input
                                                            type="radio" class="radioOrCheck"
                                                            name="torf${status.count}" value="b"
                                                            id="3_answer_${status.count}_option_2" />
                                                        <p class="ue" style="display: inline;" value="B">否</p>
                                                    </label></li>
                                                </ul>
                                            </div>
                                        </li>
                                    </c:if>
                                </c:forEach>
                            </ul>
                        </div>
                </form>
            </div>
        </div>

        <script src="./Resource/js/exampaper.js"></script>

</body>
</html>
