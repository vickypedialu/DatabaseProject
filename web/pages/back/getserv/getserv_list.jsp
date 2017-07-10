<%@ taglib prefix="c" uri="http://www.ylcto.cn/c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
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



    <link href="assets/js/footable/css/footable.core.css?v=2-0-1" rel="stylesheet" type="text/css">
    <link href="assets/js/footable/css/footable.standalone.css" rel="stylesheet" type="text/css">
    <link href="assets/js/footable/css/footable-demos.css" rel="stylesheet" type="text/css">

    <link rel="stylesheet" href="assets/js/dataTable/lib/jquery.dataTables/css/DT_bootstrap.css">
    <link rel="stylesheet" href="assets/js/dataTable/css/datatables.responsive.css">
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
                        <span style="font-family:'Microsoft YaHei UI';font-size: 25px">所有服务情况</span>
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
                <li><a href="/pages/back/index.jsp" title="Sample page 1">服务情况</a>
                </li>
                <li><i class="fa fa-lg fa-angle-right"></i>
                </li>
                <li><a href="/pages/back/getserv/GetservServlet/listSplit" title="Sample page 1">服务情况列表</a>
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
                    为系统中的服务进行登记，例如当天完成了某维修服务，点击“完成”来更新其状态！
                </div>
            </div>

            <div class="col-md-10">
            <c:if test="${allGetservs != null}">
                <table class="table-striped footable-res footable metro-blue">
                    <thead>
                    <tr>
                    <th class="footable-sortable">编号<span class="footable-sort-indicator"></span>
                    </th>
                    <th>服务名称</th>
                    <th>姓名</th>
                    <th class="footable-sortable">创建日期<span class="footable-sort-indicator"></span>
                    </th>
                    <th>是否完成</th>
                    <th>完成日期</th>
                    <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                <c:forEach items="${allGetservs}" var="get">
                   <tr>
                       <td>${get.gid}</td>
                       <td>${get.services.name}</td>
                       <td>${get.member.name}</td>
                       <td>${get.credate}</td>
                       <td>
                           <c:if test="${get.findate != null}">
                               <span class="status-metro status-active" title="Active">已完成</span>
                           </c:if>
                           <c:if test="${get.findate == null}">
                               <span class="status-metro status-suspended" title="Suspended">未完成</span>
                           </c:if>
                       </td>
                       <td>${get.findate}</td>
                       <td>
                           <c:if test="${get.findate == null}">
                               <a href="/pages/back/getserv/GetservServlet/updateByFindate?gid=${get.gid}">完成</a>
                           </c:if>
                       </td>
                   </tr>
                </c:forEach>
                    </tbody>
            </table>
                <div class="col-md-5 col-md-offset-5">
                    <jsp:include page="/pages/split_bar.jsp"></jsp:include>
                </div>
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

<script type="text/javascript" src="validate/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="validate/js/jquery.metadata.js"></script>
<script type="text/javascript" src="validate/js/additional-methods.min.js"></script>
<script type="text/javascript" src="validate/js/Message_zh_CN.js"></script>
<script type="text/javascript" src="validate/member_insert.js"></script>

<script type="text/javascript" src="assets/js/toggle_close.js"></script>
<script src="assets/js/footable/js/footable.js?v=2-0-1" type="text/javascript"></script>
<script src="assets/js/footable/js/footable.sort.js?v=2-0-1" type="text/javascript"></script>
<script src="assets/js/footable/js/footable.filter.js?v=2-0-1" type="text/javascript"></script>
<script src="assets/js/footable/js/footable.paginate.js?v=2-0-1" type="text/javascript"></script>
<script src="assets/js/footable/js/footable.paginate.js?v=2-0-1" type="text/javascript"></script>

<script type="text/javascript">
    $(function() {
        $('.footable-res').footable();
    });
</script>
<script type="text/javascript">
    $(function() {
        $('#footable-res2').footable().bind('footable_filtering', function(e) {
            var selected = $('.filter-status').find(':selected').text();
            if (selected && selected.length > 0) {
                e.filter += (e.filter && e.filter.length > 0) ? ' ' + selected : selected;
                e.clear = !e.filter;
            }
        });

        $('.clear-filter').click(function(e) {
            e.preventDefault();
            $('.filter-status').val('');
            $('table.demo').trigger('footable_clear_filter');
        });

        $('.filter-status').change(function(e) {
            e.preventDefault();
            $('table.demo').trigger('footable_filter', {
                filter: $('#filter').val()
            });
        });

        $('.filter-api').click(function(e) {
            e.preventDefault();

            //get the footable filter object
            var footableFilter = $('table').data('footable-filter');

            alert('about to filter table by "tech"');
            //filter by 'tech'
            footableFilter.filter('tech');

            //clear the filter
            if (confirm('clear filter now?')) {
                footableFilter.clearFilter();
            }
        });
    });
</script>


</body>
</html>
