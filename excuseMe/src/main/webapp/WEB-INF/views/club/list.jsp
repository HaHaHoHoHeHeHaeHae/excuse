<!-- 
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

</style> -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head>
<meta charset="UTF-8">
<title>동호회 리스트 창</title>
<c:set var="clubList" value="${dataMap.clubList }" />
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cateList" value="${dataMap.cateList }" />
<c:set var="localList" value="${dataMap.localList }" />

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
	<!-- Main -->
	<section id="main" class="wrapper">
		<div class="inner">
			<header class="align-center">
				<h1>동호회 리스트</h1>
				<p>원하는 동호회를 검색하세요.</p>
			</header>
			<!-- 검색창 -->
			<%-- <div class="searchbox align-center">
				동호회명: <input type="text" id="keyword" name="keyword"
					placeholder="검색할 동호회를 입력하세요." value="${keyword }" />
				<button type="button" id="searchKeywordBtn"
					onclick="SearchKeyword('${keyword}');">검색</button>
			</div> --%>
			<section class="content">
				<div class="container-fluid">
					<div class="row">
					
						<!-- left column -->
						<div class="col-md-12">
							<!-- general form elements -->
							<div class="card card-primary">
								<div class="card-header">
									<h3 class="card-title">동호회 검색</h3>
								</div>
								<!-- /.card-header -->
								<!-- form start -->
								<form role="form">
									<div class="card-body">
										<div class="form-group">
											<label for="exampleInputEmail1"></label> <input
												type="email" class="form-control" id="exampleInputEmail1"
												placeholder="Enter email">
										</div>
										<div class="form-group">
											<label for="exampleInputPassword1">Password</label> <input
												type="password" class="form-control"
												id="exampleInputPassword1" placeholder="Password">
										</div>

										<div class="12u$">
											<div class="select-wrapper">
												<select name="category" id="category">
													<option value="" selected disalbed>- Category -</option>
													
												</select>
											</div>
										</div>
							
										<div class="form-check">
											<input type="checkbox" class="form-check-input"
												id="exampleCheck1"> <label class="form-check-label"
												for="exampleCheck1">Check me out</label>
										</div>
									</div>
									<!-- /.card-body -->

									<div class="card-footer">
										<button type="submit" class="btn btn-primary">Submit</button>
									</div>
								</form>
							</div>
							<!-- /.card -->


							<div class="image fit">
								<img src="images/pic05.jpg" alt="" />
							</div>
							<table align="center" border="1">
								<div class="listTitle align-center"></div>
								<tr>
									<th width="10% align-center">동호회번호</th>
									<th width="10% align-center">작성자</th>
									<th width="10% align-center">동호회명</th>
									<th width="20% align-center">등록일</th>
									<th width="10% align-center">지역</th>
									<!-- <th width="10% align-center">카테고리</th> -->
									<th width="10% align-center">인원수</th>
									<th width="10% align-center">up 수</th>
									<th width="10% align-center">down 수</th>
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
											<!-- <td>${club.cate_name }</td> 서브카테고리매퍼 완성되면 다시 넣고 돌려보기-->
											<td>${club.joincnt }</td>
											<td>${club.upcnt }</td>
											<td>${club.downcnt }</td>
										</tr>
									</c:forEach>
								</c:if>
							</table>
							<div class="card-footer clearfix">
								<div class="pagination justify-content-center m-0">
									<ul class="pagination ">
										<li class="page-item"><a class="page-link"
											href="list${pageMaker.makeQuery(1)}"
											style="text-decoration: none">&lt;&lt;</a>
										<li class="page-item"><a class="page-link"
											href="list<c:if test="${pageMaker.prev }">${pageMaker.makeQuery(pageMaker.startPage-1) }</c:if>"
											style="text-decoration: none">&lt;</a></li>
										<c:forEach begin="${pageMaker.startPage }"
											end="${pageMaker.endPage }" var="pageNum">
											<li
												class="page-item <c:out value="${pageMaker.cri.page == pageNum ?'active':''}"/>"`>
												<a class="page-link"
												href="list${pageMaker.makeQuery(pageNum) }"
												style="text-decoration: none">${pageNum } </a>
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
								"
											style="text-decoration: none">&gt;</a></li>

										<li class="page-item"><a class="page-link"
											href="list${pageMaker.makeQuery(pageMaker.realEndPage) }"
											style="text-decoration: none"> &gt;&gt; </a></li>
									</ul>
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
