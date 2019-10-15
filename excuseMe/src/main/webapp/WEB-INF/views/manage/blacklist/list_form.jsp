<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="blackList" value="${dataMap.blackList }" />
<c:set var="pageMaker" value="${dataMap.pageMaker }" />


<head>
<meta charset="utf-8">
<title>동호회 블랙 리스트</title>

</head>
<body class="subpage">
	
      <!-- Main -->
    <section id="main" class="wrapper" >
        <!-- Elements -->
		<div class="row 200%">
		<div class="card-body">
    		<!-- Table -->
			<div class="table-wrapper" style=" margin-left: 0px;margin-top:-170px;">
				<table>
      				<tr>
						<th class="text-center" style="width:300px;">동호회명</th>
						<th class="text-center" style="width:200px;">카테고리</th>
						<th class="text-center" style="width:100px;">UP-DOWN</th>
						<th class="text-center" style="width:100px;">상태</th>
						<th class="text-center" style="width:100px;">등록일</th>
					</tr>
 					<c:if test="${empty blackList }">
						<tr>
							<td colspan="5" class="text-center">
								<strong>해당 내용이 없습니다.</strong>
		  					</td>
						</tr>
					</c:if> 
					<c:if test="${!empty blackList }">
						<c:forEach items="${blackList }" var="black" >
							<tr>
								<td class="text-center"><a href="#" style="text-decoration:none; color:gray;" onclick="OpenWindow('detail?club_no=${black.club_no}','','850','800')"> ${black.club_name }</a></td>
								<td class="text-center">${black.cate_name }</td>
								<td class="text-center">${black.mi }</td>
								<td class="text-center">
									<c:if test= "${black.club_status==1 }" >
										운영중
									</c:if>
									<c:if test= "${black.club_status==2 }" >
										운영 중지
									</c:if>
								</td>
								<td class="text-center"><fmt:formatDate value="${black.club_regDate }" pattern="yyyy-MM-dd" /></td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
            </div>
			<div class="text-right" style="float:right;margin-right:40px;">                                 
				<ul class="pagination ">
					<li class="page-item">
						<a class="page-link"style="text-decoration:none;" href="blackListTable${pageMaker.makeQuery(1)}">&lt;&lt;</a>
					</li>
					<li class="page-item">
	   					<a class="page-link"style="text-decoration:none;" href="blackListTable
							<c:if test="${pageMaker.prev }">
								${pageMaker.makeQuery(pageMaker.startPage-1) }
							</c:if>
						">&lt;</a>
					</li>
					<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
						<li class="page-item <c:out value="${pageMaker.cri.page == pageNum ?'active':''}"/>">
							<a class="page-link"style="text-decoration:none;" href="blackListTable${pageMaker.makeQuery(pageNum) }" >
								${pageNum }
	  						</a>
						</li>
					</c:forEach>   

					<li class="page-item">
					   <a class="page-link"style="text-decoration:none;" href="blackListTable
							<c:if test="${pageMaker.next }">
								${pageMaker.makeQuery(pageMaker.cri.page+1) }
							</c:if>
							<c:if test="${!pageMaker.next }">
								${pageMaker.makeQuery(pageMaker.cri.page) }
							</c:if>
						">&gt;</a>
					</li>         

					<li class="page-item">
   						<a class="page-link"style="text-decoration:none;" href="blackListTable${pageMaker.makeQuery(pageMaker.realEndPage) }">
                 		 &gt;&gt;
               			</a>
            		</li>    
				</ul>
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
      
      
function onSearch(){
   //alert("fff");
   //var searchType=$('select#searchType').val();
   var keyword=$('input[name="keyword"]').val();
   
   //alert("searchType="+searchType+"\n"+"keyword="+keyword);
   
   searchList(keyword);
}

function searchList(keyword){
self.location="<%=request.getContextPath()%>/manage/blacklist/list?&keyword=" + keyword;
}
   </script>

</body>