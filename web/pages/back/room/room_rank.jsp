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

    <style type="text/css">

        <!--

        body{font-size:12px;}

        ul{padding:0;margin:0;}

        .star_rating {list-style:none;margin:-1px 0 0 -1px; padding:0; width:70px; height:12px; position:relative; background:url(http://demo.jb51.net/demoimg/rating_stars.gif) 0 0 repeat-x; overflow:hidden;font-size:0;}

        .star_rating li{padding:0;margin:0;float:left;}

        .star_rating li a{display:block;width:14px;height:12px;text-decoration:none;text-indent:-9000px;z-index:20;position:absolute;padding:0;margin:0;}

        .star_rating li a:hover{background:url(http://demo.jb51.net/demoimg/rating_stars.gif) 0 12px;z-index:2;left:0;}

        .star_rating a.one_star{left:0;}

        .star_rating a.one_star:hover{width:14px;}

        .star_rating a.two_stars{left:14px;}

        .star_rating a.two_stars:hover{width:28px;}

        .star_rating a.three_stars{left:28px;}

        .star_rating a.three_stars:hover{width:42px;}

        .star_rating a.four_stars{left:42px;}

        .star_rating a.four_stars:hover{width:56px;}

        .star_rating a.five_stars{left:56px;}

        .star_rating a.five_stars:hover{width:70px;}

        .star_rating li.current_rating{background:url(http://demo.jb51.net/demoimg/rating_stars.gif) 0 24px;position:absolute;height:12px;display:block;text-indent:-9000px;z-index:1;left:0;}

        #www_zzjs_net{margin:0 0 20px 20px;}

        #www_zzjs_net p{margin:20px 0 5px 0;}

        -->
    </style>
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
                        <i class="icon-plus"></i>
                        <span style="font-family:'Microsoft YaHei UI';font-size: 25px">寝室评分操作</span>
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
                <li><a href="/pages/back/index.jsp" title="Sample page 1">寝室</a>
                </li>
                <li><i class="fa fa-lg fa-angle-right"></i>
                </li>
                <li><a href="/pages/back/room/room_rank.jsp" title="Sample page 1">寝室评分</a>
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
                   分别对寝室打扫卫生和遵守安全规定的表现进行评分！
                </div>
            </div>

            <div class="row" style="margin-top:30px;padding:0 15px;">
                <div class="col-sm-8">

                    <%--数据增加表单--%>
                        <form action="/pages/back/room/RoomServlet/Rank" method="get">
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
                            <br>

                            <div id="www_zzjs_net" star_width="14">
                                <p>寝室卫生</p>
                                <ul class="star_rating">
                                    <li style="display:none;">
                                        <input type="text" name="tidy" value="" />
                                    </li>
                                    <li class="current_rating">default level</li>
                                    <li><a href="#" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" title="1 of 5 stars" class="one_star">1</a></li>
                                    <li><a href="#" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" title="2 of 5 stars" class="two_stars">2</a></li>
                                    <li><a href="#" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" title="3 of 5 stars" class="three_stars">3</a></li>
                                    <li><a href="#" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" title="4 of 5 stars" class="four_stars">4</a></li>
                                    <li><a href="#" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" title="5 of 5 stars" class="five_stars">5</a></li>
                                </ul>
                                <p>寝室安全</p>
                                <ul class="star_rating">
                                    <li style="display:none;">
                                        <input type="text" name="safe" value="" />
                                    </li>
                                    <li class="current_rating">default level</li>
                                    <li><a href="#" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" title="1 of 5 stars" class="one_star">1</a></li>
                                    <li><a href="#" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" title="2 of 5 stars" class="two_stars">2</a></li>
                                    <li><a href="#" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" title="3 of 5 stars" class="three_stars">3</a></li>
                                    <li><a href="#" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" title="4 of 5 stars" class="four_stars">4</a></li>
                                    <li><a href="#" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" title="5 of 5 stars" class="five_stars">5</a></li>
                                </ul>
                            </div>
                            <input type="submit" value="提交" />
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

            <script type="text/javascript">

                <!--

                function __start(){

                    var initialize_width=0;

                    if(document.getElelmentById){return false};

                    if(document.getElementsByTagName==null){return false;}

                    var startLevelObj=document.getElementById("www_zzjs_net")

                    if(startLevelObj==null){return false;}

                    initialize_width=parseInt(startLevelObj.getAttribute("star_width"),10);

                    if(isNaN(initialize_width) || initialize_width==0){return false;}

                    var ul_obj=startLevelObj.getElementsByTagName("ul");

                    if(ul_obj.length<1){return false;}

                    var length=ul_obj.length;

                    var li_length=0;

                    var a_length=0;

                    var li_obj=null;

                    var a_obj=null;

                    var defaultInputObj=null;

                    var defaultValue=null;

                    for(var i=0;i<length;i++){

                        li_obj=ul_obj[i].getElementsByTagName("li");

                        li_length=li_obj.length;

                        if(li_length<0){return false;}

                        //获取默认值

                        defaultInputObj=li_obj[0].getElementsByTagName("input");if(!defaultInputObj){return false;}

                        defaultValue=parseInt(defaultInputObj[0].value,10);

                        if(!isNaN(defaultValue) && defaultValue!=0){

                            //alert("有初始值!");

                            //li_obj[1].style.width=initialize_width*defaultValue+"px";

                            //defaultValue=0;

                        }

                        for(var j=0;j<li_length;j++){

                            a_obj=li_obj[j].getElementsByTagName("a");

                            if(a_obj.length<1){continue;}

                            if(a_obj[0].className.indexOf("star")>0){

                                a_obj[0].onclick=function(){

                                    return give_value(this);

                                }

                                a_obj[0].onfocus=function(){

                                    this.blur();

                                }

                            }

                        }

                    }

                }

                function give_value(obj){

                    var status=true;

                    var parent_obj=obj.parentNode;

                    var i=0;

                    while(status){

                        i++;

                        if(parent_obj.nodeName=="UL"){break;}

                        parent_obj=parent_obj.parentNode;

                        if(i>1000){break;}//防止找不到ul发生死循环

                    }

                    var hidden_input=parent_obj.getElementsByTagName("input")[0];

                    if(hidden_input.length<1){/*alert("sorry?\nprogram error!")*/;}

                    var txt=obj.firstChild.nodeValue;//确保不能存在空格哦，因为这里用的firstChild

                    if(isNaN(parseInt(txt,10))){/*alert('level error!')*/;return false;}

                    hidden_input.setAttribute("value",txt.toString());

                    //固定选中状态,先找到初始化颜色那个li

                    var current_li=parent_obj.getElementsByTagName("li");

                    var length=current_li.length;

                    var ok_li_obj=null;

                    for(var i=0;i<length;i++){

                        if(current_li[i].className.indexOf("current_rating")>=0){

                            ok_li_obj=current_li[i];break;//找到

                        }

                    }

                    __current_width=txt*14;

                    ok_li_obj.style.width=__current_width+"px";

                    return false;

                }

                __start();

                //-->

            </script>






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



</body>
</html>










