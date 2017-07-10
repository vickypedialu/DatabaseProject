<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
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

    <link href="assets/js/stackable/stacktable.css" rel="stylesheet">
    <link href="assets/js/stackable/responsive-table.css" rel="stylesheet">
    <link rel="shortcut icon" href="assets/ico/minus.png">

    <script type="text/JavaScript">
        //点击"全选/全不选"复选框，如果选中，则选中全部复选框，否则取消选中全部复选框
        function checkboxall( Allname,name) {
            var ischecked = document.getElementById(Allname).checked;
            if(ischecked) {
                checkallbox(name);
            }else {
                discheckallbox(name);
            }
        }
        //选中全部复选框
        function checkallbox(name) {
            var boxarray = document.getElementsByName(name);
            for(var i = 0; i < boxarray.length; i++) {
                boxarray[i].checked = true;
            }
        }
        //取消选中全部复选框
        function discheckallbox(name) {
            var boxarray = document.getElementsByName(name);
            for(var i = 0; i < boxarray.length; i++) {
                boxarray[i].checked = false;
            }
        }

        //点击某个复选框，如果所有复选框都选中，“全选/全不选”复选框也选中
        //否则如果所有复选框都取消选中，“全选/全不选”复选框也取消选中
        function checkonebox(Allname,name) {
            if(isallchecked(name)) {
                document.getElementById(Allname).checked = true;
            }
            if(isalldischecked(name)) {
                document.getElementById(Allname).checked = false;
            }
        }

        //是否全部选中
        function isallchecked(name) {
            var boxarray = document.getElementsByName(name);
            for(var i = 0; i < boxarray.length; i++) {
                if(!boxarray[i].checked) {
                    return false;
                }
            }
            return true;
        }
        //是否全部没有选中
        function isalldischecked(name) {
            var boxarray = document.getElementsByName(name);
            for(var i = 0; i < boxarray.length; i++) {
                if(boxarray[i].checked) {
                    return false;
                }
            }
            return true;
        }

        //得到选中项的值的集合，结果为“1|小明,2|小王,3|小李”的形式
        function getallcheckedvalue(name) {
            var boxvalues = "";
            var boxarray = document.getElementsByName(name);
            for(var i = 0; i < boxarray.length; i++) {
                if(boxarray[i].checked) {
                    var boxvalue = boxarray[i].value;
                    if(boxvalues == "") {
                        boxvalues = boxvalue;
                    }else {
                        boxvalues = boxvalues + "," + boxvalue;
                    }
                }
            }
            return boxvalues;
        }


        function submitForm(){
            document.getElementById("myForm").submit();
        }

    </script>
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
                            <span style="font-family:'Microsoft YaHei UI';font-size: 25px">管理所有学生</span>
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
                    <li><a href="/pages/back/member/MemberServlet/list" title="Sample page 1">批量删除学生</a>
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
                        表格中显示系统中所有学生，勾选复选框来批量删除学生！
                    </div>
                </div>


                <div class="row" style="margin-top:30px;padding:0 15px;">
                    <div class="col-sm-8">
                        <c:if test="${allMembers != null}">
                            <form name="myForm" id="myForm" action="pages/back/member/MemberServlet/delete" method="post">
                                <table class="table table-bordered table-striped cf">
                                    <thead class="cf">
                                    <tr>
             <td><input type="checkbox" id="checkall" value="" onclick="checkboxall('checkall','box')"/></td>
             <th>学号</th>
             <th>姓名</th>
             <th>入学年份</th>
             <th>性别</th>
             <th>电话</th>
                                        <th>所属寝室</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${allMembers}" var="member">
             <tr>
                 <td><input type="checkbox" onclick="checkonebox('checkall','box')"value="${member.mid}" id="box" name="box" /></td>
                 <td>${member.mid}</td>
                 <td>${member.name}</td>
                 <td>${member.getEntryYear()}</td>
                 <td>
                     <c:if test="${member.sex ==1}">男
                     </c:if>
                     <c:if test="${member.sex ==2}">女
                     </c:if>
                 </td>
                 <td>${member.phone}</td>
                 <td>${member.rid}</td>
             </tr>
         </c:forEach>
                </tbody>
            </table>
                <td><input type="button" value="删除" onclick="submitForm()" /></td>

            </c:if>
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
<script type="text/javascript" src="js/member_insert.js"></script>
<script type="text/javascript" src="assets/js/stackable/stacktable.js"></script>



        <script>
            $(document).on('click', '#run', function(e) {
                e.preventDefault();
                $('#simple-example-table').stacktable({
                    hideOriginal: true
                });
                $(this).replaceWith('<span>ran</span>');
            });
            $('#responsive-example-table').stacktable({
                myClass: 'stacktable small-only'
            });
        </script>



</body>
</html>
