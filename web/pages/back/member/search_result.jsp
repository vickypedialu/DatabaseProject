<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link rel="stylesheet" type="text/css" href="assets/js/progress-bar/number-pb.css">
    <style type="text/css">
        canvas#canvas4 {
            position: relative;
            top: 20px;
        }
    </style>
    <style type="text/css">
        p.heading{font-family:"Microsoft YaHei UI";font-size:30px}
        p.para{font-family:"Microsoft YaHei UI Light";font-size:12px}
    </style>

    <link rel="shortcut icon" href="assets/ico/minus.png">
</head>

<body>
<div id="wrapper">
    <jsp:include page="/pages/back/header.jsp"></jsp:include>

    <div class="wrap-fluid" style="width: auto; margin-left: 250px;">
        <div class="container-fluid paper-wrap bevel tlbr">
            <div class="row">
                <div class="col-md-10">
                    <br>
                </div>
                <div class="col-md-6">
                    <h2 class="tittle-content-header">
                        <i class="icon-search"></i>
                        <span style="font-family:'Microsoft YaHei UI';font-size: 25px">搜索结果</span>
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
                <li><a href="/pages/back/member/search_member.jsp" title="Sample page 1">搜索学生</a>
                </li>
                <li><i class="fa fa-lg fa-angle-right"></i>
                </li>
                <li><a title="Sample page 1">搜索结果</a>
                </li>
                <li class="pull-right">
                    <div class="input-group input-widget">

                        <input style="border-radius:15px" type="text" placeholder="Search..." class="form-control">
                    </div>
                </li>
            </ul>

            <%--数据搜索结果表单--%>
            <div class="col-md-10">

            <c:if test="${result != null}">
            <table class="table table-bordered table-striped cf">
                <thead class="cf">
            <tr>
                <th>学号</th>
                <th>姓名</th>
                <th>入学年份</th>
                <th>性别</th>
                <th>电话</th>
                <th>所属寝室</th>
            </tr>
                </thead>
            <tbody>
    <tr>
    <td>${result.getMid()}</td>
    <td>${result.getName()}</td>
    <td>${result.getEntryYear()}</td>
    <td>
        <c:if test="${result.getSex() ==1}">男
        </c:if>
        <c:if test="${result.getSex() ==2}">女
        </c:if>
    </td>
    <td>${result.phone}</td>
        <td>${result.rid}</td>
    </tr>
            </tbody>
            </table>
            </c:if>

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



</body>
</html>
