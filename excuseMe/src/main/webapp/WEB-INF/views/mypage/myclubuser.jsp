<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="joinclubList" value="${dataMap.joinclubList }" /> 
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.cri }" />
<c:set var="club" value="${dataMap.club }" />


<html>
<head>
<meta charset="utf-8">
<title>회원관리</title>
	<!-- Font Awesome -->
	<link rel="stylesheet"
		href="<%=request.getContextPath()%>/resources/adminLTE/plugins/fontawesome-free/css/all.min.css">
	
	<!-- Ionicons -->
	<link rel="stylesheet"
		href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
	
	<!-- icheck bootstrap -->
	<link rel="stylesheet"
		href="<%=request.getContextPath()%>/resources/adminLTE/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
	
	<!-- Theme style -->
	<link rel="stylesheet"
		href="<%=request.getContextPath()%>/resources/adminLTE/dist/css/adminlte.min.css">
	
	<!-- Google Font: Source Sans Pro -->
	<link
		href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
		rel="stylesheet">
		
	<!-- jQuery -->
	<script
		src="<%=request.getContextPath()%>/resources/adminLTE/plugins/jquery/jquery.min.js"></script>
	
	<!-- Bootstrap 4 -->
	<script
		src="<%=request.getContextPath()%>/resources/adminLTE/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	
	<script
		src="<%=request.getContextPath()%>/resources/adminLTE/plugins/bootstrap/js/bootstrap.min.js"></script>
	
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
	
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	
	<!-- Time Line -->
	<link rel="stylesheet"
		href="<%=request.getContextPath()%>/resources/adminLTE/build/scss/_timeline.scss">
	
	<link rel="stylesheet"
		href="<%=request.getContextPath()%>/resources/templated/assets/css/main.css" />
	

</head>

<body class="subpage">
	<!-- Main -->
	<section id="main" class="wrapper" style="position: relative; width: 580px; top: -80px; height: 710px;">
		<div class="inner"">
			<!-- Elements -->
			<div  style="position: relative;">
			<h2 id="elements">${joinclubList.get(0).club_name} 의 회원 목록</h2>
								
				
			</div>
			
			<div class="row 200%" style="position: relative;">
				
				<div class="card-body">
					<!-- Table -->
					<div class="table-wrapper">
						<table>
							<tr>
								<th class="text-center" style="width: 200px;">번호</th>
								<th class="text-center" style="width: 200px;">아이디</th>
								<th class="text-center" style="width: 300px;">닉네임</th>
								<th class="text-center" style="width: 250px;">가입일</th>
								
								
							</tr>
							<c:if test="${empty joinclubList }">
								<tr>
									<td colspan="5" class="text-center">
										<strong>동호회에 가입한 회원이 없습니다.</strong>
									</td>
								</tr>
							</c:if>
							<c:if test="${!empty joinclubList }">
								<c:forEach items="${joinclubList }" var="member" varStatus="status">
									<tr>
										<td class="text-center" style="height: 55px; width: 67px;">${(cri.page-1)*10+status.count }</td>
										<td class="text-center">${member.mem_id }</td>
										<td class="text-center" style="cursor:pointer;">${member.mem_nick }</td>
										<td class="text-center"><fmt:formatDate value="${member.club_Date }" pattern="yyyy-MM-dd" /></td>
										
									</tr>
								</c:forEach>
							</c:if>
						</table>
					</div>
					<div class="text-center"  >													
				<ul class="pagination ">
					<li class="page-item">
						<a class="page-link"style="text-decoration:none;" href="myclubuser${pageMaker.makeQuery(1)}&club_no=${club}">&lt;&lt;</a>
					</li>
					<li class="page-item">
						<a class="page-link"style="text-decoration:none;" href="myclubuser
							<c:if test="${pageMaker.prev }">
								${pageMaker.makeQuery(pageMaker.startPage-1) }&club_no=${club}
							</c:if>
							<c:if test="${!pageMaker.prev }">
								?club_no=${club}
							</c:if>
						">&lt;</a>
					</li>
					<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
						<li class="page-item <c:out value="${pageMaker.cri.page == pageNum ?'active':''}"/>">
							<a class="page-link"style="text-decoration:none;" href="myclubuser${pageMaker.makeQuery(pageNum) }&club_no=${club}" >
								${pageNum }
							</a>
						</li>
					</c:forEach>	
	
					<li class="page-item">
						<a class="page-link"style="text-decoration:none;" href="myclubuser
							<c:if test="${pageMaker.next }">
								${pageMaker.makeQuery(pageMaker.endPage+1) }
							</c:if>
							<c:if test="${!pageMaker.next }">
								${pageMaker.makeQuery(pageMaker.cri.page) }
							</c:if>
						&club_no=${club}">&gt;</a>
					</li>			
	
					<li class="page-item">
						<a class="page-link"style="text-decoration:none;" href="myclubuser${pageMaker.makeQuery(pageMaker.realEndPage) }&club_no=${club}">
							&gt;&gt;
						</a>
					</li>					
				</ul>
			</div>
				</div>
			</div>
		</div>
	</section>


	
<!-- AdminLTE App -->
	<script
		src="<%=request.getContextPath()%>/resources/adminLTE/dist/js/adminlte.min.js"></script>




	<!-- templated Scripts -->
	<!-- <script src="<%=request.getContextPath()%>/resources/templated/assets/js/jquery.min.js"></script> -->
	<script
		src="<%=request.getContextPath()%>/resources/templated/assets/js/jquery.scrolly.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/templated/assets/js/skel.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/templated/assets/js/util.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/templated/assets/js/main.js"></script>


</body></html>
