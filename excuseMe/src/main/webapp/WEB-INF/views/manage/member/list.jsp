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
	<section id="main" class="wrapper">
		<div class="inner" style="margin-left: -3px;">

			<div id="sidebar">
				
				<a href="#" id="subtoplist">ADMINISTRATOR </a>
				<a href="<%=request.getContextPath()%>/manage/club/list" id="sublist">동호회 리스트 </a>
				<a href="<%=request.getContextPath()%>/manage/blacklist/list" id="sublist">블랙 리스트 </a>
				<a href="<%=request.getContextPath()%>/manage/newclub/list" id="sublist">신규동호회 승인 </a>
				<a href="<%=request.getContextPath()%>/manage/member/list" id="sublist">회원 관리</a>

			</div>








			<!-- Elements -->
			<h2 style="margin-left: 650px; ">회원 목록</h2>
			<div class="row">
			
			<section class="sort"
								style="height: 30px; margin-left:650px; ">
								<div class="listTitle" >
									<div name="aliType"  id="aliType">
									<button class="button alt small" 
									style="margin-top: 30px; "
									type="button" id="ali1" onclick="ali1();">가입오래된순</button> 
									<button class="button alt small" style="margin-top: 4px; width:180px;"
									type="button" id="ali2" onclick="ali2();">가입최신순</button>
									</div>
									<div name="sortType"  id="sortType">
									<button class="button alt small" 
									style="margin-top: 4px; width :180px; "
									type="button" id="sort1" onclick="sort1();" >&nbsp;&nbsp;&nbsp;활성멤버&nbsp;&nbsp;</button> 
									<button class="button alt small" style="margin-top: 4px; width :180px;"
									type="button" id="sort2" onclick="sort2();" >비활성멤버</button>
									</div>
								</div>
							</section>
							

							
							</div>

			<div class="row 200%">
			<section class="search">
							<select name="searchType"  id="searchType" style="width:350px; margin-left:200px; margin-top:20px; margin-bottom:4px;">
								<option value="kn"
									${pageMaker.cri.searchType eq 'kn' ? 'selected':'' }>전체</option>
								<option value="k"
									${pageMaker.cri.searchType eq 'k' ? 'selected':'' }>닉네임</option>
								<option value="n"
									${pageMaker.cri.searchType eq 'n' ? 'selected':'' }>이름</option>

							</select> 
							<input type="text" style="width:350px; margin-left:200px;"
								name="keyword" placeholder="검색어를 입력하세요."
								value="${param.keyword }" /> <span>
								<button class="button small" style="margin-top: 5px;margin-left:200px; margin-bottom:50px; width:350px;"
									type="button" id="searchBtn" onclick="onSearch();">검색</button>
							</span>
						
					</section>
					
					
					
				<div class="card-body">
					<!-- Table -->
					<div class="table-wrapper" style="margin-left: 80px; margin-top:50px;">
						<table>
							<tr>
								<th class="text-center" style="width: 200px;">이름</th>
								<th class="text-center" style="width: 300px;">아이디</th>
								<th class="text-center" style="width: 250px;">가입일</th>
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
										<td class="text-center">
										<c:if test="${member.mem_status==1 }">활성
										</c:if> 
										<c:if test="${member.mem_status==0 }">비활성
										</c:if>
									</td>
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
	function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight) {
		winleft = (screen.width - WinWidth) / 2;
		wintop = (screen.height - WinHeight) / 2;
		var win = window.open(UrlStr , WinTitle , "scrollbars=yes,width="+ WinWidth 
			                	+", height="+ WinHeight +", top="+ wintop +", left=" 
			                	+ winleft + ", resizable=no, status=yes"  );
	    win.focus() ; 
	}
	
	//멤버검색
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
	
	
	<%-- $("#sortType").val("1").click(function(){
		//alert("헤헤")
		self.location="<%=request.getContextPath()%>/manage/member/sortList";
	}); --%>
	
	//가입날짜정렬
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
