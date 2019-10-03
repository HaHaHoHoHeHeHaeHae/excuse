
<style>
div.top {
	height: 100px;
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
<c:set var="cateList" value="${dataMap.cateList }" />
<c:set var="localList" value="${dataMap.localList }" />
<c:set var="recommendList" value="${dataMap.recommendList }" />
<c:set var="member" value="${dataMap.member }" />


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
		<div class="club_inner"
			style="margin: 0 auto; width: 1126.66px; position: static;">

<!-- searchClubList Start-->
			<header class="align-center"">
				<h1>동호회 리스트</h1>
				<p>원하는 동호회를 검색하세요.</p>
			</header>
			<section class="search"
				style="top: 20px; height: 250px; margin-bottom: 10px; position: relative;">
				<div class="search1"
					style="height: 50px; position: relative; width: 1000px; align: center;">
					<div class="form-group"
						style="float: left; displayh: inline-block;">
						<div class="label"
							style="float: left; margin-left: 10px; margin-right: 20px; width: 450px; height: 40px;">
							<div class="label_name"
								style="float: left; margin-right: 10px; width: 75px;">
								<strong>카테고리:</strong>
							</div>
							<div class="select" style="float: left;">
								<!-- category1 -->
								<select id="category" class="form-control"
									style="width: 350px; float: left;">
									<option selected>전체</option>
									<c:forEach var="cate1" items="${cateList}">
										<c:if test="${!empty cateList }">
											<option value="${cate1.cate_no }">${cate1.cate_name }</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
						</div>

						<div class="label"
							style="float: left; margin-left: 20px; margin-right: 10px; width: 0px; height: 40px;">
							<div class="select">
								<!-- category2 -->
								<select id="subCategory" class="form-control"
									style="width: 500px; float: left;">
									<option selected>전체</option>
								</select>
							</div>
						</div>
					</div>
				</div>
				<div class="search2" style="height: 50px; position: relative;">
					<div class="form-group" style="float: left;">
						<div class="label"
							style="float: left; margin-left: 10px; margin-right: 20px; width: 450px;">
							<div class="label_name"
								style="float: left; margin-right: 10px; width: 75px;">
								<strong>지역:</strong>
							</div>
							<div class="select" style="float: left;">
								<select id="local" class="form-control" style="width: 350px; float: left;">
									<option selected>전체</option>
									<c:forEach var="local" items="${localList }">
										<c:if test="${!empty localList }">
											<option value="${local.local_no}">${local.local_name }</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
						</div>

						<div class="label"
							style="float: left; margin-left: 20px; margin-right: 10px; width: 450px;">
							<div class="select">
								<select id="sublocal" class="form-control"
									style="width: 500px; float: left;">
									<option selected>전체</option>
								</select>
							</div>
						</div>
					</div>
				</div>
				<div class="search3" style="height: 80px; position: relative;">
					<div class="select" style="width: 800px, float:left; height: 80px;">
						<input name="keyword" type="text" class="form-control"
							placeholder="동호회를 검색할 단어를 입력하세요." style="width: 1000px;">
					</div>
					<ul class="actions" style="float: right;">
						<li><a id="searchBtn" href="#" class="button special small">검색</a></li>
					</ul>
				</div>

			</section>
<!-- searchClubList End-->

<!-- clubList Start -->
<!-- alignment -->
			<section class="alignment"
				style="top: 50px; height: 70px; position: relative;">
				<div class="listTitle" style="float: right;">
					<a data-name="ali" class="btn btn-app" onclick="ali_1();"><i class="fas fa-sort-numeric-down-alt"></i>역사가 깊은</a> 
					<a class="btn btn-app" onclick="ali_0();"><i class="fas fa-sort-numeric-down"></i>갓 생긴</a> 
					<a class="btn btn-app" onclick="ali_5();"><i class="fas fa-users"></i>사람많은</a> 
					<a class="btn btn-app" onclick="ali_4();"><i class="fas fa-user"></i>사람적은</a> 
					<a class="btn btn-app" onclick="ali_2();"><i class="fas fa-thumbs-up"></i>인기있는</a> 
					<a class="btn btn-app" onclick="ali_3();"><i class="fas fa-thumbs-down"></i>인기없는</a>
				</div>
			</section>

			<div class="divLine"
				style="background: #f6755e; margin-bottom: 20px; height: 5px; position: relative; top: 50px;"></div>

			<section class="clublist"
				style="height: 633.62px; position: relative; top: 80px;">
				<c:forEach var="club" items="${clubList }">
					<c:if test="${empty clubList }">
						<b><strong>해당되는 동호회가 없어오. 다시 검색해주새오 </strong></b>
					</c:if>
					<c:if test="${!empty clubList }">
						<div class="clublist_body"
							style="width: 20%; float: left; border: 1px dashed #bcbcbc; margin: 3px 3px 20px 3px; width: 219px;">
							<div class="card-body box-profile">
								<div class="text-center">
									<img class="profile-user-img img-fluid img-circle"
										src="<%=request.getContextPath()%>/resources/img/logo.png"
										alt="User profile picture">
								</div>
								<h3 class="profile-username text-center">${club.club_name }</h3>
								<%-- <div class="content1" style="margin: 10px;">
									<div class="text-muted text-center"
										style="max-height: 3.6em; overflow: hidden; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical;">${club.club_content}</div>
								</div> --%>
								<ul class="list-group list-group-unbordered mb-3">
									<li class="list-group-item text-center"
										style="height: 60px; width: 198px; left: -10px;"><b
										id="btag"> <i class="fas fa-user-alt"></i>&nbsp;&nbsp;${club.joincnt }
											&nbsp;&nbsp; <i class="far fa-thumbs-up"></i>&nbsp;&nbsp;${club.upcnt }
											&nbsp;&nbsp; <i class="fas fa-thumbs-down"></i>&nbsp;&nbsp;${club.downcnt }
									</b></li>

								</ul>
								<ul class="actions vertical small"
									style="text-align: center; margin-bottom: -10px;">
									<li><a class="button small" style="color: white;">Detail</a></li>
								</ul>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</section>
		</div>
	</section>
<!-- clubList End -->


<!-- recommendClub Start-->
	<ul class="club action fit small"
		style="position: relative; top: 100px;">
		<li class="button alt fit big"
			style="width: 1126.66px; margin: 0 auto; text-align: left;">[${member.mem_nick}]
			님 근처에 인기많은 동호회를 찾아보세요.!!!</li>
	</ul>

	<section class="joinclub_wrap"
		style="width: 1126.66px; margin: 0 auto; height: 200px; position: relative; top: 90px;">
		<c:forEach var="recommend" items="${recommendList }">
			<div class="joinclub card bg-light"
				style="width: 350px; height: 200px; float: left; margin: 0 12.5px 0 12.5px;">
				<div class="joinclub_sub text-muted border-bottom-0">&nbsp;${recommend.cate_name }</div>
				<div class="joinclub_sub_body" style="width: 350px; height: 172px;">
					<div class="sub_body" style="width: 350px; height: 172px;">
						<div class="1" style="width: 190px; height: 172px; float: left;">
							<h3 class="1_title" style="text-align: center; padding-top: 8px;">
								<b>${recommend.club_name }</b>
							</h3>
							<ul class="actions vertical small"
								style="text-align: center; margin-bottom: -10px;">
								<li><a href="#" class="button alt icon fa-search">Detail</a></li>
								<li><a href="#" class="button alt icon fa-check">가입하기</a></li>
							</ul>
						</div>
						<div class="2"
							style="width: 160px; height: 160px; align: center; float: left; padding-right: 20px;">
							<img src="<%=request.getContextPath()%>/resources/img/logo.png"
								alt="" class="img-circle img-fluid">
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</section>
	<br>
	<br>
<!-- recommendClub End-->

<!-- pagination Start-->
	<section class="pagination"
		style="width: 1126.66px; margin: 0 auto; height: 68px; position: relative; top: 70px;">
		<div class="card-footer clearfix"
			style="align: center; width: 1126.66px;">
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







<%--Script --%>

	<%-- 	<script
		src="<%=request.getContextPath()%>/resources/templated/assets/js/jquery.scrolly.min.js"></script> --%>
	<script
		src="<%=request.getContextPath()%>/resources/templated/assets/js/skel.min.js"></script>
	<%-- <script
		src="<%=request.getContextPath()%>/resources/templated/assets/js/util.js"></script> --%>
	<script src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons.js"></script>
	<%-- <script
		src="<%=request.getContextPath()%>/resources/templated/assets/js/main.js"></script>
 --%>
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>



<%--Function --%>
	<script>
	<%--subCategory --%>
	 $('#category').change(function() { 
	      $.ajax({
	         data:JSON.stringify({ "cate_no":$(this).val() }),
	         contentType:"application/JSON",
	         type: "POST",
	         url: "<%=request.getContextPath()%>/club/subcategory",
	         success: function(data) {
	                  $("#subCategory").html("");
	                  for(var sub of data){
	                  $("#subCategory").append("<option>"+ sub.cate_sub_name +"</option>");
	                  }
	         }
	      });
	   });
	 
	 <%--subLocal --%>
	$('#local').change(function(){
		<%--alert("야호 성공이다");--%>
		console.log(local);
		$.ajax({
			data:JSON.stringify({"local_no":$(this).val()}),
			contentType:"application/JSON",
			type: "POST",
			url: "<%=request.getContextPath()%>/club/sublocal",
			success: function(data){
					$("#sublocal").html("");
					for(var sublo of data){
						$("#sublocal").append("<option>"+ sublo.local_sub_name +"</option>");
			}
			},
			error: function(request,status,error){
				alert("code="+request.status+"message="+request.responseText+"error="+error);
			}
				
		});
	});

	<%--search --%>
	$('a#searchBtn').click(function(){
		alert("searchBtn");
		//""(x), cate1.cate_name (x),
		//var category = $('select#category').text();
		//$("select option[value*='disabled']").prop('disabled',true);
		//var category = $('select#category option selected').text();
		//var category = $('select#category').children(":selected").attr("sub").text();
		//var local = $('select#local option selected').text();
		//$('select#category').removeAttr('disabled');
		
		var category = $('select#category option:selected' ).text();
		var local = $('select#local option:selected').text();
		var keyword = $('input[name="keyword"]').val(); 
		
		if(category=="전체"){
			var category = "";
		}
		if(local=="전체"){
			var local = "";
		}
		
		alert("category="+category+"local="+local+"keyword="+keyword);
		
		searchList("${categoryclub }",category,local,keyword);
	});
	
	
	function searchList(categoryclub,category,local,keyword){
		self.location="<%=request.getContextPath()%>/"+categoryclub+"/list?category="+category+"&local="+local+"&keyword="+keyword;
	}
	
	<%--aligment --%>
	function ali_0(){ //0:최신순
		self.location.href="<%=request.getContextPath() %>/club/list?alignment=0";
		//$('a#ali_1').click(function(e){e.preventDefault();window.open(this.href);});
	}
	function ali_1(){ //1:오래된순
		self.location.href="<%=request.getContextPath() %>/club/list?alignment=1";
	}
	function ali_2(){ //2:업 많은 순
		self.location.href="<%=request.getContextPath() %>/club/list?alignment=2";
	}
	function ali_3(){ //3:다운 많은 순
		self.location.href="<%=request.getContextPath() %>/club/list?alignment=3";
	}
	function ali_4(){ //4:회원수 없는 순
		self.location.href="<%=request.getContextPath() %>/club/list?alignment=4";
	}
	function ali_5(){ //5:회원수 많은 순
		self.location.href="<%=request.getContextPath() %>/club/list?alignment=5";
	}
	
	/* window.onload =function(){
	$('a[data-name-"ali"]').on('click',function(e){
		e.preventDefault();
	});
	} */

	</script>


</body>