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
.register-box{
	width: 700px;
	margin-top:0px;
}

.register-logo img{
	width:150px;
	height:auto;
}
.card-body{
			padding:0;
}
.card-footer div{
			margin-left:100px;
}
.card-footer div div{
			padding:0;
}
#nullform{
			width:50px;
}
#iii{
			width:600px;
			height:auto;
			margin-left:50px;
			
}
#searchID{
			position:relative;
}
#searchPwd{
			position:relative;
}
#searchID img{
			width:265px;
			height:auto;
			cursor:pointer;					
}
#searchPwd img{
			width:265px;
			height:auto;
			cursor:pointer;					
}
#sss{
			height:100px;
			weight:700px;
			padding-top:30px;
				
}
#sss p{
			text-align:center;
			font-size:1.7em;
}
</style>
</head>
<body class="hold-transition register-page">
	<div class="register-box">
		<div class="register-logo">
			<img src="<%=request.getContextPath()%>/resources/img/logo.png">
		</div>
		<div class="card">

			<!-- /.card-header -->
			<div class="card-body">
				<div id="sss">
					<p>아이디/비밀번호 찾기</p>
				</div>
				<div class="row" id="iii">
					<div id="searchID" onclick="#">
						<img src="<%=request.getContextPath()%>/resources/img/searchID.jpg" onclick="#">
					</div>
					<div id="searchPwd" onclick="#">
						<img src="<%=request.getContextPath()%>/resources/img/searchPwd.jpg" onclick="#">
					</div>
				</div>
			</div>
			<div class="card-footer">
				<div class="row uniform">
					<div id="nullform">
					</div>
					
					<div class="2u$ 12u$(small)">
						<span class="button alt" onclick="#">뒤로가기</span>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- /.register-box -->
	<%@include file="/WEB-INF/views/include/login_footer.jsp" %>
</body>
</html>