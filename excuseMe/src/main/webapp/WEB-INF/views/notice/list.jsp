<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="noticeList" value="${dataMap.noticeList }" />
<c:set var="pageMaker" value="${dataMap.pageMaker }" />

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
</head>
<body class="subpage">


	<!-- Menu -->
	<nav id="menu"></nav>

	<!-- Main -->
	<section id="main" class="wrapper">
		<div class="inner">


			<!-- Elements -->
			<div class = "row">
				<h2 id="elements">공지사항</h2>
				<div class="nav nav-pills ml-auto p-2">
					<span class="button small" onclick="#">글 쓰기</span>
				</div>
			</div>
			<div class="row 200%">
				<div class="12u">
					<!-- Table -->

					<div class="table-wrapper">
						<table>
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작성일</th>
									<th>조회수</th>
									<th>첨부파일</th>
									<c:if test="${loginUser.mem_nick eq 'admin'}">
										<th>수정</th>
										<th>삭제</th>
									</c:if>
								</tr>
							</thead>

							<tbody>
								
								<c:if test="${empty noticeList}">
									<tr>
										<td></td>
										<td>등록된 게시글이 없습니다.</td>
										<td></td>
										<td></td>
										<td></td>

										<td></td>
										<td></td>
									</tr>
								</c:if>
								<c:if test="${!empty noticeList}">
									<c:forEach var="notice" items="${noticeList }">
										<tr>
											<td>${notice.not_no.substring(1) }</td>
											<td>
												<a href="#" data-name="title" onclick="OpenWindow('detail?not_no=${notice.not_no }','','800','650');">${notice.not_title }</a>
											</td>
											<td><fmt:formatDate value="${notice.not_regDate }" pattern="yyyy-MM-dd"/></td>
											<td>${notice.not_viewCnt }</td>
											<%-- <c:if test="${!empty notice.attach_no}">
												<td>&nbsp</td>
											</c:if>
											<c:if test="${!empty notice.attach_no}">
												<td><ion-icon name="document"></ion-icon></td>
											</c:if> --%>
											<td><ion-icon name="document"></ion-icon></td>
											<c:if test="${loginUser.mem_nick eq 'admin'}">
												<td><ion-icon name="build"  onclick="form?not_no=${notice.not_no }','','800','650');"></ion-icon></td>
												<td><ion-icon name="trash"  onclick="#"></ion-icon></td>
											</c:if>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>

						</table>
					</div>
					<div class="card-footer clearfix">
						<div class="pagination justify-content-center m-0">
							<ul class="pagination ">
								<li class="page-item"><a class="page-link" href="list${pageMaker.makeQuery(1)}" style="text-decoration:none">&lt;&lt;</a>
								<li class="page-item"><a class="page-link" href="list<c:if test="${pageMaker.prev }">${pageMaker.makeQuery(pageMaker.startPage-1) }</c:if>" style="text-decoration:none">&lt;</a>
								</li>
								<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
									<li class="page-item <c:out value="${pageMaker.cri.page == pageNum ?'active':''}"/>"`>
										<a class="page-link" href="list${pageMaker.makeQuery(pageNum) }" style="text-decoration:none">${pageNum } </a>
									</li>
								</c:forEach>

								<li class="page-item"><a class="page-link"
									href="list
									<c:if test="${pageMaker.next }">
										${pageMaker.makeQuery(pageMaker.endPage+1) }
									</c:if>
									<c:if test="${!pageMaker.next }">
										${pageMaker.makeQuery(pageMaker.cri.page) }
									</c:if>
								" style="text-decoration:none">&gt;</a>
								</li>

								<li class="page-item"><a class="page-link"
									href="list${pageMaker.makeQuery(pageMaker.realEndPage) }"style="text-decoration:none">
										&gt;&gt; </a></li>

							</ul>
						</div>
					</div>

				</div>
			</div>

		</div>
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
</body>
</html>