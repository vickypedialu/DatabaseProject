<%--
  Created by IntelliJ IDEA.
  User: amylz
  Date: 2017/5/21
  Time: 22:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- TOP NAVBAR -->

<nav role="navigation" class="navbar navbar-static-top">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button data-target="#bs-example-navbar-collapse-1" data-toggle="collapse" class="navbar-toggle" type="button">
                <span class="entypo-menu"></span>
            </button>
            <button class="navbar-toggle toggle-menu-mobile toggle-left" type="button">
                <span class="entypo-list-add"></span>
            </button>

        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div id="bs-example-navbar-collapse-1" class="collapse navbar-collapse">

            <div id="nt-title-container" class="navbar-left running-text visible-lg col-md-3 col-md-offset-3">

                <ul id="nt-title">
                    <small>上次登录日期：
                        <c:if test="${lastdate != null}">
                            ${lastdate}
                        </c:if>
                    </small>
                </ul>
            </div>

            <ul style="margin-right:0;" class="nav navbar-nav navbar-right">
                <li>
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <img alt="" class="admin-pic img-circle" src="/assets/img/user.jpg">Hi,
                            <c:if test="${aid != null}">${aid}
                            </c:if>
                        <b class="caret"></b>
                    </a>
                    <ul style="margin-top:14px;" role="menu" class="dropdown-setting dropdown-menu">
                        <li>
                            <a href="/pages/back/AdminServlet/logout">
                                <span class="entypo-lifebuoy"></span>&#160;&#160;Logout</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <span class="icon-gear"></span>&#160;&#160;Setting</a>
                    <ul role="menu" class="dropdown-setting dropdown-menu">

                        <li class="theme-bg">
                            <div id="button-bg"></div>
                            <div id="button-bg2"></div>
                            <div id="button-bg3"></div>
                            <div id="button-bg5"></div>
                            <div id="button-bg6"></div>
                            <div id="button-bg7"></div>
                            <div id="button-bg8"></div>
                            <div id="button-bg9"></div>
                            <div id="button-bg10"></div>
                            <div id="button-bg11"></div>
                            <div id="button-bg12"></div>
                            <div id="button-bg13"></div>
                        </li>
                    </ul>
                </li>
                <li class="hidden-xs">
                    <a class="toggle-left" href="#">
                        <span style="font-size:20px;" class="entypo-list-add"></span>
                    </a>
                </li>

            </ul>

        </div>
    </div>
</nav>

            <!-- /END OF TOP NAVBAR -->

<div id="skin-select">
    <div id="logo">
        <h1><p class = "heading">生活园区管理</p><span>v0.1</span></h1>
    </div>

    <a id="toggle">
        <span class="entypo-menu"></span>
    </a>
    <div class="dark">
        <form action="#">
                <span>
                    <input type="text" name="search" value="" class="search rounded id_search" placeholder="Search Menu..." autofocus="">
                </span>
        </form>
    </div>



    <div class="skin-part">
        <div id="tree-wrap" style="visibility: visible;">
            <div class="side-bar">
                <ul class="topnav menu-left-nest" style="margin:10px;">
                    <li style="text-align: left;">
                        <a href="#" style="border-left:0px solid!important;" class="title-menu-left">
                            <span style="font-family:'Microsoft YaHei UI Light';font-size: 12px">学生</span>
                            <i data-toggle="tooltip" class="entypo-cog pull-right config-wrap"></i>
                        </a>
                    </li>

                    <li style="text-align: left;">
                        <a class="tooltip-tip ajax-load" href="#" title="Student">
                            <i class="icon-document-edit"></i>
                            <span style="display: inline-block; float: none;font-family:'Microsoft YaHei UI Light';font-size: 16px">
                                学生管理</span>
                        </a>
                        <ul>
                            <li style="text-align: left;">
                                <a class="tooltip-tip2 ajax-load tooltipster-disable" href="/pages/back/room/RoomServlet/listRooms">
                                    <i class="icon-plus"></i>
                                    <span style="display: inline-block; float: none;font-family:'Microsoft YaHei UI Light';font-size: 12px">学生录入</span></a>
                            </li>
                            <li style="text-align: left;">
                                <a class="tooltip-tip2 ajax-load tooltipster-disable" href="/pages/back/member/search_member.jsp">
                                    <i class="icon-search"></i>
                                    <span style="display: inline-block; float: none;font-family:'Microsoft YaHei UI Light';font-size: 12px">搜索学生</span></a>
                            </li>
                            <li style="text-align: left;">
                                <a class="tooltip-tip2 ajax-load tooltipster-disable" href="/pages/back/member/MemberServlet/list">
                                    <i class="icon-cross"></i>
                                    <span style="display: inline-block; float: none;font-family:'Microsoft YaHei UI Light';font-size: 12px">批量删除学生</span></a>
                            </li>
                        </ul>
                    </li>


                    <li>
                        <a class="tooltip-tip ajax-load" href="/pages/back/member/MemberServlet/listRank" title="Media">
                            <i class="icon-star"></i>
                            <span style="font-family:'Microsoft YaHei UI Light';font-size: 16px">学生评分</span>

                        </a>
                    </li>

                    <li style="text-align: left;">
                        <a class="tooltip-tip ajax-load" href="#" title="Student">
                            <i class="icon-home"></i>
                            <span style="display: inline-block; float: none;font-family:'Microsoft YaHei UI Light';font-size: 16px">
                                寝室管理</span>
                        </a>
                        <ul>
                            <li style="text-align: left;">
                                <a class="tooltip-tip2 ajax-load tooltipster-disable" href="/pages/back/room/RoomServlet/list">
                                    <i class="icon-align-justify"></i>
                                    <span style="display: inline-block; float: none;font-family:'Microsoft YaHei UI Light';font-size: 12px">查看寝室人员</span></a>
                            </li>
                            <li style="text-align: left;">
                                <a class="tooltip-tip2 ajax-load tooltipster-disable" href="/pages/back/room/RoomServlet/listRank">
                                    <i class="icon-star"></i>
                                    <span style="display: inline-block; float: none;font-family:'Microsoft YaHei UI Light';font-size: 12px">寝室评分</span></a>
                            </li>
                            <li style="text-align: left;">
                                <a class="tooltip-tip2 ajax-load tooltipster-disable" href="/pages/back/room/RoomServlet/listAll">
                                    <i class="icon-align-center"></i>
                                    <span style="display: inline-block; float: none;font-family:'Microsoft YaHei UI Light';font-size: 12px">所有寝室评分</span></a>
                            </li>
                        </ul>
                    </li>

                </ul>

                <ul class="topnav menu-left-nest">
                    <li>
                        <a href="#" style="border-left:0px solid!important;" class="title-menu-left">

                            <span style="font-family:'Microsoft YaHei UI Light';font-size: 12px">服务</span>
                            <i data-toggle="tooltip" class="entypo-cog pull-right config-wrap"></i>

                        </a>
                    </li>

                    <li style="text-align: left;">
                        <a class="tooltip-tip ajax-load" href="#" title="Student">
                            <i class="icon-help"></i>
                            <span style="display: inline-block; float: none;font-family:'Microsoft YaHei UI Light';font-size: 16px">
                                服务类别</span>
                        </a>

                        <ul>
                            <li style="text-align: left;">
                                <a class="tooltip-tip2 ajax-load tooltipster-disable" href="/pages/back/item/item_insert.jsp">
                                    <i class="icon-plus"></i>
                                    <span style="display: inline-block; float: none;font-family:'Microsoft YaHei UI Light';font-size: 12px">添加类别</span></a>
                            </li>
                            <li style="text-align: left;">
                                <a class="tooltip-tip2 ajax-load tooltipster-disable" href="/pages/back/item/ItemServlet/list">
                                    <i class="icon-align-justify"></i>
                                    <span style="display: inline-block; float: none;font-family:'Microsoft YaHei UI Light';font-size: 12px">类别列表</span></a>
                            </li>
                        </ul>
                    </li>


                    <li style="text-align: left;">
                        <a class="tooltip-tip ajax-load" href="#" title="Student">
                            <i class="icon-document"></i>
                            <span style="display: inline-block; float: none;font-family:'Microsoft YaHei UI Light';font-size: 16px">
                                服务管理</span>
                        </a>

                        <ul>
                            <li style="text-align: left;">
                                <a class="tooltip-tip2 ajax-load tooltipster-disable" href="/pages/back/services/ServicesServlet/insertPro">
                                    <i class="icon-plus"></i>
                                    <span style="display: inline-block; float: none;font-family:'Microsoft YaHei UI Light';font-size: 12px">添加服务</span></a>
                            </li>
                            <li style="text-align: left;">
                                <a class="tooltip-tip2 ajax-load tooltipster-disable" href="/pages/back/services/ServicesServlet/listSplit">
                                    <i class="icon-align-justify"></i>
                                    <span style="display: inline-block; float: none;font-family:'Microsoft YaHei UI Light';font-size: 12px">服务列表</span></a>
                            </li>
                        </ul>
                    </li>

                    <li style="text-align: left;">
                        <a class="tooltip-tip ajax-load" href="#" title="Student">
                            <i class="icon-checkmark"></i>
                            <span style="display: inline-block; float: none;font-family:'Microsoft YaHei UI Light';font-size: 16px">
                                服务登记</span>
                        </a>

                        <ul>
                            <li style="text-align: left;">
                                <a class="tooltip-tip2 ajax-load tooltipster-disable" href="/pages/back/getserv/GetservServlet/insertPro">
                                    <i class="icon-plus"></i>
                                    <span style="display: inline-block; float: none;font-family:'Microsoft YaHei UI Light';font-size: 12px">服务情况登记</span></a>
                            </li>
                            <li style="text-align: left;">
                                <a class="tooltip-tip2 ajax-load tooltipster-disable" href="/pages/back/getserv/GetservServlet/listSplit">
                                    <i class="icon-align-justify"></i>
                                    <span style="display: inline-block; float: none;font-family:'Microsoft YaHei UI Light';font-size: 12px">服务列表</span></a>
                            </li>
                        </ul>
                    </li>

                </ul>


                <ul id="menu-showhide" class="topnav menu-left-nest">
                    <li>
                        <a href="#" style="border-left:0px solid!important;" class="title-menu-left">

                            <span style="font-family:'Microsoft YaHei UI Light';font-size: 12px">管理员</span>
                            <i data-toggle="tooltip" class="entypo-cog pull-right config-wrap"></i>

                        </a>
                    </li>

                    <li>
                        <a class="tooltip-tip ajax-load" href="/pages/back/admin/admin_insert.jsp">
                            <i class="icon-plus"></i>
                            <span style="font-family:'Microsoft YaHei UI Light';font-size: 16px">增加管理员</span>

                        </a>
                    </li>

                </ul>




            </div>
        </div>
    </div>
</div>
<!-- END OF SIDE MENU -->



