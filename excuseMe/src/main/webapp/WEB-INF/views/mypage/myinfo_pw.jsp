<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 개인정보수정</title>



<!-- Font Awesome -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/adminLTE/plugins/fontawesome-free/css/all.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/templated/assets/css/font-awesome.min.css">

<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">

<!-- icheck bootstrap -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/adminLTE/plugins/icheck-bootstrap/icheck-bootstrap.min.css">

<!-- Theme style -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/adminLTE/dist/css/adminlte.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/templated/assets/css/main.css">

<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">

<style>
#subm {
	top: 170px;
	position: absolute;
	height: 500px;
	width: 240px;
	z-index: 5;
	background: #25A2C3;
	left: 4px;
	margin: 0px;
	padding: 0px;
	border-radius: 0px 10px 10px 0px;
}

.atag {
	font-size: 18px;
}

#section_div {
	position: absolute;
	left: 280px;
	width: 1200px;
}


</style>
</head>

<body class="subpage">

	<div id="subm">

		<br> <br> <br> <a
			href="<%=request.getContextPath()%>/mypage/myjoinlist" class="atag"
			style="color: white; text-decoration: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;가입한
			동호회</a><br> <br> <a
			href="<%=request.getContextPath()%>/mypage/myclub" class="atag"
			style="color: white; text-decoration: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;생성한
			동호회</a><br> <br> <a
			href="<%=request.getContextPath()%>/mypage/wishlist" class="atag"
			style="color: white; text-decoration: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;관심
			동호회</a><br> <br> <a
			href="<%=request.getContextPath()%>/mypage/" class="atag"
			style="color: white; text-decoration: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;내가
			쓴 댓글</a><br> <br> <a
			href="<%=request.getContextPath()%>/mypage/myinfo" class="atag"
			style="color: white; text-decoration: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;개인정보수정</a><br>


	</div>
	<div id="all_div">


		<div id="section_div">
			<!-- Main -->
			<section id="main" class="wrapper"> <!-- Menu --> <!-- Elements -->
			<div class="row">
				<h2 id="elements">마이페이지 - 개인정보수정</h2>
				<!-- <div class="nav nav-pills ml-auto p-2">
							<span class="button small" onclick="#">글 쓰기</span>
						</div> -->
			</div>
			<div class="card" style="position: relative; width: 1200px; height: 400px;">
				<form method="POST" action="myinfo" onsubmit="return check()">
					<div class="card" style="position: relative; top: 60px; left: 290px; width: 600px; height: 280px;">
						<div style="position: relative; left: 90px; top: 25px;">
							<b>본인 확인을 위해 비밀번호를 입력해주세요.</b>
						</div>
						<div class="row uniform">
							<div class="9u 12u$(xsmall)" style="position: relative; top: 55px; left: 75px;">
								<input type="password"  id="mem_pwd" 
									placeholder="비밀번호" maxlength="30" />
							</div>
						</div>
						<div style="position: relative; top: 100px; left: 240px;">
							<input type="submit" id="submit" class="button small" value="확&nbsp;&nbsp;&nbsp;&nbsp;인" />
						</div>		
					</div>
					
						
				</form>
			
				
				
			</div>



			</section>



		</div>

		<br> <br> <br>


		



		<!-- jQuery -->
		<script
			src="<%=request.getContextPath()%>/resources/adminLTE/plugins/jquery/jquery.min.js"></script>
		<!-- Bootstrap 4 -->
		<script
			src="<%=request.getContextPath()%>/resources/adminLTE/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
		<script
			src="<%=request.getContextPath()%>/resources/templated/assets/js/jquery.min.js"></script>
		<script
			src="<%=request.getContextPath()%>/resources/templated/assets/js/jquery.scrolly.min.js"></script>
		<script
			src="<%=request.getContextPath()%>/resources/templated/assets/js/skel.min.js"></script>
		<script
			src="<%=request.getContextPath()%>/resources/templated/assets/js/util.js"></script>
		<script src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons.js"></script>
		<script
			src="<%=request.getContextPath()%>/resources/templated/assets/js/main.js"></script>
		<script>
			/* $("#sidemenu").add("style='padding: 0px;'"); */
		</script>
	<script>
		
		
		<%--회원가입 버튼 활성화 --%>
		function check() {
			
			if("${loginUser.getMem_pwd()}" == $("#mem_pwd").val())
				return true;
			alert("비밀번호가 맞지않습니다.");
			return false;
		}
			
			
			
		
	</script>
</body>