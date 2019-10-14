
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>마이페이지 </title>
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">

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
	#header{
			height:100px;
	}
	#hleft{
			height:100px;
			width:350px;

	}
	#hmenu{
			height:40px;
			width:600px;
			float:right;
			margin-top:-40px;
			text-align:center;
			top: 200px;
	}
	#hid{
			height:40px;
			width:500px;

			float:right;
			margin-top:-100px;
	}
	.hmenu1{
			height:40px;
			width:150px;
			float:right;
			position:absoulte;
			border-left: 1mm solid rgb(179, 223, 242);
			text-align:center;
			cursor:pointer;
	}
	#hid1{
	  	  height:40px;
		  width:400px;
		  position:relative;

		  float:right;
	}
	#hid2{
	  	  height:40px;
		  width:100px;
		  position:relative;
		  font-size:1em;
		  float:right;
	}
	#hid2 a{
			text-decoration:none;
	}
	@media screen and (max-width:750px){
		#hid1 p{
			color:white;
			z-index:-1;
		}
	}
	@media screen and (max-width:980px){
		.hmenu1{
				
				text-align:center;
				line-height: 44px;
		}
	}
	@media screen and (max-width:1920px){
		.hmenu1{
				
				text-align:center;
				line-height: 44px;
		}
		#hid{
				
				text-align:center;
				line-height: 44px;
		}
	}
	
			#subm {
				top: 220px;
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
				position: relative;
				left:  280px;
				width: 1200px;
				top: 100px;
			}
			
			
			#footer_div {
				position: relative;
				
			}
			#all_div {
				position: relative;
				width: 100%;
			}
			
			#btag {
				position: relative;
				left: 0px;
			}
			
			h3{
				margin: 0;
			}
			
			.register-box {
				width: 950px;
				margin-top: -80px;
			}
			
			.register-logo img {
				width: 150px;
				height: auto;
			}
			
			#registForm div {
				margin-left: 5px;
			}
			
			#registForm div div {
				padding: 0;
			}
			
			#checkbutton {
				margin: 0;
				padding: 0;
				position: relative;
				left: 20px;
				top: 35px;
			}
			
			.card-footer div {
				margin-left: 100px;
			}
			
			.card-footer div div {
				padding: 0;
			}
			
			#nullform {
				width: 10px;
			}
			
			#jungbok {
				margin-top: 5px;
			}
			
			#mem_id_check_label, #mem_name_check_label, #mem_phone_check_label {
				font-size: 0.8em;
			}
			
			#mem_id_test, #mem_pwd_test, #mem_pwd_check_test, #mem_name_test,
				#mem_nick_test, #mem_phone_test,#mem_birthDate_test {
				margin-left: 10px;
				font-size: 0.8em;
				color: red;
			}
			#soso {
				position: absolute;
				top: 500px;
				background: red;
				width: 50px;
				height: 100px;
			}

</style>
</head>
<body>
	<header id="header">
	            <div id="hleft">
	            	<a href="<%=request.getContextPath() %>/main/test" class="logo left">Excuse Me</a>
	            </div>
	            
	            
	            <div id="hmenu">
	            	<!-- <ul class="nav nav-tabs" -->
	            	<%-- <c:if test="mem_nick == 'admin'"> --%>
	            	<div class="hmenu1" onclick="location.href='#'">
	            		ㅁa관리페이지
	            	</div>
	            	<%-- </c:if> --%>
	            	<c:if test="mem_nick!='admin'">
	            	<div class="hmenu1" onclick="location.href='#'">
	            		나마이페이지
	            	</div>
	            	</c:if>
	            	<div class="hmenu1" onclick="location.href='#'">
	            		동호회 찾기
	            	</div>
	            	<div class="hmenu1" onclick="location.href='#'">
	            		동호회 생성
	            	</div>
	            	<div class="hmenu1" onclick="location.href='#'">
	            		공지사항
	            	</div>
	            </div>
				<div id="hid">
					<div id="hid2">
				        <a href="#">[ 로그아웃 ]</a>
				    </div>
					<div id="hid1">
						<p>${loginUser.mem_nick} 님 환영합니다</p>
					</div>
				    
				</div>
				<div id="soso">
				</div>
				
	</header>
	
