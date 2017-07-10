<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
  <head>
      <%
          String path = request.getContextPath();
          String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
      %>
    <title>生活园区管理系统</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,inital-scale=1">
      <!-- Le styles -->
      <script type="text/javascript" src="assets/js/jquery.min.js"></script>

      <!--  <link rel="stylesheet" href="assets/css/style.css"> -->
      <link rel="stylesheet" href="assets/css/loader-style.css">
      <link rel="stylesheet" href="assets/css/bootstrap.css">
      <link rel="stylesheet" href="assets/css/signin.css">
      <base href="<%=basePath%>">
      <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
      <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
      <link href="bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet">
      <script type="text/javascript" src="js/jquery-3.2.1.js"></script>
      <script type="text/javascript" src="js/jquery.validate.js"></script>
      <script type="text/javascript" src="js/additional-methods.js"></script>
      <script type="text/javascript" src="js/messages_zh.js"></script>
      <script type="text/javascript" src="js/login.js"></script>
  </head>
  <body>


  <style type="text/css">
      body{
          background-image: url(assets/img/bcg.png);
          background-size:cover;
      }
  </style>

  <div id="preloader">
      <div id="status">&nbsp;</div>
  </div>

  <div class="container">

      <div class="" id="login-wrapper">
          <div class="row">
              <div class="col-md-4 col-md-offset-4">
                  <div id="logo-login">
                      <h1>生活园区管理系统
                          <span>v0.1</span>
                      </h1>
                  </div>
              </div>
          </div>

          <div class="row">
              <div class="col-md-4 col-md-offset-4">
                  <div class="account-box">
                  <form id="loginForm" action="<%=basePath%>/pages/back/AdminServlet/login" method="post" >
                      <div class="form-group">
                          <label for="aid">用户名：</label>
                          <input type="text" id="aid" name="aid" value ="admin" class="form-control" placeholder="请输入登录名">
                      </div>
                      <div class="form-group">
                          <label for="password">密码：</label>
                          <input type="text" id="password" name="password" value ="hello" class="form-control" placeholder="请输入密码">
                      </div>
                      <div class="checkbox pull-left">
                          <label>
                              <input type="checkbox">记住用户名</label>
                      </div>
                      <button class="btn btn btn-primary pull-right" type="submit">
                          登 录
                      </button>
                  </form>
                      <a class="forgotLnk" href="index.html"></a>
                      <div class="row-block">
                          <div class="row">
                          </div>
                      </div>
                  </div>
              </div>
          </div>
      </div>
  </div>

  </body>
</html>
