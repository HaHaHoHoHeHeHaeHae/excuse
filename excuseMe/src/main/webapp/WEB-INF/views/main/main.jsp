<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<link href="https://fonts.googleapis.com/css?family=Gamja+Flower&display=swap" rel="stylesheet">
<!-- jQuery -->
<script
	src="<%=request.getContextPath()%>/resources/adminLTE/plugins/jquery/jquery.min.js"></script>


</head>
<body>
	<!-- Menu -->
<c:set var="noticeList" value="${noticeList.noticeList }"/>	
<c:set var="recommendClubList" value="${recommendClubList.recommendClubList }"/>	
<c:set var="recentClubList" value="${recentClubList.recentClubList }"/>	
	<!-- Main -->
	<section id="main" class="wrapper" style="height:1050px;">
		<div class="inner">


			<!-- Elements -->
		
				<div class ="row"id="createClub" onclick="location.href=''" style="margin:0; width:100%;height:300px;">
					<div style="width:50%;height:300px;padding:0;">
					 	<img src="<%=request.getContextPath()%>/resources/img/createClub.jpg">
					</div>
					<div style="width:50%;height:300px;padding:0;margin-left:-1px;">
						<img src="<%=request.getContextPath()%>/resources/img/searchClub.jpg">
					</div>
					
				</div>
				<div class="row" style="margin-top:10px;width:100%;">
					<div id="notice" style="width:50%; height:400px;margin-left:10px;margin-top:10px;">
						<div class="row">
							<h3>공지 사항</h3><div style="width:340px;"></div><h5 style="cursor:pointer;margin-top:10px;color:gray;" onclick="self.location='<%=request.getContextPath()%>/notice/list'">더보기</h5>
						</div>
						
						<table style="margin-top:-10px;">
							<tbody>
								<c:if test="${empty noticeList }">
									<tr><td>게시글이 없습니다.</td></tr>
								</c:if>
								<c:if test="${!empty noticeList }">
									<c:forEach var="notice" items="${noticeList}">
										<tr>
											<td style="cursor:pointer;text-overflow: ellipsis; overflow: hidden;display: block;width:250px;" onclick="self.location='<%=request.getContextPath()%>/notice/detail?not_no=${notice.not_no }&page=1'">${notice.not_title }</td>
											<td><fmt:formatDate value="${notice.not_regDate }" pattern="yyyy-MM-dd"/></td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>
					<div id="recommend" style="width:48%; height:400px;">
				
					</div>
				</div>
				<div id="recent" style="width:100%;height:300px;">
					<div class="row">
							<h3>신규&nbsp동호회</h3>
					</div>
					<ul style="width:100%;list-style:none; padding:0; margin:0;">
						<c:forEach var="recentClub" items="${recentClubList}">
							<li style="width:27%;font-weight:bold;border-left:1.5px solid gray; float:left; padding:0;font-size:1em;margin-top:10px;margin-left:10px;cursor:pointer;text-overflow: ellipsis; overflow: hidden;display: block;" onclick="OpenWindow()">
								&nbsp&nbsp&nbsp
								${recentClub.club_name}
							</li>
							<li style="width:21%;float:left; padding:0;font-size:1em;margin-top:10px;margin-left:10px;">
								<fmt:formatDate value="${recentClub.club_regDate }" pattern="yyyy-MM-dd"/>
							</li>
						</c:forEach>
					</ul>
				</div>
		</div>
	</section>
	<footer id="footer" style="position:relative;margin-top:80px;">
	<div class="inner">
		<h2>Get In Touch</h2>
		<ul class="actions">
			<li><span class="icon fa-phone"></span> <a href="#">(000)
					000-0000</a></li>
			<li><span class="icon fa-envelope"></span> <a href="#">information@untitled.tld</a></li>
			<li><span class="icon fa-map-marker"></span> 123 Somewhere Road, Nashville, TN 00000</li>
		</ul>
	</div>
	<div class="copyright">
		&copy; Untitled. Design <a href="https://templated.co">TEMPLATED</a>.
		Images <a href="https://unsplash.com">Unsplash</a>.
	</div>
</footer>
	<!-- AdminLTE App -->
	<script
		src="<%=request.getContextPath()%>/resources/adminLTE/dist/js/adminlte.min.js"></script>
	

		<!-- Bootstrap 4 -->
	<script
		src="<%=request.getContextPath()%>/resources/adminLTE/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
   	
	<script src="<%=request.getContextPath()%>/resources/templated/assets/js/jquery.scrolly.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/templated/assets/js/skel.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/templated/assets/js/util.js"></script>
	<script src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons.js"></script>
	<script src="<%=request.getContextPath()%>/resources/templated/assets/js/main.js"></script>
	 
	<!-- date-range-picker -->
	<script src="<%=request.getContextPath()%>/resources/adminLTE/plugins/daterangepicker/daterangepicker.js"></script>
</body>
</html>