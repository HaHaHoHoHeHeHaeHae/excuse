<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<head>
<meta charset="utf-8">
<title>회원관리</title>
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
					
						 <div class="float-right">	
						 	<div class="row">
							 	<select class="form-control col-sm-4" name="searchType" id="searchType">
									<option value="in"  ${pageMaker.cri.searchType eq 'in' ? 'selected':'' }>전 체</option>
									<option value="i" ${pageMaker.cri.searchType eq 'i' ? 'selected':'' }>아이디</option>
									<option value="n" ${pageMaker.cri.searchType eq 'n' ? 'selected':'' }>이름</option>
													
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
							
					
					

					<!-- Elements -->
						<h2 style="margin-left: 350px;">회원 목록</h2>
						<div class="row 200%">
							<div class="12u">

							

								<!-- Table -->
									
									<div class="table-wrapper" style="margin-left: 100px;">
										<table>
												<tr>
													<th>이름</th>
													<th style="width:300px;">아이디</th>
													<th>가입일</th>
													<th>회원상태</th>
												</tr>
												<c:if test="${empty memberList }">
												<tr>
													<td colspan="5" class="text-center">
														<strong>해당 내용이 없습니다.</strong>
													</td>
												</tr>
											</c:if>
										<c:if test="${!empty memberList }">
							  			<c:forEach items="${memberList }" var="member" >
							  	<tr>
									<td class="text-center">${member.mem_name }</td>
									<td >
									<a href="#" data-name="member" onclick="OpenWindow('detail?mem_id=${member.mem_id }','','850','800');">
										${member.mem_id }
									</a>
									</td>
									
									
									<td>
										<fmt:formatDate value="${member.mem_regDate }" pattern="yyyy-MM-dd"/>									
									</td>
									<td class="text-center">
									<c:if test= "${member.mem_status==1 }" >
									활성
									</c:if>
									<c:if test= "${member.mem_status==0 }" >
									비활성
									</c:if>
								</tr>
							  </c:forEach>
							</c:if>
						</table>
									</div>
									
									
									<div class="card-footer clearfix"  >
						<div class="text-center">															
						<ul class="pagination ">
							<li class="page-item">
								<a class="page-link" href="listSearch${pageMaker.makeQuery(1)}">&lt;&lt;</a>
							<li class="page-item">
								<a class="page-link" href="listSearch
									<c:if test="${pageMaker.prev }">
										${pageMaker.makeQuery(pageMaker.startPage-1) }
									</c:if>
								">&lt;</a>
							</li>
							<c:forEach begin="${pageMaker.startPage }" 
							           end="${pageMaker.endPage }" var="pageNum">
							<li class="page-item <c:out value="${pageMaker.cri.page == pageNum ?'active':''}"/>">
								<a class="page-link" href="listSearch${pageMaker.makeQuery(pageNum) }" >
									${pageNum }
								</a>
							</li>
							</c:forEach>	
							
							<li class="page-item">
								<a class="page-link" href="listSearch
									<c:if test="${pageMaker.next }">
										${pageMaker.makeQuery(pageMaker.endPage+1) }
									</c:if>
									<c:if test="${!pageMaker.next }">
										${pageMaker.makeQuery(pageMaker.cri.page) }
									</c:if>
								">&gt;</a>
							</li>			
							
							<li class="page-item">
								<a class="page-link" href="listSearch${pageMaker.makeQuery(pageMaker.realEndPage) }">
									&gt;&gt;
								</a>
							</li>
											
						</ul>
						</div>
					</div>	

								

							</div>
				
						</div>

				</div>
			</section>

	

	

	
<script>
   	window.onload=function(){
   		$('a[data-name="member"]').on('click',function(event){
   				event.preventDefault();
   		});
  }
   	
   </script>

	</body>
