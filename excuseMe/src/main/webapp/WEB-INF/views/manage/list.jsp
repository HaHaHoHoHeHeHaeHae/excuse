<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Manage Page</title>
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">

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

<style>

</style>
<body class="subpage">

		

		

		<!-- Main -->
			<section id="main" class="wrapper" >
				<div class="inner" style="margin-left:-3px;"> 
					
					<div class="sidebar" style="float:left; background:#4dacc4;  width: 180px; height:548px; z-index: ">
								
								<li style="list-style: none; margin-top:50px;">
								<a style="text-decoration: none; text-color:black; display: block;
           								 height: 40px;
							             line-height: 40px;
							             text-indent: 20px;
							             font-size: 1.1em;
           								  color: black;"  href="#">동호회 리스트 </a></li>
			         			<li style="list-style: none; margin-top:30px;"><a style="text-decoration: none; text-color:black; display: block;
           								 height: 40px;
							             line-height: 40px;
							             text-indent: 20px;
							             font-size: 1.1em;
           								  color: black;"  href="#">블랙 리스트 </a></li>
			         			<li style="list-style: none; margin-top:30px;"><a style="text-decoration: none; text-color:black; display: block;
           								 height: 40px;
							             line-height: 40px;
							             text-indent: 20px;
							             font-size: 1.1em;
           								  color: black;"  href="#">신규동호회 승인 </a></li>
			         			<li style="list-style: none; margin-top:30px;"><a style="text-decoration: none; text-color:black; display: block;
           								 height: 40px;
							             line-height: 40px;
							             text-indent: 20px;
							             font-size: 1.1em;
           								  color: black;"  href="#">회원 관리</a></li>
			          
			         
					</div>

					<!-- Elements -->
						<h2 style="margin-left: 350px;">동호회리스트</h2>
						<div class="row 200%">
							<div class="12u">

							

								<!-- Table -->
								
									<div class="card-header">
						 <button id='newBtn' class="btn btn-primary" onclick="OpenWindow('regist','네이버',800,600);">글등록</button>
						 
						 <div class="float-right">	
						 	<div class="row">
							 	<select class="form-control col-sm-4" name="searchType" id="searchType">
									<option value="tcw"  ${pageMaker.cri.searchType eq 'tcw' ? 'selected':'' }>전 체</option>
									<option value="t" ${pageMaker.cri.searchType eq 't' ? 'selected':'' }>제 목</option>
									<option value="w" ${pageMaker.cri.searchType eq 'w' ? 'selected':'' }>작성자</option>
									<option value="c" ${pageMaker.cri.searchType eq 'c' ? 'selected':'' }>내 용</option>
									<option value="tc" ${pageMaker.cri.searchType eq 'tc' ? 'selected':'' }>제목+내용</option>
									<option value="cw" ${pageMaker.cri.searchType eq 'cw' ? 'selected':'' }>작성자+내용</option>							
								</select>
								<input  class="form-control col-sm-6" type="text" name="keyword" 
									placeholder="검색어를 입력하세요." value="${param.keyword }"/>
								<span class="input-group-btn col-sm-2">
									<button class="btn btn-info" type="button" id="searchBtn">
										<i class="fa fa-fw fa-search"></i>
									</button>
								</span>
							</div>
						</div>
							
					</div>
								
									
									<div class="table-wrapper" style="margin-left: 100px;">
										<table>
											<thead>
												<tr>
													<th>동호회명</th>
													<th>카테고리</th>
													<th>추천수</th>
												</tr>
											</thead>
											<tbody>
												<c:if test="${empty clubList }">
								<tr>
									<td colspan="5" class="text-center">
										<strong>해당 내용이 없습니다.</strong>
									</td>
								</tr>
							</c:if>
							<c:if test="${!empty clubList }">
							  <c:forEach items="${clubList }" var="board" >
							  	<tr>
							  	<td >
									<a href="#" data-name="title" onclick="OpenWindow('detail?club_no=${club.club_no }','','800','650');">
										${club.club_name }
										
									</a>
									</td>
									<td class="text-center">${club.cate_name}</td>
									<td class="text-center">${up.up_no-down.down_no }</td>
								</tr>
							  </c:forEach>
							</c:if>
										</table>
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

	</body>
</html>
