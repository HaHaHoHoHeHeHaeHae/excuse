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
<style>
#sidebar {
	margin-top:70px;
	float: left;
	background: #25a1c3;
	width: 200px;
	height: 500px;
    text-align: center;
	border-radius: 8px;
	 display: inline-block;
  	vertical-align: middle;
 	 height: 100%;
 	 font-family: 'Nanum Gothic Coding', monospace;
}

#sublist{
	text-decoration: none;
	color: white;
	display: block;
	height: 80px;
	line-height: 40px;
	text-indent: 20px;
	padding:-5px;
	vertical-aling:middle;
	
}
#subtoplist{
	background:#0489B1;
	text-decoration: none;
	color: white;
	display: block;
	height: 70px;
	line-height: 40px;
	text-indent: 20px;
	padding-top:-5x;
	border-radius: 0px 0px 8px 0px;
}
#sidebar>a:hover, #sidebar>a.on{
    background:#0489B1;
    border: none;
    border-radius: 0px 0px 0px 8px;
        }
</style>
</head>
<body class="subpage">

		<!-- Main -->
			<section id="main" class="wrapper" >
				<div class="inner" style="margin-left:-3px;"> 
					
					<div id="sidebar">
				
				<a href="#" id="subtoplist">ADMINISTRATOR </a>
				<a href="#" id="sublist">동호회 리스트 </a>
				<a href="#" id="sublist">블랙 리스트 </a>
				<a href="#" id="sublist">신규동호회 승인 </a>
				<a href="#" id="sublist">회원 관리</a>


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
						<h2 style="margin-left: 300px;">블랙리스트</h2>
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
function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight) {
	winleft = (screen.width - WinWidth) / 2;
	wintop = (screen.height - WinHeight) / 2;
	var win = window.open(UrlStr , WinTitle , "scrollbars=yes,width="+ WinWidth 
		                	+", height="+ WinHeight +", top="+ wintop +", left=" 
		                	+ winleft + ", resizable=no, status=yes"  );
    win.focus() ; 
}
   	
   	
   </script>
   
   

	</body>
