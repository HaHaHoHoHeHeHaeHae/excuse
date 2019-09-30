<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 가입한 동호회</title>

<c:set var="clubList" value="${dataMap.clubList }" />
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<%-- <c:set var="noticeList" value="${dataMap.noticeList }" />
<c:set var="pageMaker" value="${dataMap.pageMaker }" /> --%>

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
				left:  280px;
				width: 1200px;
			}
			
			
		</style>
</head>

<body class="subpage">

	<div id="subm">
		
		<br><br><br><a href="#" class="atag" style="color: white; text-decoration: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;가입한 동호회</a><br><br>
		<a href="#" class="atag" style="color: white; text-decoration: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;생성한 동호회</a><br><br>
		<a href="#" class="atag" style="color: white; text-decoration: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;관심 동호회</a><br><br>
		<a href="#" class="atag" style="color: white; text-decoration: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;내가 쓴 댓글</a><br><br>
		<a href="#" class="atag" style="color: white; text-decoration: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;개인정보수정</a><br>
		
	
	</div>
	
	<div id="section_div">
		<!-- Main -->
		<section id="main" class="wrapper" >
		
			
				
		
			<!-- Menu -->
			
				<!-- Elements -->
				<div class="row">
					<h2 id="elements">마이페이지 - 가입한 동호회</h2>
					<!-- <div class="nav nav-pills ml-auto p-2">
						<span class="button small" onclick="#">글 쓰기</span>
					</div> -->
				</div>
				<div class="row 200%">
					<div class="12u">
						<!-- Table -->
	
						<c:forEach var="club" items="${clubList }">
					<c:if test="${empty clubList }">
						<b><strong>해당되는 동호회가 없어오. 다시 검색해주새오 </strong></b>
					</c:if>
					<c:if test="${!empty clubList }">
						<div class="clublist_body"
							 style="width: 20%; float: left; border: 1px dashed #bcbcbc; margin-left:3px; margin-right:3px;width:219px;">
							<div class="card-body box-profile">
								<div class="text-center">
									<img class="profile-user-img img-fluid img-circle"
										src="<%=request.getContextPath()%>/resources/img/logo.png"
										alt="User profile picture">
								</div>
								<h3 class="profile-username text-center">${club.club_name }</h3>
								
								<ul class="list-group list-group-unbordered mb-3">
									<li class="list-group-item text-center" style="height: 40px;"><b>인원수&nbsp&nbsp&nbsp&nbsp</b><b>${club.joincnt }</b></li>
									<li class="list-group-item text-center" style="height: 40px;"><b>좋아요&nbsp&nbsp&nbsp&nbsp</b><b>${club.upcnt }</b></li>
									<li class="list-group-item text-center" style="height: 40px;"><b>싫어요&nbsp&nbsp&nbsp&nbsp</b><b>${club.downcnt }</b></li>
								</ul>
								<ul class="actions vertical small" style="text-align: center;">
									<li><a href="#" class="button small" style="color: white;">Follow</a></li>
								</ul>
							</div>
						</div>
					</c:if>
				</c:forEach>
				
				
			</section>
		<section class="content">	
			<!-- pagination Start-->
		<div class="card-footer clearfix">
			<div class="pagination justify-content-center m-0">
				<ul class="pagination ">
					<li class="page-item"><a class="page-link"
						href="joinclub${pageMaker.makeQuery(1)}" style="text-decoration: none">&lt;&lt;</a>
					<li class="page-item"><a class="page-link"
						href="joinclub<c:if test="${pageMaker.prev }">${pageMaker.makeQuery(pageMaker.startPage-1) }</c:if>"
						style="text-decoration: none">&lt;</a></li>
					<c:forEach begin="${pageMaker.startPage }"
						end="${pageMaker.endPage }" var="pageNum">
						<li
							class="page-item <c:out value="${pageMaker.cri.page == pageNum ?'active':''}"/>">
							<a class="page-link" href="joinclub${pageMaker.makeQuery(pageNum) }"
							style="text-decoration: none">${pageNum } </a>
						</li>
					</c:forEach>

					<li class="page-item"><a class="page-link"
						href="joinclub
									<c:if test="${pageMaker.next }">
										${pageMaker.makeQuery(pageMaker.endPage+1) }
									</c:if>
									<c:if test="${!pageMaker.next }">
										${pageMaker.makeQuery(pageMaker.cri.page) }
									</c:if>
								"
						style="text-decoration: none">&gt;</a></li>

					<li class="page-item"><a class="page-link"
						href="joinclub${pageMaker.makeQuery(pageMaker.realEndPage) }"
						style="text-decoration: none"> &gt;&gt; </a></li>
				</ul>
			</div>
		</div>
		</div>

		<br> <br> <br>
		<!-- clubList End -->
		</section>
	
		
	
	
	
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
</body>
</html>