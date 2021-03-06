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

<style>
#search{
		padding:0;
}
.login-box{
		   margin:0px;
}
#topid{
		font-size:1em;
		font-weight:bold;
}
#midid{
		font-size:1em;
		text-align:center;
}
#botid{
		font-size:1em;
		text-align:right;
		margin:0;
		font-weight:bold;
}
.card-header p{
		margin:0;
		font-size:1.2em;
		text-align:center;
		font-weight:bold;
}
</style>
</head>
<body class="hold-transition login-page" id="search">
<div class="login-box">
  <!-- /.login-logo -->
  <div class="card">
  	<div class="card-header">
  		<p>비밀번호 찾기</p>
  	</div>
    <div class="card-body login-card-body">
      <form action="#" method="post">
        <div class="input-group mb-3">
          <div class="input-group-prepend">
            <span class="input-group-text">
              <ion-icon name="contacts"></ion-icon>
            </span>
          </div>
          <input type="email" class="form-control" placeholder="이름">
        </div>
        <div class="input-group mb-3">
          <div class="input-group-prepend">
            <span class="input-group-text">
              <ion-icon name="mail"></ion-icon>
            </span>
          </div>
          <input type="email" class="form-control" placeholder="아이디">
        </div>
               
       
        <div class="social-auth-links text-center">
        <a href="#" class="button small">확&nbsp&nbsp&nbsp인</a>
      </div>
      </form>

         <!-- /.social-auth-links -->
    </div>
    <!-- /.login-card-body -->
  </div>
</div>
<%@include file="/WEB-INF/views/include/searchIdPwd_footer.jsp" %>
</body>
</html>
