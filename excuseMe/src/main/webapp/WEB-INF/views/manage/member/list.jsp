<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="memberList" value="${dataMap.memberList }" />
<c:set var="pageMaker" value="${dataMap.pageMaker }" />

<head>
<meta charset="utf-8">
<title>회원관리</title>
<style>
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


<body class="subpage">

	<!-- Main -->
	<section id="main" class="wrapper">
		<div id="inner" style="margin-left: -3px;">

			<div class="sidebar"
				style="float: left; background: #4dacc4; width: 180px; height: 548px; z-index:">

				<li style="list-style: none; margin-top: 50px;"><a
					style="text-decoration: none; text-color: black; display: block; height: 40px; line-height: 40px; text-indent: 20px; font-size: 1.1em; color: black;"
					href="#">동호회 리스트 </a></li>
				<li style="list-style: none; margin-top: 30px;"><a
					style="text-decoration: none; text-color: black; display: block; height: 40px; line-height: 40px; text-indent: 20px; font-size: 1.1em; color: black;"
					href="#">블랙 리스트 </a></li>
				<li style="list-style: none; margin-top: 30px;"><a
					style="text-decoration: none; text-color: black; display: block; height: 40px; line-height: 40px; text-indent: 20px; font-size: 1.1em; color: black;"
					href="#">신규동호회 승인 </a></li>
				<li style="list-style: none; margin-top: 30px;"><a
					style="text-decoration: none; text-color: black; display: block; height: 40px; line-height: 40px; text-indent: 20px; font-size: 1.1em; color: black;"
					href="#">회원 관리</a></li>


			</div>








			<!-- Elements -->

			<div class="row 200%">
				<div class="card-body">
					<div>
						<div class="row">
							<h2 style="margin-left: 50px; margin-right: 50px;">회원 목록</h2>

							<select style="width: 140px; margin-right: 30px;">
								<option>가입최신순</option>
								<option>가입오래된순</option>
							</select> <select name="searchType" style="width: 100px;" id="searchType">
								<option value="in"
									${pageMaker.cri.searchType eq 'in' ? 'selected':'' }>전체</option>
								<option value="i"
									${pageMaker.cri.searchType eq 'i' ? 'selected':'' }>아이디</option>
								<option value="n"
									${pageMaker.cri.searchType eq 'n' ? 'selected':'' }>이름</option>

							</select> <input style="width: 200px; margin-left: 2px;" type="text"
								name="keyword" placeholder="검색어를 입력하세요."
								value="${param.keyword }" /> <span>
								<button class="button alt small" style="margin-top: 4px;"
									type="button" id="searchBtn" onclick="onSearch();">검색</button>
							</span>
						</div>
					</div>
					<!-- Table -->
					<div class="table-wrapper" style="margin-left: 80px;">
						<table>
							<tr>
								<th class="text-center" style="width: 200px;">이름</th>
								<th class="text-center" style="width: 250px;">아이디</th>
								<th class="text-center" style="width: 150px;">가입일</th>
								<th class="text-center" style="width: 250px;">회원상태</th>
								<th class="text-center" style="width: 250px;">상세보기</th>
							</tr>
							<c:if test="${empty memberList }">
								<tr>
									<td colspan="5" class="text-center"><strong>해당
											내용이 없습니다.</strong></td>
								</tr>
							</c:if>
							<c:if test="${!empty memberList }">
								<c:forEach items="${memberList }" var="member">
									<tr>
										<td class="text-center">${member.mem_name }</td>
										<td class="text-center">${member.mem_id }</td>
										<td class="text-center"><fmt:formatDate
												value="${member.mem_regDate }" pattern="yyyy-MM-dd" /></td>
										<td class="text-center"><c:if
												test="${member.mem_status==1 }">
									활성
									</c:if> <c:if test="${member.mem_status==0 }">
									비활성
									</c:if></td>
										<td>
											<button type="button" class="button special small"
												id="detailBtn"
												onclick="OpenWindow('detail?mem_id=${member.mem_id }','','850','800');">
												상세보기</button>
										</td>
									</tr>
								</c:forEach>
							</c:if>
						</table>
					</div>


					<div class="text-center" style="margin-left: 200px;">

						<ul class="pagination ">
							<li class="page-item"><a class="page-link"
								href="list${pageMaker.makeQuery(1)}">&lt;&lt;</a>
							<li class="page-item"><a class="page-link"
								href="list
									<c:if test="${pageMaker.prev }">
										${pageMaker.makeQuery(pageMaker.startPage-1) }
									</c:if>
								">&lt;</a>
							</li>
							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="pageNum">
								<li
									class="page-item <c:out value="${pageMaker.cri.page == pageNum ?'active':''}"/>">
									<a class="page-link"
									href="list${pageMaker.makeQuery(pageNum) }"> ${pageNum } </a>
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
								">&gt;</a>
							</li>

							<li class="page-item"><a class="page-link"
								href="list${pageMaker.makeQuery(pageMaker.realEndPage) }">
									&gt;&gt; </a></li>

						</ul>
					</div>
				</div>
			</div>



		</div>
	</section>






	<script>
	 function onSearch(){
			//alert("fff");
			var searchType=$('select#searchType').val();
			var keyword=$('input[name="keyword"]').val();
			
			//alert("searchType="+searchType+"\n"+"keyword="+keyword);
			
			searchList(searchType,keyword);
		}
	 
	function searchList(searchType,keyword){
		self.location="<%=request.getContextPath()%>/manage/member/list?searchType="+ searchType + "&keyword=" + keyword;
		}
	</script>




</body>
