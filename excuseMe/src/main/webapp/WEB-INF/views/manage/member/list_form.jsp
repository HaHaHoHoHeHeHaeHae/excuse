<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="memberList" value="${dataMap.memberList }" />
<c:set var="pageMaker" value="${dataMap.pageMaker }" />

<head>
<meta charset="utf-8">
<title>회원관리</title>

</head>

<body class="subpage">
	<!-- Main -->
	<section id="main" class="wrapper">
		<div class="inner" style="margin-left: -3px;">
			<!-- Elements -->
			
			<div class="row 200%">
				
				<div class="card-body">
					<!-- Table -->
					<div class="table-wrapper" style="margin-left: 80px; margin-top:-176px;">
						<table>
							<tr>
								<th class="text-center" style="width: 200px;">이름</th>
								<th class="text-center" style="width: 300px;">아이디</th>
								<th class="text-center" style="width: 250px;">가입일</th>
								<th class="text-center" style="width: 250px;">회원상태</th>
								
							</tr>
							<c:if test="${empty memberList }">
								<tr>
									<td colspan="5" class="text-center">
										<strong>해당 내용이 없습니다.</strong>
									</td>
								</tr>
							</c:if>
							<c:if test="${!empty memberList }">
								<c:forEach items="${memberList }" var="member">
									<tr>
										<td class="text-center">${member.mem_name }</td>
										<td class="text-center" style="cursor:pointer;" onclick="OpenWindow('detail?mem_id=${member.mem_id }','','430','680');">${member.mem_id }</td>
										<td class="text-center"><fmt:formatDate value="${member.mem_regDate }" pattern="yyyy-MM-dd" /></td>
										<td class="text-center">
											<c:if test="${member.mem_status==1 }">
												활성
											</c:if> 
											<c:if test="${member.mem_status==0 }">
												비활성
											</c:if>
										</td>
									</tr>
								</c:forEach>
							</c:if>
						</table>
					</div>
					<div class="text-center" style="float:right;margin-right:40px;"  >													
				<ul class="pagination ">
					<li class="page-item">
						<a class="page-link"style="text-decoration:none;" href="listForm${pageMaker.makeQuery(1)}">&lt;&lt;</a>
					</li>
					<li class="page-item">
						<a class="page-link"style="text-decoration:none;" href="listForm
							<c:if test="${pageMaker.prev }">
								${pageMaker.makeQuery(pageMaker.cri.page-1) }
							</c:if>
						">&lt;</a>
					</li>
					<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
						<li class="page-item <c:out value="${pageMaker.cri.page == pageNum ?'active':''}"/>">
							<a class="page-link"style="text-decoration:none;" href="listForm${pageMaker.makeQuery(pageNum) }" >
								${pageNum }
							</a>
						</li>
					</c:forEach>	
	
					<li class="page-item">
						<a class="page-link"style="text-decoration:none;" href="listForm
							<c:if test="${pageMaker.next }">
								${pageMaker.makeQuery(pageMaker.cri.page+1) }
							</c:if>
							<c:if test="${!pageMaker.next }">
								${pageMaker.makeQuery(pageMaker.cri.page) }
							</c:if>
						">&gt;</a>
					</li>			
	
					<li class="page-item">
						<a class="page-link"style="text-decoration:none;" href="listForm${pageMaker.makeQuery(pageMaker.realEndPage) }">
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
		winleft = (screen.width - WinWidth) / 1.1;
		wintop = (screen.height - WinHeight) / 2;
		var win = window.open(UrlStr , WinTitle , "scrollbars=yes,width="+ WinWidth 
			                	+", height="+ WinHeight +", top="+ wintop +", left=" 
			                	+ winleft + ", resizable=no, status=yes"  );
	    win.focus() ; 
	}
	
	<%-- //멤버검색
	 function onSearch(){
			//alert("fff");
			var searchType=$('select#searchType').val();
			var keyword=$('input[name="keyword"]').val();
			
			//alert("searchType="+searchType+"\n"+"keyword="+keyword);
			
			searchList(searchType,keyword);
		}
	 
	function searchList(searchType,keyword){
		self.location="<%=request.getContextPath()%>/manage/member/list?searchType="+ searchType + "&keyword=" + keyword;
		} --%>
	
	
	<%-- $("#sortType").val("1").click(function(){
		//alert("헤헤")
		self.location="<%=request.getContextPath()%>/manage/member/sortList";
	}); --%>
	
	<%-- //가입날짜정렬
	function ali1(){ 
		var searchType=$('select#searchType').val();
		var keyword=$('input[name="keyword"]').val();
		var sortType=$('div#sortType').val();
		self.location.href="<%=request.getContextPath() %>/manage/member/list?alignment=1&sortType="+ sortType +"&searchType="+ searchType + "&keyword=" + keyword;
	}
	function ali2(){ 
		var searchType=$('select#searchType').val();
		var keyword=$('input[name="keyword"]').val();
		var sortType=$('div#sortType').val();
		self.location.href="<%=request.getContextPath() %>/manage/member/list?alignment=2&sortType="+ sortType +"&searchType="+ searchType + "&keyword=" + keyword;
	}
	 --%>
	
	//회원상태 정렬
	function sort1(){ 
		var searchType=$('select#searchType').val();
		var keyword=$('input[name="keyword"]').val();
		var aliType=$('div#aliType').val();
		self.location.href="<%=request.getContextPath() %>/manage/member/list?sort=1&aliType="+ aliType +"&searchType="+ searchType + "&keyword=" + keyword;
	}
	function sort2(){ 
		var searchType=$('select#searchType').val();
		var keyword=$('input[name="keyword"]').val();
		var aliType=$('div#aliType').val();
		self.location.href="<%=request.getContextPath() %>/manage/member/list?sort=2&aliType="+ aliType +"&searchType="+ searchType + "&keyword=" + keyword;
	}
	

	
	</script>




</body>
