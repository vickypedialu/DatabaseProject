<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://www.ylcto.cn/c" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://"
                + request.getServerName() + ":" + request.getServerPort()
                + path ;
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
                        <i class="icon-view-list"></i>
                        <span style="font-family:'Microsoft YaHei UI';font-size: 25px">添加新的服务</span>
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
                <li><a href="/pages/back/services/ServicesServlet/insertPro" title="Sample page 1">添加服务</a>
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
            向系统中添加新的服务，需要选择对应的类型和管理员！
        </div>
    </div>
            <%--编写数据增加表单--%>
            <div class="col-md-10">
                <form action="<%=basePath%>/pages/back/services/ServicesServlet/insert" method="post" class="form-horizontal" id="insertForm">

                    <div class="form-group">
                        <label for="name" class="col-md-2 control-label" style="font-family:'Microsoft YaHei UI';font-size: 15px">服务名称</label>
                        <div class="col-md-4">
                            <input type="text" name="name" id="name" class="form-control input-sm">
                        </div>
                    </div>

                    <c:if test="${allItems != null}">
                        <div class="form-group">
                            <label for="iid" class="col-md-2 control-label" style="font-family:'Microsoft YaHei UI';font-size: 15px">所属类别</label>
                            <div class="col-md-4">
                                <select class="form-control"id="iid" name="iid">
                                    <c:forEach items="${allItems}" var="item">
                                        <option value="${item.iid}">${item.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </c:if>

                    <c:if test="${allAdmins != null}">
                        <div class="form-group">
                            <label for="aid" class="col-md-2 control-label" style="font-family:'Microsoft YaHei UI';font-size: 15px">管理员ID</label>
                            <div class="col-md-4">
                                <select class="form-control"id="aid" name="aid">
                                    <c:forEach items="${allAdmins}" var="admin">
                                           <option value="${admin.aid}">${admin.aid}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </c:if>


                        <!--内容简介-->
                        <div class="form-group">
                            <label for="note" class="col-md-2 control-label" style="font-family:'Microsoft YaHei UI';font-size: 15px">内容简介</label>
                            <div class="col-md-4">
                                <textarea name="note" id="note" class="form-control"></textarea>
                            </div>
                        </div>


                    <div class="form-group">
                        <div class="col-md-6 col-md-offset-2">
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

<script type="text/javascript" src="js/jquery.validate.js"></script>
<script type="text/javascript" src="js/additional-methods.js"></script>
<script type="text/javascript" src="js/messages_zh.js"></script>
<script type="text/javascript" src="js/search_member.js"></script>
<script type="text/javascript" src="js/jquery.metadata.js"></script>

</body>
</html>
