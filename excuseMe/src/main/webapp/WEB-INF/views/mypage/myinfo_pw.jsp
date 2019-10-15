<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 개인정보수정</title>


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

	<%-- <div id="subm">

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
			href="<%=request.getContextPath()%>/mypage/myreply" class="atag"
			style="color: white; text-decoration: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;내가
			쓴 댓글</a><br> <br> <a
			href="<%=request.getContextPath()%>/mypage/myinfo" class="atag"
			style="color: white; text-decoration: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;개인정보수정</a><br>


	</div> --%>
	<div id="sidebar" style="margin-top:120px;margin-left:120px;float:left;z-index:100;position:relative;background: #25a1c3;width: 250px;height: 1000px;text-align: center;display: inline-block;vertical-align: middle;height: 100%; left: -3px;">
			
			<div style="height:50px;background:#306170;">
				<p style=" padding-top:6px;font-size:1.3em; color:white; font-weight:bold;">마이 페이지</p>
			</div>
			<div class="subButton" onclick="myPage('myjoinlist');" style="cursor:pointer;height:50px;margin-top: 20px;width:230px;margin-left:10px; border-bottom:1px solid #cce3de;">
				<p style="padding-top:10px;color: white; font-size:1.1em; text-align:left; padding-left:20px;">가입한 동호회</p>
			</div>
			<div class="subButton" onclick="myPage('myclub');" style="cursor:pointer;height:50px;margin-top: 20px;width:230px;margin-left:10px; border-bottom:1px solid #cce3de;">
				<p style="padding-top:10px;color: white; font-size:1.1em; text-align:left; padding-left:20px;">생성한 동호회</p>
			</div>
			<div class="subButton"  onclick="myPage('wishlist');" style="cursor:pointer;height:50px;margin-top: 20px;width:230px;margin-left:10px; border-bottom:1px solid #cce3de;">
				<p style="padding-top:10px;color: white; font-size:1.1em; text-align:left; padding-left:20px;">관심 동호회</p>
			</div>
			<div class="subButton" onclick="myPage('myreply');" style="cursor:pointer;height:50px;margin-top: 20px;width:230px;margin-left:10px; border-bottom:1px solid #cce3de;">
				<p style="padding-top:10px;color: white; font-size:1.1em; text-align:left; padding-left:20px;">내가 쓴 댓글</p>
			</div>
			<div class="subButton" onclick="myPage('myinfo');" style="cursor:pointer;height:50px;margin-top: 20px;width:230px;margin-left:10px; border-bottom:1px solid #cce3de;">
				<p style="padding-top:10px;color: white; font-size:1.1em; text-align:left; padding-left:20px;" >개인정보수정</p>
			</div>
			
		</div>
	

	<div id="all_div">
		<div id="section_div" style="postion: relative; left: 5px; top: 18px;">
	
			<!-- Main -->
			<section id="main" class="wrapper" > <!-- Menu --> <!-- Elements -->
			<div class="row">
				<h2 id="elements">마이페이지 - 개인정보수정</h2>
				<!-- <div class="nav nav-pills ml-auto p-2">
							<span class="button small" onclick="#">글 쓰기</span>
						</div> -->
			</div>
			<div class="card" style="position: absolute; width: 1000px; height: 400px; left: 400px;">
				<form method="POST" action="myinfo" onsubmit="return check()">
					<div class="card" style="position: relative; top: 60px; left: 194px; width: 600px; height: 280px;">
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


		



	
	<script>
		
		
		<%--회원가입 버튼 활성화 --%>
		function check() {
			
			if("${loginUser.getMem_pwd()}" == $("#mem_pwd").val())
				return true;
			alert("비밀번호가 맞지않습니다.");
			return false;
		}
			
		
		function myPage(url) {
			self.location.href="<%=request.getContextPath()%>/mypage/"+url;
		}
		
		$('.subButton').click(function(){
		      $('.subButton').css("background","");
		      $(this).css("background","linear-gradient(to bottom, rgba(0,0,0,0) 0%,rgba(0,0,0,0) 55%,rgba(0,0,0,0) 61%,rgba(0,0,0,0.16) 100%)");
		   });
			
		
	</script>
</body>