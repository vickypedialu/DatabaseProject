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

    <!-- 图片轮播用 -->
    <link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
</head>

<body>
<div id="wrapper">
    <jsp:include page="header.jsp"></jsp:include>

        <div class="wrap-fluid" style="width: auto; margin-left: 250px;">
            <div class="container-fluid paper-wrap bevel tlbr">

                <!-- 标题 -->
                <div class="row">
                    <div id="paper-top">
                        <div class="col-sm-3">
                            <h2 class="tittle-content-header">
                                <span class="entypo-doc-text"></span>
                                <span style="font-family:'Microsoft YaHei UI';font-size: 18px">生活园区管理系统
                            </span>
                                <span>v0.1</span>
                            </h2>
                        </div>

                        <div class="col-sm-7">
                            <div class="devider-vertical visible-lg"></div>
                            <div class="tittle-middle-header">
                                <div class="alert">
                                    <button type="button" class="close" data-dismiss="alert">×</button>
                                    <span class="tittle-alert entypo-info-circled" style="font-family:'Microsoft YaHei UI';font-size: 15px"></span>
                                    欢迎您&nbsp;
                                    <strong>  <c:if test="${aid != null}">${aid}</c:if></strong>&nbsp;&nbsp;进入生活园区管理系统
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row" style="margin-top:30px;padding:20px;">
                    <div class="col-sm-5 ">
                        <div class="blog-list-nest">
                            <div class="vendor">
                               <!-- 图片轮播 -->
                                <div id="myCarousel" class="carousel slide" style="width:100%;">
                                    <!-- 轮播（Carousel）指标 -->
                                    <ol class="carousel-indicators">
                                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                                        <li data-target="#myCarousel" data-slide-to="1"></li>
                                        <li data-target="#myCarousel" data-slide-to="2"></li>
                                        <li data-target="#myCarousel" data-slide-to="3"></li>
                                    </ol>
                                    <!-- 轮播（Carousel）项目 -->
                                    <div class="carousel-inner">
                                        <div id="pic0" class="item active">
                                            <img src="/assets/img/dorm1.jpg" alt="First slide">
                                        </div>
                                        <div id="pic1" class="item">
                                            <img src="/assets/img/dorm2.jpg" alt="Second slide">
                                        </div>
                                        <div id="pic2" class="item">
                                            <img src="/assets/img/dorm5.jpg" alt="Third slide">
                                        </div>
                                        <div id="pic3" class="item">
                                            <img src="/assets/img/dorm4.jpg" alt="fourth slide">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="blog-list-content">
                                <h2>张江生活园区</h2>
                                <p>复旦大学张江校区位于张江高科技园区张衡路825号，占地面积约21.7万平方米，建筑面积约10.6万平方米。
                                校区一次规划分二期建设。</p>
                                <button class="btn btn-info pull-right">阅读更多</button>
                                <div style="clear:both;"></div>
                            </div>
                        </div>
                    </div>
                    <!--  BLOG SIDE CONTENT -->
                    <div class="col-sm-4">
                        <div class="panel panel-default">
                            <img class="media-object img-circle blog-profile" data-src="holder.js/64x64" height="10%" width="32%" src="/assets/img/fudan.jpg">
                            <hr style="margin:0;">

                            <div class="panel-body">
                                <p class="lead text-center">生活园区管理处</p>
                                <br>
                                <p class="social-follower text-center">联系我们
                                    <i class="icon-phone"></i>
                                   12345678</p>
                            </div>
                        </div>

                        <div class="blog-side-nest">
                            <h4 class="text-left">最近通知</h4>
                            <hr style="margin:0">

                            <div class="media">
                                <div class="media-body">
                                    <i class="icon-star"></i>
                                    <a class="link-comment recentpost-link"  href="#">邯郸大学终于也断网了！</a>
                                </div>
                                <br>
                                <div class="media-body">
                                    <i class="icon-star"></i>
                                    <a class="link-comment recentpost-link" style="margin:-10px 0 10px" href="#">张江大学又又又断网了！</a>
                                </div>
                                <br>
                                <div class="media-body">
                                    <i class="icon-star"></i>
                                    <a class="link-comment recentpost-link" style="margin:-10px 0 10px" href="#">张江大学又断网了！</a>
                                </div>
                                <br>
                                <div class="media-body">
                                    <i class="icon-star"></i>
                                    <a class="link-comment recentpost-link" style="margin:-10px 0 10px" href="#">听说张江大学断网了！</a>
                                </div>
                            </div>





                        </div>

                    </div>
            </div>
        </div>
</div>

    <jsp:include page="footer.jsp"></jsp:include>

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


<script>
    var i=0;
    var c = null;
    c = setTimeout(carousel,1000);//开始执行
    function carousel()
    {

        clearTimeout(c);//清除定时器

        $("#pic"+i).removeClass("active");
        $("#pic"+(i+1)).addClass("active");
        i++;
        $("ol li").removeClass("active");
        $("ol li:eq("+i+")").addClass("active");

        if(i>3){
            $("#pic"+(i-1)).removeClass("active");
            $("#pic0").addClass("active");
            i=0;
            $("ol li:eq("+i+")").addClass("active");

        }
        c = setTimeout(carousel,1000); //设定定时器，循环执行
    }

</script>


</body>
</html>










