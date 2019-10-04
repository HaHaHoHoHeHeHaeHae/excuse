<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="newclubList" value="${dataMap.newclubList }" />
<c:set var="pageMaker" value="${dataMap.pageMaker }" />


<head>
<meta charset="utf-8">
<title>신규 동호회 목록</title>
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
						<h2 style="margin-left: 300px;">신규 동호회 목록</h2>
						<div class="row 200%">
							<div class="card-body"  >
								<!-- Table -->
									<div class="table-wrapper" style="margin-left: 80px;">
										<table style="width:1000px;" >
												<tr>
													<th class="text-center" style="width:100px;">NO</th>
													<th class="text-center" style="width:200px;">동호회명</th>
													<th class="text-center" style="width:200px;">카테고리</th>
													<th class="text-center" style="width:200px;">상태</th>
													<th class="text-center" style="width:100px;">상세보기</th>
													<th class="text-center" style="width:100px;">수락</th>
													<th class="text-center" style="width:100px;">거부</th>
												</tr>
												<c:if test="${empty newclubList }">
												<tr>
													<td colspan="5" class="text-center">
														<strong>해당 내용이 없습니다.</strong>
													</td>
												</tr>
											</c:if>
										<c:if test="${!empty newclubList }">
							  			<c:forEach items="${newclubList }" var="newclub" >
							  	<tr id="clubno">
							  		<td class="text-center" id="club_no" name="club_no">${newclub.club_no }</td>
							  		<td class="text-center"><a href='#' style="text-decoration:none; text-color:gray;" onclick="OpenWindow('detail?club_no=${newclub.club_no }','','850','800');">
							  		${newclub.club_name }</a></td>
							  		
									<td class="text-center">${newclub.cate_name }</td>
									
									<td class="text-center">
									<c:if test= "${newclub.club_status==0 }" >
									승인대기 
									</c:if>
									<c:if test= "${newclub.club_status==1 }" >
									운영중
									</c:if>
									<c:if test= "${newclub.club_status==2 }" >
									운영 중지
									</c:if>
									</td>
									<td class="text-center">
									<button style=" " type="button" class="button small" id="detailBtn" onclick="OpenWindow('detail?club_no=${newclub.club_no }','','850','800');">
									상세보기</button>
									</td>
									<td class="text-center">
									<button type="button" class="button special small" id="statusBtn" onclick="Status();">
									수락</button>
									</td>
									<td class="text-center">
									<button type="button" class="button special small" id="detailBtn" id="statusStopBtn" onclick="StatusStop();">
									거부</button>
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
   	window.onload=function(){
   		$('a[data-name="member"]').on('click',function(event){
   				event.preventDefault();
   		});
  }
   	
   
   	
   	
   	function Status(){
   		var id= $("#clubno").children().eq(0).text();
		//var status = $("#club_status").val();
		alert(id);
		//alert(status);
		
			$.ajax({
				url:"<%=request.getContextPath() %>/manage/club/status",
				type:"POST",
				data:{club_no:id},
				
				success:function(result){
					if(result=="SUCCESS"){
						alert("승인수락 되었습니다.");
						location.reload();
					}else{
						alert("1234");
					}
				},
				error:function(){
					alert('실패했습니다.');
				},
				
			}); 
		}
	function StatusStop(){
   		var id= $("#clubno").children().eq(0).text();
		//var status = $("#club_status").val();
		alert(id);
		//alert(status);
		
			$.ajax({
				url:"<%=request.getContextPath() %>/manage/club/stopstatus",
				type:"POST",
				data:{club_no:id},
				
				success:function(result){
					if(result=="SUCCESS"){
						alert("승인거부 되었습니다.");
						location.reload();
					}else{
						alert("1234");
					}
				},
				error:function(){
					alert('실패했습니다.');
				},
				
			}); 
		}
   	
   </script>
   
   

	</body>
