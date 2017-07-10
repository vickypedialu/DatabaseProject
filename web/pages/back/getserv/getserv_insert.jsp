<%@ taglib prefix="c" uri="http://www.ylcto.cn/c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://"
                + request.getServerName() + ":" + request.getServerPort()
                + path + "/";
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

    <!-- 此处编写内容  -->
    <div class="wrap-fluid" style="width: auto; margin-left: 250px;">
        <div class="container-fluid paper-wrap bevel tlbr">



            <div class="row">
                <div class="col-md-10">
                    <br>
                </div>
                <div class="col-md-6">
                    <h2 class="tittle-content-header">
                        <i class="icon-plus"></i>
                        <span style="font-family:'Microsoft YaHei UI';font-size: 25px">登记服务操作</span>
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
                <li><a href="/pages/back/index.jsp" title="Sample page 1">服务</a>
                </li>
                <li><i class="fa fa-lg fa-angle-right"></i>
                </li>
                <li><a href="/pages/back/getserv/GetservServlet/insertPro" title="Sample page 1">服务登记</a>
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
                    选择登记的服务名称和对应的学生姓名，例如“维修晾衣杆-张三”
                </div>
            </div>


        <%--编写数据增加表单--%>
            <div class="col-md-10">
                <form action="<%=basePath%>pages/back/getserv/GetservServlet/insert" method="post" class="form-horizontal" id="insertForm">

                        <c:if test="${allServices != null}">
                            <%--aid--%>
                            <div class="form-group">
                                <label for="sid" class="col-md-2 control-label" style="font-family:'Microsoft YaHei UI';font-size: 15px">选择服务</label>
                                <div class="col-md-4">
                                    <select class="form-control"id="sid" name="sid">
                                       <c:forEach items="${allServices}" var="services">
                                           <option value="${services.sid}">${services.name}</option>
                                       </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </c:if>

                        <c:if test="${allMembers != null}">
                            <%--aid--%>
                            <div class="form-group">
                                <label for="mid" class="col-md-2 control-label" style="font-family:'Microsoft YaHei UI';font-size: 15px">学生姓名</label>
                                <div class="col-md-4">
                                    <select class="form-control"id="mid" name="mid">
                                        <c:forEach items="${allMembers}" var="member">
                                            <option value="${member.mid}">${member.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </c:if>

                    <div class="form-group">
                        <div class="col-md-6 col-md-offset-2">
                            <br>
                            <button type="submit" class="btn btn-success c">提交</button>
                            <button type="reset" class="btn btn-success">重置</button>
                        </div>
                    </div>
                </form>
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
<script type="text/javascript" src="validate/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="validate/js/jquery.metadata.js"></script>
<script type="text/javascript" src="validate/js/additional-methods.min.js"></script>
<script type="text/javascript" src="validate/js/Message_zh_CN.js"></script>
<script type="text/javascript" src="validate/member_insert.js"></script>
</body>
</html>
