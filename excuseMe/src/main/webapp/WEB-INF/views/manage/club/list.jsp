<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="clubList" value="${dataMap.clubList }" />
<c:set var="pageMaker" value="${dataMap.pageMaker }" />


<head>
<meta charset="utf-8">
<title>동호회 목록</title>
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
					
						 <%--  <div class="float-right">	
						 	<div class="row">
							 	<select class="form-control col-sm-4" name="searchType" id="searchType">
									<option value="in"  ${pageMaker.cri.searchType eq 'in' ? 'selected':'' }>전 체</option>
									<option value="i" ${pageMaker.cri.searchType eq 'i' ? 'selected':'' }>아이디</option>
									<option value="n" ${pageMaker.cri.searchType eq 'n' ? 'selected':'' }>이름</option>
													
								</select>
								<input  class="form-control col-sm-6" type="text" name="keyword" 
									placeholder="검색어를 입력하세요." value="${param.keyword }"/>
								<span class="input-group-btn col-sm-2">
									<button class="btn btn-info" type="button" id="searchBtn" onclick="onSearch();">
										<i class="fa fa-fw fa-search"></i>
									</button>
								</span>
							</div>
						</div> 
							 --%>
					
					

					<!-- Elements -->
						<h2 style="margin-left: 300px;">동호회 목록</h2>
						<div class="row 200%">
							<div class="card-body">
								<!-- Table -->
									<div class="table-wrapper" style="margin-left: 80px;">
										<table>
												<tr>
													<th class="text-center" style="width:100px;">동호회명</th>
													<th class="text-center" style="width:100px;">카테고리</th>
													<th class="text-center" style="width:100px;">UP-DOWN</th>
													<th class="text-center" style="width:100px;">상태</th>
													<th class="text-center" style="width:100px;">상세보기</th>
												</tr>
												<c:if test="${empty clubList }">
												<tr>
													<td colspan="5" class="text-center">
														<strong>해당 내용이 없습니다.</strong>
													</td>
												</tr>
											</c:if>
										<c:if test="${!empty clubList }">
							  			<c:forEach items="${clubList }" var="club" >
							  	<tr>
							  		<td class="text-center">${club.club_name }</td>
									<td class="text-center">${club.cate_name }</td>
									<td class="text-center">${club.mi }</td>
									<td class="text-center">
									<c:if test= "${club.club_status==1 }" >
									운영중
									</c:if>
									<c:if test= "${club.club_status==2 }" >
									운영 중지
									</c:if>
									</td>
									
									<td class="text-center">
									<button type="button" class="button special small" id="detailBtn" onclick="OpenWindow('detail?club_no=${club.club_no }','','850','800');">
									상세보기</button>
									</td>
								</tr>
							  </c:forEach>
							</c:if>
						</table>
									</div>
									
									
					<div class="text-center" style="margin-left: 200px;"  >
																				
						<ul class="pagination ">
							<li class="page-item">
								<a class="page-link" href="list${pageMaker.makeQuery(1)}">&lt;&lt;</a>
							<li class="page-item">
								<a class="page-link" href="list
									<c:if test="${pageMaker.prev }">
										${pageMaker.makeQuery(pageMaker.startPage-1) }
									</c:if>
								">&lt;</a>
							</li>
							<c:forEach begin="${pageMaker.startPage }" 
							           end="${pageMaker.endPage }" var="pageNum">
							<li class="page-item <c:out value="${pageMaker.cri.page == pageNum ?'active':''}"/>">
								<a class="page-link" href="list${pageMaker.makeQuery(pageNum) }" >
									${pageNum }
								</a>
							</li>
							</c:forEach>	
							
							<li class="page-item">
								<a class="page-link" href="list
									<c:if test="${pageMaker.next }">
										${pageMaker.makeQuery(pageMaker.endPage+1) }
									</c:if>
									<c:if test="${!pageMaker.next }">
										${pageMaker.makeQuery(pageMaker.cri.page) }
									</c:if>
								">&gt;</a>
							</li>			
							
							<li class="page-item">
								<a class="page-link" href="list${pageMaker.makeQuery(pageMaker.realEndPage) }">
									&gt;&gt;
								</a>
							</li>
											
						</ul>
						</div>
					</div>	
				</div>
				
						

				</div>
			</section>

	

	

	
<script>
   <%-- 	window.onload=function(){
   		$('a[data-name="member"]').on('click',function(event){
   				event.preventDefault();
   		});
  }
   	
   	
   function onSearch(){	
   		var searchType=$('select#searchType').val();
   		var keyword=$('input[name="keyword"]').val();
   		
   		alert("searchType="+searchType+"\n"+"keyword="+keyword);
   		
   		location.href="<%=request.getContextPath() %>/manage/user/list";
   		
   	}; --%>
   	
   	
   </script>
   
   

	</body>
