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

			<!-- 검색창 -->
			<header class="align-center">
				<h1>동호회 리스트</h1>
				<p>원하는 동호회를 검색하세요.</p>
			</header>

			<!-- 동호회 리스트 -->

			<div class="clublist">
				<c:forEach var="club" items="${clubList }">
					<c:if test="${empty clubList }">
						<b><strong>해당되는 동호회가 없어오. 다시 검색해주새오 </strong></b>
					</c:if>
					<c:if test="${!empty clubList }">
						<div class="card card-primary card-outline"
							style="width: 20%; float: left;">
							<div class="card-body box-profile">
								<div class="text-center">
									<img class="profile-user-img img-fluid img-circle" 
										 src="<%=request.getContextPath() %>/resources/logo.png" alt="User profile picture">
								</div>
								<h3 class="profile-username text-center">${club.club_name }</h3>
								<div class="content1">
									<p class="text-muted text-center">${club.club_content}</p>
								</div>
								<ul class="list-group list-group-unbordered mb-3">
									<li class="list-group-item text-center" style="height: 40px;"><b>인원수&nbsp&nbsp&nbsp&nbsp</b><b>${club.joincnt }</b></li>
									<li class="list-group-item text-center" style="height: 40px;"><b>좋아요&nbsp&nbsp&nbsp&nbsp</b><b>${club.upcnt }</b></li>
									<li class="list-group-item text-center" style="height: 40px;"><b>싫어요&nbsp&nbsp&nbsp&nbsp</b><b>${club.downcnt }</b></li>
								</ul>
								<ul class="actions vertical small" style="text-align: center;">
									<li><a href="#" class="button small" style="color:white;">Follow</a></li>
								</ul>
									<!-- <div class="3u 12u$(small)">
											<ul class="actions vertical small">
												<li><a href="#" class="button special small">Small</a></li>
												<li><a href="#" class="button small">Small</a></li>
												<li><a href="#" class="button alt small">Small</a></li>
											</ul>
										</div>
								 -->
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>


			<!-- /.card-body -->

			<!-- /.card -->

			<div class="card-footer clearfix">
				<div class="pagination justify-content-center m-0">
					<ul class="pagination ">
						<li class="page-item"><a class="page-link"
							href="list${pageMaker.makeQuery(1)}"
							style="text-decoration: none">&lt;&lt;</a> <li class="page-item"><a class="page-link"
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
	S
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
         data:JSON.stringify({ "cate_no":$(this).val() }),
         contentType:"application/JSON",
         type: "POST",
         url: "<%=request.getContextPath()%>/subcategory",
         cache: false,
         success: function(data) {
            console.log(data);
            $("#subCategory").html("");
            for(var sub of data){
               console.log(sub.cate_sub_name);
               $("#subCategory").append("<option>"+sub.cate_sub_name+"</option>");
            }
         }
      });
   
   });

   
</script></
						body>
