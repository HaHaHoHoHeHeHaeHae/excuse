<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="clubList" value="${dataMap.clubList }" />
<c:set var="pageMaker" value="${dataMap.pageMaker }" />


<head>
<title>Club List</title>

<style>
div.top {
	height: 100px;
}

th {
	text-align: center;
}

.listTitle {
	height: 30px;
	background: pink;
}

table {
	font-size: 10px;
}

ul {
	text-align: center;
}

li {
	display: inline-block;
	list-style: none;
}

.card-footer {
	text-align: center;
}
</style>

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

<body>
	<div class="top"></div>

	<!-- 검색창 -->
	<div class="searchbox">
		동호회명: <input type="text" id="keyword" name="keyword"
			placeholder="검색할 동호회를 입력하세요." value="${keyword }" />
		<button type="button" id="searchKeywordBtn"
			onclick="SearchKeyword('${keyword}');">검색</button>
	</div>

	<script>
		function SearchKeyword(keyword){
			form.action="<%=request.getContextPath()%>
		/club/list";
			form.submit();
		}
	</script>

	<!-- <body class="subpage"> -->

	<!-- Menu -->
	<nav id="menu">
		<ul class="links">
			<li><a href="index.html">Home</a></li>
			<li><a href="generic.html">Generic</a></li>
			<li><a href="elements.html">Elements</a></li>
		</ul>
		<ul class="actions vertical">
			<li><a href="#" class="button fit">Login</a></li>
		</ul>
	</nav>

	<!-- Main -->
	<section id="main" class="wrapper">
		<div class="inner">
			<header class="align-center">
				<h1>동호회 리스트</h1>
				<p>원하는 동호회를 검색하세요.</p>
			</header>
			<div class="image fit">
				<img src="images/pic05.jpg" alt="" />
			</div>
			<table align="center" border="1">
				<div class="listTitle">
					<h3>
						<strong>동호회 리스트</strong>
					</h3>
				</div>
				<tr>
					<th width="10%">동호회번호</th>
					<th width="10%">작성자</th>
					<th width="10%">동호회명</th>
					<th width="20%">등록일</th>
					<th width="10%">지역</th>
					<th width="10%">카테고리</th>
					<th width="10%">인원수</th>
					<th width="10%">up 수</th>
					<th width="10%">down 수</th>
				</tr>
				<c:if test="${empty clubList }">
					<tr>
						<td><strong> 해당 내용이 없습니다. </strong></td>
					</tr>
				</c:if>
				<c:if test="${!empty clubList }">
					<c:forEach items="${clubList }" var="club">
						<tr>
							<td>${club.club_no }</td>
							<td>${club.mem_id }</td>
							<td>${club.club_name }</td>
							<td>${club.club_regDate }</td>
							<td>${club.club_local }</td>
							<td>${club.cate_name }</td>
							<td>${club.joincnt }</td>
							<td>${club.upcnt }</td>
							<td>${club.downcnt }</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
		</div>
	</section>

	<div class="card-footer clearfix">
		<div class="text-center">
			<ul class="pagination ">
				<li class="page-item"><a class="page-link"
					href="listSearch${pageMaker.makeQuery(1)}">&lt;&lt;</a>
				<li class="page-item"><a class="page-link"
					href="listSearch 
						<c:if test="${pageMaker.prev }">
								${pageMaker.makeQuery(pageMaker.startPage-1) }
						</c:if>">&lt;</a>
				</li>
				<c:forEach begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }" var="pageNum">
					<li
						class="page-item <c:out value="${pageMaker.cri.page == pageNum ?'active':''}"/>">
						<a class="page-link"
						href="listSearch${pageMaker.makeQuery(pageNum) }"> ${pageNum }</a>
					</li>
				</c:forEach>

				<li class="page-item"><a class="page-link"
					href="list <c:if test="${pageMaker.next }">
														${pageMaker.makeQuery(pageMaker.endPage+1) }
													</c:if>
													<c:if test="${!pageMaker.next }">
														${pageMaker.makeQuery(pageMaker.cri.page) }
													</c:if>">&gt;</a>
				</li>

				<li class="page-item"><a class="page-link"
					href="list${pageMaker.makeQuery(pageMaker.realEndPage) }">&gt;&gt;
				</a></li>

			</ul>
		</div>
	</div>

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
	<script
		src="<%=request.getContextPath()%>/resources/templated/assets/js/main.js"></script>

	<%@ include file="/WEB-INF/views/include/footer_js.jsp"%>

</body>


