<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    %>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <base href="<%=basePath%>">
    <title>生活园区管理系统</title>
    <script type="text/javascript" src="assets/js/jquery.js"></script>
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/loader-style.css">
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <link rel="stylesheet" href="assets/css/media.css">
    <link rel="stylesheet" href="assets/css/social.css">

    <style type="text/css">
        p.heading{font-family:"Microsoft YaHei UI";font-size:30px}
        p.para{font-family:"Microsoft YaHei UI Light";font-size:12px}
    </style>

    <link rel="shortcut icon" href="assets/ico/minus.png">



</head>

<body>

<div id="preloader">
    <div id="status">&nbsp;</div>
</div>

    <jsp:include page="/pages/back/header.jsp"></jsp:include>

    <div class="wrap-fluid" style="width: auto; margin-left: 250px;">
        <div class="container-fluid paper-wrap bevel tlbr">
            <div class="row">
                <div class="col-md-10">
                    <br>
                </div>
                <div class="col-md-6">
                    <h2 class="tittle-content-header">
                        <i class="icon-plus"></i>
                        <span style="font-family:'Microsoft YaHei UI';font-size: 25px">录入学生操作</span>
                    </h2>
                </div>

                <div class="col-md-10">
                    <br>
                </div>
            </div>

            <ul id="breadcrumb">
                <li>
                    <span class="entypo-home"></span>
                </li>
                <li><i class="fa fa-lg fa-angle-right"></i>
                </li>
                <li><a href="/pages/back/index.jsp" title="Sample page 1">学生</a>
                </li>
                <li><i class="fa fa-lg fa-angle-right"></i>
                </li>
                <li><a href="/pages/back/member/member_insert.jsp" title="Sample page 1">录入学生</a>
                </li>
                <li class="pull-right">
                    <div class="input-group input-widget">

                        <input style="border-radius:15px" type="text" placeholder="Search..." class="form-control">
                    </div>
                </li>
            </ul>

            <div class="col-sm-7">
                <div class="alert">
                    <button type="button" class="close" data-dismiss="alert">×</button>
                    <span class="tittle-alert entypo-info-circled"></span>
                    将新入住生活园区的学生添加到系统中，输入学生的各种信息，必须输入学号和姓名！
                </div>
            </div>

            <div class="row" style="margin-top:30px;padding:0 15px;">
            <div class="col-sm-8">

                <%--数据增加表单--%>
                <div class="blog-list-nest">
                <form action="<%=basePath%>pages/back/member/MemberServlet/insert" method="post" class="form-horizontal" id="insertForm">
                <div class="form-group">
                    <label for="mid" class="col-md-2 control-label" style="font-family:'Microsoft YaHei UI';font-size: 15px">学号：</label>
                    <div class="col-md-4">
                        <input type="text" id="mid" name="mid" class="form-control input-sm" >
                    </div>
                </div>

                <div class="form-group">
                    <label for="name" class="col-md-2 control-label" style="font-family:'Microsoft YaHei UI';font-size: 15px">姓名：</label>
                    <div class="col-md-4">
                        <input type="text" id="name" name="name" class="form-control input-sm" >
                    </div>
                </div>

                <div class="form-group">
                    <label for="EntryYear" class="col-md-2 control-label" style="font-family:'Microsoft YaHei UI';font-size: 15px">入学年份：</label>
                    <div class="col-md-4">
                        <input type="text" id="EntryYear" name="EntryYear" class="form-control">
                    </div>
                </div>


                <div class="form-group">
                    <label for="sex" class="col-md-2 control-label" style="font-family:'Microsoft YaHei UI';font-size: 15px">性别：</label>
                    <div class="radio">
                        <div class="col-md-2 col-md-offset-1">
                            <input type="radio" id="sex" name="sex" value="1" checked >男
                        </div>
                        <div class="col-md-1">
                            <input type="radio" id="sex" name="sex" value="2">女
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="phone" class="col-md-2 control-label" style="font-family:'Microsoft YaHei UI';font-size: 15px">联系电话：</label>
                    <div class="col-md-4">
                        <input type="text" id="phone" name="phone" class="form-control input-sm" >
                    </div>
                </div>


                 <c:if test="${allRooms != null}">
                    <div class="form-group">
                        <label for="rid" class="col-md-2 control-label" style="font-family:'Microsoft YaHei UI';font-size: 15px">选择寝室</label>
                        <div class="col-md-4">
                            <select class="form-control"id="rid" name="rid">
                                <c:forEach items="${allRooms}" var="room">
                                    <option value="${room.rid}">${room.rid}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                 </c:if>

                <div class="form-group" id="butDiv">
                    <div class="col-md-6 col-md-offset-2">
                        <button type="submit" id="subBut" class="btn btn-success c">提交</button>
                        <button type="reset" id="rstBut" class="btn btn-success">重置</button>
                    </div>
                </div>
            </form>
                </div>
                <!-- 表单结束 -->

            </div>
            </div>

        </div>
        </div>


    <jsp:include page="/pages/back/footer.jsp"></jsp:include>

<script type="text/javascript" src="assets/js/preloader.js"></script>
<script type="text/javascript" src="assets/js/bootstrap.js"></script>
<script type="text/javascript" src="assets/js/app.js"></script>
<script type="text/javascript" src="assets/js/load.js"></script>
<script type="text/javascript" src="assets/js/main.js"></script>
<script src="assets/js/flatvideo/jquery.fitvids.js"></script>
<script>
    // Basic FitVids Test
    $(".blog-list-nest").fitVids();
    // Custom selector and No-Double-Wrapping Prevention Test
    $(".blog-list-nest").fitVids();
    // Custom selector and No-Double-Wrapping Prevention Test
</script>

<script type="text/javascript" src="js/jquery.validate.js"></script>
<script type="text/javascript" src="js/additional-methods.js"></script>
<script type="text/javascript" src="js/messages_zh.js"></script>
<script type="text/javascript" src="js/member_insert.js"></script>


</body>
</html>










