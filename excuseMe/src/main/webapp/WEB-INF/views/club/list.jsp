
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
</style> 


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head>

<title>동호회 리스트 창</title>
<c:set var="clubList" value="${dataMap.clubList }" />
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<!--<c:set var="cateList" value="${dataMap.cateList }" />
<c:set var="localList" value="${dataMap.localList }" />-->

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

			<!-- searchClubList Start-->
			<header class="align-center">
				<h1>동호회 리스트</h1>
				<p>원하는 동호회를 검색하세요.</p>
			</header>
			<!-- searchClubList End-->

			<!-- clubList Start -->
			<!-- alignment -->
			<section class="alignment" style="height: 70px;">
				<div class="listTitle" style="float: right;">
					<a class="btn btn-app"><i class="fas fa-users"></i> 인원수순</a> <a
						class="btn btn-app"><i class="fas fa-thumbs-up"></i> 좋아요순</a> <a
						class="btn btn-app"><i class="fas fa-thumbs-down"></i> 싫어요순</a>
				</div>
			</section>

			<section class="clublist" style="height: 936px;width:auto;">
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
								<div class="content1" style="margin:10px;">
									<div class="text-muted text-center" style="max-height:3.6em; overflow:hidden; 
																			   display:-webkit-box; -webkit-line-clamp:2; -webkit-box-orient:vertical;">${club.club_content}</div>
								</div>
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
		</div>

		<br> <br> <br>
		<!-- clubList End -->

		<!-- joinClub Start-->
		<section class="joinclub_title">
			<div class="join_wrap"
				style="width: 953.33px; margin-left: auto; margin-right: auto;">
				<h3>추천동호회</h3>
				<div class="card card-solid">
					<div class="card-body" style="padding-bottom: 0">
						<div class="row d-flex align-items-stretch">
							<div class="d-flex align-items-stretch" style="width: 20%;">
								<div class="card bg-light">
									<div class="card-header text-muted border-bottom-0">카테고리</div>
									<div class="card-body pt-0">
										<div class="row">
											<div class="col-7">
												<h2 class="lead">
													<b>동호회명</b>
												</h2>
												<p class="text-muted text-sm">
													<b>About: </b> 동호회 설명
												</p>
												<!-- <ul class="ml-4 mb-0 fa-ul text-muted">
												<li class="small"><span class="fa-li"><i
														class="fas fa-lg fa-building"></i></span> Address: Demo Street
													123, Demo City 04312, NJ</li>
												<li class="small"><span class="fa-li"><i
														class="fas fa-lg fa-phone"></i></span> Phone #: + 800 - 12 12 23
													52</li>
											</ul> -->
											</div>
											<div class="col-5 text-center">
												<img src="../../dist/img/user1-128x128.jpg" alt=""
													class="img-circle img-fluid">
											</div>
										</div>
									</div>
									<div class="card-footer">
										<div class="text-right">
											<a href="#" class="btn btn-sm bg-teal"> <i
												class="fas fa-comments"></i>
											</a> <a href="#" class="btn btn-sm btn-primary"> <i
												class="fas fa-user"></i> View Profile
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /.card-body -->
				</div>
			</div>
		</section>
		<!-- joinClub End-->

		<!-- pagination Start-->
		<div class="card-footer clearfix">
			<div class="pagination justify-content-center m-0">
				<ul class="pagination ">
					<li class="page-item"><a class="page-link"
						href="list${pageMaker.makeQuery(1)}" style="text-decoration: none">&lt;&lt;</a>
					<li class="page-item"><a class="page-link"
						href="list<c:if test="${pageMaker.prev }">${pageMaker.makeQuery(pageMaker.startPage-1) }</c:if>"
						style="text-decoration: none">&lt;</a></li>
					<c:forEach begin="${pageMaker.startPage }"
						end="${pageMaker.endPage }" var="pageNum">
						<li
							class="page-item <c:out value="${pageMaker.cri.page == pageNum ?'active':''}"/>">
							<a class="page-link" href="list${pageMaker.makeQuery(pageNum) }"
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

	</section>
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
   $('#category').change(function() { 
      
      <%-- self.location="<%=request.getContextPath()%>/subcategory" --%>
      
      /* alert(go); */
      $.ajax({
         data:JSON.stringify({ "
							cate_no":$(this).val() }),
         contentType:"application/JSON",
         type: "POST",
         url: "<%=request.getContextPath()%>/subcategory",
         cache:
							false,
         success:
							function(data) {
            console.log(data);
            $("#subCategory").html("");
            for(var
							sub ofdata){
               console.log(sub.cate_sub_name);
               $("#subCategory").append("<option>"+sub.cate_sub_name+"</option>");
            }
         }
      });
   
   });
	
							
</script>
</body>