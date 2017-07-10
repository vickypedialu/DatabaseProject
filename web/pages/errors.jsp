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
      <style type="text/css">
          body {
              overflow:hidden!important;
              padding-top: 120px;
          }
      </style>
      <script type="text/javascript" src="../assets/js/jquery.min.js"></script>

      <!--  <link rel="stylesheet" href="assets/css/style.css"> -->
      <base href="<%=basePath%>">

      <link rel="stylesheet" href="assets/css/style.css">
      <link rel="stylesheet" href="assets/css/loader-style.css">
      <link rel="stylesheet" href="assets/css/bootstrap.css">
      <link rel="stylesheet" href="assets/css/signin.css">
      <link rel="stylesheet" href="assets/css/extra-pages.css">
      <link rel="shortcut icon" href="assets/ico/minus.png">
  </head>
  <body>




  <div class="logo-error">
      <h1>生活园区管理系统
          <span>v0.1</span>
      </h1>
  </div>

  <!-- Main content -->
  <section class="page-error">
      <div class="error-page">
          <h2 class="headline text-info">404</h2>
          <div class="error-content">
              <h3><i class="fa fa-warning text-yellow"></i> 发生错误！</h3>
              <p class = "para">
                  找不到你访问的界面，你可以选择 <a class="error-link" href='pages/back/index.jsp'>回到主页</a> 或使用搜索栏。
              </p>
              <form class='search-form'>
                  <input type="text" name="search" class='form-control' placeholder="Search">
              </form>
          </div>
          <!-- /.error-content -->
      </div>
      <!-- /.error-page -->

  </section>





  </body>
</html>
