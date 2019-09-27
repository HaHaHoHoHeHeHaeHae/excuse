<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 3 | Log in</title>
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="/WEB-INF/views/include/login_header.jsp" %>
<style>
.login-box{
		   margin-top:-20px;
}
#newclub{
		 position:absolute;
		 width:auto;
		 height:100px;
		 text-align:center;
		 left:38.5%;
		 margin-top:-100px;
		 margin-left:-10px;
}
#newclub h1{
			font-family: 'Gamja Flower', cursive;
			font-size:2.7em;
}
</style>
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <img src="<%=request.getContextPath()%>/resources/img/logo.png">
  </div>

  <!-- /.login-logo -->
  <div class="card">
    <div class="card-body login-card-body">

      <form action="loginPost" method="post">
        <div class="input-group mb-3">
          <input type="email" class="form-control" placeholder="Email" name="mem_id">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" class="form-control" placeholder="Password" name="mem_pwd">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="social-auth-links text-center">
        <input type="submit" class="button small" placeholder="로그인">

        
        <span class="button small" onclick="location.href='/'">
          	회원가입
        </span>
      </div>
      </form>

      
      <!-- /.social-auth-links -->
      
      <p class="mb-1">
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a href="#">아이디/비밀번호를 잊으셨습니까?</a>
      </p>
    </div>
    <!-- /.login-card-body -->
  </div>
</div>
<div id = "newclub">
	<h1>새로운 동호회를 찾아보세요.</h1>
</div>
<%@include file="/WEB-INF/views/include/login_footer.jsp" %>
</body>
</html>
