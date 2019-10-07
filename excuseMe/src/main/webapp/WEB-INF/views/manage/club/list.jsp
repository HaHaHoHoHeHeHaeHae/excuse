<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="clubList" value="${dataMap.clubList }" />
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cateList" value="${dataMap.cateList }" />
<c:set var="localList" value="${dataMap.localList }" />


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
        
#category,#local,#sublocal,#subCategory{
width:250px;
}
</style>
</head>
<body class="subpage">

		<!-- Main -->
			<section id="main" class="wrapper" >
				<div class="inner" style="margin-left:-3px; "> 
					
					<div id="sidebar">
				
				<a href="#" id="subtoplist">ADMINISTRATOR </a>
				<a href="<%=request.getContextPath()%>/manage/club/list" id="sublist">동호회 리스트 </a>
				<a href="<%=request.getContextPath()%>/manage/blacklist/list" id="sublist">블랙 리스트 </a>
				<a href="<%=request.getContextPath()%>/manage/newclub/list" id="sublist">신규동호회 승인 </a>
				<a href="<%=request.getContextPath()%>/manage/member/list" id="sublist">회원 관리</a>


			</div>
					<div class="row">
						<h2 style="margin-left:330px;  ">동호회 목록</h2>
			</div>
			
			<section class="search">
						<div class="row" style="margin-left:300px;  ">
								<strong>카테고리</strong>
							<div class="select" >
								<!-- category1 -->
								<select id="category" class="form-control">
									<option selected>전체</option>
									<c:forEach var="cate1" items="${cateList}">
										<c:if test="${!empty cateList }">
											<option value="${cate1.cate_no }">${cate1.cate_name }</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
							
						<div class="label">
							<div class="select">
								<!-- category2 -->
								<select id="subCategory" class="form-control">
									<option selected>전체</option>
								</select>
							</div>
						</div>
					</div>
					<div class="row" style="margin-top:10px; margin-left:300px;">
								<strong style="text-align:center;">&nbsp;&nbsp;&nbsp;&nbsp;지역&nbsp;&nbsp;&nbsp;&nbsp;</strong>
							<div class="select">
								<select id="local" class="form-control">
									<option selected>전체</option>
									<c:forEach var="local" items="${localList }">
										<c:if test="${!empty localList }">
											<option value="${local.local_no}">${local.local_name }</option>
										</c:if>
									</c:forEach>
								</select>
							</div>

						<div class="label">
							<div class="select">
								<select id="sublocal" class="form-control">
									<option selected>전체</option>
								</select>
							</div>
						</div>
					</div>
				<div class="search3" >
					<div class="select">
						<input name="keyword" type="text" class="form-control" style="width:520px; margin-top:10px; margin-left:445px;"
							placeholder="검색어를 입력하세요">
					</div>
					<ul class="actions" >
						<li><a id="searchBtn" href="#" class="button small" style="width:520px; margin-top:10px; margin-left:245px; " 
						onclick="onSearch();">검색</a></li>
					</ul>
				</div>
				</section>
				<section class="sort">
				<div class="row"  style="margin-left:270px;" >
									<div name="aliType"  id="aliType">
									<button class="button alt small" 
									style="margin-top: 20px; "
									type="button" id="ali1" name="ali1" onclick="ali1();">생성 오래된순</button> 
									<button class="button alt small" style="margin-top: 20px; width:180px;"
									type="button" id="ali2" name="ali2" onclick="ali2();">생성 최신순</button>
									</div>
									
									<div name="sortType"  id="sortType">
									<button class="button alt small" 
									style="margin-top: 20px; width :180px; "
									type="button" id="sort1" name="sort1" onclick="sort1();" >운영중 동호회</button> 
									<button class="button alt small" style="margin-top:20px; width :180px;"
									type="button" id="sort2" name="sort2" onclick="sort2();" >운영중지 동호회</button>
									</div>
								</div>
							</section>

			<div class="card-body" >
						<div class="row " style="margin-top:20px; ">
							
								<!-- Table -->
									<div class="table-wrapper">
										<table>
												<tr>
													<th class="text-center" style="width:300px;">동호회명</th>
													<th class="text-center" style="width:300px;">카테고리</th>
													<th class="text-center" style="width:200px;">UP-DOWN</th>
													<th class="text-center" style="width:200px;">상태</th>
													<th class="text-center" style="width:200px;">상세보기</th>
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
								</div>	
								</div>
									
					<div class="text-center" style="margin-left: 480px;"  >
																				
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
	function onSearch(){
	//alert("searchBtn");
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
	
	//alert("category="+category+"local="+local+"keyword="+keyword);
	
	searchList("${categoryclub }",category,local,keyword);
}


function searchList(categoryclub,category,local,keyword){
	self.location="<%=request.getContextPath()%>/"+categoryclub+"/list?category="+category+"&local="+local+"&keyword="+keyword;
}



 
 //동호회 생성날짜 정렬
function ali1(){ 
	var category = $('select#category option:selected' ).text();
	var local = $('select#local option:selected').text();
	var keyword = $('input[name="keyword"]').val();
	var sortType=$('div#sortType').val();
	self.location.href="<%=request.getContextPath() %>/manage/club/list?alignment=1&sortType="+ sortType +"&category="+category+"&local="+local+"&keyword=" + keyword;
}
function ali2(){ 
	var category = $('select#category option:selected' ).text();
	var local = $('select#local option:selected').text();
	var keyword = $('input[name="keyword"]').val();
	var searchType=$('select#searchType').val();
	var keyword=$('input[name="keyword"]').val();
	var sortType=$('div#sortType').val();
	self.location.href="<%=request.getContextPath() %>/manage/club/list?alignment=2&sortType="+ sortType +"&searchType="+ searchType + "&keyword=" + keyword;
}


//동호회 운영상태 정렬
function sort1(){ 
	var searchType=$('select#searchType').val();
	var keyword=$('input[name="keyword"]').val();
	var aliType=$('div#aliType').val();
	self.location.href="<%=request.getContextPath() %>/manage/club/list?sort=1&aliType="+ aliType +"&searchType="+ searchType + "&keyword=" + keyword;
}
function sort2(){ 
	var searchType=$('select#searchType').val();
	var keyword=$('input[name="keyword"]').val();
	var aliType=$('div#aliType').val();
	self.location.href="<%=request.getContextPath() %>/manage/club/list?sort=2&aliType="+ aliType +"&searchType="+ searchType + "&keyword=" + keyword;
} 
 
   	
   	
   </script>
   
   

	</body>
