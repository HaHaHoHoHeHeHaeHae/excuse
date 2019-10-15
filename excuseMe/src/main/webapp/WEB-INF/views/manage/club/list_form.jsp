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


</head>
<body class="subpage">

		<!-- Main -->
	

	<div class="card-body" >
		<div class="row " style="margin-top:-88px; ">			
			<!-- Table -->
			<div class="table-wrapper">
				<table>
					<tr>
						<th class="text-center" style="width:300px;">동호회명</th>
						<th class="text-center" style="width:300px;">카테고리</th>
						<th class="text-center" style="width:100px;">회원수</th>
						<th class="text-center" style="width:200px;">UP-DOWN</th>
						<th class="text-center" style="width:200px;">상태</th>
						<th class="text-center" style="width:200px;">등록일</th>
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
						  		<td class="text-center" style="cursor:pointer;"onclick="OpenWindow('detail?club_no=${club.club_no }','','850','800');">${club.club_name }</td>
								<td class="text-center">${club.cate_name }</td>
								<td class="text-center">${club.joincnt }</td>
								<td class="text-center">${club.mi }</td>
								<td class="text-center">
									<c:if test= "${club.club_status==1 }" >
										운영중
									</c:if>
									<c:if test= "${club.club_status==2 }" >
										운영 중지
									</c:if>
								</td>
								<td class="text-center"><fmt:formatDate value="${club.club_regDate }" pattern="yyyy-MM-dd" /></td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
			</div>
		</div>	
	</div>
									
			<div class="text-center" style="margin-left: 360px;"  >														
				<ul class="pagination ">
					<li class="page-item">
					<a class="page-link" href="clubListTable${pageMaker.makeQuery(1)}" style="text-decoration:none;">&lt;&lt;</a>
					<li class="page-item">
						<a class="page-link" style="text-decoration:none;" href="clubListTable
							<c:if test="${pageMaker.prev }">
								${pageMaker.makeQuery(pageMaker.startPage-1) }
							</c:if>
						">&lt;</a>
					</li>
					<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
						<li class="page-item <c:out value="${pageMaker.cri.page == pageNum ?'active':''}"/>">
							<a class="page-link" href="clubListTable${pageMaker.makeQuery(pageNum) }" style="text-decoration:none;">
								${pageNum }
							</a>
						</li>
					</c:forEach>	
						
					<li class="page-item">
						<a class="page-link" style="text-decoration:none;" href="clubListTable
							<c:if test="${pageMaker.next }">
								${pageMaker.makeQuery(pageMaker.cri.page+1) }
							</c:if>
							<c:if test="${!pageMaker.next }">
								${pageMaker.makeQuery(pageMaker.cri.page) }
							</c:if>
						">&gt;</a>
					</li>			
						
					<li class="page-item">
						<a class="page-link" style="text-decoration:none;" href="clubListTable${pageMaker.makeQuery(pageMaker.realEndPage) }">
							&gt;&gt;
						</a>
					</li>
									
				</ul>
			</div>
						
				
						

			

	

	

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<script>
function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight) {
	winleft = (screen.width - WinWidth) / 2;
	wintop = (screen.height - WinHeight) / 2;
	var win = window.open(UrlStr , WinTitle , "scrollbars=yes,width="+ WinWidth 
		                	+", height="+ WinHeight +", top="+ wintop +", left=" 
		                	+ winleft + ", resizable=no, status=yes"  );
    win.focus() ; 
}


<%--subCategory --%>
$('#category').change(function() { 
     $.ajax({
        data:JSON.stringify({ "cate_no":$(this).val() }),
        contentType:"application/JSON",
        type: "POST",
        url: "<%=request.getContextPath()%>/club/subcategory",
        success: function(data) {
                 $("#subCategory").html("");
                 $("#subCategory").append("<option>- 전체 보기 -</option>");
                 for(var sub of data){
                 $("#subCategory").append("<option>"+ sub.cate_sub_name +"</option>");
                 }
        }
     });
  });

<%--subLocal --%>
$('#local').change(function(){
	
	console.log(local);
	$.ajax({
		data:JSON.stringify({"local_no":$(this).val()}),
		contentType:"application/JSON",
		type: "POST",
		url: "<%=request.getContextPath()%>/club/sublocal",
		success: function(data){
				$("#sublocal").html("");
				$("#sublocal").append("<option>- 전체 보기 -</option>");
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
	
	searchList(category,local,keyword);
}


function searchList(category,local,keyword){
	self.location="<%=request.getContextPath()%>/manage/club/list?category="+category+"&local="+local+"&keyword="+keyword;
}



 
 <%-- //동호회 생성날짜 정렬
function ali1(){ 
	var category = $('select#category option:selected' ).text();
	var local = $('select#local option:selected').text();
	var keyword = $('input[name="keyword"]').val();
	var sortType=$('div#sortType').val();
	self.location="<%=request.getContextPath()%>/manage/club/list?alignment=2&sortType="+ sortType+"&category="+category+"&local="+local+"&keyword="+keyword;
}
 
function ali2(){ 
	var category = $('select#category option:selected' ).text();
	var local = $('select#local option:selected').text();
	var keyword = $('input[name="keyword"]').val();
	var sortType=$('div#sortType').val();
	self.location="<%=request.getContextPath()%>/manage/club/list?alignment=3&sortType="+ sortType+"&category="+category+"&local="+local+"&keyword="+keyword;
} --%>


//동호회 운영상태 정렬
function sort1(){ 
	var category = $('select#category option:selected').text();
	var local = $('select#local option:selected').text();
	var keyword=$('input[name="keyword"]').val();
	self.location.href="<%=request.getContextPath() %>/manage/club/list?sort=1&category="+ category + "&local="+local+"&keyword=" + keyword;
}

function sort2(){ 
	var category = $('select#category option:selected').val();
	var local = $('select#local option:selected').val();
	var keyword=$('input[name="keyword"]').val();
	self.location.href="<%=request.getContextPath() %>/manage/club/list?sort=2&category="+ category + "&local="+local+"&keyword=" + keyword;
} 
 
   	
   	
   </script>
   
   

	</body>
